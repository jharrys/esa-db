SET SQLBLANKLINES ON
PROMPT alter table 'ITEM'
ALTER TABLE ITEM 
ADD (DATA_STEWARD_GROUP_ESA_ROLE_ID NUMBER );

COMMENT ON COLUMN ITEM.DATA_STEWARD_GROUP_ESA_ROLE_ID IS 'This is the esa_role.id responsible for the managment of the the item information.';

UPDATE CONFIGURATION_PARAMETER set value='1.3'
where NAME='database.version';

commit;