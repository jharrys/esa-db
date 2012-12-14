create table project_migration
( ARCHITECT VARCHAR2(256),
  NAME VARCHAR2(256),
  EXTERNAL_PROJECT_NUMBER VARCHAR2(64),
  PROJECT_MANAGER VARCHAR2(256),
  TIME_FRAME VARCHAR2(256),
  TYPE VARCHAR2(40),
  STATUS VARCHAR2(40)
);

@projectSeedData_dbPatch003.sql

commit;

declare
  cursor c1 is
    select
      architect,
      name,
      external_project_number,
      project_manager,
      time_frame,
      type,
      status
    from project_migration;
    
  r1 c1%ROWTYPE;
    
  architect_party_id number;
  project_manager_party_id number;
  project_id number;
begin
  for r1 in c1 loop
    begin
      select id
      into architect_party_id
      from party
      where name=r1.architect;
    exception
      when others then
        architect_party_id := null;
    end;
    
    begin
      select id
      into project_manager_party_id
      from party
      where name=r1.project_manager;
    exception
      when others then
        project_manager_party_id := null;
    end;
    
    select project_seq.nextval
    into project_id
    from dual;
    
    insert into project
    (
      id,
      name,
      type,
      status,
      external_project_number,
      architect_party_id,
      project_manager_party_id,
      date_start,
      date_completed,
      date_created,
      created_by,
      last_updated,
      updated_by
    )
    values
    (
      project_id,
      r1.name,
      r1.type,
      r1.status,
      r1.external_project_number,
      architect_party_id,
      project_manager_party_id,
      null,
      null,
      trunc(sysdate),
      'tssimpso',
      trunc(sysdate),
      'tssimpso'
    );
  end loop;
  commit;
end;
/

drop table project_migration;

purge recyclebin;


