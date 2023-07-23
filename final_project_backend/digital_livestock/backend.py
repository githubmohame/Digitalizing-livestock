from django.contrib.auth.models import AnonymousUser, Group
from rest_framework.authentication import BaseAuthentication
from digital_livestock.models import User, totpyUsers
import pyotp
import redis

class CustomerBackendTotp(BaseAuthentication):
    def authenticate(self, request, **kwargs):
        try:
            # u1=User.objects.get(ssn=request.headers["ssn"])
            r = redis.Redis(host='localhost', port=6379, decode_responses=True)
            totp= r.get( request.headers["ssn"] )
            if(  totp ) :
                pass
            else:
                u1 = totpyUsers.objects.get(user=request.headers["ssn"])
                totp=u1.totp
                r.set(name=request.headers["ssn"],value=u1.totp,ex=60*60)
            totp = pyotp.TOTP(  totp, interval=60)
            totp_request = str(request.headers.get("totpy"))
            if (totp.verify(totp_request)):
                print("killer") 
                print(User.objects.get(ssn=request.headers["ssn"]))
                return (User.objects.get(ssn=request.headers["ssn"]), None)
            else:
                #print("killer")
                return (AnonymousUser(), None)
        except Exception as e:
            print(e)
            return (AnonymousUser(), None)


class CustomerBackendBasic(BaseAuthentication):
    def authenticate(self, request, **kwargs):

        try:
            u1 = User.objects.get(ssn=request.headers["ssn"])
            if (u1.check_password(request.headers["password"])):
                return (u1, None)
            else:
                return (AnonymousUser(), None)
        except Exception as e:
            # print(e)
            return (AnonymousUser(), None)
