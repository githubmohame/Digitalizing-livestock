DELIMITER | 

CREATE EVENT totp_clear
ON 
SCHEDULE
every 1 day starts timestampadd(microsecond, timestampdiff(microsecond, current_timestamp() ,timestampadd(hour,1, STR_TO_DATE('23',"%H") ))
,current_timestamp())
comment 'totp_clear'
DO BEGIN
 delete from  test_db.digital_livestock_totpyusers  where timestampdiff(day,insert_time,current_timestamp)>=2
 ;

END;

| DELIMITER ;