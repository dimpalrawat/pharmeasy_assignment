# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-01-20 07:32
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('fileupload', '0002_auto_20180120_0721'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='requestedfiles',
            name='file',
        ),
        migrations.RemoveField(
            model_name='requestedfiles',
            name='user',
        ),
        migrations.AddField(
            model_name='requestedfiles',
            name='requested_by',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='requested_by', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='requestedfiles',
            name='requested_to',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='requested_to', to=settings.AUTH_USER_MODEL),
        ),
    ]