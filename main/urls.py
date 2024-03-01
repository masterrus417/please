from django.contrib import admin
from django.urls import path, include
from RequestsList.views import start_page, requests_list

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',start_page,name="start"),
    path('requests_list/',requests_list,name="requests_list" ),

]
