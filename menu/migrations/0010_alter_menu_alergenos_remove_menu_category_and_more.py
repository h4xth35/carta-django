# Generated by Django 4.1 on 2022-08-04 21:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('menu', '0009_remove_menu_alergenos_menu_alergenos'),
    ]

    operations = [
        migrations.AlterField(
            model_name='menu',
            name='alergenos',
            field=models.ManyToManyField(blank=True, null=True, to='menu.alergenos'),
        ),
        migrations.RemoveField(
            model_name='menu',
            name='category',
        ),
        migrations.AddField(
            model_name='menu',
            name='category',
            field=models.ManyToManyField(blank=True, null=True, to='menu.category'),
        ),
    ]
