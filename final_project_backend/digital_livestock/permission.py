from rest_framework import permissions
from django.contrib.auth.models import AnonymousUser,Group

class CustomerAccessPermission(permissions.BasePermission):

	def has_permission(self, request, view):
		if(type(request.user)!=AnonymousUser and request.user.groups.all().filter(name="admin").count()>0 and view.__class__.__name__ in ["modified_gavernorate","modified_city","modified_village","modified_species","modified_platoon" ,"governorate_api","get_locations_api","city_api","village_api","admin_api"]):
			return True;
		elif(type(request.user)!=AnonymousUser and request.user.groups.all().filter(name="fockeltpoint").count()>0 and  view.__class__.__name__ in["farm_api","farmer_api","add_farm_animal" , "search_farm_api","search_farmer_api","connect_farm_farmer_api","farm_info_list","farm_info","farm_platoon_api","farm_species_api","get_animal_farm","farm_map_bounder_api","governorate_api","get_locations_api","city_api","village_api","farm_type_api","section_type_api","animal_species_api","animal_plotoon_api","get_animal" ,"img_farmer_api" ,]):
			#print("jjjhyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy")
			return True
		elif(type(request.user)!=AnonymousUser and request.user.groups.all().filter(name="supervisor").count()>0  and view.__class__.__name__ in["governorate_api","city_api","village_api","location_statistics", "summary_governorate"]):
			return True
		elif(view.__class__.__name__ in ["login","send_totpy_email","send_totpy_template"]):	
			return True
		elif(type(request.user)!=AnonymousUser and view.__class__.__name__ in["change_password","change_password_done","change_password_email"] ):
			return True
		elif(type(request.user)!=AnonymousUser and request.user.groups.all().filter(name="farmer").count()>0 and  view.__class__.__name__ in ["farm_info_list","farm_info","farm_platoon_api","farm_species_api","get_animal_farm"]):
			return True
		elif(type(request.user)!=AnonymousUser and view.__class__.__name__ in ["check_totp_api"]):
			return True
	def has_object_permission(self, request, view, obj):
		return False
