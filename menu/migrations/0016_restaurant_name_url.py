# Generated by Django 4.1 on 2022-08-04 22:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('menu', '0015_restaurant_favicon'),
    ]

    operations = [
        migrations.AddField(
            model_name='restaurant',
            name='name_url',
            field=models.CharField(default=123, max_length=100),
            preserve_default=False,
        ),
    ]
