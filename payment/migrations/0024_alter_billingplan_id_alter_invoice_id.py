# Generated by Django 5.0.2 on 2024-05-02 05:46

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
                default=uuid.UUID("d1430321-9411-4dc0-9866-6d2b0872f795"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
        migrations.AlterField(
            model_name="invoice",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("f9638964-c6fb-4d71-ab56-f06f5d1d1812"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
    ]
