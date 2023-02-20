  CREATE TABLE "TJOEUNIT"."HANDOVERD_3" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"COMMENTD" VARCHAR2(2000 BYTE) NOT NULL ENABLE, 
	"FROMNAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"FROMDT" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"GUP" NUMBER(*,0) NOT NULL ENABLE, 
	"LEV" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "HANDOVERD_PK" PRIMARY KEY ("IDX")
   );

delete from HANDOVERD_3;
drop SEQUENCE HANDOVERD_3_idx_seq;
create SEQUENCE HANDOVERD_3_idx_seq;


SELECT * FROM HANDOVERD_3;
DROP TABLE HANDOVERD_3;

insert into HANDOVERD_3 (idx, gup, lev, commentD, fromDT, employeeIdx, fromName, writedate) 
values (1, 1, 0, '김교수님 회진 금 4P로 변경', '의사A', 1102, '김석진', sysdate-2);

insert into HANDOVERD_3 (idx, gup, lev, commentD, fromDT, employeeIdx, fromName, writedate) 
values (2, 2, 0, '구창모환자 DNR동의서받기', '의사A', 1102, '김석진', sysdate-2);

insert into HANDOVERD_3 (idx, gup, lev, commentD, fromDT, employeeIdx, fromName, writedate) 
values (3, 3, 0, '11/23 7P A팀 회식', '의사A', 1103, '김태형', sysdate-1);

insert into HANDOVERD_3 (idx, gup, lev, commentD, fromDT, employeeIdx, fromName, writedate)  
values (4, 3, 1, '전원 참석예정', '의사A', 1101, '권지용', sysdate-(3/24));

insert into HANDOVERD_3 (idx, gup, lev, commentD, fromDT, employeeIdx, fromName, writedate) 
values (5, 2, 1, '동의서 완료', '의사A', 1101, '권지용', sysdate-(3/24));

