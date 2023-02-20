 CREATE TABLE "TJOEUNIT"."MEDICALCOMMENT_7" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"PATIENTIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE), 
	"RECORDD" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"DISCHARGEC" CHAR(1 BYTE) DEFAULT 'N' NOT NULL ENABLE, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"EMPLOYEENAME" VARCHAR2(20 BYTE), 
	 CONSTRAINT "MEDICALCOMMENT_7_PK" PRIMARY KEY ("IDX")
   );
  
  
  commit;
  
delete from MEDICALCOMMENT_7;
drop SEQUENCE MEDICALCOMMENT_7_idx_seq;
create SEQUENCE MEDICALCOMMENT_7_idx_seq;

SELECT * FROM MEDICALCOMMENT_7;
DROP TABLE MEDICALCOMMENT_7;


insert into MEDICALCOMMENT_7 (IDX, PATIENTIDX, NAME, RECORDD, DISCHARGEC, EMPLOYEEIDX, EMPLOYEENAME, WRITEDATE) 
values (MEDICALCOMMENT_7_idx_seq.nextval, 100007, '구창모', '만성위염 있는 환자로 상복부통증 호소함. hydration하며 통증경감위한 치료진행.', 'N', 1102, '김석진', sysdate-2);

insert into MEDICALCOMMENT_7 (idx, patientIdx, name, recordD, dischargeC, employeeIdx, employeename, writedate) 
values (MEDICALCOMMENT_7_idx_seq.nextval, 100007, '구창모', '상복부통증 호소함. 진통제 및 위염치료진행.', 'N', 1103, '김태형', sysdate-1);

insert into MEDICALCOMMENT_7 (idx, patientIdx, name, recordD, dischargeC, employeeIdx, employeename, writedate) 
values (MEDICALCOMMENT_7_idx_seq.nextval, 100008, '전소연', '간헐적 하복부통증 호소함. hydration 및 진통제 처방함.', 'N', 1103, '김태형', sysdate-1);

insert into MEDICALCOMMENT_7 (idx, patientIdx, name, recordD, dischargeC, employeeIdx, employeename, writedate) 
values (MEDICALCOMMENT_7_idx_seq.nextval, 100007, '구창모', '전날보다 증상호전됨. 치료유지.', 'N', 1101, '권지용', sysdate-(3/24));

insert into MEDICALCOMMENT_7 (idx, patientIdx, name, recordD, dischargeC, employeeIdx, employeename, writedate) 
values (MEDICALCOMMENT_7_idx_seq.nextval, 100008, '전소연', '전날보다 증상호전됨. 치료유지.', 'N', 1101, '권지용', sysdate-(3/24));

insert into MEDICALCOMMENT_7 (idx, patientIdx, name, recordD, dischargeC, employeeIdx, employeename, writedate) 
values (MEDICALCOMMENT_7_idx_seq.nextval, 100009, '조미연', '금일 입원. 설사증상 있는 환자로 hydration 및 증상 치료진행.', 'N', 1101, '권지용', sysdate-(3/24));

