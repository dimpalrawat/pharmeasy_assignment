from django.db import models
from django.contrib.auth.models import User
from django.conf import settings
import os


# Create your models here.
class Users(models.Model):
	user = models.OneToOneField(User)
	ROLE = (('1','Patient'),('2','Doctor'),('3','Pharmacist'))
	role = models.CharField(
		max_length=1,
        choices=ROLE,
        default='1',
    )
	created = models.DateTimeField(auto_now=True)


class Files(models.Model):
	file = models.FileField()
	file_created = models.DateTimeField(auto_now_add=True)
	user = models.ForeignKey(settings.AUTH_USER_MODEL, default=1)

	def __str__(self):
		return os.path.basename(self.file.name)

class SharedWith(models.Model):
	file = models.ForeignKey(Files, on_delete=models.CASCADE)
	file_shared = models.DateTimeField(auto_now_add=True)
	user = models.ForeignKey(settings.AUTH_USER_MODEL, default=1)


class RequestedFiles(models.Model):
	requested_by = models.ForeignKey(settings.AUTH_USER_MODEL, default=1, related_name='requested_by')
	requested_to = models.ForeignKey(settings.AUTH_USER_MODEL, default=1, related_name='requested_to')



