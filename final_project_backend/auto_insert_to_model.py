from digital_livestock.models import governorate,city,village,section_type,platoon,farm_type,species,farm
from django.contrib.auth.models import Group ,Permission
from django.contrib.contenttypes.models import ContentType
import geopandas as gpd
from django.contrib.gis.geos import GEOSGeometry
def insert_into_governorate():
    df=gpd.read_file('./egy_admbnda_adm1_capmas_20170421.zip')
    f1=df.loc[ 0:,['ADM1_AR' ,'geometry']]
    na1=f1.drop_duplicates()
    for j,i in na1.iterrows():
        #print(i["ADM1_AR"])
        g1=governorate()
        g1.name=i['ADM1_AR']
        g1.location= GEOSGeometry(str(i['geometry']))
        g1.save()
def insert_into_city():
    df=gpd.read_file('egy_admbnda_adm2_capmas_20170421.zip')
    f1=df.loc[ 0:,['ADM1_AR','ADM2_AR','geometry']]
    fn12=f1.drop_duplicates()
    for j,i in fn12.iterrows():
        g1=governorate.objects.get(name=i['ADM1_AR'])
        c1=city()
        c1.location= GEOSGeometry(str(i['geometry']))
        c1.name=i['ADM2_AR']
        c1.governorate=g1
        c1.save()
def insert_into_village():
    df=gpd.read_file('egy_admbnda_adm3_capmas_20170421.zip')
    f1=df.loc[ 0:,['ADM3_AR','ADM2_AR','geometry']]
    fn12=f1.drop_duplicates()
    for j,i in fn12.iterrows():
        c1=city.objects.get(name=i['ADM2_AR'])
        v1=village()
        v1.location= GEOSGeometry(str(i['geometry']))
        v1.name=i['ADM3_AR']
        v1.city=c1
        v1.save()
'''insert_into_governorate()
insert_into_city()
insert_into_village() '''
def insert_section_type():
    sec=section_type()
    sec.name='خاص'
    sec.save()
    sec=section_type()
    sec.name='عام'
    sec.save()
#insert_section_type()
def remove_newline_governorate_model():
    for i in governorate.objects.all():
        i.name=i.name.replace('\n','')
        i.save()
#remove_newline_governorate_model()
def insert_farrm_type(list1):
    for i in list1:
        f1=farm_type()
        f1.name=i
        f1.save()
        
#insert_farrm_type(list1=['انتاج طلايع','انتاج البان','انتاج لحوم'])

def insert_species(platoon1:str,list1:list):
     for i in list1:
         sp1=species()
         sp1.name=i
         sp1.platoon=platoon.objects.get(name=platoon1)
         sp1.save()
         
def insert_platoon_type(list1):
    for i in list1:
        pl1=platoon()
        pl1.name=i
        pl1.save()
        
#insert_platoon_type(list1=['الجمال',"الماعز",'الابقار'])
#insert_species(list1=['الأكتين الشقراء','الآيرشاير','الجيرسي','الهولشتاين','الأنجوس','هيريفورد','شاروليز'],platoon1='الابقار')
'''
for i in governorate.objects.all():
    i.delete()
for i in village.objects.all():
    i.delete()
for i in city.objects.all():
    i.delete() 
'''

   
def test_city():
    c1=city.objects.all().filter(location__within=governorate.objects.all()[3].location)
    print(c1.count())
    for i in c1:
        print(i.governorate.name)
#test_city()
import json
def test():
    f1=GEOSGeometry( str(  {
        "type": "Polygon",
        "coordinates": [
          [
            [
              105.7739666,
              21.0726795
            ],
            [
              105.7739719,
              21.0721991
            ],
            [
              105.7743394,
              21.0721966
            ],
            [
              105.774331,
              21.0725269
            ],
            [
              105.7742564,
              21.072612
            ],
            [
              105.7741865,
              21.0726095
            ],
            [
              105.7741785,
              21.0726746
            ],
            [
              105.7739666,
              21.0726795
            ]
          ]
        ]
      }
  ))
    print(f1)
#test()
#farm.objects.all().delete()
def create_admin():
  admin,create=Group.objects.get_or_create(name="admin")
  context_table=ContentType.objects.all().filter(app_label='digital_livestock',model__in=["village","city","governorate","platoon","species",])
  p1=Permission.objects.all().filter(content_type_id__in=context_table)
  for perm in p1:
    admin.permissions.add(perm)

def create_fockeltpoint():
  admin,create=Group.objects.get_or_create(name="fockeltpoint")
  context_table=ContentType.objects.all().filter(app_label='digital_livestock',model__in=["village","city","governorate","platoon","species",])
  p1=Permission.objects.all().filter(content_type_id__in=context_table,codename__startswith="view")
  for perm in p1:
    admin.permissions.add(perm)
  context_table=ContentType.objects.all().filter(app_label='digital_livestock',model__in=["farm","farmer", ])
  p1=Permission.objects.all().filter(content_type_id__in=context_table )
  for perm in p1:
    admin.permissions.add(perm)
def create_farmer():
  admin,create=Group.objects.get_or_create(name="farmer")
  context_table=ContentType.objects.all().filter(app_label='digital_livestock',model__in=["farm","village", ])
  p1=Permission.objects.all().filter(content_type_id__in=context_table ,codename__startswith="view")
  for perm in p1:
    admin.permissions.add(perm)
def auto_insert():
  
  insert_into_governorate()
  insert_into_city()
  insert_into_village()
  insert_section_type()
  remove_newline_governorate_model()
  insert_farrm_type(list1=['انتاج طلايع','انتاج البان','انتاج لحوم'])
  insert_platoon_type(list1=['الجمال',"الماعز",'الابقار'])
  insert_species(list1=['الأكتين الشقراء','الآيرشاير','الجيرسي','الهولشتاين','الأنجوس','هيريفورد','شاروليز'],platoon1='الابقار')  
  create_farmer()
  create_fockeltpoint()
  create_admin()
auto_insert()
''' 
insert_into_governorate()
insert_into_city()
insert_into_village()
'''
