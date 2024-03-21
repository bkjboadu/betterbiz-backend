from django.db import models
from django.conf import settings
import uuid
from django.urls import reverse

class Business(models.Model):
    id = models.UUIDField(primary_key=True,default=uuid.uuid4)
    name = models.CharField(max_length=255)
    user = models.ForeignKey('account.User',related_name='business',on_delete=models.CASCADE,null=True,blank=True)
    industry = models.ForeignKey('questionnaire.Industry',related_name='business',on_delete=models.CASCADE)
    logo = models.ImageField(upload_to='business_profile/',blank=True,null=True)
    date_founded = models.DateField(blank=True,null=True)
    
    street_address = models.CharField(max_length=255,blank=True,null=True)
    city = models.CharField(max_length=255,blank=True,null=True)
    state_province = models.CharField(max_length=255,blank=True,null=True)
    postal_code = models.CharField(max_length=20,blank=True,null=True)
    country = models.CharField(max_length=100,blank=True,null=True)

    facebook_url = models.URLField(blank=True,null=True)
    twitter_url = models.URLField(blank=True,null=True)
    linkedin_url = models.URLField(blank=True,null=True)

    legal_status = models.CharField(max_length=100,blank=True,null=True)
    tax_id = models.CharField(max_length=100,blank=True,null=True)


    def __str__(self):
        return f"{self.name}"
    
    def get_absolute_url(self):
        return reverse('business-detail',kwargs={'pk':self.id})



class BusinessScore(models.Model):
    id = models.UUIDField(default=uuid.uuid4,primary_key=True)
    business = models.ForeignKey(Business,related_name='score',on_delete=models.CASCADE)
    score = models.IntegerField()
    date = models.DateTimeField(auto_now_add=True,null=True,blank=True)

    def __str__(self):
        return f"{self.business.name}_score-{self.score}"