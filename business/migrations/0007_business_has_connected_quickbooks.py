# Generated by Django 5.0.2 on 2024-05-25 06:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("business", "0006_business_has_completed_questionnaire"),
    ]

    operations = [
        migrations.AddField(
            model_name="business",
            name="has_connected_quickbooks",
            field=models.BooleanField(blank=True, null=True),
        ),
    ]
