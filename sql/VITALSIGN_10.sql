 CREATE TABLE "TJOEUNIT"."VITALSIGN_10" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"PATIENTIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"BP" VARCHAR2(20 BYTE), 
	"HR" NUMBER(*,0), 
	"BT" FLOAT(126), 
	"RR" NUMBER(*,0), 
	"VITALTIME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"NAME" VARCHAR2(20 BYTE), 
	"EMPLOYEENAME" VARCHAR2(20 BYTE), 
	 CONSTRAINT "VITALSIGN_10_PK" PRIMARY KEY ("IDX")
   ); 
    
delete from VITALSIGN_10;
drop SEQUENCE VITALSIGN_10_idx_seq;
create SEQUENCE VITALSIGN_10_idx_seq;


SELECT * FROM VITALSIGN_10;
DROP TABLE VITALSIGN_10;


insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100007, '구창모', '120/80', 72, 36.6, 15, '10A', 2101, '정호석', sysdate-2);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100007, '구창모', '110/70', 76, 36.5, 14, '4P', 2101, '정호석', sysdate-2);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100007, '구창모', '120/80', 74, 36.4, 16, '10P', 2101, '정호석', sysdate-2);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100007, '구창모', '120/80', 76, 36.3, 16, '10A', 2102, '민윤기', sysdate-1);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100008, '전소연', '110/70', 77, 36.2, 14, '10A', 2102, '민윤기', sysdate-1);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100007, '구창모', '120/80', 78, 36.1, 17, '4P', 2102, '민윤기', sysdate-1);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100008, '전소연', '120/80', 76, 36.3, 16, '4P', 2102, '민윤기', sysdate-1);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100007, '구창모', '110/70', 77, 36.2, 14, '10P', 2102, '민윤기', sysdate-1);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100008, '전소연', '120/80', 78, 36.1, 17, '10P', 2102, '민윤기', sysdate-1);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100007, '구창모', '120/80', 76, 36.3, 16, '10A', 2101, '정호석', sysdate);

insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100008, '전소연', '110/70', 77, 36.2, 14, '10A', 2101, '정호석', sysdate);



-- 체온이상 데이터
insert into VITALSIGN_10 (idx, patientIdx, name, bp, hr, bt, rr, vitalTime, employeeIdx, employeename, writeDate) 
values (VITALSIGN_10_idx_seq.nextval, 100009, '조미연', '120/80', 78, 37.6, 17, '10A', 2101, '정호석', sysdate);
