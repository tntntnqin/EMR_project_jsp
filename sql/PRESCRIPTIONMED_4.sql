
  CREATE TABLE "TJOEUNIT"."PRESCRIPTIONMED_4" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"PATIENTIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE), 
	"MEDICINE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"DOSAGE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ROUTE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"INJECTTIME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"DISCHARGEM" CHAR(1 BYTE) DEFAULT 'N', 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"EMPLOYEENAME" VARCHAR2(20 BYTE), 
	 CONSTRAINT "PRESCRIPTIONMED_4_PK" PRIMARY KEY ("IDX")
   );

   
delete from PRESCRIPTIONMED_4;
drop SEQUENCE PRESCRIPTIONMED_4_idx_seq;
create SEQUENCE PRESCRIPTIONMED_4_idx_seq;


SELECT * FROM PRESCRIPTIONMED_4;
DROP TABLE PRESCRIPTIONMED_4;



insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'NS 0.9%', '3000ml', 'IV', '24h', 'N', 1102, '김석진', sysdate-2);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'Taron Tab [진경제]', '100mg', 'PO', 'tid', 'N', 1102, '김석진', sysdate-2);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'Aldrin Tab [제산제]', '500mg', 'PO', 'tid', 'N', 1102, '김석진', sysdate-2);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'Asec Tab [진통소염제]', '100mg', 'PO', 'bid', 'N', 1102, '김석진', sysdate-2);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'NS 0.9%', '3000ml', 'IV', '24h', 'N', 1103, '김태형', sysdate-1);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'Taron Tab [진경제]', '100mg', 'PO', 'tid', 'N', 1103, '김태형', sysdate-1);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'Aldrin Tab [제산제]', '500mg', 'PO', 'tid', 'N', 1103, '김태형', sysdate-1);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'Asec Tab [진통소염제]', '100mg', 'PO', 'bid', 'N', 1103, '김태형', sysdate-1);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100008, '전소연', 'NS 0.9%', '3000ml', 'IV', '24h', 'N', 1103, '김태형', sysdate-1);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100008, '전소연', 'Taron Tab [진경제]', '100mg', 'PO', 'tid', 'N', 1103, '김태형', sysdate-1);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100008, '전소연', 'Asec Tab [진통소염제]', '100mg', 'PO', 'bid', 'N', 1103, '김태형', sysdate-1);

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'NS 0.9%', '3000ml', 'IV', '24h', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'Taron Tab [진경제]', '100mg', 'PO', 'tid', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'Aldrin Tab [제산제]', '500mg', 'PO', 'tid', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100007, '구창모', 'Asec Tab [진통소염제]', '100mg', 'PO', 'bid', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100008, '전소연', 'NS 0.9%', '3000ml', 'IV', '24h', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100008, '전소연', 'Taron Tab [진경제]', '100mg', 'PO', 'tid', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100008, '전소연', 'Asec Tab [진통소염제]', '100mg', 'PO', 'bid', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100009, '조미연', 'NS 0.9%', '3000ml', 'IV',' 24h', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100009, '조미연', 'Stavic Suspension [지사제]', '20ml', 'PO', 'tid', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100009, '조미연', 'Bacillis Cap [정장제]', '2250mg', 'PO', 'tid', 'N', 1101, '권지용', sysdate-(3/24));

insert into PRESCRIPTIONMED_4 (idx, patientIdx, name, medicine, dosage, route, injectTime, dischargeM, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONMED_4_idx_seq.nextval, 100009, '조미연', 'Lopmin Cap [지사제]', '2mg', 'PO', 'tid', 'N', 1101, '권지용', sysdate-(3/24));

