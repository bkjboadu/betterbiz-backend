from django.db import models
from django.conf import settings
from business.models import Business

class QuickBooksToken(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='quickbooks', on_delete=models.CASCADE)
    business = models.ForeignKey(Business, related_name='quickbooks', on_delete=models.CASCADE, null=True, blank=True)
    access_token = models.CharField(max_length=1025)
    refresh_token = models.CharField(max_length=1025)
    token_type = models.CharField(max_length=255)
    expires_in = models.IntegerField()
    x_refresh_token_expires_in = models.IntegerField()
    realm_id = models.CharField(max_length=64, blank=True, null=True)
    quickbooks_data = models.JSONField(null=True, blank=True)
    is_connected = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.user.email}'s - {self.business.name}: QuickBooks Token"
