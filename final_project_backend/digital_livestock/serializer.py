from rest_framework  import serializers
from digital_livestock.models import *
class governorateSerializer(serializers.ModelSerializer):
    class Meta:
        model=governorate
        fields=['name','id']
        
class citySerializer(serializers.ModelSerializer):
    class Meta:
        model=city
        fields=['name','id']

class villageSerializer(serializers.ModelSerializer):
    class Meta:
        model=village
        fields=['name','id']
        
class platoonSerializer(serializers.ModelSerializer):
    class Meta:
        model=platoon
        fields=['name','id']
        
class speciesSerializer(serializers.ModelSerializer):
    class Meta:
        model=species
        fields=['name','id']
        
class section_typeSerializer(serializers.ModelSerializer):
        class Meta:
            model=section_type
            fields=['name','id']
class farm_typeSerializer(serializers.ModelSerializer):
        class Meta:
            model=farm_type
            fields=['name','id']

class FarmerSerializer(serializers.ModelSerializer):
    class Meta:
            model=User
            fields=['fname','lname','email','phone','ssn','password']
class FarmSerializer(serializers.ModelSerializer):
    class Meta:
            model=farm
            fields="__all__"


class connectFarmAnimalSeralizer(serializers.ModelSerializer):
    class Meta:
            model=connect_animal_farm
            fields="__all__"

class citySeralizer(serializers.ModelSerializer):
    class Meta:
            
            model=city
            fields= ['id' ,'governorate_id' ]



class locatinSeralizer(serializers.ModelSerializer):
    city = citySeralizer(many=False, read_only=True)
    class Meta:
            
            model=village
            fields= ['id' , 'city']


class animalSeralizer(serializers.ModelSerializer):
     class Meta:
            
            model=species
            fields= ['id' , 'platoon']


class connectFarmFarmerSeralizer(serializers.ModelSerializer):
     class Meta:
            model=connect_farm_farmer
            fields= ['farm' , 'farmer','total_cost']



class governorateFarmListSerializer(serializers.ModelSerializer):
    class Meta:
        model=governorate
        fields=['name' ]
        
class cityFarmListSerializer(serializers.ModelSerializer):
    governorate=governorateFarmListSerializer()
    class Meta:
        model=city
        fields=['name' ,'governorate',]

class villageFarmListSerializer(serializers.ModelSerializer):
    city=cityFarmListSerializer()
    class Meta:
        model=village
        fields=['name' ,'city']

class section_typeFarmListSerializer(serializers.ModelSerializer):
        class Meta:
            model=section_type
            fields=['name' ]
class FarmListSerializer(serializers.ModelSerializer):
    village=villageFarmListSerializer()
    section_type=section_typeFarmListSerializer()
    class Meta:
            model=farm
            fields=['farm_name','number_of_workers','village','id','section_type']


