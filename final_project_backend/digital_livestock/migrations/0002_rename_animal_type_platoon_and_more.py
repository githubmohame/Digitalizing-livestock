# Generated by Django 4.0.8 on 2023-02-21 18:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('digital_livestock', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='animal_type',
            new_name='platoon',
        ),
        migrations.RenameModel(
            old_name='animal_sub_type',
            new_name='species',
        ),
    ]