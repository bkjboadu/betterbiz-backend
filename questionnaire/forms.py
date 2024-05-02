from django.forms import ModelForm
from .models import SpecificQuestion, AnswerOption


class SpecificQuestionForm(ModelForm):
    class Meta:
        model = SpecificQuestion
        fields = (
            "question",
            "description",
        )


class AnswerOptionForm(ModelForm):
    class Meta:
        model = AnswerOption
        fields = ("option_text", "points")
