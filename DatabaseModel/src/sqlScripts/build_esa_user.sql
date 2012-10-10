CREATE TABLESPACE ESAD 
    DATAFILE 
        '/u01/oradata/esa/esad01.dbf' SIZE 536870912 AUTOEXTEND ON NEXT 134217728 MAXSIZE 4294967296 
    DEFAULT NOCOMPRESS 
    ONLINE 
    EXTENT MANAGEMENT LOCAL;
    
create user esa identified by esa
default tablespace esad
temporary tablespace temp;

grant connect to esa;
grant resource to esa;