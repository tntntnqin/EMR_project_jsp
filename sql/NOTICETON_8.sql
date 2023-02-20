  CREATE TABLE "TJOEUNIT"."NOTICETON_8" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"PATIENTIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ALARMN" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"FROMDP" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"FROMNAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	 CONSTRAINT "NOTICETON_PK" PRIMARY KEY ("IDX")
   );

delete from NOTICETON_8;
drop SEQUENCE NOTICETON_8_idx_seq;
create SEQUENCE NOTICETON_8_idx_seq;


SELECT * FROM NOTICETON_8;
DROP TABLE NOTICETON_8;


insert into NOTICETON_8 (idx, patientIdx, name, alarmN, fromDP, employeeIdx, fromName, writedate) 
values (NOTICETON_8_idx_seq.nextval, 100009, '조미연', '환자등록', '원무과', 4001, '전정국', sysdate-(4/24));

insert into NOTICETON_8 (idx, patientIdx, name, alarmN, fromDP, employeeIdx, fromName, writedate) 
values (NOTICETON_8_idx_seq.nextval, 100009, '조미연', '처방완료', '의사', 1101, '권지용', sysdate-(3/24));

insert into NOTICETON_8 (idx, patientIdx, name, alarmN, fromDP, employeeIdx, fromName, writedate) 
values (NOTICETON_8_idx_seq.nextval, 100009, '조미연', '검사결과', '병리사', 3001, '표지훈', sysdate-(1/24));




--추후 퇴원 진행시에 적용할 것

insert into NOTICETON_8 (idx, patientIdx, name, alarmN, fromDP, employeeIdx, fromName, writedate) 
values (NOTICETON_8_idx_seq.nextval, 100008, '전소연', '퇴진완료', '의사', 1101, '권지용', sysdate);
