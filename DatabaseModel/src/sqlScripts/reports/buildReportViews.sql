PROMPT create view 'WEEKLY_STATUS_REPORT'
CREATE VIEW WEEKLY_STATUS_REPORT AS select
  pty.id ARCHITECT_PARTY_ID,
  pty.name ARCHITECT_NAME,
  p.id PROJECT_ACID#,
  p.name PROJECT_NAME,
  p.status PROJECT_STATUS,
  p.type PROJECT_TYPE,
  nvl(n.text,'No update') PROJECT_NOTE
from project p,
  note n,
  project_architect pa,
  party pty
where pa.party_id = pty.id
  and p.id=pa.project_id
  and n.project_id (+)=p.id
  and n.date_created(+) between sysdate-7 and sysdate
  and p.status='ACTIVE';

PROMPT create view 'USER_AUTHORITY_LIST'
CREATE VIEW USER_AUTHORITY_LIST AS select
  er.authority AUTHORITY,
  p.name FULL_NAME,
  p.id PARTY_ID
from
  esa_role er,
  esa_user_esa_role euer,
  esa_user eu,
  party p
where euer.esa_role_id = er.id
  and euer.esa_user_id = eu.id
  and p.id = eu.party_id;

PROMPT create view 'UNASSIGNED_PROJECT_REPORT'
CREATE VIEW UNASSIGNED_PROJECT_REPORT AS select
  p.id PROJECT_ACID#,
  p.name PROJECT_NAME,
  p.type PROJECT_TYPE,
  p.status PROJECT_STATUS
from
  project p
where not exists (select pa.project_id
                  from project_architect pa
                  where pa.project_id=p.id);

PROMPT create view 'PROJECT_SUMMARY_REPORT'
CREATE VIEW PROJECT_SUMMARY_REPORT AS select
  p.id ARCHITECT_PARTY_ID,
  p.name ARCHITECT_NAME,
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

PROMPT create view 'EXCEPTION_SUMMARY_REPORT'
CREATE VIEW EXCEPTION_SUMMARY_REPORT AS select
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

PROMPT create view 'EVALUATION_SUMMARY_REPORT'
CREATE VIEW EVALUATION_SUMMARY_REPORT AS select
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
