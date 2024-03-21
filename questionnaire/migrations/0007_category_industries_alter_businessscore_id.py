# Generated by Django 5.0.2 on 2024-03-03 01:48

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("questionnaire", "0006_alter_businessscore_id"),
    ]

    operations = [
        migrations.AddField(
            model_name="category",
            name="industries",
            field=models.ManyToManyField(
                blank=True,
                null=True,
                related_name="categories",
                to="questionnaire.industry",
            ),
        ),
        migrations.AlterField(
            model_name="businessscore",
            name="id",
            field=models.UUIDField(
                default=uuid.UUID("efec1e1a-df81-4af2-931d-91104b803e58"),
                primary_key=True,
                serialize=False,
            ),
        ),
    ]
