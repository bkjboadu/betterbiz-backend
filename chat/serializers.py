from rest_framework import serializers
from .models import BettyChatMessage


class AIChatMessageSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = BettyChatMessage
        fields = "__all__"

