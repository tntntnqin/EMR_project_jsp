 CREATE TABLE "TJOEUNIT"."TESTURINE_21" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"PATIENTIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"COLOR" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"TURBIDITY" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"GRAVITY" NUMBER NOT NULL ENABLE, 
	"ACIDITY" NUMBER NOT NULL ENABLE, 
	"ALBUMIN" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"GLUCOSE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"KETONES" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"BILIRUBIN" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"BLOOD" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"BILINOGEN" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"LEUKOCYTE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"GENDER" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"NITRITE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMPLOYEENAME" VARCHAR2(20 BYTE), 
	 CONSTRAINT "TESTURINE_21_PK" PRIMARY KEY ("IDX")
   );
  
delete from TESTURINE_21;
drop SEQUENCE TESTURINE_21_Idx_seq;

create SEQUENCE TESTURINE_21_Idx_seq; 

SELECT * FROM TESTURINE_21;
DROP TABLE TESTURINE_21;

insert into TESTURINE_21 (idx, PATIENTIDX, GENDER, COLOR, TURBIDITY, GRAVITY, ACIDITY, ALBUMIN, GLUCOSE, 
KETONES, BILIRUBIN, BLOOD, BILINOGEN, nitrite, LEUKOCYTE, EMPLOYEEIDX, employeename, writedate) 
VALUES (TESTURINE_21_IDX_SEQ.nextval, 100007, 'M', 'straw', 'clear', 1.01, 5.1, 'negative', 'normal', 
'negative', 'negative', 'negative', 'normal', 'negative', 'negative', 3001, 'ǥ????', sysdate-2);

insert into TESTURINE_21 (idx, PATIENTIDX, GENDER, COLOR, TURBIDITY, GRAVITY, ACIDITY, ALBUMIN, GLUCOSE, 
KETONES, BILIRUBIN, BLOOD, BILINOGEN, nitrite, LEUKOCYTE, EMPLOYEEIDX, employeename, writedate) 
VALUES (TESTURINE_21_IDX_SEQ.nextval, 100008, 'F', 'straw', 'clear', 1.01, 5.9, 'negative', 'normal', 
'negative', 'negative', 'negative', 'normal', 'negative', 'negative', 3001, '??????', sysdate-1);


