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
from user_account.models import User


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

    def retrieve(self,request,*args,**kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        business_data = serializer.data


        business_scores = BusinessScore.objects.filter(business=instance)
        score_serializer = BusinessScoreSerializer(business_scores,many=True)

        business_data['scores'] = score_serializer.data
        return Response(business_data)
