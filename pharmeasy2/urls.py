from django.conf.urls import url,include
from django.contrib import admin
from django.conf.urls.static import static
from django.conf import settings
from fileupload.views import user_register_view,files_upload,sharedwith,loginview,logoutview
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^',include('fileupload.urls',namespace="fileupload")),

]


if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)