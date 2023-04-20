from django.shortcuts import render
from digital_livestock.models import *
from django.views.decorators.csrf import csrf_protect
# Create your views here.
from django.template.loader import render_to_string
from django.core.mail import send_mail
from django.core.mail import EmailMultiAlternatives
from django.conf import settings
from rest_framework import permissions
from django.db import connection
from rest_framework.decorators import api_view,authentication_classes,permission_classes,throttle_classes
from rest_framework.throttling import UserRateThrottle
from django.http.response import  JsonResponse
from rest_framework import response
from rest_framework.request import Request
from django.contrib.gis.gdal import DataSource
from .serializer import *
from rest_framework.authentication import BaseAuthentication
from django.contrib.gis.gdal.geometries import Polygon,Point
import geopandas as gpd
from django.contrib.gis.geos import GEOSGeometry
def set_geometry(obj:models.Model,dic1:dict[str,]):
	if(dic1.get('geometry')!=None):
			try:
				if(type(dic1.get('geometry'))==str):
					#print( (dic1.get('geometry')) )
					import json
					from django.contrib.gis.geos import Point
					from django.contrib.gis.geos import GEOSGeometry
					data=json.loads(dic1.get('geometry'))
					print( *(data['Point']['coordinates'] ))
					print( Point (*(data['Point']['coordinates'])))
					setattr(obj,'location',GEOSGeometry(str( Point (*(data['Point']['coordinates'])))))
					print('rrrrr33422222')
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
						print('gggggggr4554322')
						import json
						from django.contrib.gis.geos import GEOSGeometry
						try:
							with open('m')as f:
								data=json.loads(f.read())
						except:
							
							data=json.loads(dic1.get('geometry'))
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
			except Exception as e:
				print(e.args)
				return JsonResponse({'error':'خطأ في صيغة الملف'})
class CustomerAccessPermission(permissions.BasePermission):

	def has_permission(self, request, view):
		return True
	def has_permission(self, request, view):
		return True
class CustomerBackend(BaseAuthentication):
	def authenticate(self, request, **kwargs):
		print(User.objects.all( )[0])
		return (User.objects.all( )[0],None)
class OncePerDayUserThrottle(UserRateThrottle):
	rate = '1/day'
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def governorate_api(request :Request):
	print((request.data))
	ser1=governorateSerializer( instance= governorate.objects.all() ,many=True)
	print(ser1)
	return response.Response(ser1.data)
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def city_api(request :Request):
	ser1=citySerializer( instance= city.objects.all().filter(governorate=governorate.objects.get(id=request.data['filter'])) ,many=True)
	print(city.objects.all().filter(governorate=governorate.objects.get(id=request.data['filter'])))
	return response.Response(ser1.data)
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def village_api(request :Request):
	 
	ser1=villageSerializer( instance= village.objects.all().filter(city=city.objects.get(id=request.data['filter'])) ,many=True)
	return response.Response(ser1.data)


@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def animal_plotoon_api(request :Request):
	ser1=platoonSerializer( instance= platoon.objects.all()  ,many=True)
	return response.Response(ser1.data)

@api_view(['GET','POST'])
@permission_classes([permissions.AllowAny])
@authentication_classes([CustomerBackend])
def animal_species_api(request :Request):
	ser1=speciesSerializer( instance= species.objects.all().filter(platoon=platoon.objects.get(id=request.data['filter']))  ,many=True)
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
def login(request :Request):
	user1=User.objects.all().filter(ssn=request.data['ssn']).filter(is_superuser=True )
	print( user1.count())
	if(user1.count()>0):
		print(request.data.get('password'))
		if(user1[0].check_password(request.data.get('password'))):
			return  JsonResponse({"token":True})
		return JsonResponse({"token":False})
	else:
		return JsonResponse({"token":False})

'''

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def check_email_password(request :Request):
	print( type(request.data ))
	User.objects.all().filter(ssn=request.data['ssn']).filter(password=request.data['ssn'])
	return  JsonResponse({"token":"loop"})

'''

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def create_farmer(request :Request):
	request.data
	u=User.objects.create_user(fname=request.data['fname'],ssn=request.data['ssn'],lname=request.data['lname'],password=request.data['password'],phone=request.data['phone'])
	print(u)
	return  JsonResponse({"token":"loop"})
'''


	return  response.Response(data=f1.data)

'''
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

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_gavernorate(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		print(request.data['gavernorate'])
		g1=governorate.objects.get(id=request.data['gavernorate']).delete()
		print(g1)
		print('done')
		return  JsonResponse({"message":'تم مسح البيانات'})
	if(oper=='update'):
		g1=governorate.objects.get(id=request.data['gavernorate'])
		set_geometry(obj=g1,dic1=request.data)
		g1.name=request.data['new_name']
		g1.save()
		return  JsonResponse({"message":'تم تعديل البيانات'})

	print('insert')
	if(oper=='insert'):
		g1=governorate()
		g1.name=request.data['new_name']
		set_geometry(obj=g1,dic1=request.data)
		g1.save()
		JsonResponse({"message":'تم اضافة البيانات'})


@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_city(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		g1=city.objects.get(id=request.data['city']).delete()
		return  JsonResponse({"message":'تم مسح البيانات'})

	if(oper=='update'):
		g1=city.objects.get(id=request.data['city'])
		g1.name=request.data['new_name']
		set_geometry(obj=g1,dic1=request.data)
		g1.save()
		return  JsonResponse({"message":'تم تعديل البيانات'})

	if(oper=='insert'):
		g1=city()
		g1.name=request.data['new_name']
		g1.governorate=city.objects.get(id=request.data['city']).governorate
		set_geometry(obj=g1,dic1=request.data)
		g1.save()
		return  JsonResponse({"message":'تم اضافة البيانات'})

	g1=citySerializer(instance=g1)
	return  response.Response(data=g1.data)

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_village(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		g1=village.objects.get(id=request.data['village']).delete()
		return  JsonResponse({"message":"تم مسح البينات"})
	if(oper=='update'):
		g1=village.objects.get(id=request.data['village'])
		set_geometry(obj=g1,dic1=request.data)
		g1.name=request.data['new_name']
		g1.save()
		return  JsonResponse({"message":"تم تعديل البينات"})

	if(oper=='insert'):
		g1=village()
		g1.name=request.data['new_name']
		g1.city=city.objects.get(id=request.data['city'])
		set_geometry(obj=g1,dic1=request.data)
		g1.save()
		return  JsonResponse({"message":"تم اضافة البينات"})

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
		print('done')
		print(except1)
		if(isinstance(except1,JsonResponse)):
			
			return except1
		farm1.attached_area=dic1['attached_area']
		print(dic1.get('farm_type')==None)
		if(dic1.get('farm_type')==None):
			return JsonResponse({'error':'اختارنوع للمزرعة'})


		import json
		dic1['farm_type']= json.loads(dic1['farm_type'])
		print(isinstance ( dic1.get('farm_type')    ,type(list())|type( set)|type(tuple) ) )
		if(not isinstance ( dic1.get('farm_type')    ,type(list())|type( set)|type(tuple) )):
			return JsonResponse({'error':"the farm  type should be iterable type"})
		if(farm_type.objects.filter(name__in=dic1.get('farm_type')).count()!=len(dic1.get('farm_type')) or len(dic1.get('farm_type'))==0):
			print(farm_type.objects.filter(name__in=dic1.get('farm_type')).count()  )
			return JsonResponse({'error':"the farm 12 should have valid farm type"})
		print(dic1)
		print(dic1['total_area_of_farm'])
		for key,value in dic1.items() :
			print(key)
			print(value)
			if(key in ['id','isolated_wards','number_of_arc','number_of_workers','playground','wards','total_area_of_farm','farm_name','huge_playground']):
				setattr(farm1,key,value)
			print('pp'*78)
		print(farm1.number_of_workers)
		'''
		farm1.isolated_wards=dic1['isolated_wards']
		farm1.number_of_arc=float(dic1['number_of_arc'])
		farm1.number_of_workers=dic1['number_of_workers']
		farm1.playground=dic1['playground']
		farm1.wards=dic1['wards']
		farm1.total_area_of_farm=dic1['total_area_of_farm']
		farm1.farm_name=dic1['farm_name']
		farm1.huge_playground=dic1['huge_playground']
		farm1.id=dic1['id']
		'''
		farm1.section_type=section_type.objects.get(id= dic1['section_type'])
		farm1.village=village.objects.get(id=dic1['village'])
		print(farm1.id)
		farm1.save()
		for i in set(dic1.get('farm_type')):
			con_farmm_farmt1=connect_farm_farmtype()
			con_farmm_farmt1.farm=farm1
			con_farmm_farmt1.farm_type=farm_type.objects.get(name=i)
			con_farmm_farmt1.save()

		return JsonResponse({"message":'تم اضافة البيانات'})
	if(request.data['operation']=='delete'):

			if(request.data.get('id')==None):
				return JsonResponse({'message':'من فضلك ادخل كود المزرعة', })
			d1=farm.objects.all().filter(id=request.data.get('id')).delete()
			print(d1)
			return JsonResponse({"message":"تم مسح البيانات"})
	if(request.data['operation']=='update'):
			print(request.data.get("city"))
			if(request.data.get('id')==None):
				return JsonResponse({'error':'من فضلك ادخل كود المزرعة', })
			try: 
				d1=farm.objects.all().get(id=request.data.get('id'))
			except:
				return JsonResponse({'error':'الكود غير صحيح', })
			dic1=request.data.dict()
			for key  in dic1:
				if(key=='geometry'):
					except1=set_geometry(obj=d1,dic1=dic1)
					print('done')
					print(except1)
					if(isinstance(except1,JsonResponse)):
						return except1
					continue
				if(key=='farm_type'):
					import json
					connect_farm_farmtype.objects.all().filter(farm=farm.objects.get(id=request.data['id'])).delete()
					for i in set(json.loads(dic1.get('farm_type'))):
						con_farmm_farmt1=connect_farm_farmtype()
						con_farmm_farmt1.farm=d1
						con_farmm_farmt1.farm_type=farm_type.objects.get(name=i)
						con_farmm_farmt1.save()
					continue
				if(key=='section_type'):
					d1.section_type=section_type.objects.get(id= dic1['section_type'])
					d1.save()
					continue
				if(key=='village'):
					print( village.objects.all().filter( id=request.data.get('village')))
					d1.village=village.objects.all().get( id=request.data.get('village'))
					print(d1.village.name)
					continue
					print(d1.village.name)
				setattr(d1,key,request.data[key])

			d1.save()

			return  JsonResponse({"message":"تم تعديل البينات"})
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_species(request :Request):
	oper=request.data['operation']
	print(oper)
	print('jjuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu')
	if(oper=='delete'):
		try:
			g1=species.objects.get(id=request.data['species']).delete()
			return  JsonResponse({"message":'تم مسح البيانات'})
		except:
			return JsonResponse({"error":' اختار الفصيلة'})
	if(oper=='update'):
		try:
			g1=species.objects.get(id=request.data['species'])
			g1.save()
		except:
			return JsonResponse({"error":' اختار الفصيلة'})
		g1.name=request.data['new_name']
		g1.save()
		return JsonResponse({"message":'تم تعديل البيانات'})
	if(oper=='insert'):
		g1=species()
		
		if(request.data['new_name']=='' or request.data['new_name']==None):
				return JsonResponse({"error":'يجب ادخال الاسم'})
		g1.name=request.data['new_name']
		try:
			g1.platoon=platoon.objects.get(id=request.data['platoon']) 
			g1.save()
		except:
			return JsonResponse({"error":' اختار الفصيلة'})
		return JsonResponse({"message":'تم اضافة البيانات'})


@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def modified_platoon(request :Request):
	oper=request.data['operation']
	if(oper=='delete'):
		try:
				g1=platoon.objects.get(id=request.data['platoon']).delete()
				print(request.data)
				return  JsonResponse({"message":'تم مسح البيانات'})
		except:
			return JsonResponse({"error":' اختار النوع'})
	if(oper=='update'):
		try:
			g1=platoon.objects.get(id=request.data['platoon'])
			if(request.data['new_name']=='' or request.data['new_name']==None):
				return JsonResponse({"error":'يجب ادخال الاسم'})
			g1.name=request.data['new_name']
			g1.save()
		except:
			return JsonResponse({"error":' اختار النوع'})
		return  JsonResponse({"message":'تم تعديل البيانات'})
	if(oper=='insert'):
		print(request.data['new_name'])
		g1=platoon()
		if(request.data['new_name']=='' or request.data['new_name']==None):
				return JsonResponse({"error":'يجب ادخال الاسم'})
		g1.name=request.data['new_name']
		g1.save()
		return  JsonResponse({"message":'تم تعديل البيانات'})
	 

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
			return  JsonResponse({"error":'الرقم القومي غير صحيح'})
			print(int(i.ssn)==int(m))
		if(user1[0].is_superuser):
			return  JsonResponse({"error":'الرقم القومي غير صحيح'})
		else:
			user1[0].delete()
			return  JsonResponse({"message":'تم مسح البيانات'})
	if(oper=='update'):
		 
		dic1=request.data.dict()
		dic1.pop('operation')
		user1=User.objects.filter(ssn=dic1['ssn'])
		if(len(user1)==0):
			return  JsonResponse({"error":'الرقم القومي غير صحيح'})
		user1:User=User.objects.get(ssn=int(request.data['ssn']))
		for key,value in dic1.items() :
			if(value ==None  and  key not in ['ssn','fnane','lname','email','password','phone','photo']):
				continue
			setattr(user1,key,value)
		user1.save()
		return JsonResponse({"message":"تم تعديل البيانات"})
		print(user1.age)
	if(oper=='insert'):
		dic1=request.data.dict()
		dic1.pop('operation')
		print(set(dic1) ,set(['ssn','fname','lname','email','password','phone','photo','job','age']))
		if(set(dic1).issubset(['ssn','fname','lname','email','password','phone','photo','job','age'])):
			print(dic1)
			user1=User.objects.create_user(**dic1)
	return JsonResponse({"message":'تم حفظ البيانات'})
@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def add_farm_animal(request :Request):
	print(request.data)
	from datetime import datetime
	if(request.data['operation']=='insert'):
		print(request.data)
		print(farm.objects.all().filter( id=request.data.get('farm_id')).count())
		if(request.data.get('date')!=None):
			date=datetime.strptime(request.data.get('date'),'%Y-%m-%d %H:%M:%S.%f').date()
			date=datetime(date.year,date.month,date.day,0,0,0)
			print(species.objects.all().filter(id=request.data['species']).count())
			if (connect_animal_farm.objects.filter(animal_sub_type=species.objects.all().get(id=request.data['species']).id,date=date,is_male=request.data.get('is_male'),farm_id=farm.objects.get(id= request.data.get('farm_id')).id).count()!=0):
				connect_animal_farm1=connect_animal_farm.objects.get(animal_sub_type=species.objects.all().get(id=request.data['species']).id,date=date,is_male=request.data.get('is_male'),farm_id=farm.objects.get(id= request.data.get('farm_id')).id)
				connect_animal_farm1.animal_number=request.data.get('animal_number')
				connect_animal_farm1.date=date
				connect_animal_farm1.save()
				message='تم تعديل البيانات'
			else:
				connect_animal_farm1=connect_animal_farm()
				connect_animal_farm1.animal_number=request.data.get('animal_number')
				connect_animal_farm1.animal_sub_type=species.objects.get(id=request.data.get('species'))
				message='تم اضافة البيانات'
			#connect_animal_farm1.total_money=request.data.get('total_money')
			bool1=False
			print(type(request.data.get('is_male')))
			if(request.data.get('is_male')=='1'):
				print('kkkuuyytt')
				bool1=True
			connect_animal_farm1.is_male=bool1
			connect_animal_farm1.farm_id=farm.objects.get(id= request.data.get('farm_id'))
			connect_animal_farm1.date=date.date()
			connect_animal_farm1.save()
			user1=connectFarmAnimalSeralizer(instance= connect_animal_farm1)
			return  JsonResponse({'message':message})
		return JsonResponse({"errors":'من فضلك اختار تاريخ'})
	if(request.data['operation']=='delete'):
		date=datetime.strptime(request.data.get('date'),'%Y-%m-%d %H:%M:%S.%f').date()
		date=datetime(date.year,date.month,date.day,0,0,0)
		con1=connect_animal_farm.objects.get(date=date ,farm_id=farm.objects.get( id=request.data.get('farm_id')) ,is_male=request.data.get('is_male'),animal_sub_type=species.objects.get(id=request.data.get('species')))
		if(request.data['animal_number']!=None and request.data['animal_number']!= '' ):
			print('hyttww3344')
			print(request.data['animal_number'] )
			print(type(int(request.data['animal_number'])))
			con1.animal_number=int(request.data['animal_number'])
			con1.save()
			con1=connectFarmAnimalSeralizer(instance=con1)
			print(con1.data)
			return response.Response(data=con1.data)
		else:
			con1=con1.delete()
			return JsonResponse({"message":'تم مسح البيانات'})

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def get_locations(request :Request):
	pass
	g1=village.objects.all()[0]
	g1Seralizer= locatinSeralizer(instance=g1)
	print(g1Seralizer.data )
	return response.Response(data=g1Seralizer.data)

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def get_animal(request :Request):
	try:
		g1=species.objects.all()[0]
		g1Seralizer= animalSeralizer(instance=g1)

		print(g1Seralizer.data )
		return response.Response(data=g1Seralizer.data)
	except Exception as e:
		print(e)
		g1=species.DoesNotExist()
		return JsonResponse({"error":None});
		

@api_view(['GET','POST'])
@permission_classes([CustomerAccessPermission])
@authentication_classes([CustomerBackend])
def change_password_email(request :Request):
	if(User.objects.filter(email=request.data['email']).count()==0):
		print('uuuuuuuuuuuuuuuuuuuuuuuu')
		return JsonResponse({"error":"login first"})
	from uuid import uuid4
	code=uuid4()
	render(request,template_name='confirm_code.html', context={"code":code})
	print('jjuuuuuuuuffrrrr\n')
	html_content = render_to_string('confirm_code.html', context={"code":code}).strip()
	subject = 'confirm email address'


	msg = EmailMultiAlternatives(subject, html_content,from_email=settings.EMAIL_HOST_USER , to=[request.data.get('email')],reply_to= [request.data.get('email')])
	msg.content_subtype = 'html'  # Main content is text/html
	msg.mixed_subtype = 'related'
	 # This is critical, otherwise images will be displayed as attachments!
	msg.send()
	print(code)
	import redis
	r=redis.Redis()
	#send_mail('change_password','the code is   '+str(code  ),settings.EMAIL_HOST_USER,[request.data.get('email')],fail_silently=False)
	r.setex(name=str(code  ),time=5*60,value=request.data.get('email'))
	print('kkkkii'*78)
	return JsonResponse({"message":'تم ارسال الرسالة'})

@api_view(['GET','POST'])
@permission_classes([CustomerAccessPermission])
@authentication_classes([CustomerBackend])
def change_password_done(request :Request):
	import redis
	r=redis.Redis()
	email=r.get(request.data.get('code'))
	print(email)
	print(request.data.get('password'))
	if(isinstance(email,bytes)):
		email=email.decode()
	if(email!=None):
		print('kkjjuytrewww123\n')
		print(email)
		user=User.objects.get(email=email)
		user.set_password(request.data.get('password'))
		user.save()
	return JsonResponse({"message":'تم تغير كلمه المرور'})





@api_view(['GET','POST'])
@permission_classes([CustomerAccessPermission])
@authentication_classes([CustomerBackend])
def connect_farm_farmer_api(request :Request):
	if(request.data.get('operation')=='insert'):
		print(request.data.get('farm_id'))
		try:
			connect_farm_farmer1=connect_farm_farmer()
			connect_farm_farmer1.farmer=User.objects.get(ssn=request.data.get('farmer_id'))
			connect_farm_farmer1.farm=farm.objects.get(id=request.data.get('farm_id'))
			connect_farm_farmer1.total_cost=request.data.get('total_cost')
			connect_farm_farmer1.save()
			con1=connectFarmFarmerSeralizer(instance=connect_farm_farmer1)
			return JsonResponse({"message":"تم اضافة البيانات"})
		except:
			print('hhhhtttrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr')
			connect_farm_farmer1=connect_farm_farmer.objects.get(farmer_id=User.objects.get(ssn=request.data.get('farmer_id')),farm=farm.objects.get(id=request.data.get('farm_id')))
			connect_farm_farmer1.total_cost=request.data.get('total_cost')
			con1=connectFarmFarmerSeralizer(instance=connect_farm_farmer1)
			return JsonResponse({"message":"تم تعديل البيانات"})
	if(request.data.get('operation')=='delete'):
		connect_farm_farmer1=connect_farm_farmer.objects.filter(farm=request.data.get('farm_id'),farmer=request.data.get('farmer_id')).delete()
		return JsonResponse({"message":"تم مسح البيانات"})


@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def admin_api(request :Request):
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
		else:
			user1[0].delete()
			return JsonResponse({"error":'تم مسح البيانات'})
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
		return JsonResponse({"message":"تم تعديل البيانات"})
		print(user1.age)
	if(oper=='insert'):
		dic1=request.data.dict()
		dic1.pop('operation')
		print(set(dic1) ,set(['ssn','fname','lname','email','password','phone','photo','job','age']))
		if(set(dic1).issubset(['ssn','fname','lname','email','password','phone','photo','job','age'])):
			print(dic1)
			user1=User.objects.create_superuser(**dic1)
			return JsonResponse({"message":"تم اضافة البيانات"})

@api_view(['GET','POST'])
@permission_classes([permissions.IsAuthenticated])
@authentication_classes([CustomerBackend])
def list_farm_api(request :Request):
	import typesense
	client = typesense.Client({
					'api_key': 'AA3jvgcuaEfuB3GAtWjNS3LG66404bd6KHOBK1YqstLgBTtT',
					'nodes': [{
							'host': 'localhost',
							'port': '8108',
							'protocol': 'http'
					}],
					'connection_timeout_seconds': 2
			})
	d1=client.collections['farm'].documents.search({"q":request.data['name'],"query_by":"name"})
	l1=[i['document']['id'] for i in d1['hits']]
	 
	ser1=FarmListSerializer(instance=farm.objects.all().filter(id__in= l1),many=True)
	return response.Response(ser1.data)