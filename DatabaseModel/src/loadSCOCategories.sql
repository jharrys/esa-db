set serveroutput on;
declare
  cursor c1 is select distinct item_category category from migration;
  category_id number;
begin
  for r1 in c1 loop
    category_id := category_seq.nextval;
    dbms_output.put_line('category = '||r1.category);
    dbms_output.put_line('category id = '||category_id);
    if(r1.category is not null ) then
      dbms_output.put_line('category = '||r1.category);
      insert into category(
        id,
        parent_category_id,
        name,
        parent_category_path,
        date_created,
        created_by,
        last_updated,
        updated_by
      )
      values
      ( category_id,
        category_id,
        r1.category,
        '/',
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

set serveroutput on;
update migration m
set m.category_id = (select c.id from category c where c.name=m.item_category);

commit;
