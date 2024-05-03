from rest_framework import serializers
from .models import User


class UserSerializer(serializers.ModelSerializer):
    has_companies = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = "__all__"

    def get_has_companies(self,obj):
        return obj.has_companies
