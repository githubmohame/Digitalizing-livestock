from django.db.models.signals import  post_save
from django.dispatch import receiver
from .models import village
@receiver(post_save,sender=village)
def update_counter_village():
    pass