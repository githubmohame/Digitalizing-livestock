from  table_location import *
try:
   from digital_livestock.models import *
except:
   pass
def insert_governorate():
   wb =open_file(x=None,file_name='table_locations.xlsx',sheet_name='cow')
   l1=distinct_governorate(wb)
   for name in l1:
      gover=governorate()
      gover.name=name
      gover.save()
def insert_city():
   wb =open_file(x=None,file_name='table_locations.xlsx',sheet_name='table_locations')
   l1,l2=distinct_city(wb)
   for i in range(0,len(l1)):
      city1=city()
      city1.name=l2[i]
      city1.governorate_id=governorate.objects.get(name=l1[i])
      city1.save()
def insert_village():
   wb =open_file(x=None,file_name='table_locations.xlsx',sheet_name='table_locations')
   l1,l2=distinct_village(wb)
   for i in range(0,len(l1)):
      city1=village()
      city1.name=l2[i]
      city1.city_id=city.objects.get(name=l1[i])
      city1.save()
def insert_animal():
   animal1=animal_type()
   animal1.name="الابقار"
   animal1.save()
   animal1=animal_type()
   animal1.name="الاغنام"
   animal1.save()
def insert_subtype():
   wb=open_file(x=None,file_name='animal_file.xlsx',sheet_name='cow')
   ws=wb['cow']
   col1=list(ws.rows)
   for i   in range(len(col1)):
      l1=[i.value for i in col1[i]]
      if(l1[0] is None or l1[0]=='السلالة' or l1[0]=='—'):
         continue
      l1=[i.value for i in col1[i]]
      #print(l1[1])
      #print(l1[0]+'\t'+l1[2]+'\t'+l1[3]+'\t'+l1[4])
      animal_sub_type1=animal_sub_type()
      animal_sub_type1.name=l1[0]
      animal_sub_type1.animal_type=animal_type.objects.get(name='االابقار')
      if(l1[1]=='—'):
          animal_sub_type1.country=l1[1]=None
      else:
         animal_sub_type1.country=l1[1]
      animal_sub_type1.save()
      connect_sub_animal_for_what1=connect_sub_animal_for_what()
      connect_sub_animal_for_what1.animal_sub_type=animal_sub_type1
      if(l1[2]!='—' or l1[2]!=None):
         connect_sub_animal_for_what1.for_what_use_animal=for_what_use_animal.objects.get(name='اللحم')
      elif(l1[3]!='—' or l1[3]!=None):
         connect_sub_animal_for_what1.for_what_use_animal=for_what_use_animal.objects.get(name='الحليب')
      elif(l1[4]!='—' or l1[4]!=None):
         connect_sub_animal_for_what1.for_what_use_animal=for_what_use_animal.objects.get(name='بقر الأشغال (جرار)')
      connect_sub_animal_for_what1.save()
#insert_village()
def insert_animal():
   animal_type1=animal_type()
   animal_type1.name='االابقار'
   animal_type1.save()
   ############################################
   animal_type1=animal_type()
   animal_type1.name='الاغنام'
   animal_type1.save()
def for_what_use_animal_func():
      animal_sub_type1=for_what_use_animal()
      animal_sub_type1.name='اللحم'
      animal_sub_type1.save()
      ############################################
      animal_sub_type1=for_what_use_animal()
      animal_sub_type1.name='الحليب'
      animal_sub_type1.save()
      #############################################
      animal_sub_type1=for_what_use_animal()
      animal_sub_type1.name='بقر الأشغال (جرار)'
      animal_sub_type1.save()
insert_subtype()