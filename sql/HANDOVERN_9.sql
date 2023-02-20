 CREATE TABLE "TJOEUNIT"."HANDOVERN_9" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"COMMENTN" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"FROMNAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"FROMDT" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"GUP" NUMBER(*,0) NOT NULL ENABLE, 
	"LEV" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "HANDOVERN_9_PK" PRIMARY KEY ("IDX")
   );
   
delete from HANDOVERN_9;
drop SEQUENCE HANDOVERN_9_idx_seq;
create SEQUENCE HANDOVERN_9_idx_seq;


SELECT * FROM HANDOVERN_9;
DROP TABLE HANDOVERN_9;


-- 예시로 어떻게 뜨는지 보여주려고 밑에서는 idx와 gup lev수동으로 입력해둔 건데 기능구현하면서는 이 두개로 하면 됩니다.
-- HANDOVERN_9_idx_seq.nextval
-- HANDOVERN_9_idx_seq.currval

insert into HANDOVERN_9 (idx, gup, lev, commentN, fromDT, employeeIdx, fromName, writedate) 
values (1, 1, 0, '김교수 회진 시 구창모 환자보호자에게 연락', '간호A', 2101, '정호석', sysdate-2);

insert into HANDOVERN_9 (idx, gup, lev, commentN, fromDT, employeeIdx, fromName, writedate) 
values (2, 2, 0, '환자 드레싱시 거즈로', '간호A', 2102, '민윤기', sysdate-1);

insert into HANDOVERN_9 (idx, gup, lev, commentN, fromDT, employeeIdx, fromName, writedate) 
values (3, 1, 1, '김교수님 회진 금 4P로 변경', '간호A', 2102, '민윤기', sysdate-1);
