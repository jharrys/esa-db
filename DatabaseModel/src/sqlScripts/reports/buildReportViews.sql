PROMPT create or replace view 'WEEKLY_STATUS_REPORT'
CREATE OR REPLACE VIEW ESA.WEEKLY_STATUS_REPORT AS select
  rownum VIEW_ROW_ID,
  pty.id ARCHITECT_PARTY_ID,
  pty.name ARCHITECT_NAME,
  p.id PROJECT_ACID_NUMBER,
  p.name PROJECT_NAME,
  p.status PROJECT_STATUS,
  p.type PROJECT_TYPE,
  p.date_created DATE_CREATED,
  p.last_updated LAST_UPDATED,
  p.date_start DATE_START,
  p.date_completed DATE_COMPLETED,
  trunc(nvl( p.date_completed, decode(p.status,'CLOSED', p.last_updated,sysdate))-p.date_start ,0) PROJECT_DURATION,
  trunc(p.last_updated-p.date_created ,0) PROJECT_ACTIVITY_DURATION,
  nvl((select n.text
       from 
         note n,
         (select max( n2.last_updated ) last_note_date, n2.project_id
          from note n2
          group by n2.project_id) ln
       where n.last_updated = ln.last_note_date
         and n.project_id = ln.project_id
         and ln.project_id = p.id),'No Update') LAST_NOTE
from project p,
  project_architect pa,
  party pty
where pa.party_id = pty.id
  and p.id=pa.project_id
  and (p.status='ACTIVE' or (p.status='CLOSED' and p.date_completed > sysdate - 7))
order by pty.name, p.last_updated desc;

PROMPT create or replace view 'USER_AUTHORITY_LIST'
CREATE OR REPLACE VIEW ESA.USER_AUTHORITY_LIST AS select
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

PROMPT create or replace view 'UNASSIGNED_PROJECT_REPORT'
CREATE OR REPLACE VIEW ESA.UNASSIGNED_PROJECT_REPORT AS select
  p.id PROJECT_ACID#,
  p.name PROJECT_NAME,
  p.type PROJECT_TYPE,
  p.status PROJECT_STATUS
from
  project p
where not exists (select pa.project_id
                  from project_architect pa
                  where pa.project_id=p.id);

PROMPT create or replace view 'PROJECT_SUMMARY_REPORT'
CREATE OR REPLACE VIEW ESA.PROJECT_SUMMARY_REPORT AS select
  rownum VIEW_ROW_ID,
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
  and er.authority = 'ROLE_ESA_ARCHITECT';

PROMPT create or replace view 'EXCEPTION_SUMMARY_REPORT'
CREATE OR REPLACE VIEW ESA.EXCEPTION_SUMMARY_REPORT AS select
  rownum VIEW_ROW_ID,
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
  and er.authority = 'ROLE_ESA_ARCHITECT';

PROMPT create or replace view 'EVALUATION_SUMMARY_REPORT'
CREATE OR REPLACE VIEW ESA.EVALUATION_SUMMARY_REPORT AS select
  rownum VIEW_ROW_ID,
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
  and er.authority = 'ROLE_ESA_ARCHITECT';

PROMPT create or replace view 'DAYS_SINCE_LAST_UPDATE_REPORT'
CREATE OR REPLACE VIEW ESA.DAYS_SINCE_LAST_UPDATE_REPORT AS select
  rownum VIEW_ROW_ID,
  pty.id ARCHITECT_PARTY_ID,
  pty.name ARCHITECT_NAME,
  p.name PROJECT_NAME,
  round(sysdate - p.last_updated,0) DAYS_SINCE_LAST_UPDATE
from project p,
  party pty,
  project_architect pa
where pa.party_id = pty.id
  and p.id = pa.project_id
  and p.status = 'ACTIVE'
order by 3 desc;
