from rest_framework  import serializers
from digital_livestock.models import *
class governorateSerializer(serializers.ModelSerializer):
    class Meta:
        model=governorate
        fields=['name']
        
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
        models=platoon
        field=['name']
        
class speciesSerializer(serializers.ModelSerializer):
    class Meta:
        models=species
        field=['name']
        