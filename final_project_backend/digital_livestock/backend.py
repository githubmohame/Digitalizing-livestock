from django.contrib.auth.models import AnonymousUser, Group
from rest_framework.authentication import BaseAuthentication
from digital_livestock.models import User, totpyUsers
import pyotp


class CustomerBackendTotp(BaseAuthentication):
    def authenticate(self, request, **kwargs):
        try:
            # u1=User.objects.get(ssn=request.headers["ssn"])
            u1 = totpyUsers.objects.get(user=request.headers["ssn"])
            totp = pyotp.TOTP(u1.totp, interval=60)
            totp_request = str(request.headers.get("totpy"))
            if (totp.verify(totp_request)):
                # print("kiiiiiyyyyyy"*676)
                return (User.objects.get(ssn=request.headers["ssn"]), None)
            else:
                return (AnonymousUser(), None)
        except Exception as e:
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
