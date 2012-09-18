set serveroutput on
declare
    cursor c1 is 
        select 'select nvl(max(id),0) from '||replace(sequence_name, '_SEQ', '') sql_text, sequence_name 
        from user_sequences;
        
    alter_sequence_text varchar2(1024);
    TYPE generic_cursor_type IS REF CURSOR;
    max_id number;
    c2 generic_cursor_type;
begin
    for r1 in c1 loop
        dbms_output.put_line(r1.sql_text);
        open c2 for r1.sql_text;
        fetch c2 into max_id;
        close c2;
        
        if( max_id != 0 ) then
            execute immediate 'alter sequence '||r1.sequence_name||' increment by '||to_char(max_id);
            execute immediate 'select '||r1.sequence_name||'.nextval from dual';
            execute immediate 'alter sequence '||r1.sequence_name||' increment by 1';
            dbms_output.put_line( 'sequence: '||r1.sequence_name||' is at '||to_char(max_id+1) );
        end if;
    end loop;
end;