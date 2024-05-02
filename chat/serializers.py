from rest_framework import serializers
from .models import AIChatMessage


class AIChatMessageSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = AIChatMessage
        fields = "__all__"

