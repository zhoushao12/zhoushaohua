exec dbms_service.create_server(
    service_name => 'proddb_rw',
    network_name => 'proddb_rw',
    aq_ha_notifications => TRUE,
    failover_method => 'BASIC',
    failover_type => 'SELECT',
    failover_retries => 30,
    failover_delay => 5
);

create trigger myapptrigg after startup on database  
declare  
 v_role varchar(30);  
begin  
 select database_role into v_role from v$database;  
 if v_role = 'PRIMARY' then  
 DBMS_SERVICE.START_SERVICE('proddb_rw');  
 else  
 DBMS_SERVICE.STOP_SERVICE('proddb_rw');  
 end if;  
end;  
/  


 begin  
 dbms_service.create_service('proddb_rw','proddb_rw');  
end;  
/  
begin  
 DBMS_SERVICE.START_SERVICE('proddb_rw');  
end;  
/  