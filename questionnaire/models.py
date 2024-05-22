from django.db import models
from django.conf import settings
from user_account.models import User


class Industry(models.Model):
    name = models.CharField(max_length=255, unique=True)

    def save(self, *args, **kwargs):
        self.name = self.name.capitalize()
        super(Industry, self).save(*args, **kwargs)

    def __str__(self):
        return self.name
    
class Questions(models.Model):
    questions = models.JSONField(null=True,blank=True)

class UserResponse(models.Model):
    user = models.ForeignKey(User,related_name='response',on_delete=models.CASCADE)
    business = models.ForeignKey(
        "business.Business", related_name="response", on_delete=models.CASCADE
    )
    responses = models.JSONField(null=True,blank=True)
    time = models.DateTimeField(auto_now_add=True)

