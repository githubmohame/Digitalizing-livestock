# Generated by Django 4.0.8 on 2023-04-29 03:20

import django.contrib.gis.db.models.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('digital_livestock', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='farm',
            name='location',
            field=django.contrib.gis.db.models.fields.GeometryField(geography=True, null=True, srid=4326),
        ),
    ]
