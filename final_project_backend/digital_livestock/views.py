from django.shortcuts import render
from digital_livestock.models import *
from django.views.decorators.csrf import csrf_protect
# Create your views here.
from rest_framework import permissions
from django.db import connection
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
		return (User.objects.get(ssn=3010906121154),None)
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
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def check_email_password(request :Request):
	print( request.data['ssn'])
	User.objects.all().filter(ssn=request.data['ssn']).filter(password=request.data['ssn'])
	return  JsonResponse({"token":"loop"})

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def check_email_password(request :Request):
	print( type(request.data ))
	User.objects.all().filter(ssn=request.data['ssn']).filter(password=request.data['ssn'])
	return  JsonResponse({"token":"loop"})

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def create_farmer(request :Request):
	request.data
	u=User.objects.create_user(fname=request.data['fname'],ssn=request.data['ssn'],lname=request.data['lname'],password=request.data['password'],phone=request.data['phone'])
	print(u)
	return  JsonResponse({"token":"loop"})

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def create_farm(request :Request):
	query_dict=request.data.dict()
	query_dict['village']=village.objects.get(name=request.data['village']).id
	query_dict['farm_type']=farm_type.objects.get(name=request.data['farm_type']).id
	query_dict['section_type']=section_type.objects.get(name=request.data['section_type']).id
	#print(query_dict)
	f1=FarmSerializer(data=query_dict)
	print(f1.is_valid())
	print(f1.errors)
	return  response.Response(data=f1.data)

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_gavernorate(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		g1=governorate.objects.get(name=request.data['gavernorate']).delete()
	if(oper=='update'):
		g1=governorate.objects.get(name=request.data['gavernorate'])
		g1.name=request.data['new_name']
		g1.save()
	if(oper=='insert'):
		g1=governorate()
		g1.name=request.data['new_name']
		g1.save()
	g1=governorateSerializer(instance=g1)
	return  response.Response(data=g1.data)