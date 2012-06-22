set serveroutput on size 1000000;
declare
    cursor c1 is
        select 'ALTER TABLE '||owner||'.'||table_name||
               ' DROP CONSTRAINT '||constraint_name sql_text,
               constraint_name
        from user_constraints 
        where owner='ESA'
          and constraint_type = 'R';
        
    r1 c1%ROWTYPE;
    
    cursor c2 is
        select 'DROP TABLE '||table_name||' purge' sql_text,
          table_name
        from user_tables;

    r2 c2%ROWTYPE;
    
    cursor c3 is
        select 'DROP SEQUENCE '||sequence_name sql_text,
          sequence_name
        from user_sequences;
        
    r3 c3%ROWTYPE;
    
begin
    for r1 in c1 loop
        execute immediate r1.sql_text;
        dbms_output.put_line('Disabled constraint '||r1.constraint_name);
    end loop;
    
    for r2 in c2 loop
        execute immediate r2.sql_text;
        dbms_output.put_line('Dropped table '||r2.table_name);
    end loop;
    
    for r3 in c3 loop
        execute immediate r3.sql_text;
        dbms_output.put_line('Dropped sequence '||r3.sequence_name);
    end loop;
        
end;
/