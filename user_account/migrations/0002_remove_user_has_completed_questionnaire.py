# Generated by Django 5.0.2 on 2024-05-22 21:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("user_account", "0001_initial"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="user",
            name="has_completed_questionnaire",
        ),
    ]
