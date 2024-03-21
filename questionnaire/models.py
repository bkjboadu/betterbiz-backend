from django.db import models
from django.conf import settings
import uuid

class Industry(models.Model):
    name = models.CharField(max_length=255,unique=True)

    def save(self,*args,**kwargs):
        self.name = self.name.capitalize()
        super(Industry,self).save(*args,**kwargs)

    def __str__(self):
        return self.name
    

class Category(models.Model):
    industries = models.ManyToManyField(Industry,related_name='categories',blank=True)
    name = models.CharField(max_length=255,unique=True)
    
    def save(self,*args,**kwargs):
        self.name = self.name.capitalize()
        super(Category,self).save(*args,**kwargs)

    def __str__(self):
        return self.name

class BaseQuestion(models.Model):
    question = models.CharField(max_length=255)
    description = models.TextField()

    class Meta:
        abstract = True

class SpecificQuestion(BaseQuestion):
    category = models.ForeignKey(Category,related_name="questions",on_delete=models.CASCADE)

    def __str__(self):
        return self.question

class AnswerOption(models.Model):
    question = models.ForeignKey(SpecificQuestion,related_name='answer_options',on_delete=models.CASCADE)
    option_text = models.CharField(max_length=255)
    points = models.IntegerField()

    def __str__(self):
        return f"{self.option_text} ({self.points} points)"
    
class UserResponse(models.Model):
    business = models.ForeignKey('business.Business',related_name='response',on_delete=models.CASCADE)
    question = models.ForeignKey(SpecificQuestion,related_name='response',on_delete=models.CASCADE)
    answer = models.ForeignKey(AnswerOption,related_name='answer',on_delete=models.CASCADE)

    def __str__(self):
        return f"Response by {self.user.email} to question {self.question.id}"




