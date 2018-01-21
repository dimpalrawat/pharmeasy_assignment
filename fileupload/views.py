from django.shortcuts import render
from django.http import HttpResponse , HttpResponseRedirect , Http404
from django.shortcuts import render, get_object_or_404, redirect
from .models import Users,Files,SharedWith
from .forms import UserRegisterForm,UsersRegisterForm,FileUploadForm,SharedWithForm,UserLoginForm
from django.contrib.auth.models import User
from django.contrib.auth import(
	authenticate,
	get_user_model,
	login,
	logout,
	)
from django.contrib import messages
import json
import datetime
from django.utils.timezone import utc

# Create your views here.

def user_register_view(request):
	if request.user.is_authenticated():
		return redirect("/files_upload")
	form = UserRegisterForm(request.POST or None)
	form2 = UsersRegisterForm(request.POST or None)
	if form.is_valid() and form2.is_valid():
		user = form.save(commit=False)
		password = form.cleaned_data.get("password")
		user.set_password(password)
		user.save()
		users = form2.save(commit=False)
		users.user = user
		users.save()
		messages.success(request, 'User registered.')
	else:
		messages.error(request, form.errors	)
	return render(request,"register.html",{'form':form,'form2':form2,'title':'Register Employees'})

def files_upload(request):
	print(request.user.is_authenticated())
	if not request.user.is_authenticated():
		raise Http404("You Don't Have Permission To Upload the file")
	u = Users.objects.filter(user = request.user).first()
	

	if u:
		if u.role != '1':
			raise Http404("You Don't Have Permission To Upload the file")
		form = FileUploadForm(request.POST or None, request.FILES or None)
		if form.is_valid():
			instance = form.save(commit=False)
			instance.user = request.user
			instance.file_created = datetime.datetime.utcnow().replace(tzinfo=utc)
			instance.save()
			messages.success(request, 'File uploaded.')
			return HttpResponseRedirect('/home/')	
		return render(request,"files.html",{'form':form,'btn':'Upload', 'role':u.role})
	else:
		return HttpResponse('You are logging as superuser. Login as Patient, Doctor or Pharmacist. Please <a href="/logout">Logout</a>');



def sharedwith(request):
	print(request.user.is_authenticated())
	if not request.user.is_authenticated():
		raise Http404("You Don't Have Permission To Access This Page")
	u = Users.objects.filter(user = request.user).first()
	if u:
		if u.role != '1':
			raise Http404("You Don't Have Permission To Access This Page")
		form = SharedWithForm(request.POST or None)
		if form.is_valid():
			
			a = form.cleaned_data.get('user')
			b = form.cleaned_data.get('file')

			ownership = Files.objects.filter(file = b.file, user = request.user)

			sw = SharedWith.objects.filter(file = b, user = a)

			# print(sw)
			if not ownership:
				messages.error(request, 'This file was not uploaded by you. You dont have permission to share this file')
			
			elif a == request.user:
				messages.error(request, 'You cannot share with yourself. Choose other users')

			elif not sw:
				instance = form.save(commit=False)
				instance.save()
				messages.success(request, 'Your prescription has been successfully shared.')
			else:
				messages.error(request, 'You have already shared Prescription with this user.')

		return render(request,"share.html",{'form':form,'btn':'Share', 'role':u.role})
	else:
		return HttpResponse('You are logging as superuser. Login as Patient, Doctor or Pharmacist. Please <a href="/logout">Logout</a>');


def loginview(request):
	if not request.user.is_authenticated():
		form = UserLoginForm(request.POST or None)
		if form.is_valid():
			username = form.cleaned_data.get("username")
			password = form.cleaned_data.get("password")
			user = authenticate(username=username,password=password)
			user_details = User.objects.get(username=user)
			login(request,user)
			return HttpResponseRedirect('/home/')
		if form.errors:
			messages.error(request, 'Invalid Username or Password')
		return render(request,"login.html",{'form':form,'btn':'Login'})
	return redirect('/home/')

def logoutview(request):
	logout(request)
	return redirect("/")

def listview(request):
	if not request.user.is_authenticated():
		return redirect("/login")
	u = Users.objects.filter(user = request.user).first()

	if u:
		if u.role == '1':
			files = Files.objects.filter(user = request.user)
			return render(request,"home.html",{'sf':files, 'role':u.role})

		sw = SharedWith.objects.filter(user = request.user)
		print(sw)
		return render(request,"home.html",{'sf':sw, 'role':u.role})
	else:
		return HttpResponse('You are logging as superuser. Login as Patient, Doctor or Pharmacist. Please <a href="/logout">Logout</a>');


# def request_file(request):
# 	if not request.user.is_authenticated():
# 		raise Http404
# 	alluser = User.objects.exclude(username = request.user.username)
# 	dicr = dict()
# 	for user in alluser:
# 		print(user.username)
# 		dicr[user.username] = dict()
# 		dicr[user.username]['username'] = user.username
# 		dicr[user.username]['firstname'] = user.first_name
# 		dicr[user.username]['lastname'] = user.last_name
# 	return HttpResponse(json.dumps(dicr))

# def requestfiles(request):
# 	print(request.user.is_authenticated())
# 	if not request.user.is_authenticated():
# 		raise Http404("You Don't Have Permission To Access This Page")
# 	u = Users.objects.filter(user = request.user).first()
# 	print(request.user.username)
# 	form = RequestedForm(request.POST or None, initial={'requested_by': request.user.username})
# 	form.fields['requested_by'].widget.attrs['readonly'] = True
# 	if form.is_valid():
# 		instance = form.save(commit=False)
# 		instance.save()
# 		return redirect("/home/")
# 	return render(request,"requestedfiles.html",{'form':form,'btn':'Share'})

	

