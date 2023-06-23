--create function mynew_udf returns int SONAME 'lib45.so';

delimiter //

create trigger  Syncing_typesense_insert_farm
after insert on digital_livestock_farm for each row
begin
declare result text ;
select   run_script(concat('sh /home/mohamed/IdeaProjects/MainFinalProject/database/farm/bash_script_farm.sh  ','"',new.id,'"',' ','"', new.farm_name,'"'  ,' ','insert')) into result ;

end  //; 


drop trigger Syncing_typesense_insert;

show triggers;

drop trigger Syncing_typesense_update;




delimiter //

create trigger  Syncing_typesense_update_farm
after update on digital_livestock_farm for each row
begin
declare result text ;
select   run_script(concat('sh /home/mohamed/IdeaProjects/MainFinalProject/database/farm/bash_script_farm.sh   ','"',new.id,'"',' ','"', new.farm_name,'"'  ,' ','update')) into result ;
end   //;



delimiter //

create trigger  Syncing_typesense_delete_farm
after delete on digital_livestock_farm for each row
begin
declare result text ;
select   run_script(concat('sh /home/mohamed/IdeaProjects/MainFinalProject/database/farm/bash_script_farm.sh  ','"',old.id,'"',' ','"', old.farm_name,'"'  ,' ','delete'))  into result ;
end  //;






-- #######################################################

delimiter //

create trigger  Syncing_typesense_update_farmer
after update on digital_livestock_user for each row
begin
declare result text ;
select   run_script(concat('sh /home/mohamed/IdeaProjects/MainFinalProject/database/farm/bash_script_farm.sh   ','"',new.ssn,'"',' ','"', new.fname,' ',new.lname,'"'  ,' ','update')) into result ;
end   //;



delimiter //

create trigger  Syncing_typesense_delete_farmer
after delete on digital_livestock_user for each row
begin
declare result text ;
select   run_script(concat('sh /home/mohamed/IdeaProjects/MainFinalProject/database/farm/bash_script_farm.sh  ','"',old.ssn,'"',' ','"', new.fname,' ',new.lname,'"'  ,' ','delete'))  into result ;
end  //;




delimiter //

create trigger  Syncing_typesense_insert_farmer
after insert on digital_livestock_user for each row
begin
declare result text ;
select   run_script(concat('sh /home/mohamed/IdeaProjects/MainFinalProject/database/farm/bash_script_farm.sh  ','"',new.ssn,'"',' ','"', new.fname,' ',new.lname,'"'  ,' ','insert')) into result ;

end  //; 


drop trigger Syncing_typesense_delete;
