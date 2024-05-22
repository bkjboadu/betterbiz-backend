from django.db import models
from django.conf import settings
from user_account.models import User


class BettyChatMessage(models.Model):
    query = models.TextField()
    response = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(User, related_name="bettychat", on_delete=models.CASCADE)

    def __str__(self):
        return f"ChatSession created at {self.created_at}"
