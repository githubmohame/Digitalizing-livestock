from django.db.models.signals import  post_save,pre_save,post_delete,m2m_changed
from django.dispatch import receiver
from django.contrib.auth.models import Group
import pyotp
from django.core.signals import request_finished
from django.db.models.fields.files import ImageFieldFile
import typesense
import json
import os
from django.contrib.gis.db import models

from .models import User,farm,totpyUsers
import uuid
'''
@receiver(pre_save, sender=User, dispatch_uid="pre_save_User")
def pre_save_User(sender, instance:User,raw, *args, **kwargs):
    try:
        old_img = User.objects.all().get(ssn=instance.ssn).img.path
        try:
            new_img = instance.img.path
            

        except:
            new_img = None
        if  old_img!=new_img:
            import os
            if os.path.exists(old_img):
                os.remove(old_img)
                 
        #instance.save()
    except: 
        pass
'''
@receiver(post_delete, sender=farm, dispatch_uid="my_unique_identifier")
def  post_delete_farm(sender, instance:farm , *args, **kwargs):
    try:
        
        if os.path.exists(instance.img.path):
            os.remove(instance.img.path)
    except:
        pass
    client = typesense.Client({
					'api_key': 'AA3jvgcuaEfuB3GAtWjNS3LG66404bd6KHOBK1YqstLgBTtT',
					'nodes': [{
							'host': 'localhost',
							'port': '8108',
							'protocol': 'http'
					}],
					'connection_timeout_seconds': 2
			})
    #client.collections['farmer'].documents[instance.old_kwargs["id"]].delete( )
    try:
        client.collections['farm'].documents[instance.id].delete( )
    except Exception as e:
        pass
    m=instance.__dict__.copy()
    m.pop("old_kwargs")
    instance.old_kwargs=m
    instance.old_kwargs["img"]=ImageFieldFile(instance=instance,field=instance.img.field,name=instance.img.name)

@receiver(post_save, sender=farm, dispatch_uid="post_save_farm")
def post_save_farm(sender, instance:farm,raw,created:bool, *args, **kwargs):
    client = typesense.Client({
					'api_key': 'AA3jvgcuaEfuB3GAtWjNS3LG66404bd6KHOBK1YqstLgBTtT',
					'nodes': [{
							'host': 'localhost',
							'port': '8108',
							'protocol': 'http'
					}],
					'connection_timeout_seconds': 2
			})
    print(created)
    if (instance.old_kwargs["id"]!="" and instance.id!=instance.old_kwargs["id"] and not  created):
        try:
            client.collections['farm'].documents[instance.old_kwargs["id"]].delete( )
        except Exception as e:
            pass
        client.collections['farm'].documents.import_(json.dumps({"id":instance.id,"name":instance.farm_name}))
        return
    elif((instance.farm_name!=instance.old_kwargs['farm_name'] )and not  created)  :
        client.collections['farm'].documents[instance.id].update(json.dumps({"id":instance.id,"name":instance.farm_name }),{'dirty_values': 'coerce_or_reject'})
    else:
         client.collections['farm'].documents.import_(json.dumps({"id":instance.id,"name":instance.farm_name}))
    try:
        
        if(instance.img.path!=instance.old_kwargs["img"].path):
        
            if os.path.exists(instance.old_kwargs["img"].path):
                        os.remove(instance.old_kwargs["img"].path)
    except Exception as e:
        pass
        print(e)
    m=instance.__dict__.copy()
    m.pop("old_kwargs")
    instance.old_kwargs=m
    instance.old_kwargs["img"]=ImageFieldFile(instance=instance,field= models.ImageField(upload_to="farm_img",blank=False,null=False),name=instance.img.name)
@receiver(m2m_changed, sender=User.groups.through, dispatch_uid= 'my_unique_identifier')
def m2m_group_User(sender, instance:User, action, *args, **kwargs):
    print(action)
    client = typesense.Client({
					'api_key': 'AA3jvgcuaEfuB3GAtWjNS3LG66404bd6KHOBK1YqstLgBTtT',
					'nodes': [{
							'host': 'localhost',
							'port': '8108',
							'protocol': 'http'
					}],
					'connection_timeout_seconds': 2
			})
    if(action=="post_clear"):
        #client.collections['farmer'].documents[instance.old_kwargs["id"]].delete( )
        client.collections['farmer'].documents[instance.ssn].delete( )
        instance.old_kwargs["group"]=[]
    elif(action in["post_add"]):
     
      if(Group.objects.all().get(name="farmer") in instance.old_kwargs["group"] and Group.objects.all().get(name="farmer")  not in instance.groups.all() ):
        print("kwargs"*12)
        client.collections['farmer'].documents[instance.ssn].delete( )
      if(Group.objects.all().get(name="farmer") not in instance.old_kwargs["group"] and Group.objects.all().get(name="farmer")    in instance.groups.all() ):
        client.collections['farmer'].documents.import_(json.dumps({"id":instance.ssn,"name":instance.fname+" "+instance.lname}))
    elif(action=="post_remove"):
        pass
        if( Group.objects.all().get(name="farmer")  not  in instance.groups.all() and  Group.objects.all().get(name="farmer") in instance.old_kwargs["group"] ):
            client.collections['farmer'].documents[instance.ssn].delete( )
    instance.old_kwargs["group"]=list(instance.groups.all())
@receiver(post_save, sender=User, dispatch_uid="post_save_User")
def post_save_User(sender, instance:User,raw,created:bool, *args, **kwargs):
    client = typesense.Client({
					'api_key': 'AA3jvgcuaEfuB3GAtWjNS3LG66404bd6KHOBK1YqstLgBTtT',
					'nodes': [{
							'host': 'localhost',
							'port': '8108',
							'protocol': 'http'
					}],
					'connection_timeout_seconds': 2
			})
    if (instance.ssn!=instance.old_kwargs["ssn"] and not  created):
        client.collections['farmer'].documents[instance.old_kwargs["id"]].delete( )
        client.collections['farmer'].documents.import_(json.dumps({"id":instance.ssn,"name":instance.fname+" "+instance.lname}))
        return
    elif((instance.fname!=instance.old_kwargs['fname'] or instance.lname!=instance.old_kwargs['lname'] )and not  created)  :
        client.collections['farmer'].documents[instance.ssn].update(json.dumps({"id":instance.ssn,"name":instance.fname+" "+instance.lname}),{'dirty_values': 'coerce_or_reject'})
    else:
        client.collections['farmer'].documents.import_(json.dumps({"id":instance.ssn,"name":instance.fname+" "+instance.lname}))
    try:
        
        if(instance.img.path!=instance.old_kwargs["img"].path):
            print(instance.img.path)
            print(instance.old_kwargs["img"].path)
            if os.path.exists(instance.old_kwargs["img"].path):
                        os.remove(instance.old_kwargs["img"].path)
    except Exception as e:
        pass
        print(e)
    m=instance.__dict__.copy()
    m.pop("old_kwargs")
    instance.old_kwargs=m
    instance.old_kwargs["img"]=ImageFieldFile(instance=instance,field=instance.img.field,name=instance.img.name)
    instance.old_kwargs["group"]=list(instance.groups.all())
    """
    if(created):
        totpy1=totpyUsers()
        totpy1.user=instance
        str1=pyotp.random_base32()
        totpy1.totp=str1
        totpy1.save()
        """
@receiver(post_delete, sender=User, dispatch_uid="my_unique_identifier")
def  post_delete_User(sender, instance:User , *args, **kwargs):
    try:
        
        if os.path.exists(instance.img.path):
            os.remove(instance.img.path)
    except:
        pass
    client = typesense.Client({
					'api_key': 'AA3jvgcuaEfuB3GAtWjNS3LG66404bd6KHOBK1YqstLgBTtT',
					'nodes': [{
							'host': 'localhost',
							'port': '8108',
							'protocol': 'http'
					}],
					'connection_timeout_seconds': 2
			})
    #client.collections['farmer'].documents[instance.old_kwargs["id"]].delete( )
    try:
        client.collections['farmer'].documents[instance.ssn].delete( )
    except Exception as e:
        pass
    m=instance.__dict__.copy()
    m.pop("old_kwargs")
    instance.old_kwargs=m
    instance.old_kwargs["img"]=ImageFieldFile(instance=instance,field=instance.img.field,name=instance.img.name)