from django.conf.urls import url
from django.contrib import admin
from fileupload.views import user_register_view,files_upload,sharedwith,loginview,logoutview,listview
urlpatterns = [ 
   url(r'^upload/$',files_upload,name="files_upload"),
    url(r'^share/$',sharedwith,name="sharedwith"),
    url(r'^login/$',loginview,name="loginview"),
    url(r'^logout/$',logoutview,name="logoutview"),
    url(r'^home/$',listview,name="home"),
    # url(r'^requestfiles/$',request_file,name="request_file"),
    url(r'^$',loginview,name="login"),

    url(r'^register/$',user_register_view,name="user_register_view"),
]