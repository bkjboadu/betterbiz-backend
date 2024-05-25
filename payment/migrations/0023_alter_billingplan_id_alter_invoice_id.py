# Generated by Django 5.0.2 on 2024-05-25 06:45

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payment", "0022_alter_billingplan_id_alter_invoice_id"),
    ]

    operations = [
        migrations.AlterField(
            model_name="billingplan",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("e4c6b0fe-70dd-49b0-9647-48c33692ee83"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
        migrations.AlterField(
            model_name="invoice",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("d645b755-2ce6-4824-a864-0e98137fc4e6"),
                editable=False,
                primary_key=True,
                serialize=False,
            ),
        ),
    ]
