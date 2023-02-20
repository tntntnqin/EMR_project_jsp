  CREATE TABLE "TJOEUNIT"."WORKMEMOA_19" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"COMMENTA" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" DATE DEFAULT sysdate, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	 CONSTRAINT "WORKMEMOA_19_PK" PRIMARY KEY ("IDX")
   );

delete from workmemoa_19;
drop SEQUENCE workmemoa_19_Idx_seq;
create SEQUENCE workmemoa_19_Idx_seq;

SELECT * FROM WORKMEMOA_19;
DROP TABLE WORKMEMOA_19;



insert into workmemoa_19 (idx, employeeidx, commentA) 
VALUES (workmemoa_19_IDX_SEQ.nextval, 4001, '휴가신청하기');

insert into workmemoa_19 (idx, employeeidx, commentA) 
VALUES (workmemoa_19_IDX_SEQ.nextval, 4001, '김계장님께 결재받기');

insert into workmemoa_19 (idx, employeeidx, commentA) 
VALUES (workmemoa_19_IDX_SEQ.nextval, 4001, '11/23 주임 전체회의');

insert into workmemoa_19 (idx, employeeidx, commentA) 
VALUES (workmemoa_19_IDX_SEQ.nextval, 4002, '11/23 주임 전체회의');

insert into workmemoa_19 (idx, employeeidx, commentA) 
VALUES (workmemoa_19_IDX_SEQ.nextval, 4002, '사유서 작성하기');


