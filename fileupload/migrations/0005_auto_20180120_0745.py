# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-01-20 07:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fileupload', '0004_auto_20180120_0742'),
    ]

    operations = [
        migrations.AlterField(
            model_name='requestedfiles',
            name='requested_by',
            field=models.CharField(max_length=10),
        ),
    ]
