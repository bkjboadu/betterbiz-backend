# Generated by Django 5.0.2 on 2024-05-30 08:14

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payment", "0023_alter_billingplan_id_alter_invoice_id"),
    ]

    operations = [
        migrations.AlterField(
            model_name="billingplan",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("8b548df9-c4d1-4c0c-9c42-45baf1ac06fb"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
        migrations.AlterField(
            model_name="invoice",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("e7ab3e74-96d5-4669-ae17-2ebb42068afe"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
    ]
