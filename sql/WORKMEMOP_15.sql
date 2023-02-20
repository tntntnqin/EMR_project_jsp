  CREATE TABLE "TJOEUNIT"."WORKMEMOP_15" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"COMMENTP" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"EMPLOYEEIDX" NUMBER(*,0) NOT NULL ENABLE, 
	 CONSTRAINT "WORKMEMOP_PK" PRIMARY KEY ("IDX")
   );

   
delete from WORKMEMOP_15;
drop SEQUENCE WORKMEMOP_15_idx_seq;
create SEQUENCE WORKMEMOP_15_idx_seq;

select * from WORKMEMOP_15;

drop table WORKMEMOP_15;


insert into WORKMEMOP_15 (idx, employeeIdx, COMMENTP, writedate) 
values (WORKMEMOP_15_idx_seq.nextval, 3001, '»ﬁ∞°Ω≈√ª«œ±‚', sysdate-2);

insert into WORKMEMOP_15 (idx, employeeIdx, COMMENTP, writedate) 
values (WORKMEMOP_15_idx_seq.nextval, 3001, '∆¿¿Â¥‘≤≤ ∫∏∞Ì', sysdate-2);

insert into WORKMEMOP_15 (idx, employeeIdx, COMMENTP, writedate) 
values (WORKMEMOP_15_idx_seq.nextval, 3002, '∆¿¿Â¥‘≤≤ ∫∏∞Ì', sysdate-1);

insert into WORKMEMOP_15 (idx, employeeIdx, COMMENTP, writedate) 
values (WORKMEMOP_15_idx_seq.nextval, 3002, '»ﬁ∞°Ω≈√ª«œ±‚', sysdate-1);

