from rest_framework import serializers
from .models import User
from business.serializer import BusinessSerializer
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework.exceptions import AuthenticationFailed


class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        try:
            data = super().validate(attrs)
            data["result"] = True
            return data
        except AuthenticationFailed as e:

            raise AuthenticationFailed({"message": str(e), "result": False})


class UserSerializer(serializers.ModelSerializer):
    has_companies = serializers.SerializerMethodField()
    default_company = BusinessSerializer(read_only=True)

    class Meta:
        model = User
        # fields = "__all__"
        exclude = ['password']

    def get_has_companies(self, obj):
        return obj.has_companies
