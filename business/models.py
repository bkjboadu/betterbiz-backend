from django.db import models
from django.dispatch import receiver
from django.db.models.signals import post_save
from django.conf import settings
import uuid
from django.urls import reverse


class Business(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    name = models.CharField(max_length=255)
    user = models.ForeignKey(
        "user_account.User",
        related_name="business",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )
    industry = models.ForeignKey(
        "questionnaire.Industry", related_name="business", on_delete=models.CASCADE
    )
    logo = models.ImageField(upload_to="business_profile/", blank=True, null=True)
    date_founded = models.DateField(blank=True, null=True)

    street_address = models.CharField(max_length=255, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    state_province = models.CharField(max_length=255, blank=True, null=True)
    postal_code = models.CharField(max_length=20, blank=True, null=True)
    country = models.CharField(max_length=100, blank=True, null=True)

    facebook_url = models.URLField(blank=True, null=True)
    twitter_url = models.URLField(blank=True, null=True)
    linkedin_url = models.URLField(blank=True, null=True)

    has_completed_questionnaire = models.BooleanField(null=True,blank=True)

    legal_status = models.CharField(max_length=100, blank=True, null=True)
    tax_id = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return f"{self.name}"

    def get_absolute_url(self):
        return reverse("business-detail", kwargs={"pk": self.id})


@receiver(post_save, sender=Business)
def set_default_company(sender, instance, created, **kwargs):
    if created:
        user = instance.user
        if user and user.default_company is None:
            user.default_company = instance
            user.save()


class BusinessScore(models.Model):
    id = models.UUIDField(default=uuid.uuid4, primary_key=True)
    user = models.ForeignKey("user_account.User",related_name='business_score',on_delete=models.CASCADE,null=True,blank=True)
    business = models.ForeignKey(
        Business, related_name="score", on_delete=models.CASCADE
    )
    score = models.IntegerField(null=True,blank=True)
    date = models.DateTimeField(auto_now_add=True, null=True, blank=True)

    def __str__(self):
        return f"{self.business.name}_score-{self.score}"
