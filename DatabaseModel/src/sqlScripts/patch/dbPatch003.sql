SET SQLBLANKLINES ON
PROMPT create table 'PROJECT'
CREATE TABLE PROJECT 
(
  ID NUMBER NOT NULL 
, NAME VARCHAR2(256) NOT NULL 
, TYPE VARCHAR2(40) 
, STATUS VARCHAR2(40) 
, EXTERNAL_PROJECT_NUMBER VARCHAR2(64) 
, ARCHITECT_PARTY_ID NUMBER 
, PROJECT_MANAGER_PARTY_ID NUMBER 
, DATE_START DATE 
, DATE_COMPLETED DATE 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT PROJECT_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT alter table 'NOTE'
ALTER TABLE NOTE 
ADD (PROJECT_ID NUMBER );

PROMPT alter table 'NOTE'
ALTER TABLE NOTE  
MODIFY (ITEM_ID NULL);

PROMPT alter table 'NOTE'
ALTER TABLE NOTE
ADD CONSTRAINT PROJECT_NOTES_FK FOREIGN KEY
(
  PROJECT_ID 
)
REFERENCES PROJECT
(
  ID 
)
ENABLE;

PROMPT alter table 'PROJECT'
ALTER TABLE PROJECT
ADD CONSTRAINT ARCHITECT_PARTY_FK FOREIGN KEY
(
  ARCHITECT_PARTY_ID 
)
REFERENCES PARTY
(
  ID 
)
ENABLE;

PROMPT alter table 'PROJECT'
ALTER TABLE PROJECT
ADD CONSTRAINT PROJECT_MANAGER_PARTY_FK FOREIGN KEY
(
  PROJECT_MANAGER_PARTY_ID 
)
REFERENCES PARTY
(
  ID 
)
ENABLE;

COMMENT ON COLUMN PROJECT.TYPE IS 'The type of project.  this value is populated using the project type lookup_list';

COMMENT ON COLUMN PROJECT.STATUS IS 'defines the status of the project such as OPEN, CLOSED, HOLD, CANCEL and so on.  This value should be populated using the project status lookup list.';

COMMENT ON COLUMN PROJECT.EXTERNAL_PROJECT_NUMBER IS 'the project reference number in the external project managment system';

COMMENT ON COLUMN PROJECT.ARCHITECT_PARTY_ID IS 'Reference to the architect in the party table.  The party should be populated with a someone who has an enterprise architect role.';

COMMENT ON COLUMN PROJECT.PROJECT_MANAGER_PARTY_ID IS 'Reference to the project manager in the party table.  The party should be populated with a someone who has an enterprise architect role.';

COMMENT ON COLUMN PROJECT.DATE_START IS 'The date the project is started.';

COMMENT ON COLUMN PROJECT.DATE_COMPLETED IS 'The date the project was completed, closed or terminated.';

PROMPT create sequence 'PROJECT_SEQ'
CREATE SEQUENCE PROJECT_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;

@enterpriseArchitects_dbPatch003.sql
@projectsLoad_dbPatch003.sql

