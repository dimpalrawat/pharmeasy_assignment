from django.contrib import admin
from .models import Users,Files,SharedWith,RequestedFiles
class UsersAdmin(admin.ModelAdmin):
	list_display = ["id","user","role","created"]
	class Meta:
		model = Users
admin.site.register(Users,UsersAdmin)
admin.site.register(Files)
admin.site.register(SharedWith)
admin.site.register(RequestedFiles)
# Register your models here.
