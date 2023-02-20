 CREATE TABLE "TJOEUNIT"."NOTICETOP_14" 
   (	"idx" NUMBER(11,0) NOT NULL ENABLE, 
	"patientIdx" NUMBER(11,0) NOT NULL ENABLE, 
	"name" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ALARMP" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"fromDP" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"fromName" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	 CONSTRAINT "NOTICETOP_14" PRIMARY KEY ("idx")
   );



delete from NOTICETOP_14;
drop SEQUENCE NOTICETOP_14_Idx_seq;
create SEQUENCE NOTICETOP_14_Idx_seq;  
DROP TABLE NOTICETOP_14;


select * from NOTICETOP_14;


insert into NOTICETOP_14 (idx, patientIdx, name, alarmP, fromDP, employeeIdx, fromname, writeDate) 
values (NOTICETOP_14_idx_seq.nextval, 100009, '조미연', '혈액검사의뢰', '간호사', 2101, '정호석', sysdate-(2/24));

