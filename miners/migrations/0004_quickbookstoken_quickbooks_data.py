# Generated by Django 5.0.2 on 2024-05-19 04:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("miners", "0003_quickbookstoken_realm_id"),
    ]

    operations = [
        migrations.AddField(
            model_name="quickbookstoken",
            name="quickbooks_data",
            field=models.JSONField(blank=True, null=True),
        ),
    ]
