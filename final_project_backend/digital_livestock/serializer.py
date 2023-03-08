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
            fields=['name']
class farm_typeSerializer(serializers.ModelSerializer):
        class Meta:
            model=farm_type
            fields=['name']

class FarmerSerializer(serializers.ModelSerializer):
    class Meta:
            model=User
            fields=['fname','lname','email','phone','ssn','password']
class FarmSerializer(serializers.ModelSerializer):
    class Meta:
            model=farm
            fields="__all__"