CREATE TABLE "TJOEUNIT"."TESTBLOOD_17" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"PATIENTIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"WBC" NUMBER(*,0) NOT NULL ENABLE, 
	"HB" FLOAT(126) NOT NULL ENABLE, 
	"HCT" FLOAT(126) NOT NULL ENABLE, 
	"RBC" NUMBER(*,0) NOT NULL ENABLE, 
	"MCV" NUMBER(*,0) NOT NULL ENABLE, 
	"MCH" NUMBER(*,0) NOT NULL ENABLE, 
	"MCHC" NUMBER(*,0) NOT NULL ENABLE, 
	"PLATELET" NUMBER(*,0) NOT NULL ENABLE, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"GENDER" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"EMPLOYEENAME" VARCHAR2(20 BYTE), 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	 CONSTRAINT "TESTBLOOD_17_PK" PRIMARY KEY ("IDX")
   );

 
 delete from TESTBLOOD_17;
drop SEQUENCE TESTBLOOD_17_Idx_seq;
create SEQUENCE TESTBLOOD_17_Idx_seq; 

SELECT * FROM TESTBLOOD_17;
DROP TABLE TESTBLOOD_17;	

insert into TESTBLOOD_17 (idx, patientIdx, gender, WBC, Hb, Hct, RBC, MCV, MCH, MCHC, Platelet, employeeIdx, employeeName, writeDate) 
values (TESTBLOOD_17_idx_seq.nextval, 100007, 'M', 6570, 13.4, 39.3, 420, 82, 27, 33, 320, 3001, '«•¡ˆ»∆', sysdate-2);

insert into TESTBLOOD_17 (idx, patientIdx, gender, WBC, Hb, Hct, RBC, MCV, MCH, MCHC, Platelet, employeeIdx, employeeName, writeDate) 
values (TESTBLOOD_17_idx_seq.nextval, 100008, 'F', 7000, 14, 50, 500, 90, 30, 33, 300, 3002, '¿Ã¬˘«ı', sysdate-1);

insert into TESTBLOOD_17 (idx, patientIdx, gender, WBC, Hb, Hct, RBC, MCV, MCH, MCHC, Platelet, employeeIdx, employeeName, writeDate) 
values (TESTBLOOD_17_idx_seq.nextval, 100003, 'F', 9000, 15, 51, 550, 89, 30, 33, 310, 3001, '«•¡ˆ»∆', sysdate-(1/24));


