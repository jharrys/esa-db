SET SQLBLANKLINES ON
PROMPT create table 'ADDRESS'
CREATE TABLE ESA.ADDRESS 
(
  ID NUMBER NOT NULL 
, EXTERNAL_ID VARCHAR2(128) 
, ADDRESS_LINE1 VARCHAR2(256) 
, ADDRESS_LINE2 VARCHAR2(256) 
, ADDRESS_LINE3 VARCHAR2(256) 
, ADDRESS_LINE4 VARCHAR2(256) 
, CITY VARCHAR2(256) 
, STATE VARCHAR2(3) 
, ZIP VARCHAR2(10) 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT ADDRESS_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'CATALOG'
CREATE TABLE ESA.CATALOG 
(
  ID NUMBER NOT NULL 
, NAME VARCHAR2(128) NOT NULL 
, DESCRIPTION VARCHAR2(1024) 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT CATALOG_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'CATALOG_ITEM'
CREATE TABLE ESA.CATALOG_ITEM 
(
  ID NUMBER NOT NULL 
, ITEM_ID NUMBER NOT NULL 
, CATALOG_ID NUMBER NOT NULL 
, ITEM_VERSION_ID NUMBER 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT CATALOG_ITEM_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'CONFIGURATION_CATALOG'
CREATE TABLE ESA.CONFIGURATION_CATALOG 
(
  ID NUMBER NOT NULL 
, PARENT_ITEM_ID NUMBER NOT NULL 
, PARENT_ITEM_VERSION_ID NUMBER 
, ELEMENT_ITEM_ID NUMBER NOT NULL 
, ELEMENT_ITEM_VERSION_ID NUMBER 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT CONFIGURATION_CATALOG_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'CONTRACT'
CREATE TABLE ESA.CONTRACT 
(
  ID NUMBER NOT NULL 
, CONTRACT_NUMBER VARCHAR2(256) NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT CONTRACT_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'DOCUMENT'
CREATE TABLE ESA.DOCUMENT 
(
  ID NUMBER NOT NULL 
, FORM_ID NUMBER NOT NULL 
, SIRP_ID VARCHAR2(256) 
, REQUESTOR VARCHAR2(64) NOT NULL 
, REQUESTOR_EMAIL VARCHAR2(256) NOT NULL 
, OWNER VARCHAR2(64) NOT NULL 
, OWNER_EMAIL VARCHAR2(256) NOT NULL 
, JUSTIFICATION VARCHAR2(1024) NOT NULL 
, VENDOR_REPRESENTATIVE_PARTY_ID NUMBER NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT DOCUMENT_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'FORM'
CREATE TABLE ESA.FORM 
(
  ID NUMBER NOT NULL 
, NAME VARCHAR2(256) NOT NULL 
, DESCRIPTION VARCHAR2(1024) 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT FORM_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'FORM_FIELD'
CREATE TABLE ESA.FORM_FIELD 
(
  ID NUMBER NOT NULL 
, FORM_ID NUMBER NOT NULL 
, PAGE_NUMBER NUMBER 
, SECTION_NUMBER NUMBER NOT NULL 
, ORDER_NUMBER NUMBER 
, QUESTION VARCHAR2(1024) NOT NULL 
, DATA_TYPE VARCHAR2(20) 
, CSS_CLASS VARCHAR2(40)
, MULTI_SELECT VARCHAR2(1) DEFAULT 'N' NOT NULL 
, LOOKUP_LIST_ID NUMBER 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT FORM_FIELD_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'ITEM'
CREATE TABLE ESA.ITEM 
(
  ID NUMBER NOT NULL 
, EXTERNAL_ID VARCHAR2(256) 
, SOURCE_SYSTEM VARCHAR2(256) 
, STANDARD VARCHAR2(1) DEFAULT 'N' 
, DOCUMENT_ID NUMBER 
, VENDOR_PARTY_ID NUMBER 
, INTERMOUNTAIN_ITEM_NUMBER NUMBER 
, NAME VARCHAR2(128) 
, DESCRIPTION VARCHAR2(512) 
, GENERAL_LEDGER_CODE VARCHAR2(256) 
, PRODUCT_GROUP VARCHAR2(64) 
, TECHNOLOGY_GROUP VARCHAR2(64) 
, CONTRACT_ID NUMBER 
, AVAILABLE_DATE DATE 
, IHC_ACTUAL_DECOMISSIONED DATE 
, IHC_PROPOSED_DECOMISSIONED DATE 
, VENDOR_DECOMISSIONED DATE 
, VENDOR_CATALOG_NUMBER VARCHAR2(20) 
, MANUFACTURER_PART_ID NUMBER 
, MANUFACTURER_CATALOG_NUMBER VARCHAR2(256) 
, PURCHASING_UNIT_OF_MEASURE VARCHAR2(64) 
, PURCHASING_UNIT_PRICE NUMBER 
, UNSPSC_NUMBER VARCHAR2(20) 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT ITEM_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'ITEM_UNITS_CONVERSION'
CREATE TABLE ESA.ITEM_UNITS_CONVERSION 
(
  ID NUMBER NOT NULL 
, ITEM_ID NUMBER 
, VALUE NUMBER 
, UNITS VARCHAR2(64) 
, PER_UNITS VARCHAR2(64) 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT ITEM_UNITS_CONVERSION_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'ITEM_VERSION'
CREATE TABLE ESA.ITEM_VERSION 
(
  ID NUMBER NOT NULL 
, ITEM_ID NUMBER NOT NULL 
, VERSION_NUMBER VARCHAR2(256) NOT NULL 
, IHC_ACTUAL_DECOMISSION DATE 
, IHC_PROPOSED_DECOMISSIONED DATE 
, VENDOR_DECOMISSION DATE 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT ITEM_VERSION_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'LOOKUP_ELEMENT'
CREATE TABLE ESA.LOOKUP_ELEMENT 
(
  ID NUMBER NOT NULL 
, LOOKUP_LIST_ID NUMBER 
, VALUE VARCHAR2(40) NOT NULL 
, DISPLAY VARCHAR2(256) NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT LOOKUP_ELEMENT_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'LOOKUP_LIST'
CREATE TABLE ESA.LOOKUP_LIST 
(
  ID NUMBER NOT NULL 
, NAME VARCHAR2(40) NOT NULL 
, PROMPT VARCHAR2(256) NOT NULL 
, DESCRIPTION VARCHAR2(1024) 
, LIST_TYPE VARCHAR2(40) NOT NULL 
, SQL_STATEMENT VARCHAR2(4000) 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT LOOKUP_LIST_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'PARTY'
CREATE TABLE ESA.PARTY 
(
  ID NUMBER NOT NULL 
, EXTERNAL_ID VARCHAR2(128) 
, TYPE VARCHAR2(40) NOT NULL 
, NAME VARCHAR2(128) 
, EMAIL_ADDRESS VARCHAR2(256) 
, MOBILE_PHONE_NUMBER VARCHAR2(15) 
, WORK_PHONE_NUMBER VARCHAR2(15) 
, HOME_PHONE_NUMBER VARCHAR2(15) 
, WEB_SITE_URL VARCHAR2(4000) 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT PARTY_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'PARTY_ADDRESS'
CREATE TABLE ESA.PARTY_ADDRESS 
(
  ID NUMBER NOT NULL 
, PARTY_ID NUMBER NOT NULL 
, ADDRESS_ID NUMBER NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT PARTY_ADDRESS_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'PARTY_RELATIONSHIP'
CREATE TABLE ESA.PARTY_RELATIONSHIP 
(
  ID NUMBER NOT NULL 
, PARENT_PARTY_ID NUMBER NOT NULL 
, CHILD_PARTY_ID NUMBER NOT NULL 
, RELATIONSHIP_TYPE VARCHAR2(40) NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT PARTY_RELATIONSHIP_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'QUESTION_RESPONSE'
CREATE TABLE ESA.QUESTION_RESPONSE 
(
  ID NUMBER NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, FORM_FIELD_ID NUMBER 
, DOCUMENT_ID NUMBER 
, STRING_VALUE VARCHAR2(1024) 
, FLOAT_VALUE NUMBER 
, DATE_VALUE DATE 
, CONSTRAINT QUESTION_RESPONSE_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'REPLACEMENT_ITEM'
CREATE TABLE ESA.REPLACEMENT_ITEM 
(
  ID NUMBER NOT NULL 
, ITEM_ID NUMBER NOT NULL 
, REPLACEMENT_ITEM_ID NUMBER NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT REPLACEMENT_ITEM_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'ROLE'
CREATE TABLE ESA.ROLE 
(
  ID NUMBER NOT NULL 
, NAME VARCHAR2(40) NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT TABLE1_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'ROLE_SERVICE'
CREATE TABLE ESA.ROLE_SERVICE 
(
  ID NUMBER NOT NULL 
, ROLE_ID NUMBER NOT NULL 
, SERVICE_ID NUMBER NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT ROLE_PRIVLIGES_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'SERVICE'
CREATE TABLE ESA.SERVICE 
(
  ID NUMBER NOT NULL 
, SERVICE_NAME VARCHAR2(256) NOT NULL 
, SERVICE_TYPE VARCHAR2(20) NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT APPLICATION_SERVICE_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT alter table 'CATALOG_ITEM'
ALTER TABLE ESA.CATALOG_ITEM
ADD CONSTRAINT BELONGS_TO_CATALOGS_FK FOREIGN KEY
(
  ITEM_ID 
)
REFERENCES ESA.ITEM
(
  ID 
)
ENABLE;

PROMPT alter table 'CATALOG_ITEM'
ALTER TABLE ESA.CATALOG_ITEM
ADD CONSTRAINT HAS_CATALOG_ITEMS_FK FOREIGN KEY
(
  CATALOG_ID 
)
REFERENCES ESA.CATALOG
(
  ID 
)
ENABLE;

PROMPT alter table 'CATALOG_ITEM'
ALTER TABLE ESA.CATALOG_ITEM
ADD CONSTRAINT USING_VERSION_FK FOREIGN KEY
(
  ITEM_VERSION_ID 
)
REFERENCES ESA.ITEM_VERSION
(
  ID 
)
ENABLE;

PROMPT alter table 'CONFIGURATION_CATALOG'
ALTER TABLE ESA.CONFIGURATION_CATALOG
ADD CONSTRAINT CONFIGURATION_ELEMENTS_FK FOREIGN KEY
(
  ELEMENT_ITEM_ID 
)
REFERENCES ESA.ITEM
(
  ID 
)
ENABLE;

PROMPT alter table 'CONFIGURATION_CATALOG'
ALTER TABLE ESA.CONFIGURATION_CATALOG
ADD CONSTRAINT CONFIGURATION_VERSION_IS_FK FOREIGN KEY
(
  PARENT_ITEM_VERSION_ID 
)
REFERENCES ESA.ITEM_VERSION
(
  ID 
)
ENABLE;

PROMPT alter table 'CONFIGURATION_CATALOG'
ALTER TABLE ESA.CONFIGURATION_CATALOG
ADD CONSTRAINT ELEMENT_VERSION_IS_FK FOREIGN KEY
(
  ELEMENT_ITEM_VERSION_ID 
)
REFERENCES ESA.ITEM_VERSION
(
  ID 
)
ENABLE;

PROMPT alter table 'CONFIGURATION_CATALOG'
ALTER TABLE ESA.CONFIGURATION_CATALOG
ADD CONSTRAINT PART_OF_CONFIGURATIONS_FK FOREIGN KEY
(
  PARENT_ITEM_ID 
)
REFERENCES ESA.ITEM
(
  ID 
)
ENABLE;

PROMPT alter table 'DOCUMENT'
ALTER TABLE ESA.DOCUMENT
ADD CONSTRAINT AN_INSTANCE_OF_FORM_FK FOREIGN KEY
(
  FORM_ID 
)
REFERENCES ESA.FORM
(
  ID 
)
ENABLE;

PROMPT alter table 'DOCUMENT'
ALTER TABLE ESA.DOCUMENT
ADD CONSTRAINT VENDOR_REPRESENTATIVE_FK FOREIGN KEY
(
  VENDOR_REPRESENTATIVE_PARTY_ID 
)
REFERENCES ESA.PARTY
(
  ID 
)
ENABLE;

PROMPT alter table 'FORM_FIELD'
ALTER TABLE ESA.FORM_FIELD
ADD CONSTRAINT FIELD_LOOKUP_FK FOREIGN KEY
(
  LOOKUP_LIST_ID 
)
REFERENCES ESA.LOOKUP_LIST
(
  ID 
)
ENABLE;

PROMPT alter table 'FORM_FIELD'
ALTER TABLE ESA.FORM_FIELD
ADD CONSTRAINT FORM_FIELDS_FK FOREIGN KEY
(
  FORM_ID 
)
REFERENCES ESA.FORM
(
  ID 
)
ENABLE;

PROMPT alter table 'ITEM'
ALTER TABLE ESA.ITEM
ADD CONSTRAINT EXCEPTION_DOCUMENT_FK FOREIGN KEY
(
  DOCUMENT_ID 
)
REFERENCES ESA.DOCUMENT
(
  ID 
)
ENABLE;

PROMPT alter table 'ITEM'
ALTER TABLE ESA.ITEM
ADD CONSTRAINT ITEM_CONTRACT_FK FOREIGN KEY
(
  CONTRACT_ID 
)
REFERENCES ESA.CONTRACT
(
  ID 
)
ENABLE;

PROMPT alter table 'ITEM'
ALTER TABLE ESA.ITEM
ADD CONSTRAINT VENDOR_ITEM_FK FOREIGN KEY
(
  VENDOR_PARTY_ID 
)
REFERENCES ESA.PARTY
(
  ID 
)
ENABLE;

PROMPT alter table 'ITEM_UNITS_CONVERSION'
ALTER TABLE ESA.ITEM_UNITS_CONVERSION
ADD CONSTRAINT ITEM_CONVERSIONS_FK FOREIGN KEY
(
  ITEM_ID 
)
REFERENCES ESA.ITEM
(
  ID 
)
ENABLE;

PROMPT alter table 'ITEM_VERSION'
ALTER TABLE ESA.ITEM_VERSION
ADD CONSTRAINT ITEM_VERSIONS_FK FOREIGN KEY
(
  ITEM_ID 
)
REFERENCES ESA.ITEM
(
  ID 
)
ENABLE;

PROMPT alter table 'LOOKUP_ELEMENT'
ALTER TABLE ESA.LOOKUP_ELEMENT
ADD CONSTRAINT LOOKUP_ELEMENT_LOOKUP_LIST_FK FOREIGN KEY
(
  LOOKUP_LIST_ID 
)
REFERENCES ESA.LOOKUP_LIST
(
  ID 
)
ENABLE;

PROMPT alter table 'PARTY_ADDRESS'
ALTER TABLE ESA.PARTY_ADDRESS
ADD CONSTRAINT PARTY_ADDRESS_ADDRESS_FK FOREIGN KEY
(
  ADDRESS_ID 
)
REFERENCES ESA.ADDRESS
(
  ID 
)
ENABLE;

PROMPT alter table 'PARTY_ADDRESS'
ALTER TABLE ESA.PARTY_ADDRESS
ADD CONSTRAINT PARTY_ADDRESS_PARTY_FK FOREIGN KEY
(
  PARTY_ID 
)
REFERENCES ESA.PARTY
(
  ID 
)
ENABLE;

PROMPT alter table 'PARTY_RELATIONSHIP'
ALTER TABLE ESA.PARTY_RELATIONSHIP
ADD CONSTRAINT PARTY_RELATIONSHIP_PARTY_FK FOREIGN KEY
(
  PARENT_PARTY_ID 
)
REFERENCES ESA.PARTY
(
  ID 
)
ENABLE;

PROMPT alter table 'PARTY_RELATIONSHIP'
ALTER TABLE ESA.PARTY_RELATIONSHIP
ADD CONSTRAINT PARTY_RELATIONSHIP_PARTY_FK1 FOREIGN KEY
(
  CHILD_PARTY_ID 
)
REFERENCES ESA.PARTY
(
  ID 
)
ENABLE;

PROMPT alter table 'QUESTION_RESPONSE'
ALTER TABLE ESA.QUESTION_RESPONSE
ADD CONSTRAINT PART_OF_DOCUMENT_FK FOREIGN KEY
(
  DOCUMENT_ID 
)
REFERENCES ESA.DOCUMENT
(
  ID 
)
ENABLE;

PROMPT alter table 'QUESTION_RESPONSE'
ALTER TABLE ESA.QUESTION_RESPONSE
ADD CONSTRAINT RESPONSE_TO_QUESTION_FK FOREIGN KEY
(
  FORM_FIELD_ID 
)
REFERENCES ESA.FORM_FIELD
(
  ID 
)
ENABLE;

PROMPT alter table 'REPLACEMENT_ITEM'
ALTER TABLE ESA.REPLACEMENT_ITEM
ADD CONSTRAINT REPLACEMENT_FOR_ITEMS_FK FOREIGN KEY
(
  ITEM_ID 
)
REFERENCES ESA.ITEM
(
  ID 
)
ENABLE;

PROMPT alter table 'REPLACEMENT_ITEM'
ALTER TABLE ESA.REPLACEMENT_ITEM
ADD CONSTRAINT REPLACEMENT_ITEMS_FK FOREIGN KEY
(
  REPLACEMENT_ITEM_ID 
)
REFERENCES ESA.ITEM
(
  ID 
)
ENABLE;

PROMPT alter table 'ROLE_SERVICE'
ALTER TABLE ESA.ROLE_SERVICE
ADD CONSTRAINT PART_OF_ROLE_FK FOREIGN KEY
(
  SERVICE_ID 
)
REFERENCES ESA.SERVICE
(
  ID 
)
ENABLE;

PROMPT alter table 'ROLE_SERVICE'
ALTER TABLE ESA.ROLE_SERVICE
ADD CONSTRAINT ROLE_SERVICE_FK FOREIGN KEY
(
  ROLE_ID 
)
REFERENCES ESA.ROLE
(
  ID 
)
ENABLE;

COMMENT ON COLUMN ESA.DOCUMENT.SIRP_ID IS 'SIRP stands for Security Incident Response Program.';

COMMENT ON COLUMN ESA.ITEM.DOCUMENT_ID IS 'The document is used to identify the exception or deviation documentation for the Item.';

COMMENT ON COLUMN ESA.ITEM.VENDOR_PARTY_ID IS '@fk:providesItems:@relation:OneToMany';

COMMENT ON COLUMN ESA.ITEM.INTERMOUNTAIN_ITEM_NUMBER IS 'Used to be the MMIS number';

COMMENT ON COLUMN ESA.ITEM.TECHNOLOGY_GROUP IS 'This is used to identify which technology group the item belongs to.  The can be values such as Hardware, Vended Software, Internal software, Infrustructure technology and so on.';

COMMENT ON COLUMN ESA.ITEM.CONTRACT_ID IS '@fk:governsItems:@relation:OneToMany';

COMMENT ON COLUMN ESA.ITEM.MANUFACTURER_CATALOG_NUMBER IS 'Manufacturer part number';

COMMENT ON COLUMN ESA.PARTY_ADDRESS.PARTY_ID IS '@parties';

COMMENT ON COLUMN ESA.PARTY_ADDRESS.ADDRESS_ID IS '@addresses';

PROMPT create sequence 'ADDRESS_SEQ'
CREATE SEQUENCE ESA.ADDRESS_SEQ NOCACHE;

PROMPT create sequence 'CATALOG_ITEM_SEQ'
CREATE SEQUENCE ESA.CATALOG_ITEM_SEQ NOCACHE;

PROMPT create sequence 'CATALOG_SEQ'
CREATE SEQUENCE ESA.CATALOG_SEQ NOCACHE;

PROMPT create sequence 'CONFIGURATION_CATALOG_SEQ'
CREATE SEQUENCE ESA.CONFIGURATION_CATALOG_SEQ NOCACHE;

PROMPT create sequence 'CONTRACT_SEQ'
CREATE SEQUENCE ESA.CONTRACT_SEQ NOCACHE;

PROMPT create sequence 'DOCUMENT_SEQ'
CREATE SEQUENCE ESA.DOCUMENT_SEQ NOCACHE;

PROMPT create sequence 'FORM_FIELD_SEQ'
CREATE SEQUENCE ESA.FORM_FIELD_SEQ NOCACHE;

PROMPT create sequence 'FORM_SEQ'
CREATE SEQUENCE ESA.FORM_SEQ NOCACHE;

PROMPT create sequence 'ITEM_SEQ'
CREATE SEQUENCE ESA.ITEM_SEQ NOCACHE;

PROMPT create sequence 'ITEM_UNITS_CONVERSION_SEQ'
CREATE SEQUENCE ESA.ITEM_UNITS_CONVERSION_SEQ NOCACHE;

PROMPT create sequence 'ITEM_VERSION_SEQ'
CREATE SEQUENCE ESA.ITEM_VERSION_SEQ NOCACHE;

PROMPT create sequence 'LOOKUP_ELEMENT_SEQ'
CREATE SEQUENCE ESA.LOOKUP_ELEMENT_SEQ NOCACHE;

PROMPT create sequence 'LOOKUP_LIST_SEQ'
CREATE SEQUENCE ESA.LOOKUP_LIST_SEQ NOCACHE;

PROMPT create sequence 'PARTY_ADDRESS_SEQ'
CREATE SEQUENCE ESA.PARTY_ADDRESS_SEQ NOCACHE;

PROMPT create sequence 'PARTY_RELATIONSHIP_SEQ'
CREATE SEQUENCE ESA.PARTY_RELATIONSHIP_SEQ NOCACHE;

PROMPT create sequence 'PARTY_SEQ'
CREATE SEQUENCE ESA.PARTY_SEQ NOCACHE;

PROMPT create sequence 'QUESTION_RESPONSE_SEQ'
CREATE SEQUENCE ESA.QUESTION_RESPONSE_SEQ NOCACHE;

PROMPT create sequence 'REPLACEMENT_ITEM_SEQ'
CREATE SEQUENCE ESA.REPLACEMENT_ITEM_SEQ NOCACHE;

PROMPT create sequence 'ROLE_SEQ'
CREATE SEQUENCE ESA.ROLE_SEQ NOCACHE;

PROMPT create sequence 'ROLE_SERVICE_SEQ'
CREATE SEQUENCE ESA.ROLE_SERVICE_SEQ NOCACHE;

PROMPT create sequence 'SERVICE_SEQ'
CREATE SEQUENCE ESA.SERVICE_SEQ NOCACHE;
