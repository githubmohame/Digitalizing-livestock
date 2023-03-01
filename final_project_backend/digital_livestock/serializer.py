from rest_framework  import serializers
from digital_livestock.models import *
class governorateSerializer(serializers.ModelSerializer):
    class Meta:
        model=governorate
        fields=['name','id']
        
class citySerializer(serializers.ModelSerializer):
    class Meta:
        model=city
        fields=['name']

class villageSerializer(serializers.ModelSerializer):
    class Meta:
        model=village
        fields=['name']
        
class platoonSerializer(serializers.ModelSerializer):
    class Meta:
        model=platoon
        fields=['name']
        
class speciesSerializer(serializers.ModelSerializer):
    class Meta:
        model=species
        fields=['name']
        
class section_typeSerializer(serializers.ModelSerializer):
        class Meta:
            model=section_type
            fields=['name']
class farm_typeSerializer(serializers.ModelSerializer):
        class Meta:
            model=farm_type
            fields=['name']

class UserSerializer(serializers.ModelSerializer):
    class Meta:
            model=User
            fields=['fname','lname','email','phone','ssn','password']
class FarmSerializer(serializers.ModelSerializer):
    class Meta:
            model=farm
            fields="__all__"