update migration set item_id=item_seq.nextval;

commit;

update migration set alternative_item_id=item_seq.nextval
where alternative_vendor_party_id is not null;

commit;

insert into item
(
  ID,
  EXTERNAL_ID,
  SOURCE_SYSTEM,
  STANDARD,
  STANDARD_TYPE,
  EXCEPTION,
  DEVIATION,
  IN_SERVICE,
  EXCEPTION_REQUIRED,
  EXCEPTION_CRITERIA,
  DOCUMENT_ID,
  VENDOR_PARTY_ID,
  INTERMOUNTAIN_ITEM_NUMBER,
  NAME,
  DESCRIPTION,
  GENERAL_LEDGER_CODE,
  PRODUCT_GROUP,
  TECHNOLOGY_GROUP,
  CONTRACT_ID,
  AVAILABLE_DATE,
  IHC_ACTUAL_DECOMISSIONED,
  IHC_PROPOSED_DECOMISSIONED,
  VENDOR_DECOMISSIONED,
  VENDOR_CATALOG_NUMBER,
  MANUFACTURER_PARTY_ID,
  MANUFACTURER_CATALOG_NUMBER,
  PURCHASING_UNIT_OF_MEASURE,
  PURCHASING_UNIT_PRICE,
  UNSPSC_NUMBER,
  USEFUL_LIFE,
  COMMENTS,
  DATE_CREATED,
  CREATED_BY,
  LAST_UPDATED,
  UPDATED_BY
)
(select
  m.ITEM_ID,
  null,
  'EISA EXCEL DOCUMENT',
  'Y',
  null,
  'N',
  'N',
  'Y',
  'N',
  null,
  null,
  m.VENDOR_PARTY_ID,
  m.INTERMOUNTAIN_ITEM_#_MMIS,
  nvl(m.VENDOR_CATALOG_#,m.MANUFACTURER_CATALOG_#),
  m.DESCRIPTION,
  m.GL_CODE,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  m.VENDOR_CATALOG_#,
  m.MANUFACTURER_PARTY_ID,
  m.MANUFACTURER_CATALOG_#,
  m.PURCHASE_UNIT,
  m.PRICE,
  m.UNSPC,
  null,
  m.NOTES,
  nvl(to_date(m.LAST_UPDATED,'mm/dd/yyyy'), sysdate),
  'bulkLoad',
  nvl(to_date(m.LAST_UPDATED,'mm/dd/yyyy'), sysdate),
  'bulkLoad'
from migration m
);

commit;

insert into item
(
  ID,
  EXTERNAL_ID,
  SOURCE_SYSTEM,
  STANDARD,
  STANDARD_TYPE,
  EXCEPTION,
  DEVIATION,
  IN_SERVICE,
  EXCEPTION_REQUIRED,
  EXCEPTION_CRITERIA,
  DOCUMENT_ID,
  VENDOR_PARTY_ID,
  INTERMOUNTAIN_ITEM_NUMBER,
  NAME,
  DESCRIPTION,
  GENERAL_LEDGER_CODE,
  PRODUCT_GROUP,
  TECHNOLOGY_GROUP,
  CONTRACT_ID,
  AVAILABLE_DATE,
  IHC_ACTUAL_DECOMISSIONED,
  IHC_PROPOSED_DECOMISSIONED,
  VENDOR_DECOMISSIONED,
  VENDOR_CATALOG_NUMBER,
  MANUFACTURER_PARTY_ID,
  MANUFACTURER_CATALOG_NUMBER,
  PURCHASING_UNIT_OF_MEASURE,
  PURCHASING_UNIT_PRICE,
  UNSPSC_NUMBER,
  USEFUL_LIFE,
  COMMENTS,
  DATE_CREATED,
  CREATED_BY,
  LAST_UPDATED,
  UPDATED_BY
)
(select
  m.ALTERNATIVE_ITEM_ID,
  null,
  'EISA EXCEL DOCUMENT',
  'Y',
  null,
  'N',
  'N',
  'Y',
  'N',
  null,
  null,
  m.ALTERNATIVE_VENDOR_PARTY_ID,
  m.INTERMOUNTAIN_ITEM_#_MMIS,
  nvl(m.ALTERNATIVE_VENDOR_PART_#,m.MANUFACTURER_CATALOG_#),
  m.DESCRIPTION,
  m.GL_CODE,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  m.ALTERNATIVE_VENDOR_PART_#,
  m.MANUFACTURER_PARTY_ID,
  m.MANUFACTURER_CATALOG_#,
  m.PURCHASE_UNIT,
  m.PRICE,
  m.UNSPC,
  null,
  m.NOTES,
  nvl(to_date(m.LAST_UPDATED,'mm/dd/yyyy'), sysdate),
  'bulkLoad',
  nvl(to_date(m.LAST_UPDATED,'mm/dd/yyyy'), sysdate),
  'bulkLoad'
from migration m
where m.alternative_vendor_party_id is not null
);

commit;

insert into item_category(
  id,
  item_id,
  category_id,
  date_created,
  created_by,
  last_updated,
  updated_by
)
(select
  item_category_seq.nextval,
  m.item_id,
  m.category_id,
  sysdate,
  'buldLoad',
  sysdate,
  'bulkLoad'
 from migration m
 where m.category_id is not null
   and m.item_id is not null);

commit;

insert into item_category(
  id,
  item_id,
  category_id,
  date_created,
  created_by,
  last_updated,
  updated_by
)
(select
  item_category_seq.nextval,
  m.alternative_item_id,
  m.category_id,
  sysdate,
  'buldLoad',
  sysdate,
  'bulkLoad'
 from migration m
 where m.category_id is not null
   and m.alternative_item_id is not null);
   
insert into replacement_item(
  id,
  item_id,
  replacement_item_id,
  date_created,
  created_by,
  last_updated,
  updated_by
)
(select
  replacement_item_seq.nextval,
  m.item_id,
  m.alternative_item_id,
  sysdate,
  'buldLoad',
  sysdate,
  'bulkLoad'
 from migration m
 where m.alternative_item_id is not null
   and m.item_id is not null);