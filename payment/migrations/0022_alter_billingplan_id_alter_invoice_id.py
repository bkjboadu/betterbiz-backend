# Generated by Django 5.0.2 on 2024-05-24 23:34

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payment", "0021_alter_billingplan_id_alter_invoice_id"),
    ]

    operations = [
        migrations.AlterField(
            model_name="billingplan",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("44301f1b-9853-48e1-b8c0-1640593d3685"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
        migrations.AlterField(
            model_name="invoice",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("57f86cf5-1ab5-4e5a-b967-64140adba745"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
    ]
