from django.contrib import admin
from django.urls import path,include
from .views import *
urlpatterns = [
    path('governorate', governorate_api ),
    path('village', village_api ),
    path('city', city_api ), 
     path('section_type', section_type_api ),
      path('farm_type', farm_type_api ),
      path('species',animal_species_api)
      ,path('platoon',animal_plotoon_api)
       ,path('check_password',check_email_password)
      ,path('create_farmer', create_farmer)
       ,path('create_farm', create_farm)
       ,path('modify_gavernorate',  modified_gavernorate)
]
