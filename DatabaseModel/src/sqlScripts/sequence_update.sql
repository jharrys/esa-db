set serveroutput on
declare
    cursor c1 is 
        select
          'select nvl(max(id),0) from '||uc.table_name sql_text,
          uc.table_name||'_SEQ' sequence_name 
        from
          user_constraints uc,
          user_cons_columns ucc
        where uc.constraint_type='P'
          and ucc.constraint_name = uc.constraint_name
          and ucc.column_name='ID'
          and uc.owner='ESA';
        
    alter_sequence_text varchar2(1024);
    TYPE generic_cursor_type IS REF CURSOR;
    max_id number;
    next_id number;
    c2 generic_cursor_type;
begin
    for r1 in c1 loop
        open c2 for r1.sql_text;
        fetch c2 into max_id;
        close c2;
        
        if( max_id != 0 ) then
            dbms_output.put_line( 'seq name = '||r1.sequence_name );
            execute immediate 'alter sequence '||r1.sequence_name||' increment by '||to_char(max_id);
            dbms_output.put_line( 'max_id = '||to_char(max_id) );
            execute immediate 'select '||r1.sequence_name||'.nextval from dual' into next_id;
            dbms_output.put_line( 'sequence value = '||to_char(next_id) );
            execute immediate 'alter sequence '||r1.sequence_name||' increment by 1';
            dbms_output.put_line( 'sequence: '||r1.sequence_name||' is at '||to_char(max_id+1) );
        end if;
    end loop;
end;