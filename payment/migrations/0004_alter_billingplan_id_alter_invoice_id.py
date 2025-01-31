# Generated by Django 5.0.2 on 2024-05-17 05:06

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payment", "0003_alter_billingplan_id_alter_invoice_id"),
    ]

    operations = [
        migrations.AlterField(
            model_name="billingplan",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("6b7a2163-f94b-40df-a408-a9ad1b70fb7b"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
        migrations.AlterField(
            model_name="invoice",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("f6cf8d60-b158-4fef-80b8-355fd7e4b870"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
    ]
