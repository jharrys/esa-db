create tablespace esad
datafile '/u01/app/oracle/oradata/esa/esad01.dbf' size 256M
autoextend on next 128M maxsize 4096M
default storage( initial 1M next 1M minextents 1 maxextents unlimited );

create user esa identified by esa;
grant connect to esa;
grant resource to esa;

select tablespace_name from dba_tablespaces;

alter user esa default tablespace esad;
alter user esa temporary tablespace temp;
