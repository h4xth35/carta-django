# Generated by Django 4.1 on 2022-08-04 22:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('menu', '0011_restaurant_logo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='menu',
            name='alergenos',
            field=models.ManyToManyField(blank=True, to='menu.alergenos'),
        ),
        migrations.AlterField(
            model_name='menu',
            name='category',
            field=models.ManyToManyField(blank=True, to='menu.category'),
        ),
    ]
