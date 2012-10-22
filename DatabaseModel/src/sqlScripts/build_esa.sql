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

PROMPT create table 'ATTACHMENT'
CREATE TABLE ESA.ATTACHMENT 
(
  ID NUMBER NOT NULL 
, DOCUMENT_ID NUMBER NOT NULL 
, NAME VARCHAR2(20) NOT NULL 
, MIME_TYPE VARCHAR2(40) NOT NULL 
, ARTIFACT BLOB NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT ATTACHMENT_PK PRIMARY KEY 
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

PROMPT create table 'CATEGORY'
CREATE TABLE ESA.CATEGORY 
(
  ID NUMBER NOT NULL 
, PARENT_CATEGORY_ID NUMBER NOT NULL 
, PARENT_CATEGORY_PATH VARCHAR2(4000) NOT NULL 
, NAME VARCHAR2(128) NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT CATEGORY_PK PRIMARY KEY 
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

PROMPT create table 'CONFIGURATION_PARAMETER'
CREATE TABLE ESA.CONFIGURATION_PARAMETER 
(
  ID NUMBER NOT NULL 
, NAME VARCHAR2(1024) NOT NULL 
, VALUE VARCHAR2(4000) NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT CONFIGURATION_PARAMETER_PK PRIMARY KEY 
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

PROMPT create table 'ESA_ROLE'
CREATE TABLE ESA.ESA_ROLE 
(
  ID NUMBER NOT NULL 
, AUTHORITY VARCHAR2(1024 BYTE) 
, VERSION NUMBER(19, 0) 
, CONSTRAINT ESA_ROLE_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX ESA.ESA_ROLE_PK ON ESA.ESA_ROLE (ID ASC) 
      LOGGING 
      TABLESPACE "ESAD" 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "ESAD" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

PROMPT create table 'ESA_USER'
CREATE TABLE ESA.ESA_USER 
(
  ID NUMBER NOT NULL 
, USERNAME VARCHAR2(1024 BYTE) NOT NULL 
, PASSWORD VARCHAR2(1024 BYTE) NOT NULL 
, EMAIL_ADDRESS VARCHAR2(1024 BYTE) 
, ENABLED NUMBER(1, 0) DEFAULT 0 
, ACCOUNT_EXPIRED NUMBER(1, 0) DEFAULT 0 
, ACCOUNT_LOCKED NUMBER(1, 0) DEFAULT 0 
, PASSWORD_EXPIRED NUMBER(1, 0) DEFAULT 0 
, VERSION NUMBER(19, 0) 
, CONSTRAINT USER_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX ESA.USER_PK ON ESA.ESA_USER (ID ASC) 
      LOGGING 
      TABLESPACE "ESAD" 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "ESAD" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

PROMPT create table 'ESA_USER_ESA_ROLE'
CREATE TABLE ESA.ESA_USER_ESA_ROLE 
(
  ESA_USER_ID NUMBER NOT NULL 
, ESA_ROLE_ID NUMBER NOT NULL 
, CONSTRAINT ESA_USER_ESA_ROLE_PK PRIMARY KEY 
  (
    ESA_USER_ID 
  , ESA_ROLE_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX ESA.ESA_USER_ESA_ROLE_PK ON ESA.ESA_USER_ESA_ROLE (ESA_USER_ID ASC, ESA_ROLE_ID ASC) 
      LOGGING 
      TABLESPACE "ESAD" 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "ESAD" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
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
, REQUIRED VARCHAR2(1) DEFAULT 'N' NOT NULL 
, INTERNAL_ONLY VARCHAR2(1) DEFAULT 'N' NOT NULL 
, QUESTION VARCHAR2(4000) NOT NULL 
, SEARCH_LISTING VARCHAR2(1) DEFAULT 'N' 
, DATA_TYPE VARCHAR2(20) 
, MULTI_SELECT VARCHAR2(1) DEFAULT 'N' NOT NULL 
, DEFAULT_VALUE_STRING VARCHAR2(4000) 
, DEFAULT_VALUE_FLOAT NUMBER 
, DEFAULT_VALUE_DATE DATE 
, LOOKUP_LIST_ID NUMBER 
, FORM_INPUT_TYPE VARCHAR2(40) 
, CSS_CLASS VARCHAR2(128) 
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
, STANDARD VARCHAR2(1) DEFAULT 'N' NOT NULL 
, STANDARD_TYPE VARCHAR2(40) 
, EXCEPTION VARCHAR2(1) DEFAULT 'N' NOT NULL 
, DEVIATION VARCHAR2(1) DEFAULT 'N' NOT NULL 
, IN_SERVICE VARCHAR2(1) DEFAULT 'N' NOT NULL 
, EXCEPTION_REQUIRED VARCHAR2(1) DEFAULT 'N' NOT NULL 
, EXCEPTION_CRITERIA VARCHAR2(2048) 
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
, USEFUL_LIFE VARCHAR2(128) 
, COMMENTS VARCHAR2(4000) 
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

PROMPT create table 'ITEM_CATEGORY'
CREATE TABLE ESA.ITEM_CATEGORY 
(
  ID NUMBER NOT NULL 
, ITEM_ID NUMBER NOT NULL 
, CATEGORY_ID NUMBER NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT ITEM_CATEGORY_PK PRIMARY KEY 
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

PROMPT create table 'NOTE'
CREATE TABLE ESA.NOTE 
(
  ID NUMBER NOT NULL 
, ITEM_ID NUMBER NOT NULL 
, NOTE_TYPE VARCHAR2(40) 
, TEXT VARCHAR2(4000) NOT NULL 
, DATE_CREATED DATE NOT NULL 
, CREATED_BY VARCHAR2(40) NOT NULL 
, LAST_UPDATED DATE NOT NULL 
, UPDATED_BY VARCHAR2(40) NOT NULL 
, CONSTRAINT NOTE_PK PRIMARY KEY 
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
, STRING_VALUE VARCHAR2(4000) 
, FLOAT_VALUE NUMBER 
, DATE_VALUE DATE 
, CONSTRAINT QUESTION_RESPONSE_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);

PROMPT create table 'REGISTRATION_CODE'
CREATE TABLE ESA.REGISTRATION_CODE 
(
  ID NUMBER(19, 0) NOT NULL 
, TOKEN VARCHAR2(255 CHAR) NOT NULL 
, DATE_CREATED TIMESTAMP(6) NOT NULL 
, USERNAME VARCHAR2(255 CHAR) NOT NULL 
, CONSTRAINT REGISTRATION_CODE_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX ESA.REGISTRATION_CODE_PK ON ESA.REGISTRATION_CODE (ID ASC) 
      LOGGING 
      TABLESPACE "ESAD" 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "ESAD" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
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

PROMPT create table 'SPRING_SECURITY_EVENT'
CREATE TABLE ESA.SPRING_SECURITY_EVENT 
(
  ID NUMBER(19, 0) NOT NULL 
, DATE_CREATED TIMESTAMP(6) NOT NULL 
, EVENT_NAME VARCHAR2(255 CHAR) NOT NULL 
, REMOTE_ADDRESS VARCHAR2(255 CHAR) NOT NULL 
, SESSION_ID VARCHAR2(255 CHAR) 
, USERNAME VARCHAR2(255 CHAR) 
, CONSTRAINT SPRING_SECURITY_EVENT_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX ESA.SPRING_SECURITY_EVENT_PK ON ESA.SPRING_SECURITY_EVENT (ID ASC) 
      LOGGING 
      TABLESPACE "ESAD" 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "ESAD" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

PROMPT alter table 'ESA_ROLE'
ALTER TABLE ESA.ESA_ROLE
ADD CONSTRAINT ESA_ROLE_AUTHORITY_UK UNIQUE 
(
  AUTHORITY 
)
USING INDEX 
(
    CREATE UNIQUE INDEX ESA.ESA_ROLE_AUTHORITY_UK ON ESA.ESA_ROLE (AUTHORITY ASC) 
    LOGGING 
    TABLESPACE "ESAD" 
    PCTFREE 10 
    INITRANS 2 
    STORAGE 
    ( 
      BUFFER_POOL DEFAULT 
    ) 
)
 ENABLE;

PROMPT alter table 'ESA_USER'
ALTER TABLE ESA.ESA_USER
ADD CONSTRAINT USER_USERNAME_UK UNIQUE 
(
  USERNAME 
)
USING INDEX 
(
    CREATE UNIQUE INDEX ESA.USER_USERNAME_UK ON ESA.ESA_USER (USERNAME ASC) 
    LOGGING 
    TABLESPACE "ESAD" 
    PCTFREE 10 
    INITRANS 2 
    STORAGE 
    ( 
      BUFFER_POOL DEFAULT 
    ) 
)
 ENABLE;

PROMPT alter table 'QUESTION_RESPONSE'
ALTER TABLE ESA.QUESTION_RESPONSE
ADD CONSTRAINT QUESTION_RESPONSE_UK1 UNIQUE 
(
  DOCUMENT_ID 
, FORM_FIELD_ID 
)
ENABLE;

PROMPT alter table 'ATTACHMENT'
ALTER TABLE ESA.ATTACHMENT
ADD CONSTRAINT ATTACHMENT_DOCUMENT_FK FOREIGN KEY
(
  DOCUMENT_ID 
)
REFERENCES ESA.DOCUMENT
(
  ID 
)
ENABLE;

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

PROMPT alter table 'CATEGORY'
ALTER TABLE ESA.CATEGORY
ADD CONSTRAINT SUB_CATEGORY_FK FOREIGN KEY
(
  PARENT_CATEGORY_ID 
)
REFERENCES ESA.CATEGORY
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

PROMPT alter table 'ESA_USER_ESA_ROLE'
ALTER TABLE ESA.ESA_USER_ESA_ROLE
ADD CONSTRAINT ESA_USER_ESA_ROLE_RLE_FK FOREIGN KEY
(
  ESA_ROLE_ID 
)
REFERENCES ESA.ESA_ROLE
(
  ID 
)
ENABLE;

PROMPT alter table 'ESA_USER_ESA_ROLE'
ALTER TABLE ESA.ESA_USER_ESA_ROLE
ADD CONSTRAINT ESA_USER_ESA_ROLE_USR_FK FOREIGN KEY
(
  ESA_USER_ID 
)
REFERENCES ESA.ESA_USER
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

PROMPT alter table 'ITEM_CATEGORY'
ALTER TABLE ESA.ITEM_CATEGORY
ADD CONSTRAINT ITEM_CATEGORY_CATEGORY_FK FOREIGN KEY
(
  CATEGORY_ID 
)
REFERENCES ESA.CATEGORY
(
  ID 
)
ENABLE;

PROMPT alter table 'ITEM_CATEGORY'
ALTER TABLE ESA.ITEM_CATEGORY
ADD CONSTRAINT ITEM_CATEGORY_ITEM_FK FOREIGN KEY
(
  ITEM_ID 
)
REFERENCES ESA.ITEM
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

PROMPT alter table 'NOTE'
ALTER TABLE ESA.NOTE
ADD CONSTRAINT ITEM_NOTES_FK FOREIGN KEY
(
  ID 
)
REFERENCES ESA.ITEM
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

COMMENT ON TABLE ESA.ADDRESS IS 'This table is used to store the addresses of the various parties.  This includes companiens, organizations, or persons.  multiple parties can share the same address.  This also provides the ability to identify relationships between various parties.';

COMMENT ON TABLE ESA.CATALOG IS 'The catalog is a method for grouping items which can be orderd much in the same way  as a paper based catalog.  This is only used to identify or name the catalog.  The items for the catalog are established in the catalog_item table.';

COMMENT ON TABLE ESA.CATALOG_ITEM IS 'This table is used to store the relationship between a catalog and the various items in the catalog.  This allows for items to be contained with in several catalogs.';

COMMENT ON TABLE ESA.CONFIGURATION_CATALOG IS 'This table is used to identify items that are part of a configuration.  It is similar to the catalog however this allows for version of an item to be tracted.';

COMMENT ON TABLE ESA.CONTRACT IS 'This is used to track the contracts associated with items.  There is no contract module this is identified in other systems.  This will alow the purchasing organization research the terms and conditions of the contract or associated discounts and breaches of contract.';

COMMENT ON TABLE ESA.DOCUMENT IS 'This table is used to track the instances of forms.  When a user fills out a form an instance of that form is created and the mater record is stored here.  The details about the document, answers to the form questions is stored in the question_response table.';

COMMENT ON TABLE ESA.FORM IS 'This table is used to define the various forms available for use.  It is similar to defining a template for data entry.  Cascading Style Sheets are used to format the forms for data input.';

COMMENT ON TABLE ESA.FORM_FIELD IS 'This defines the text and questions of the forms.  and can be broken up into pages section and order.  The questions are grouped first by page, then section and finaly order.  The page number is independant of the section and order.  Howver the order is dependant within the section.  Therefor a scection can be split accross several pages.  This is up to the desingner of the form.  Cascading Style Sheets can be used to format the page layouts.';

COMMENT ON TABLE ESA.ITEM IS 'The Item is used to define any element that is part of a configuration, or an orderable item within a catalog.  Each of the various items can be defined as a standard for the organization.  It also supports exceptions and deviations from standards.  It is up to the organization to define how and were to apply standards, exceptions and deviaitons.';

COMMENT ON TABLE ESA.ITEM_CATEGORY IS 'The item_category table is used to add an item to a defined category.  An item can belong to many differnt categories.';

COMMENT ON TABLE ESA.ITEM_UNITS_CONVERSION IS 'The item_units_conversion table is used to allow for the conversion of items from the default ordering unit of measure.  there for a ordering unit of measure may be a case.  If each case has 144 item.  The units conversion can be used to calculate  how many each of the given item has been orderd base on the defaut unit of measuer as well as the cost.';

COMMENT ON TABLE ESA.ITEM_VERSION IS 'The item version is used to track the version of an item, its release and decommition/desupported dates.  This will allow a road map to be defined and plan  the enterprise road map.';

COMMENT ON TABLE ESA.LOOKUP_ELEMENT IS 'The lookup_element is used to define the elements of the lookup_lists for the applicaiton.  The elements defined in this table are part of the fixed lookup_list type.';

COMMENT ON TABLE ESA.LOOKUP_LIST IS 'The lookup_list is ued to provide a consistant method for defining pick lists or lists of values.  The lookup_lists can be defined in one of two ways, fixed or sql.  The fixed list elemetns are defined in the lookup_elements table.  The sql select section of the sql lookup list must have the format of select <value element> value, <display element> display.';

COMMENT ON TABLE ESA.NOTE IS 'This table is used to create notes regarding the items.  It can be used for insturctions or comments';

COMMENT ON TABLE ESA.PARTY IS 'The party table is used to store organizations and people.  These are elements that are physical bodies or logical business units.  The granularity of organizations is for the business units to decide.  This is not intended to be for accounts, locations or items.';

COMMENT ON TABLE ESA.PARTY_ADDRESS IS 'The party_address is used to define relationships between a party and a physical address.  As the data is cleansed it allows for possible relationships to be established between various parties.  people sharring the same address are possibly related as common employees of the same organization or relationship of parent and child if sharing the same home address.  This is also where the use and type of address is defined.';

COMMENT ON TABLE ESA.PARTY_RELATIONSHIP IS 'The party_relationship table is used to define the relationship between various parties.  Such as employer and employee.';

COMMENT ON COLUMN ESA.ATTACHMENT.DOCUMENT_ID IS 'used to associates the artifact to a document.';

COMMENT ON COLUMN ESA.ATTACHMENT.NAME IS 'This is the name of the artifact with out the associated mime type.  The fully qualified artifact name is the NAME.MIME_TYPE';

COMMENT ON COLUMN ESA.ATTACHMENT.MIME_TYPE IS 'this is the mime type of the artificat.  This should be populated from a pick list provided in the LOOKUP_LIST';

COMMENT ON COLUMN ESA.ATTACHMENT.ARTIFACT IS 'This is the atifact associated to the form document.';

COMMENT ON COLUMN ESA.CATEGORY.NAME IS 'This is used to define the taxonomy of a category.  It is also the unique name.  This will look similar to a path expresson.';

COMMENT ON COLUMN ESA.FORM_FIELD.REQUIRED IS 'This flag indicates if a field is requierd or not.  The default value is N.';

COMMENT ON COLUMN ESA.FORM_FIELD.INTERNAL_ONLY IS 'This flag is used to indicate the question is for internal use only and should not be presented to the user filling out the form.';

COMMENT ON COLUMN ESA.FORM_FIELD.DEFAULT_VALUE_STRING IS 'This set if there is a default value for a string data type.';

COMMENT ON COLUMN ESA.FORM_FIELD.DEFAULT_VALUE_FLOAT IS 'this is set if there is a default value for the float data type.';

COMMENT ON COLUMN ESA.FORM_FIELD.DEFAULT_VALUE_DATE IS 'this is used if there is a default value for the date data type.';

COMMENT ON COLUMN ESA.FORM_FIELD.FORM_INPUT_TYPE IS 'defines the type of UI input to use on the form shuch as a check box, combo box, text box and so on.';

COMMENT ON COLUMN ESA.ITEM.STANDARD_TYPE IS 'This identifies what type of standard the item is. Corporate, Department, Select Heath, Intermountain and so on.  The selection choice is defined as a LOOKUP_LIST';

COMMENT ON COLUMN ESA.ITEM.IN_SERVICE IS 'This field indicates if the itme or configuration is currently inservice within the organization.  Possible values are Y or N';

COMMENT ON COLUMN ESA.ITEM.DOCUMENT_ID IS 'The document is used to identify the exception or deviation documentation for the Item.';

COMMENT ON COLUMN ESA.ITEM.VENDOR_PARTY_ID IS 'id of the Pary who is the vendor of the item';

COMMENT ON COLUMN ESA.ITEM.INTERMOUNTAIN_ITEM_NUMBER IS 'Used to be the MMIS number';

COMMENT ON COLUMN ESA.ITEM.TECHNOLOGY_GROUP IS 'This is used to identify which technology group the item belongs to.  The can be values such as Hardware, Vended Software, Internal software, Infrustructure technology and so on.';

COMMENT ON COLUMN ESA.ITEM.CONTRACT_ID IS '@fk:governsItems:@relation:OneToMany';

COMMENT ON COLUMN ESA.ITEM.MANUFACTURER_CATALOG_NUMBER IS 'Manufacturer part number';

COMMENT ON COLUMN ESA.NOTE.NOTE_TYPE IS 'this is a pick list that describes the type of note.  The possible values are defined in the NoteType lookup list';

COMMENT ON COLUMN ESA.PARTY_ADDRESS.PARTY_ID IS '@parties';

COMMENT ON COLUMN ESA.PARTY_ADDRESS.ADDRESS_ID IS '@addresses';

PROMPT create sequence 'ADDRESS_SEQ'
CREATE SEQUENCE ESA.ADDRESS_SEQ NOCACHE;

PROMPT create sequence 'ATTACHMENT_SEQ'
CREATE SEQUENCE ESA.ATTACHMENT_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;

PROMPT create sequence 'CATALOG_ITEM_SEQ'
CREATE SEQUENCE ESA.CATALOG_ITEM_SEQ NOCACHE;

PROMPT create sequence 'CATALOG_SEQ'
CREATE SEQUENCE ESA.CATALOG_SEQ NOCACHE;

PROMPT create sequence 'CATEGORY_SEQ'
CREATE SEQUENCE ESA.CATEGORY_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;

PROMPT create sequence 'CONFIGURATION_CATALOG_SEQ'
CREATE SEQUENCE ESA.CONFIGURATION_CATALOG_SEQ NOCACHE;

PROMPT create sequence 'CONFIGURATION_PARAMETER_SEQ'
CREATE SEQUENCE ESA.CONFIGURATION_PARAMETER_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;

PROMPT create sequence 'CONTRACT_SEQ'
CREATE SEQUENCE ESA.CONTRACT_SEQ NOCACHE;

PROMPT create sequence 'DOCUMENT_SEQ'
CREATE SEQUENCE ESA.DOCUMENT_SEQ NOCACHE;

PROMPT create sequence 'ESA_ROLE_SEQ'
CREATE SEQUENCE ESA.ESA_ROLE_SEQ INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE;

PROMPT create sequence 'ESA_USER_ESA_ROLE_SEQ'
CREATE SEQUENCE ESA.ESA_USER_ESA_ROLE_SEQ INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE;

PROMPT create sequence 'ESA_USER_SEQ'
CREATE SEQUENCE ESA.ESA_USER_SEQ INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE;

PROMPT create sequence 'FORM_FIELD_SEQ'
CREATE SEQUENCE ESA.FORM_FIELD_SEQ NOCACHE;

PROMPT create sequence 'FORM_SEQ'
CREATE SEQUENCE ESA.FORM_SEQ NOCACHE;

PROMPT create sequence 'HIBERNATE_SEQUENCE'
CREATE SEQUENCE ESA.HIBERNATE_SEQUENCE INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE;

PROMPT create sequence 'ITEM_CATEGORY_SEQ'
CREATE SEQUENCE ESA.ITEM_CATEGORY_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;

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

PROMPT create sequence 'NOTE_SEQ'
CREATE SEQUENCE ESA.NOTE_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;

PROMPT create sequence 'PARTY_ADDRESS_SEQ'
CREATE SEQUENCE ESA.PARTY_ADDRESS_SEQ NOCACHE;

PROMPT create sequence 'PARTY_RELATIONSHIP_SEQ'
CREATE SEQUENCE ESA.PARTY_RELATIONSHIP_SEQ NOCACHE;

PROMPT create sequence 'PARTY_SEQ'
CREATE SEQUENCE ESA.PARTY_SEQ NOCACHE;

PROMPT create sequence 'QUESTION_RESPONSE_SEQ'
CREATE SEQUENCE ESA.QUESTION_RESPONSE_SEQ NOCACHE;

PROMPT create sequence 'REGISTRATION_CODE_SEQ'
CREATE SEQUENCE ESA.REGISTRATION_CODE_SEQ INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE;

PROMPT create sequence 'REPLACEMENT_ITEM_SEQ'
CREATE SEQUENCE ESA.REPLACEMENT_ITEM_SEQ NOCACHE;

PROMPT create sequence 'SPRING_SECURITY_EVENT_SEQ'
CREATE SEQUENCE ESA.SPRING_SECURITY_EVENT_SEQ INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE;
