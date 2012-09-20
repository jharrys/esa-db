REM first create trigger so we do not have rely on our own
CREATE OR REPLACE TRIGGER ESA.PARTY_TRIGGER before
	INSERT ON ESA.PARTY FOR EACH row BEGIN IF inserting THEN IF :NEW."ID" IS NULL THEN
	SELECT PARTY_SEQ.nextval INTO :NEW."ID" FROM dual;
END IF;
END IF;
END;
/
ALTER TRIGGER ESA.PARTY_TRIGGER ENABLE;


REM INSERTING into PARTY
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Intermountain Healthcare',null,null,null,null,null,to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Dell',null,null,'8009993355',null,'http://www.dell.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','VLCM',null,null,'8008171504',null,'http://www.vlcmtech.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Softchoice',null,null,null,null,null,to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Marshal ',null,null,null,null,null,to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Transcription Gear',null,null,null,null,null,to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Apple',null,null,'8006927753',null,'http://www.apple.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Imprivata','sales@imprivata.com',null,'8009355958',null,'http://www.imprivata.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','CDW',null,null,'8008004239',null,'http://www.cdw.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','APC',null,null,'8005552725',null,'http://www.apc.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','IBM','ews@us.ibm.com',null,'8004264968',null,'http://www.ibm.com/us/en/',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Sprint',null,null,'8009272199',null,'http://www.sprint.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Verizon',null,null,null,null,'http://www.verizon.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Teletracking',null,null,'8775706903',null,'http://www.teletracking.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','GuardRFID',null,null,'8667857343',null,'http://www.guardrfid.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Oracle Corporation',null,null,'8006330738',null,'http://www.oracle.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Medtronic',null,null,'8003282518',null,'http://www.medtronic.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Microsoft Corporation',null,null,null,null,'http://www.microsoft.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','HP Corporation',null,null,null,null,'http://www.hp.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','NEC',null,null,null,null,'http://www.nec.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Epson',null,null,null,null,'http://www.epson.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Kronos',null,null,null,null,'http://www.kronos.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Siemens',null,null,null,null,'http://www.siemens.com/entry/cc/en/',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Mediware',null,null,null,null,'http://www.mediware.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Nuance',null,null,null,null,'http://www.nuance.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Google',null,null,null,null,'http://www.google.com/about/company',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Quest Software',null,null,null,null,'http://www.quest.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Symantec',null,null,null,null,'http://norton.symantec.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Citrix',null,null,null,null,'http://www.citrix.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Cisco',null,null,null,null,'http://www.cisco.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Canon Incorporated',null,null,null,null,'http://www.canon.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Sharp Electronics Corporation',null,null,null,null,'http://www.sharpusa.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Red Hat, Incorporated',null,null,null,null,'http://www.redhat.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','VMWare, Incorporated',null,null,null,null,'http://www.vmware.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','NetApp, Incorporated',null,null,null,null,'http://www.netapp.com/us',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','CenturyLink, Incorporated',null,null,null,null,'http://www.centurylink.com/us',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Vocera Communications Incorporated',null,null,null,null,'http://www.vocera.com/us',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Avaya, Incorporated',null,null,null,null,'http://www.avaya.com/usa',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Telesoft Corporation',null,null,null,null,'http://www.telesoft.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Philips Electronics',null,null,null,null,'http://www.usa.philips.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','USA Mobility, Incorporated',null,null,null,null,'http://www.usamobility.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');
Insert into PARTY (EXTERNAL_ID,TYPE,NAME,EMAIL_ADDRESS,MOBILE_PHONE_NUMBER,WORK_PHONE_NUMBER,HOME_PHONE_NUMBER,WEB_SITE_URL,DATE_CREATED,CREATED_BY,LAST_UPDATED,UPDATED_BY) values (null,'organization','Emerson Electric Corporation',null,null,null,null,'http://www.emersonnetworkpower.com',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load',to_timestamp('20-SEP-12','DD-MON-RR HH.MI.SSXFF AM'),'bulk load');

REM remove trigger we created
DROP trigger ESA.PARTY_TRIGGER;