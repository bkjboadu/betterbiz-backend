from django.db import models
from django.conf import settings
from account.models import User


# Create your models here.
class AIChatMessage(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    query = models.TextField()
    response = models.TextField()
    # role =
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"ChatSession created at {self.created_at}"

# class GroupChatMessage
