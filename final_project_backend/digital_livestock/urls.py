from django.contrib import admin
from django.urls import path,include
from .views import *
urlpatterns = [
    path('governorate', governorate_api ),
    path('village', village_api ),
    path('city', city_api ),
]
