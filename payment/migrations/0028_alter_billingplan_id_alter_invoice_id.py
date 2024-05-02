# Generated by Django 5.0.2 on 2024-05-02 12:08

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payment", "0027_alter_billingplan_id_alter_invoice_id"),
    ]

    operations = [
        migrations.AlterField(
            model_name="billingplan",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("67f085eb-6ff2-4eca-aa97-dd8f8950b190"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
        migrations.AlterField(
            model_name="invoice",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("0026c5da-a8ca-45af-b29c-1c89a6613a70"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
    ]
