from django.shortcuts import render
from digital_livestock.models import *
from django.views.decorators.csrf import csrf_protect
# Create your views here.
from rest_framework import permissions

from rest_framework.decorators import api_view,authentication_classes,permission_classes,throttle_classes
from rest_framework.throttling import UserRateThrottle
from django.http.response import  JsonResponse
import json
from rest_framework import response
from rest_framework.request import Request

from .serializer import *
from rest_framework.authentication import BaseAuthentication

class CustomerBackend(BaseAuthentication):
	def authenticate(self, request, **kwargs):
		print((User.objects.all()[0]))
		return (User.objects.get(name='mohamed'),None)
class OncePerDayUserThrottle(UserRateThrottle):
	rate = '1/day'
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def governorate_api(request :Request):
	print((request.data))
	ser1=governorateSerializer( instance= governorate.objects.all() ,many=True)
	return response.Response(ser1.data)
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def city_api(request :Request):
	print(governorate.objects.filter(name=request.data['filter']).count())
	ser1=citySerializer( instance= city.objects.all().filter(governorate=governorate.objects.get(name=request.data['filter'])) ,many=True)
	return response.Response(ser1.data)
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def village_api(request :Request):
	ser1=villageSerializer( instance= village.objects.all().filter(city=city.objects.get(name=request.data['filter'])) ,many=True)
	return response.Response(ser1.data)


@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def animal_plotoon_api(request :Request):
	ser1=platoonSerializer( instance= platoon.objects.all()  ,many=True)
	return response.Response(ser1.data)

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def animal_species_api(request :Request):
	ser1=speciesSerializer( instance= species.objects.all().filter(platoon=platoon.objects.get(name=request.data['filter']))  ,many=True)
	return response.Response(ser1.data)


@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def section_type_api(request :Request):
	ser1=section_typeSerializer( instance= section_type.objects.all()  ,many=True)
	return response.Response(ser1.data)
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def farm_type_api(request :Request):
	ser1=farm_typeSerializer( instance= farm_type.objects.all()  ,many=True)
	return response.Response(ser1.data)
