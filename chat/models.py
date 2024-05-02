from django.db import models
from django.conf import settings
# Create your models here.
class AIChatMessage(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Message from {self.user} at {self.created_at}"
    
#class GroupChatMessage
    
