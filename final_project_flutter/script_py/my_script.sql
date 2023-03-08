
desc villages;
truncate governorates;
truncate cities;
truncate villages;
commit;
select * from governorates;
select * from cities;
select * from villages  where city_id=190;
