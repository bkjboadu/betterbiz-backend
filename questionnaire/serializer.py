from rest_framework import serializers
from .models import Questions, Industry, UserResponse


class IndustrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Industry
        fields = "__all__"

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Questions
        fields = '__all__'

class UserResponseSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserResponse
        fields = ['business','responses','time']
        read_only_fields = ['time']

# class AnswerOptionSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = AnswerOption
#         fields = ["id", "option_text", "points"]


# class SpecificQuestionSerializer(serializers.ModelSerializer):
#     answer_options = AnswerOptionSerializer(many=True, read_only=True)

#     class Meta:
#         model = SpecificQuestion
#         fields = ["id", "question", "description", "answer_options"]


# class CategorySerializer(serializers.ModelSerializer):
#     category = serializers.CharField(source="name")
#     questions = SpecificQuestionSerializer(many=True, read_only=True)

#     class Meta:
#         model = Category
#         fields = ["id", "category", "questions"]
