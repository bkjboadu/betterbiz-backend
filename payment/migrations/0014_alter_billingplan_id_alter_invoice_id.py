# Generated by Django 5.0.2 on 2024-05-23 21:52

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payment", "0013_alter_billingplan_id_alter_invoice_id"),
    ]

    operations = [
        migrations.AlterField(
            model_name="billingplan",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("4b6b5916-cb1f-45f6-b571-fdb661d15b02"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
        migrations.AlterField(
            model_name="invoice",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("cd74501e-325f-4de9-90a8-0065223ec47e"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
    ]
