from rest_framework.decorators import api_view,authentication_classes,permission_classes,action
from rest_framework import viewsets
from rest_framework.permissions import BasePermission,AllowAny
from rest_framework.response import Response
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from rest_framework import status
from django.conf import settings
from .forms import SignupForm
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_decode,urlsafe_base64_encode
from django.shortcuts import render,redirect,reverse
from django.core.mail import send_mail
from .models import User
from django.contrib.auth.forms import SetPasswordForm
from .serializer import UserSerializer
from rest_framework_simplejwt.tokens import AccessToken
from business.models import Business,BusinessScore
from rest_framework.permissions import IsAuthenticated
from business.serializer import BusinessSerializer

class EmailTokenGenerator(PasswordResetTokenGenerator):
    def _make_hash_value(self,user,timestamp):
        return str(user.pk) + str(timestamp) + str(user.email_verified)

class PasswordChangeGenerator(PasswordResetTokenGenerator):
    def _make_hash_value(self, user, timestamp):
        return str(user.pk) + str(timestamp) + str(user.password)

email_token_generator = EmailTokenGenerator()
password_change_token_generator = PasswordChangeGenerator()

class AccountViewSet(viewsets.ModelViewSet):
    authentication_classes = []
    permission_classes = []
    queryset = User.objects.all()
    serializer_class = UserSerializer

    @action(detail=False, methods=['GET'], url_path='get-user-details')
    def get_user_details(self,request):
        try:
            print(request.headers)
            token = request.headers.get('Authorization').split(' ')[-1]
            decoded_token = AccessToken(token)
            user_id = decoded_token.get('user_id')

            if user_id:
                user = User.objects.get(id=user_id)
                user_serializer = self.get_serializer(user)
                business = Business.objects.filter(user_id=user.id)
                business_serializer = BusinessSerializer(business,many=True)
                return Response({'user':user_serializer.data,
                                 'businesses':business_serializer.data})
            else:
                return Response({'error': 'Invalid token'},status=status.HTTP_404_UNAUTHORIZED)

        except Exception as e:
            print(e)
            return Response({'error':'Token decoding error'},status = status.HTTP_401_UNAUTHORIZED)

    @action(detail=False,methods=['post'])
    def signup(self,request):
        form = SignupForm(request.data)
        if form.is_valid():
            user = form.save()
            # send a verification mail
            token = email_token_generator.make_token(user)
            uidb64 = urlsafe_base64_encode(force_bytes(user.pk))

            verification_url = request.build_absolute_uri(
                reverse('account-verify-email',kwargs={'uidb64':uidb64,'token':token})
            )
            print(verification_url)
            subject = 'Email Verification'
            body = f'Please verify your email address by clicking the link {verification_url}'
            send_mail(subject,body,settings.DEFAULT_FROM_EMAIL,[user.email])
            message = 'Email verification link sent'
        else:
            message = form.errors
        return Response({'status':message})

    @action(detail=False,methods=['GET'],url_path='verify-email/(?P<uidb64>[^/.]+)/(?P<token>[^/.]+)')
    def verify_email(self,request,uidb64,token):
        try:
            uid = urlsafe_base64_decode(uidb64).decode()
            user = User.objects.get(pk=uid)
        except (TypeError,ValueError,OverflowError,User.DoesNotExist):
            user = None

        if user and email_token_generator.check_token(user,token):
            print(user)
            user.email_verified = True
            user.save()
            message = 'User verified'
        else:
            message = 'error'
        return Response({'status':message})

    @action(detail=False,methods=['POST'],url_path="password-change-request")
    def password_change_request(self,request):
        email = request.data.get('email','')
        print(email)
        print('bright')
        try:
            user = User.objects.get(email=email)
        except (TypeError,OverflowError,ValueError,User.DoesNotExist) as e:
            print(e)
            return Response({'status':'User with this email does not exist'})

        uidb64 = urlsafe_base64_encode(force_bytes(user.pk))
        token = password_change_token_generator.make_token(user)

        subject = 'Password change request'
        password_reset_url = request.build_absolute_uri(
            reverse('account-password-change-confirm',kwargs={'uidb64':uidb64,'token':token})
        )
        body = f'Plese click the link to reset password {password_reset_url}'
        send_mail(subject,body,settings.DEFAULT_FROM_EMAIL,[user.email])
        return Response({'statue':'Password reset link sent'})

    @action(detail=False,methods=['POST'],url_path='password-change-confirm/(?P<uidb64>[^/.]+)/(?P<token>[^/.]+)')
    def password_change_confirm(self,request,uidb64,token):
        try:
            uid = urlsafe_base64_decode(uidb64).decode()
            user = User.objects.get(pk=uid)
        except (TypeError,ValueError,OverflowError,User.DoesNotExist):
            user = None
        if user and password_change_token_generator.check_token(user,token):
            form = SetPasswordForm(user,request.data)
            if form.is_valid():
                form.save()
                message = 'Password changed'
            else:
                print(form.errors)
                form = SetPasswordForm(user)
                message = 'Invalid input'
        else:
            message = 'Not authenticated'
        return Response({'status':message})
    
    @action(detail=True,methods=['PUT','PATCH'],url_path='edit-profile')
    def edit_profile(self,request,pk=None):
        user = self.get_object()
        if not user:
            return Response({'error': 'User not found'},status=status.HTTP_404_NOT_FOUND)
        
        serializer = UserSerializer(user,data=request.data,partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)

        
        
        




