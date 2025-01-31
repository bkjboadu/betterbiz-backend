# Generated by Django 5.0.2 on 2024-05-23 22:13

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payment", "0016_alter_billingplan_id_alter_invoice_id"),
    ]

    operations = [
        migrations.AlterField(
            model_name="billingplan",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("5797a57e-0be8-4e86-9573-39f4400540b4"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
        migrations.AlterField(
            model_name="invoice",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("a54d9c7f-5fa8-4847-82ac-e84df9c9c05a"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
    ]
