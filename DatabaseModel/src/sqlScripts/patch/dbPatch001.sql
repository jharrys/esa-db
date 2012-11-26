PROMPT alter table 'ITEM'
ALTER TABLE ITEM RENAME COLUMN MANUFACTURER_PART_ID to MANUFACTURER_PARTY_ID;

PROMPT alter table 'ITEM'
ALTER TABLE ITEM  
MODIFY (VENDOR_CATALOG_NUMBER VARCHAR2(256) );

PROMPT alter table 'ITEM'
ALTER TABLE ITEM
ADD CONSTRAINT MANUFACTURER_ITEM_FK FOREIGN KEY
(
  MANUFACTURER_PARTY_ID 
)
REFERENCES PARTY
(
  ID 
)
ENABLE;

UPDATE CONFIGURATION_PARAMETER set value='1.2'
where NAME='database.version';