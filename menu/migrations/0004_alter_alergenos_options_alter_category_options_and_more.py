# Generated by Django 4.1 on 2022-08-04 12:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('menu', '0003_restaurant_status'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='alergenos',
            options={'ordering': ['name'], 'verbose_name': 'Alérgenos', 'verbose_name_plural': 'Alérgenos'},
        ),
        migrations.AlterModelOptions(
            name='category',
            options={'ordering': ['name'], 'verbose_name': 'Categoría', 'verbose_name_plural': 'Categorías'},
        ),
        migrations.AlterModelOptions(
            name='menu',
            options={'ordering': ['name'], 'verbose_name': 'Menú', 'verbose_name_plural': 'Menús'},
        ),
        migrations.AlterModelOptions(
            name='restaurant',
            options={'ordering': ['name'], 'verbose_name': 'Restaurante', 'verbose_name_plural': 'Restaurantes'},
        ),
        migrations.AlterField(
            model_name='category',
            name='name',
            field=models.CharField(max_length=100, unique=True),
        ),
    ]
