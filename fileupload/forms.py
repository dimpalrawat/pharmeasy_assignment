from django import forms
from django.contrib.auth import (
	authenticate,
	get_user_model,
	login,
	logout,
	)
from .models import Users,Files,SharedWith



User = get_user_model()
class UserLoginForm(forms.Form):
	username = forms.CharField()
	password = forms.CharField(widget=forms.PasswordInput)

	def clean(self, *args, **kwargs):
		username = self.cleaned_data.get("username")
		password = self.cleaned_data.get("password")
		if username and password:
			user = authenticate(username=username,password=password)
			if not user:
				raise forms.ValidationError("This User Doesn't Exist")
			if not user.check_password(password):
				raise forms.ValidationError("Incorrect Password")
			if not user.is_active:
				raise forms.ValidationError("User is no longer active.")
		return super(UserLoginForm, self).clean(*args, **kwargs)

class UserRegisterForm(forms.ModelForm):
	email = forms.EmailField(label='Email address')
	password = forms.CharField(widget=forms.PasswordInput)
	class Meta:
		model=User
		fields = [
		'username',
		'email',
		'password',
		'first_name',
		'last_name',
		]

	def clean_email2(self):
		email = self.cleaned_data.get('email')
		email_qs = User.objects.filter(email=email)
		if email_qs.exists():
			raise forms.ValidationError("This Email has already been registered!")
		return email

class UsersRegisterForm(forms.ModelForm):
	#email = forms.EmailField(label='Email address')
	#password = forms.CharField(widget=forms.PasswordInput)
	class Meta:
		model=Users
		fields = [
		'role',
		]

class FileUploadForm(forms.ModelForm):
	class Meta:
		model = Files
		fields = [
		 'file',
		 # 'file_created'
		]
class SharedWithForm(forms.ModelForm):
	#users = User.objects.all()
	#files = Files.objects.all()
	class Meta:
		model = SharedWith
		fields = [
			'file',
			'user'
		]

# class RequestedForm(forms.ModelForm):
# 	#users = User.objects.all()
# 	#files = Files.objects.all()
# 	class Meta:
# 		model = RequestedFiles
# 		fields = [
# 			'requested_to'
# 		]
# 		exclude = ('requested_by',)