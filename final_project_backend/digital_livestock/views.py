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
from django.contrib.gis.geos import GEOSGeometry
from django.contrib.gis.gdal import DataSource
from .serializer import *
from rest_framework.authentication import BaseAuthentication
import json
from django.contrib.gis.gdal.geometries import Polygon
import tempfile
import geopandas as gpd
def set_geometry(obj:models.Model,dic1:dict[str,]):
	if(dic1.get('geometry')!=None):
			try:
				if(type(dic1.get('geometry'))==str):
					setattr(obj,'location', GEOSGeometry(str(dic1.get('geometry') )))
				else:
					with open('m',mode='wb' ) as binary_file:
						binary_file.write(dic1.get('geometry').read())
					import zipfile
					try:
						with zipfile.ZipFile(file='m',mode='r') as zip_ref:
							zip_ref.extractall('targdir')
						dsource=DataSource('targdir')
						for d in dsource:
							print(d)
							list1=d.get_geoms()
							print(len(list1))
							break
						muilt_plog= list1[0]
						if(len(list1)>100):
								count=100
						else:
								count=len(data['features'])
						for i in range(1,count):
							muilt_plog=muilt_plog.union(list1[i])
						print('end loop')
						setattr(obj,'location',str(muilt_plog))
					except:
						import json
						from django.contrib.gis.geos import GEOSGeometry
						with open('m')as f:
							data=json.loads(f.read())
						list1=[]
						if(len(data['features'])>100):
							count=100
						else:
							count=len(data['features'])
						for ft in range(0,count):
							geom_str=json.dumps( data['features'][ft])
							geom=GEOSGeometry(geom_str)
							list1.append(geom)
					
				print(muilt_plog.geom_type)
			except:
				print('done error')
				return JsonResponse({'Error':'file format error'})
class CustomerBackend(BaseAuthentication):
	def authenticate(self, request, **kwargs):
		return (User.objects.get(ssn=3010906121153),None)
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
	ser1=citySerializer( instance= city.objects.all().filter(governorate=governorate.objects.get(name=request.data['filter'])) ,many=True)
	print(city.objects.all().filter(governorate=governorate.objects.get(name=request.data['filter'])))
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
		return  JsonResponse({"gg":g1})
	if(oper=='update'):
		g1=governorate.objects.get(name=request.data['gavernorate'])
		set_geometry(obj=g1,dic1=request.data)
		g1.name=request.data['new_name']
		g1.save()
	print('insert')
	if(oper=='insert'):
		g1=governorate()
		g1.name=request.data['new_name']
		set_geometry(obj=g1,dic1=request.data)
		g1.save()
	g1=governorateSerializer(instance=g1)
	return  response.Response(data=g1.data)

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_city(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		g1=city.objects.get(name=request.data['city']).delete()
		return  JsonResponse({"gg":g1})
	if(oper=='update'):
		g1=city.objects.get(name=request.data['city'])
		g1.name=request.data['new_name']
		set_geometry(obj=g1,dic1=request.data)
		g1.save()
	if(oper=='insert'):
		g1=city()
		g1.name=request.data['new_name']
		g1.governorate=city.objects.get(name=request.data['city']).governorate
		set_geometry(obj=g1,dic1=request.data)
		g1.save()
	g1=citySerializer(instance=g1)
	return  response.Response(data=g1.data)

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_village(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		g1=village.objects.get(name=request.data['village']).delete()
		return  JsonResponse({"gg":g1})
	if(oper=='update'):
		g1=village.objects.get(name=request.data['village'])
		set_geometry(obj=g1,dic1=request.data)
		g1.name=request.data['new_name']
		g1.save()
	if(oper=='insert'):
		g1=village()
		g1.name=request.data['new_name']
		g1.city=city.objects.get(name=request.data['city'])
		set_geometry(obj=g1,dic1=request.data)
		g1.save()
	print(g1.name)
	g1=villageSerializer(instance=g1)
	return  response.Response(data=g1.data)

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def test_geson(request :Request):
	print(request.data.get('filter') )
	f1= GEOSGeometry(str(request.data.get('filter') ))
	print(f1) 
	return JsonResponse({"llo":986})


@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def farm_api(request :Request):
	print('iioo')
	if(request.data['operation']=='insert'):
		farm1=farm()
		dic1=request.data.dict() 
		except1=set_geometry(obj=farm1,dic1=dic1)
		if(isinstance(except1,JsonResponse)):
			return except1
		farm1.attached_area=dic1['attached_area']
		print(dic1.get('farm_type')==None)
		if(dic1.get('farm_type')==None):
			return JsonResponse({'error': None})
		dic1['farm_type']=json.loads((dic1['farm_type']))
		print(isinstance ( dic1.get('farm_type')    ,type(list())|type( set)|type(tuple) ) )
		if(not isinstance ( dic1.get('farm_type')    ,type(list())|type( set)|type(tuple) )):
			return JsonResponse({'error':"the farm  type should be iterable type"})
		if(farm_type.objects.filter(name__in=dic1.get('farm_type')).count()!=len(dic1.get('farm_type')) or len(dic1.get('farm_type'))==0):
			print(farm_type.objects.filter(name__in=dic1.get('farm_type')).count()  )
			return JsonResponse({'error':"the farm 12 should have valid farm type"})
		print(dic1['total_area_of_farm'])	 
		farm1.isolated_wards=dic1['isolated_wards']
		farm1.number_of_arc=float(dic1['number_of_arc'])
		farm1.number_of_workers=dic1['number_of_workers']
		farm1.playground=dic1['playground']
		farm1.section_type=section_type.objects.get(name= dic1['section_type'])
		farm1.wards=dic1['wards']
		farm1.village=village.objects.get(name=dic1['village'])
		farm1.total_area_of_farm=dic1['total_area_of_farm']
		farm1.farm_name=dic1['farm_name']
		farm1.huge_playground=dic1['huge_playground']

		farm1.id=dic1['id']
		print(farm1.id)
		print('done')
		farm1.save()
		print()
		for i in set(dic1.get('farm_type')):
			con_farmm_farmt1=connect_farmm_farmtype()
			con_farmm_farmt1.farm=farm1
			con_farmm_farmt1.farm_type=farm_type.objects.get(name=i)
			con_farmm_farmt1.save()

		return JsonResponse({"llo":986})
	if(request.data['operation']=='delete'):

			if(request.data.get('id')==None):
				return JsonResponse({'message':'error', })
			d1=farm.objects.all().filter(id=request.data.get('id')).delete()
			print(d1)
	if(request.data['operation']=='update'):
			print(request.data.get("city"))
			if(request.data.get('id')==None):
				return JsonResponse({'message':'error', })
			try: 
				d1=farm.objects.all().get(id=request.data.get('id'))
			except:
				return JsonResponse({'message':'id not valid', })
			dic1=request.data.dict()
			print(type(dic1) )
			for key  in dic1:
				print(dic1.get(key) )
				if(key=='farm_type'):
					import json
					connect_farmm_farmtype.objects.all().filter(farm=farm.objects.get(id=request.data['id'])).delete()
					for i in set(json.loads(dic1.get('farm_type'))):
						con_farmm_farmt1=connect_farmm_farmtype()
						con_farmm_farmt1.farm=d1
						con_farmm_farmt1.farm_type=farm_type.objects.get(name=i)
						con_farmm_farmt1.save()
					continue
				if(key=='section_type'):
					 
					d1.section_type=section_type.objects.get(name= dic1['section_type'])
					d1.save()
					continue
				if(key=='village'):
					print( village.objects.all().filter(city=city.objects.get(name=request.data.get('city')),name=request.data.get('village')))
					print(d1.village.name)
					continue
				print(key)
				print(d1.village.name)
				setattr(d1,key,request.data[key])
			d1.save()

			return JsonResponse({"error":"message"})
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_species(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		g1=species.objects.get(name=request.data['species']).delete()
		return  JsonResponse({"gg":g1})
	if(oper=='update'):
		g1=species.objects.get(name=request.data['species'])
		g1.name=request.data['new_name']
		g1.save()
	if(oper=='insert'):
		g1=species()
		g1.name=request.data['new_name']
		g1.platoon=species.objects.get(name=request.data['species']).platoon 
		g1.save()
	g1=speciesSerializer(instance=g1)
	return  response.Response(data=g1.data)


@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_platoon(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		g1=platoon.objects.get(name=request.data['platoon']).delete()
		print(request.data)
		return  JsonResponse({"gg":'kkk'})
	if(oper=='update'):
		g1=platoon.objects.get(name=request.data['gavernorate'])
		g1.name=request.data['new_name']
		g1.save()
	if(oper=='insert'):
		g1=platoon()
		g1.name=request.data['new_name']
		g1.save()
	g1=platoonSerializer(instance=g1)
	return  response.Response(data=g1.data)


@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def farmer_api(request :Request):
	oper=request.data['operation']
	print(oper)
	if(oper=='delete'):
		import json
		dic1=request.data.dict()
		dic1.pop('operation')
		user1=User.objects.filter(ssn=dic1['ssn'])
		if(len(user1)==0):
			return  JsonResponse({"error":'it is not valid user ssn'})
			print(int(i.ssn)==int(m))
		if(user1[0].is_superuser):
			return  JsonResponse({"error":'it is not valid user'})
		else:
			user1[0].delete()
			return JsonResponse({"error":'KKII'})
	if(oper=='update'):
		for i ,k in {'name':12}.items():
			print(k)
		dic1=request.data.dict()
		dic1.pop('operation')
		user1:User=User.objects.get(ssn=int(request.data['ssn']))
		for key,value in dic1.items() :
			if(value ==None  and  key not in ['ssn','fnane','lname','email','password','phone','photo']):
				continue
			setattr(user1,key,value)
		user1.save()
		print(user1.age)
	if(oper=='insert'):
		dic1=request.data.dict()
		dic1.pop('operation')
		print(set(dic1) ,set(['ssn','fname','lname','email','password','phone','photo','job','age']))
		if(set(dic1).issubset(['ssn','fname','lname','email','password','phone','photo','job','age'])):
			print(dic1)
			user1=User.objects.create_user(**dic1)
	user1=FarmerSerializer(instance= user1)
	return  response.Response(data=user1.data)
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def connect_farmer_farm(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		dic1=request.data.dict()
		dic1.pop('operation')
		user1:User=user1.objects.get(ssn=request.data['ssn'])
		if(user1.is_superuser):
			return  JsonResponse({"error":'it is not valid user'})
		else:
			user1.delete()
	if(oper=='update'):
		dic1=request.data.dict()
		dic1.pop('operation')
		for i in User.objects.all():
			print(i.ssn==request.data['ssn'])
		for key,value in request.data.dict() and value !=None  and key in ['ssn','fnane','lname','email','password','phone','photo']:
			setattr(user1,key,value)
		user1.save()
	if(oper=='insert'):
		dic1=request.data.dict()
		dic1.pop('operation')
		print(set(dic1) ,set(['ssn','fname','lname','email','password','phone','photo','job','age']))
		if(set(dic1).issubset(['ssn','fname','lname','email','password','phone','photo','job','age'])):
			print(dic1)
			user1=User.objects.create_user(**dic1)
	
	user1=FarmerSerializer(instance= user1)
	return  response.Response(data=user1.data)