# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-01-21 13:45
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('fileupload', '0008_auto_20180121_1324'),
    ]

    operations = [
        migrations.AddField(
            model_name='sharedwith',
            name='file_shared',
            field=models.DateTimeField(auto_now_add=True, default=datetime.datetime(2018, 1, 21, 13, 45, 26, 170268, tzinfo=utc)),
            preserve_default=False,
        ),
    ]