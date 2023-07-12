#from django.db import models
from django.core.validators import RegexValidator
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager
#import uuid
import datetime
from django.db.models.fields.files import ImageFieldFile
from django.contrib.gis.db import models
from django.contrib.auth.models import Group
from django.contrib.gis.db.backends import  spatialite
from django.forms import FileField
#from django.db.backends import sqlite3
#from django.db import models
# Create your models here.
#
'''class for_what_use_animal(models.Model):
    name=models.CharField(max_length=20)
    id=models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    '''

class platoon(models.Model):
    name = models.CharField(max_length=20)
    id = models.AutoField(primary_key=True , editable=False)


class species(models.Model):
    name = models.CharField(max_length=20)
    id = models.AutoField(primary_key=True , editable=False)
    platoon = models.ForeignKey(platoon, on_delete=models.CASCADE)

    # country=models.CharField(max_length=20,null=True)
'''class connect_sub_animal_for_what(models.Model):
    animal_sub_type=models.ForeignKey(animal_sub_type,on_delete=models.CASCADE)
    for_what_use_animal=models.ForeignKey(for_what_use_animal,on_delete=models.CASCADE)
    '''


class governorate(models.Model):
    name = models.CharField(max_length=50)
    id = models.AutoField(primary_key=True , editable=False)
    location = models.GeometryField(null=True)
class city(models.Model):
    name = models.CharField(max_length=50)
    id = models.AutoField(primary_key=True , editable=False)
    governorate = models.ForeignKey(governorate, on_delete=models.CASCADE)
    location = models.GeometryField(geography=True,null=True)







class village(models.Model):
    name = models.CharField(max_length=50)
    id = models.AutoField(primary_key=True , editable=False)
    city = models.ForeignKey(city, on_delete=models.CASCADE)
    location = models.GeometryField(geography=True,null=True)






class AdminManager(BaseUserManager):
     
    def create_user(self, ssn, lname,fname, phone, password, location=None, **other_fields):
        
        user = self.model(fname=fname,ssn=ssn, lname=lname, phone=phone, location=location,**other_fields)
        user.set_password(password)
        user.save()
        user.groups.add(Group.objects.get(name="admin"))
        return user

    def get_queryset(self):
        return super().get_queryset().filter( groups__name__in=["admin"])








class FarmerManager(BaseUserManager):
     
    def create_user(self, ssn, lname,fname, phone, password, location=None, **other_fields):
        
        user = self.model(fname=fname,ssn=ssn, lname=lname, phone=phone, location=location,**other_fields)
        user.set_password(password)
        user.save()
        user.groups.add(Group.objects.get(name="farmer"))
        return user

    def get_queryset(self):
        return super().get_queryset().filter( groups__name__in=["farmer"])







class UserManager(BaseUserManager):
    def create_superuser(self, ssn ,fname, phone,  password, location=None,lname=None, **other_fields):
        print('hello world')
        #other_fields.setdefault('is_staff', True)
        other_fields.setdefault('is_superuser', True)
        other_fields.setdefault('is_active', True)
        other_fields.setdefault('is_active', False)
        '''
         if other_fields.get('is_staff') is not True:
            raise ValueError(
                'Superuser must be assigned to is_staff=True.')
        '''
        if other_fields.get('is_superuser') is not True:
            raise ValueError(
                'Superuser must be assigned to is_superuser=True.')

        return self.create_user(ssn, fname=fname,lname=lname,phone= phone,  password= password,location= location, **other_fields)

    def create_user(self, ssn, lname,fname, phone, password, location=None, **other_fields):
        
        user = self.model(fname=fname,ssn=ssn, lname=lname, phone=phone, location=location,**other_fields)
        print(type (password) )
        user.set_password(password)
        user.save()
        return user


class User(AbstractBaseUser, PermissionsMixin):
    def __init__(self, *args, **kwargs):
        super(User, self).__init__(*args, **kwargs)
        self.old_kwargs=self.__dict__.copy()
        self.old_kwargs["img"]=ImageFieldFile(instance=self,field=models.ImageField(upload_to="farmer_user",blank=False,null=True,),name=self.img.name)
        self.old_kwargs["group"]=list(self.groups.all())
        #print(args)
    ssn = models.CharField(max_length=13, primary_key=True, validators=[RegexValidator(regex='''[1-9]{1,1}[0-9]{12,12}''')])
    USERNAME_FIELD = 'ssn'
    REQUIRED_FIELDS = ['phone', 'fname',]
    fname = models.CharField(max_length=30, blank=False, validators=[
        RegexValidator(regex='''[a-zA-Zا-ي]''')
    ])
    phone = models.CharField(max_length=12, blank=False, validators=[
        RegexValidator(regex='''[0-9]{12,12}''')
    ])
    #photo = models.ImageField(upload_to='personal_images')
    #village = models.ForeignKey(village, null=True, on_delete=models.CASCADE)
    objects = UserManager()
    farmer=FarmerManager()
    admin=AdminManager()
    email=models.EmailField(null=True,unique=True,)
    lname = models.CharField(null=True,max_length=30, blank=False, validators=[
        RegexValidator(regex='''[a-zA-Zا-ي]''')
    
    ])
    job = models.CharField(null=True,max_length=30, blank=False, validators=[
        RegexValidator(regex='''[a-zA-Zا-ي]''')
    
    ])
    is_staff=models.BooleanField(default=False)
    is_active=models.BooleanField(default=True)
    age=models.IntegerField(null=True,)
    location=models.ForeignKey(village,null=True,on_delete=models.SET_NULL)
    img=models.ImageField( upload_to="farmer_user",blank=True,null=True,)

class totpyUsers(models.Model):
    insert_time = models.DateTimeField(default=datetime.date.today)
    totp=models.CharField( max_length=32,unique=True)
    user=models.ForeignKey(User,on_delete=models.CASCADE)
class farm_type(models.Model):
    name = models.CharField(max_length=30, blank=False, null=False)
    id = models.AutoField(primary_key=True,  editable=False)


class section_type(models.Model):
    name = models.CharField(max_length=30, blank=False, null=False)
    id = models.AutoField(primary_key=True , editable=False)


class farm(models.Model):
    def __init__(self, *args, **kwargs):
        super(farm, self).__init__(*args, **kwargs)
        self.old_kwargs=self.__dict__.copy()
        self.old_kwargs["img"]=ImageFieldFile(instance=self,field=models.ImageField(upload_to="farm_img",blank=False,null=True,),name=self.img.name)
    def create(self, **obj_data):
        # Do some extra stuff here on the submitted data before saving...
        # For example...
 
        # Now call the super method which does the actual creation
        return super().create(**obj_data)
    farm_name = models.CharField(max_length=30,null=True)
    id = models.CharField(primary_key=True ,max_length=40 )
    number_of_workers_inner = models.PositiveIntegerField(null= False,default=0)
    number_of_workers_outer = models.PositiveIntegerField(null=False)
    playground = models.PositiveIntegerField(null=False)
    huge_playground=models.PositiveIntegerField(null=True)
    wards = models.PositiveIntegerField(null=False)
    isolated_wards = models.PositiveIntegerField(null=False)
    # google_map=models.URLField(null=True)
    section_type = models.ForeignKey(section_type, on_delete=models.CASCADE)
    village = models.ForeignKey(village, on_delete=models.CASCADE)
    attached_area = models.PositiveIntegerField(validators=[])
    location = models.GeometryField(null=True,geography=True )
    total_area_of_farm=models.PositiveIntegerField(null=True)
    img=models.FileField( upload_to="farm_img",blank=True,null=True)
class connect_farm_farmtype(models.Model):
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['farm', 'farm_type' ,], name="connect_farm_farmtype_uk")
        ]
    farm=models.ForeignKey(farm,on_delete=models.CASCADE,null=False)
    farm_type=models.ForeignKey(farm_type,on_delete=models.CASCADE,null=False)
    
class connect_animal_farm(models.Model):
    animal_sub_type = models.ForeignKey(species, on_delete=models.CASCADE)
    farm_id = models.ForeignKey(farm, on_delete=models.CASCADE)
    animal_number = models.PositiveIntegerField(null=False)
    is_male = models.BooleanField(null=False, blank=False)
    #total_money = models.PositiveIntegerField(validators=[])
    date=models.DateField(null=True, blank=True, )
    


class connect_farm_farmer(models.Model):
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['farm', 'farmer' ,], name="connect_farm_farmer_uk")
        ]
    farm=models.ForeignKey(farm,on_delete=models.CASCADE,)
    farmer=models.ForeignKey(User,on_delete=models.CASCADE)
    total_cost=models.PositiveIntegerField ()
    #date=models.DateField()
    


