declare
    project_to_merge number := &project_to_merge;
    project_to_merge_to number := &project_to_merge_to;
    
    architect_exists number;
    
    cursor project_architect_c (p_project_id number) is
    select party_id
    from project_architect
    where project_id = p_project_id;
begin
    update external_project_number
    set project_id = project_to_merge_to
    where project_id = project_to_merge;
    
    update note
    set project_id = project_to_merge_to
    where project_id = project_to_merge;
    
    update project_alias
    set project_id = project_to_merge_to
    where project_id = project_to_merge;
    
    for project_architect_r in project_architect_c(project_to_merge) loop
        select count(*)
        into architect_exists
        from project_architect
        where party_id = project_architect_r.party_id
          and project_id = project_to_merge_to;
        
        if(architect_exists=0) then
            insert into project_architect
            (id,
             party_id,
             project_id,
             date_created,
             created_by,
             last_updated,
             updated_by)
            values
            (project_architect_seq.nextval,
             project_architect_r.party_id,
             project_to_merge_to,
             sysdate,
             'merge',
             sysdate,
             'merge');
        end if;
    end loop;
    
    delete from project_architect where project_id = project_to_merge;
    delete from project where id = project_to_merge;
    
    insert into note
    (id,
     text,
     project_id,
     date_created,
     created_by,
     last_updated,
     updated_by)
    values
    (note_seq.nextval,
     'Project ACID#:'||project_to_merge||' merged to this project',
     project_to_merge_to,
     sysdate,
     'merge',
     sysdate,
     'merge');
    
    commit;
end;
/