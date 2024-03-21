from django.db import models
import uuid
from django.conf import settings

class BillingPlan(models.Model):
    FREQUENCY_CHOICES = (
        ('monthly','Monthly'),
        ('yearly','Yearly')
    )
    id = models.UUIDField(default=uuid.uuid4(),editable=False,primary_key=True)
    name = models.CharField(max_length=100)
    description = models.TextField()
    price = models.IntegerField()
    duration = models.IntegerField(help_text='duration in days')
    frequency = models.CharField(choices=FREQUENCY_CHOICES,max_length=10,default='monthly')

    def __str__(self):
        return self.name

class Invoice(models.Model):
    id = models.UUIDField(default=uuid.uuid4(),editable=False,primary_key=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL,related_name='invoices',on_delete=models.CASCADE)
    billing_plan = models.ForeignKey(BillingPlan,related_name='invoices',on_delete=models.SET_NULL,null=True)
    amount_paid = models.DecimalField(max_digits=10,decimal_places=3)
    date = models.DateTimeField(auto_now_add=True)
    invoice_number = models.CharField(max_length=100,unique=True)

    def __str__(self):
        return f"Invoice {self.invoice_number} for {self.user}"




