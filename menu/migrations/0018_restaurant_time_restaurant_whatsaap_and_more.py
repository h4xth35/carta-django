# Generated by Django 4.1 on 2022-08-08 01:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('menu', '0017_alter_restaurant_name_url'),
    ]

    operations = [
        migrations.AddField(
            model_name='restaurant',
            name='time',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='whatsaap',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='restaurant',
            name='email',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='restaurant',
            name='phone',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
