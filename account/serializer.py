from rest_framework import serializers
from .models import User
from business.serializer import BusinessSerializer


class UserSerializer(serializers.ModelSerializer):
    has_companies = serializers.SerializerMethodField()
    default_company = BusinessSerializer(read_only=True)

    class Meta:
        model = User
        fields = "__all__"

    def get_has_companies(self,obj):
        return obj.has_companies
