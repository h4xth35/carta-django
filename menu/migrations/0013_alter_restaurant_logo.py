# Generated by Django 4.1 on 2022-08-04 22:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('menu', '0012_alter_menu_alergenos_alter_menu_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='restaurant',
            name='logo',
            field=models.ImageField(blank=True, null=True, upload_to='restaurant_logo'),
        ),
    ]
