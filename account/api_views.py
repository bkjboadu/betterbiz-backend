from rest_framework.decorators import (
    api_view,
    authentication_classes,
    permission_classes,
    action,
)
from rest_framework import viewsets
from rest_framework.permissions import BasePermission, AllowAny
from rest_framework.response import Response
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.contrib.auth.hashers import check_password
from rest_framework import status
from rest_framework.permissions import (
    AllowAny,
    IsAdminUser,
    IsAuthenticated,
    IsAuthenticatedOrReadOnly,
)
from rest_framework_simplejwt.authentication import JWTAuthentication
from django.conf import settings
from .forms import SignupForm
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.shortcuts import render, redirect, reverse
from django.core.mail import send_mail
from .models import User
from django.contrib.auth.forms import SetPasswordForm
from .serializer import UserSerializer
from rest_framework_simplejwt.tokens import AccessToken
from business.models import Business, BusinessScore
from rest_framework.permissions import IsAuthenticated
from business.serializer import BusinessSerializer
from utils import send_email


class EmailTokenGenerator(PasswordResetTokenGenerator):
    def _make_hash_value(self, user, timestamp):
        return str(user.pk) + str(timestamp) + str(user.email_verified)


class PasswordChangeGenerator(PasswordResetTokenGenerator):
    def _make_hash_value(self, user, timestamp):
        return str(user.pk) + str(timestamp) + str(user.password)


email_token_generator = EmailTokenGenerator()
password_change_token_generator = PasswordChangeGenerator()


class AccountViewSet(viewsets.ModelViewSet):
    """This ViewSet is for managing user account,verification and security as a whole"""

    authentication_classes = []
    permission_classes = []
    queryset = User.objects.all()
    serializer_class = UserSerializer

    @action(detail=False, methods=["GET"], url_path="get-user-details")
    def get_user_details(self, request):
        "This view is to get user details through the access token or refresh token in the headers"
        try:
            token = request.headers.get("Authorization").split(" ")[-1]
            decoded_token = AccessToken(token)
            user_id = decoded_token.get("user_id")

            if user_id:
                user = User.objects.get(id=user_id)
                user_serializer = self.get_serializer(user)
                business = Business.objects.filter(user_id=user.id)
                business_serializer = BusinessSerializer(business, many=True)
                return Response(
                    {
                        "user": user_serializer.data,
                        "businesses": business_serializer.data,
                        "result":True
                    }
                )
            else:
                return Response(
                    {"error": "Invalid token","result":False}, status=status.HTTP_404_UNAUTHORIZED
                )

        except Exception as e:
            print(e)
            return Response(
                {"error": "Token decoding error","result":False}, status=status.HTTP_401_UNAUTHORIZED
            )

    @action(detail=False, methods=["post"])
    def signup(self, request):
        """
        This view is for signing up
        """
        form = SignupForm(request.data)
        if form.is_valid():
            user = form.save()
            # send a verification mail
            token = email_token_generator.make_token(user)
            uidb64 = urlsafe_base64_encode(force_bytes(user.pk))

            verification_url = request.build_absolute_uri(
                reverse(
                    "account-verify-email", kwargs={"uidb64": uidb64, "token": token}
                )
            )
            subject = "Email Verification"
            body = f"Please verify your email address by clicking the link {verification_url}"

            message = "trial"

            try:
                email_sent = send_email(
                    from_email="bright@betterbizscore.com",subject=subject, content=body, to_emails=user.email
                )

                if email_sent == True:
                    return Response({"message": "Email verification link sent","result":True}, status=status.HTTP_201_CREATED)
                else:
                    return Response({"message": f"Error sending email {email_sent}","result":False}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            except Exception as e:
                return Response(
                    {"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
                )
        else:
            message = form.errors
            return Response({"status": message,"result":False})

    @action(detail=True, methods=["GET"], url_path="getverificationlink")
    def getverificationlink(self, request, pk=None):
        """
        This view is to get verification after the user is authenticated that is after the user is logged in
        """
        user = User.objects.get(id=pk)

        token = email_token_generator.make_token(user)
        uidb64 = urlsafe_base64_encode(force_bytes(user.pk))

        verification_url = request.build_absolute_uri(
            reverse("account-verify-email", kwargs={"uidb64": uidb64, "token": token})
        )
        subject = "Email Verification"
        body = (
            f"Please verify your email address by clicking the link {verification_url}"
        )
        try:
            email_sent = send_email(subject=subject, content=body, to_emails=user.email)
            if email_sent == True:
                return Response({"message": "Email verification link sent","result":True}, status=status.HTTP_201_CREATED)
            else:
                return Response({"message": f"Error sending email {email_sent}","result":False}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        except Exception as e:
            return Response(
                {"error": str(e),"result":False}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

    @action(
        detail=False,
        methods=["GET"],
        url_path="verify-email/(?P<uidb64>[^/.]+)/(?P<token>[^/.]+)",
    )
    def verify_email(self, request, uidb64, token):
        """
        This view authenticated the verification link sent to user email for password change and update the
        verification status of the user
        """
        try:
            uid = urlsafe_base64_decode(uidb64).decode()
            user = User.objects.get(pk=uid)
        except (TypeError, ValueError, OverflowError, User.DoesNotExist):
            user = None

        if user and email_token_generator.check_token(user, token):
            user.email_verified = True
            user.save()
            message = "User verified"
        else:
            message = "error"
        result = True if message == "User verified" else False
        return Response({"status": message,"result":result})

    @action(detail=False, methods=["post", "GET"])
    def passwordchangerequest(self, request):
        """
        This request for a link to change password when the user has forgotten his/her password
        thus,when user is not authenticated
        """
        email = request.data.get("email", "")
        try:
            user = User.objects.get(email=email)
        except (TypeError, OverflowError, ValueError, User.DoesNotExist) as e:
            print(e)
            return Response({"status": "User with this email does not exist"})

        uidb64 = urlsafe_base64_encode(force_bytes(user.pk))
        token = password_change_token_generator.make_token(user)

        subject = "Password change request"
        password_reset_url = request.build_absolute_uri(
            reverse(
                "account-passwordchangeconfirm",
                kwargs={"uidb64": uidb64, "token": token},
            )
        )
        body = f"Plese click the link to reset password {password_reset_url}"
        email_sent = send_email(subject=subject, content=body, to_emails=user.email)
        # message = 'Email verification link sent' if email_sent else "Error sending email"
        send_mail(subject, body, settings.DEFAULT_FROM_EMAIL, [user.email])
        return Response({"status": "Password reset link sent","result": True})

    @action(
        detail=False,
        methods=["POST"],
        url_path="passwordchangeconfirm/(?P<uidb64>[^/.]+)/(?P<token>[^/.]+)",
    )
    def passwordchangeconfirm(self, request, uidb64, token):
        """
        This view changes user password
        """
        try:
            uid = urlsafe_base64_decode(uidb64).decode()
            user = User.objects.get(pk=uid)
        except (TypeError, ValueError, OverflowError, User.DoesNotExist):
            user = None
        if user and password_change_token_generator.check_token(user, token):
            form = SetPasswordForm(user, request.data)
            if form.is_valid():
                form.save()
                message = "Password changed"
            else:
                print(form.errors)
                form = SetPasswordForm(user)
                message = "Invalid input"
        else:
            message = "Not authenticated"
        return Response({"status": message,"result": True})

    @action(detail=True, methods=["POST"], url_path="passwordreset")
    def passwordreset(self, request, pk=None):
        """
        This request for password change when user is already authenticated thus they request change
        when they are already authenticated
        """
        data = request.data
        old_password = data.get("old_password", " ")
        new_password = data.get("new_password", " ")
        confirm_new_password = data.get("confirm_new_password", "")
        user = self.get_object()

        if not user.check_password(old_password):
            return Response({"error": "Incorrect old password"})

        # check if the new passwords match and meet criteria
        if new_password != confirm_new_password:
            return Response({"error": "New password do not match"})

        # if all checks are okay, set the new password
        user.set_password(new_password)
        user.save()
        return Response({"success": "Password updated successfully","result": True})

    @action(detail=True, methods=["PUT", "PATCH"], url_path="edit-profile")
    def edit_profile(self, request, pk=None):
        """
        This view is for user to edit their profile after they are authenticated
        """
        user = self.get_object()
        if not user:
            return Response(
                {"error": "User not found","result": False}, status=status.HTTP_404_NOT_FOUND
            )

        serializer = UserSerializer(user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response({"data":serializer.data,"result": True})
        return Response({"data":serializer.errors,"result":False}, status=status.HTTP_400_BAD_REQUEST)
