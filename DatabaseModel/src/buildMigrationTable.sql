create table migration
( vendor_party_id number,
  alternative_vendor_party_id number,
  manufacturer_party_id number,
  item_id number,
  alternative_item_id number,
  category_id number,
  last_updated varchar2(15),
  item_category varchar2(128),
  description varchar2(4000),
  price number,
  vendor varchar2(128),
  vendor_catalog_# varchar2(128),
  manufacturer varchar2(128),
  manufacturer_catalog_# varchar2(128),
  alternative_vendor_price number,
  alternative_vendor varchar2(128),
  alternative_vendor_part_# varchar2(128),
  intermountain_item_#_mmis varchar2(128),
  purchase_unit varchar2(128),
  conversion number,
  gl_code varchar2(128),
  unspc varchar2(128),
  notes varchar2(4000)
);

purge recyclebin;
