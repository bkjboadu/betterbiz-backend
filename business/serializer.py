from rest_framework import serializers
from .models import Business,BusinessScore
from questionnaire.models import Industry

class BusinessScoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = BusinessScore
        fields = '__all__'

class BusinessSerializer(serializers.ModelSerializer):
    score = BusinessScoreSerializer(many=True,read_only=True)
    industry = serializers.PrimaryKeyRelatedField(queryset=Industry.objects.all())
    class Meta:
        model = Business
        exclude = ('user',)
        depth = 1

