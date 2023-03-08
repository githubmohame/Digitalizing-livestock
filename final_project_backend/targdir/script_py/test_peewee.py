from peewee import *

database = MySQLDatabase('test_db2', **{'charset': 'utf8', 'sql_mode': 'PIPES_AS_CONCAT', 'use_unicode': True, 'user': 'root', 'password': 'Mohammmed123#'})

class UnknownField(object):
	def __init__(self, *_, **__): pass

class BaseModel(Model):
	class Meta:
		database = database

class Activities(BaseModel):
	created_at = DateTimeField(null=True)
	id = BigAutoField()
	name = CharField()
	updated_at = DateTimeField(null=True)

	class Meta:
		table_name = 'activities'

class Cities(BaseModel):
	created_at = DateTimeField(null=True)
	gov_id = IntegerField()
	id = BigAutoField()
	name = CharField()
	updated_at = DateTimeField(null=True)

	class Meta:
		table_name = 'cities'

class Farms(BaseModel):
	activity = CharField()
	avg_workforce = IntegerField()
	capacity_fields = IntegerField()
	city = CharField()
	commercial_register = AutoField()
	created_at = DateTimeField(null=True)
	cultivated_area = IntegerField()
	governorate = CharField()
	name = CharField()
	num_fields = IntegerField()
	num_isolation_wards = IntegerField()
	sector_type = CharField()
	updated_at = DateTimeField(null=True)
	url = CharField()
	Village = CharField()

	class Meta:
		table_name = 'farms'

class Geom(BaseModel):
	g = UnknownField(null=True)  # geometry

	class Meta:
		table_name = 'geom'
		primary_key = False

class Governorate(BaseModel):
	created_at = DateTimeField(null=True)
	id = BigAutoField()
	name = CharField()
	updated_at = DateTimeField(null=True)

	class Meta:
		table_name = 'governorates'

class Migrations(BaseModel):
	batch = IntegerField()
	migration = CharField()

	class Meta:
		table_name = 'migrations'

class Owners(BaseModel):
	age = IntegerField()
	created_at = DateTimeField(null=True)
	full_name = CharField()
	job = CharField()
	national_id = AutoField()
	phone = IntegerField()
	updated_at = DateTimeField(null=True)
	username = CharField()

	class Meta:
		table_name = 'owners'

class PersonalAccessTokens(BaseModel):
	abilities = TextField(null=True)
	created_at = DateTimeField(null=True)
	expires_at = DateTimeField(null=True)
	id = BigAutoField()
	last_used_at = DateTimeField(null=True)
	name = CharField()
	token = CharField(unique=True)
	tokenable_id = BigIntegerField()
	tokenable_type = CharField()
	updated_at = DateTimeField(null=True)

	class Meta:
		table_name = 'personal_access_tokens'
		indexes = (
			(('tokenable_type', 'tokenable_id'), False),
		)

class Village(BaseModel):
	city_id = IntegerField()
	created_at = DateTimeField(null=True)
	id = BigAutoField()
	name = CharField()
	updated_at = DateTimeField(null=True)

	class Meta:
		table_name = 'villages'



import geopandas as gpd
def add_Governorate():
	df=gpd.read_file('./egy_admbnda_adm1_capmas_20170421.zip')
	f1=df.loc[ 0:,['ADM1_AR' ,'geometry']]
	na1=f1.drop_duplicates()
	count=1
	for j,i in na1.iterrows():
		g1=Governorate.create(name=i['ADM1_AR'],id=count)
		 
		print(Governorate.select().count())
		count+=1
def add_city():
	count=1
	df=gpd.read_file('egy_admbnda_adm2_capmas_20170421.zip')
	f1=df.loc[ 0:,['ADM1_AR','ADM2_AR','geometry']]
	fn12=f1.drop_duplicates()
	for j,i in fn12.iterrows():
		for f in Governorate.select().where(Governorate.name==i['ADM1_AR']):
			g_id=f.id
		c1=Cities.create(name=i['ADM2_AR'],id=count,gov_id=g_id)
		count+=1
  
def add_Village():
	count=1
	df=gpd.read_file('egy_admbnda_adm3_capmas_20170421.zip')
	f1=df.loc[ 0:,['ADM3_AR','ADM2_AR','geometry']]
	fn12=f1.drop_duplicates()
	for j,i in fn12.iterrows():
		for f in Cities.select().where(Cities.name==i['ADM2_AR']):
			g_id=f.id
		c1=Village.create(name=i['ADM3_AR'],id=count,city_id=g_id)
		 
		c1.save( )
		count+=1
add_Governorate()
add_city()
add_Village()

