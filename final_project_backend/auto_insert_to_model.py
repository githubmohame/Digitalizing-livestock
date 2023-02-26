from digital_livestock.models import governorate,city,village,section_type,platoon,farm_type,species
import pandas as pd
def insert_into_governorate():
    df=pd.read_excel('./locations.xlsx')
    f1=df['ADM1_AR']
    na1=f1.unique()
    for i in na1:
        g1=governorate()
        g1.name=i
        g1.save()
    print('done')
def insert_into_city():
    df=pd.read_excel('./locations.xlsx')
    f1=df.loc[ 0:,['ADM1_AR','ADM2_AR']]
    print(len(f1['ADM2_AR'].unique()))
    fn12=f1.drop_duplicates()
    for j,i in fn12.iterrows():
        print(i['ADM1_AR'])
        print(i['ADM2_AR'])
        g1=governorate.objects.get(name=i['ADM1_AR'])
        c1=city()
        c1.name=i['ADM2_AR']
        c1.governorate=g1
        c1.save()
    print('done')
def insert_into_village():
    df=pd.read_excel('./locations.xlsx')
    f1=df.loc[ 0:,['ADM3_AR','ADM2_AR']]
    fn12=f1.drop_duplicates()
    for j,i in fn12.iterrows():
        print(i['ADM2_AR'])
        print(i['ADM3_AR'])
        c1=city.objects.get(name=i['ADM2_AR'])
        v1=village()
        v1.name=i['ADM3_AR']
        v1.city=c1
        v1.save()
    print('done')
#insert_into_governorate()
#insert_into_city()
#insert_into_village() 
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
        print(i.name.count('\n'))

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
insert_species(list1=['الأكتين الشقراء','الآيرشاير','الجيرسي','الهولشتاين','الأنجوس','هيريفورد','شاروليز'],platoon1='الابقار')