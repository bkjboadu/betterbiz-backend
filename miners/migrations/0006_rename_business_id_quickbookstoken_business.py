# Generated by Django 5.0.2 on 2024-05-24 23:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("miners", "0005_quickbookstoken_business_id_and_more"),
    ]

    operations = [
        migrations.RenameField(
            model_name="quickbookstoken",
            old_name="business_id",
            new_name="business",
        ),
    ]
