# Generated by Django 5.0.2 on 2024-05-24 00:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("user_account", "0002_remove_user_has_completed_questionnaire"),
    ]

    operations = [
        migrations.AddField(
            model_name="user",
            name="quickbooks",
            field=models.BooleanField(default=False),
        ),
    ]
