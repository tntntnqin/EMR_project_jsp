  CREATE TABLE "TJOEUNIT"."PRESCRIPTIONTEST_5" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"PATIENTIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE), 
	"TEST" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"EMPLOYEENAME" VARCHAR2(20 BYTE), 
	 CONSTRAINT "PRESCRIPTIONTEST_5_PK" PRIMARY KEY ("IDX")
   );

 
 delete from PRESCRIPTIONTEST_5;
drop SEQUENCE PRESCRIPTIONTEST_5_idx_seq;
create SEQUENCE PRESCRIPTIONTEST_5_idx_seq;


SELECT * FROM PRESCRIPTIONTEST_5;
DROP TABLE PRESCRIPTIONTEST_5;


insert into PRESCRIPTIONTEST_5 (idx, patientIdx, name, test, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONTEST_5_idx_seq.nextval, 100007, '구창모', '혈액검사', 1102, '김석진', sysdate-2);

insert into PRESCRIPTIONTEST_5 (idx, patientIdx, name, test, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONTEST_5_idx_seq.nextval, 100007, '구창모', '소변검사', 1102, '김석진',  sysdate-2);

insert into PRESCRIPTIONTEST_5 (idx, patientIdx, name, test, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONTEST_5_idx_seq.nextval, 100008, '전소연', '혈액검사', 1103, '김태형', sysdate-1);

insert into PRESCRIPTIONTEST_5 (idx, patientIdx, name, test, employeeIdx, employeename, writedate) 
values (PRESCRIPTIONTEST_5_idx_seq.nextval, 100009, '조미연', '혈액검사', 1101, '권지용', sysdate-(3/24));
