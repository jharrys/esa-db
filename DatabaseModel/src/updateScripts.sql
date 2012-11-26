update migration m
set m.vendor_party_id = (select p.id from party p where p.name=m.vendor);

commit;