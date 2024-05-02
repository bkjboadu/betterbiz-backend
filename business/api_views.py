from rest_framework.decorators import (
    action,
    api_view,
    permission_classes,
    authentication_classes,
)
from rest_framework import viewsets
from rest_framework import permissions
from .models import Business, BusinessScore
from .serializer import BusinessScoreSerializer, BusinessSerializer
from .forms import BusinessForm
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from django.forms.models import model_to_dict
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework import status
from rest_framework.parsers import MultiPartParser, FormParser
from account.models import User
from shared.base_viewsets import CustomBaseViewSet


class BusinessViewset(viewsets.ModelViewSet):
    queryset = Business.objects.all()
    serializer_class = BusinessSerializer
    authentication_classes = [JWTAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    parser_classes = [MultiPartParser, FormParser]

    @action(detail=False, methods=["POST"], url_path="register-business")
    def register_business(self, request):
        business_data = request.data
        print(business_data)
        serializer = BusinessSerializer(data=business_data)
        if serializer.is_valid():
            serializer.save(user=request.user)
            return Response({"status": "business registered"})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=True, methods=["PUT", "PATCH"], url_path="edit-business-profile")
    def edit_business_profile(self, request, pk=None):
        business = self.get_object()
        if not business:
            return Response({"error": "Business not found"})

        if request.user.id != business.user_id:
            return Response(
                {"status": "You do not have permission to edit this business "},
                status=status.HTTP_403_FORBIDDEN,
            )

        serializer = BusinessSerializer(business, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(
        detail=False, methods=["GET"], url_path="get-user-business/(?P<user_id>[^/.]+)"
    )
    def get_user_businesses(self, request, user_id):
        user = get_object_or_404(User, id=user_id)
        business = Business.objects.filter(user=user)
        business_serializer = BusinessSerializer(business, many=True)
        return Response({"businesses": business_serializer.data})

    # @action(detail=False,methods=['GET','POST'],url_path='register-business')
    # def register_business(self,request):
    #     message = 'done'
    #     if request.method == "POST":
    #         form = BusinessForm(request.data,request.FILES)
    #         if form.is_valid():
    #             business = form.save(commit=False)
    #             if request.user.is_authenticated:
    #                 business.user = request.user
    #             business.save()
    #             message = 'business registered'
    #         else:
    #             print({field:error for field,error in form.errors.items()})
    #             message = 'failed to register business'
    #     return Response({'status':message})

    # @action(detail=True,methods=['GET','POST'],url_path = 'edit-business-profile')
    # def edit_business_profile(self,request,pk):
    #     business_instance = get_object_or_404(Business,pk=pk)
    #     form_data = model_to_dict(business_instance)
    #     form_data.update(request.data)

    #     if request.user.id != business_instance.user_id :
    # return Response({"status":"You do not have permission to edit this business "},status=status.HTTP_403_FORBIDDEN)

    #     if request.method == 'POST':
    #         form = BusinessForm(form_data,request.FILES,instance=business_instance)
    #         if form.is_valid():
    #             form.save()
    #             message = 'Edit successful'
    #         else:
    #             errors = {field_name:errors for field_name,errors in form.errors.items()}
    #             return Response({'status':'Failed to edit','errors':errors})
    #     else:
    #         form = BusinessForm(instance=business_instance)
    #         return Response({'form':form.fields})
    #     return Response({'status':message})
