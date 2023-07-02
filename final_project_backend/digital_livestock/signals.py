from django.db.models.signals import  post_save,pre_save,post_delete,m2m_changed
from django.dispatch import receiver
from django.core.signals import request_finished
from .models import User
@receiver(pre_save, sender=User, dispatch_uid="my_unique_identifier1")

def pre_save_image(sender, instance:User,raw, *args, **kwargs):
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
@receiver(post_delete, sender=User, dispatch_uid="my_unique_identifier")
def  u(sender, instance:User , *args, **kwargs):
     
    import os
    if os.path.exists(instance.img.path):
        os.remove(instance.img.path)
                 
        #instance.save()
        
@receiver(m2m_changed,sender=User.groups.through)
def update_group(*args, **kwargs):
    pass 