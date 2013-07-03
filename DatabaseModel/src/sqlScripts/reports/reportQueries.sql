select
  pty.id PARTY_ID,
  pty.name ARCHITECT_NAME,
  p.id PROJECT_ACID#,
  p.name PROJECT_NAME,
  p.status STATUS,
  p.type TYPE,
  nvl(n.text,'No update') NOTE
from project p,
  note n,
  project_architect pa,
  party pty
where pa.party_id = pty.id
  and p.id=pa.project_id
  and n.project_id (+)=p.id
  and n.date_created(+) between sysdate-7 and sysdate
  and p.status='ACTIVE'
  and pty.id = 281
order by p.last_updated desc, n.last_updated desc;
  
--select
--  pty.id,
--  pty.name,
--  p.id ACID,
--  p.name NAME,
--  p.status STATUS,
--  p.type TYPE
--from project p,
--  project_architect pa,
--  party pty
--where pa.party_id = pty.id
--  and p.id=pa.project_id
--  and pty.id = 281
--  and p.status='ACTIVE'
--order by p.type, p.status;
select
  p.id,
  p.name,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='ACTIVE') ACTIVE_PROJECTS,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='CLOSED') CLOSED_PROJECTS,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='ONHOLD') ON_HOLD_PROJECTS
from esa_role er, esa_user_esa_role euer, esa_user eu, party p
where euer.esa_role_id = er.id
  and euer.esa_user_id = eu.id
  and p.id = eu.party_id
  and er.authority = 'ROLE_ESA_ARCHITECT' group by p.id, p.name
order by 3 desc,4 desc,5 desc;

select
  p.id,
  p.name,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='ACTIVE'
     and pj.type = 'PROJECT') ACTIVE_PROJECTS,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='CLOSED'
     and pj.type = 'PROJECT') CLOSED_PROJECTS,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='ONHOLD'
     and pj.type = 'PROJECT') ON_HOLD_PROJECTS
from esa_role er, esa_user_esa_role euer, esa_user eu, party p
where euer.esa_role_id = er.id
  and euer.esa_user_id = eu.id
  and p.id = eu.party_id
  and er.authority = 'ROLE_ESA_ARCHITECT' group by p.id, p.name;

select
  p.id ARCHITECT_PARTY_ID,
  p.name ARCHITECT_NAME,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='ACTIVE'
     and pj.type = 'EXCEPTION') ACTIVE_EXCEPTIONS,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='CLOSED'
     and pj.type = 'EXCEPTION') CLOSED_EXCEPTIONS,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='ONHOLD'
     and pj.type = 'EXCEPTION') ON_HOLD_EXCEPTIONS
from esa_role er, esa_user_esa_role euer, esa_user eu, party p
where euer.esa_role_id = er.id
  and euer.esa_user_id = eu.id
  and p.id = eu.party_id
  and er.authority = 'ROLE_ESA_ARCHITECT' group by p.id, p.name;

select
  p.id ARCHITECT_PARTY_ID,
  p.name ARCHITECT_NAME,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='ACTIVE'
     and pj.type = 'EVALUATION') ACTIVE_EVALUATIONS,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='CLOSED'
     and pj.type = 'EVALUATION') CLOSED_EVALUATIONS,
  (select count(*)
   from project pj, project_architect pa
   where pj.id = pa.project_id
     and pa.party_id = p.id
     and pj.status='ONHOLD'
     and pj.type = 'EVALUATION') ON_HOLD_EVALUATIONS
from esa_role er, esa_user_esa_role euer, esa_user eu, party p
where euer.esa_role_id = er.id
  and euer.esa_user_id = eu.id
  and p.id = eu.party_id
  and er.authority = 'ROLE_ESA_ARCHITECT' group by p.id, p.name;

select
  p.id PROJECT_ACID#,
  p.name PROJECT_NAME,
  p.type PROJECT_TYPE,
  p.status PROJECT_STATUS
from
  project p
where not exists (select pa.project_id
                  from project_architect pa
                  where pa.project_id=p.id);

select * from party;

select * from project;

select distinct type from project;

select table_name from user_tables;
select * from esa_role;
select * from esa_user;

select ll.name, le.value, le.display
from lookup_element le, lookup_list ll
where le.lookup_list_id = ll.id;

select * from esa_user_esa_role;

select er.authority, p.name, party_id
from esa_role er, esa_user_esa_role euer, esa_user eu, party p
where euer.esa_role_id = er.id
  and euer.esa_user_id = eu.id
  and p.id = eu.party_id
  and er.authority = 'ROLE_ESA_ARCHITECT';