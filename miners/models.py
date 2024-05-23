from django.db import models
from django.conf import settings

class QuickBooksToken(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    access_token = models.CharField(max_length=1025)
    refresh_token = models.CharField(max_length=1025)
    token_type = models.CharField(max_length=255)
    expires_in = models.IntegerField()
    x_refresh_token_expires_in = models.IntegerField()
    realm_id = models.CharField(max_length=64, blank=True, null=True)  
    quickbooks_data = models.JSONField(null=True,blank=True)

    def __str__(self):
        return f"{self.user.email}'s QuickBooks Token"
