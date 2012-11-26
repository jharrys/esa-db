set serveroutput on;
update migration m
set m.vendor_party_id = (select p.id from party p where p.name=m.vendor);

commit;

declare
  cursor c1 is select distinct vendor vendor from migration where vendor_party_id is null and vendor is not null;
  party_id number;
begin
  for r1 in c1 loop
    party_id := party_seq.nextval;
    dbms_output.put_line('vendor = '||r1.vendor);
    dbms_output.put_line('vendor id = '||party_id);
    if(r1.vendor is not null ) then
      dbms_output.put_line('party = '||r1.vendor);
      insert into party(
        id,
        type,
        name,
        date_created,
        created_by,
        last_updated,
        updated_by
      )
      values
      ( party_id,
        'organization',
        r1.vendor,
        sysdate,
        'bulkLoad',
        sysdate,
        'bulkLoad'
      );
    end if;
  end loop;
  commit;
end;
/

update migration m
set m.vendor_party_id = (select p.id from party p where p.name=m.vendor)
where m.vendor_party_id is null;

commit;

update migration m
set m.manufacturer_party_id = (select p.id from party p where p.name=m.manufacturer)
where m.manufacturer is not null
  and m.manufacturer_party_id is null;

commit;

declare
  cursor c1 is select distinct manufacturer manufacturer 
               from migration 
               where manufacturer is not null
                 and manufacturer_party_id is null;
  party_id number;
begin
  for r1 in c1 loop
    party_id := party_seq.nextval;
    dbms_output.put_line('manufacturer = '||r1.manufacturer);
    dbms_output.put_line('manufacturer id = '||party_id);
    if(r1.manufacturer is not null ) then
      dbms_output.put_line('party = '||r1.manufacturer);
      insert into party(
        id,
        type,
        name,
        date_created,
        created_by,
        last_updated,
        updated_by
      )
      values
      ( party_id,
        'organization',
        r1.manufacturer,
        sysdate,
        'bulkLoad',
        sysdate,
        'bulkLoad'
      );
    end if;
  end loop;
  commit;
end;
/

update migration m
set m.manufacturer_party_id = (select p.id from party p where p.name=m.manufacturer)
where m.manufacturer is not null
  and m.manufacturer_party_id is null;

commit;

update migration m
set m.alternative_vendor_party_id = (select p.id from party p where p.name=m.alternative_vendor)
where m.alternative_vendor is not null
  and m.alternative_vendor_party_id is null;

commit;

declare
  cursor c1 is select distinct alternative_vendor vendor
               from migration 
               where alternative_vendor_party_id is null
                 and alternative_vendor is not null;
  party_id number;
begin
  for r1 in c1 loop
    party_id := party_seq.nextval;
    dbms_output.put_line('vendor = '||r1.vendor);
    dbms_output.put_line('vendor id = '||party_id);
    if(r1.vendor is not null ) then
      dbms_output.put_line('party = '||r1.vendor);
      insert into party(
        id,
        type,
        name,
        date_created,
        created_by,
        last_updated,
        updated_by
      )
      values
      ( party_id,
        'organization',
        r1.vendor,
        sysdate,
        'bulkLoad',
        sysdate,
        'bulkLoad'
      );
    end if;
  end loop;
  commit;
end;
/

update migration m
set m.alternative_vendor_party_id = (select p.id from party p where p.name=m.alternative_vendor)
where m.alternative_vendor is not null
  and m.alternative_vendor_party_id is null;

commit;



