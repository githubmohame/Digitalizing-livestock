from digital_livestock.models import  *
import pyotp
def my_scheduled_job():
   list1=[]
   for i in User.objects.all():
       str1=pyotp.random_base32()
       totpy1=totpyUsers()
       totpy1.user=i.ssn
       totpy1.totp=str1
       list1.append(totpy1)