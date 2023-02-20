CREATE TABLE "TJOEUNIT"."PATIENT_1" 
   (	"PATIENTIDX" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"REGISTNUM1" NUMBER(*,0) NOT NULL ENABLE, 
	"REGISTNUM2" NUMBER(*,0) NOT NULL ENABLE, 
	"AGE" NUMBER(*,0) NOT NULL ENABLE, 
	"GENDER" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"INSURANCE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ROOM" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"MEAL" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"DOCTORT" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"NURSET" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"DISCHARGE" CHAR(1 BYTE) DEFAULT 'N' NOT NULL ENABLE, 
	"ADDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"CC" VARCHAR2(1000 BYTE), 
	"PI" VARCHAR2(1000 BYTE), 
	"HISTROY" VARCHAR2(1000 BYTE), 
	"ALLERGY" VARCHAR2(1000 BYTE), 
	"ALCOHOL" VARCHAR2(1000 BYTE), 
	"SMOKING" VARCHAR2(1000 BYTE), 
	"DIAGNOSIS" VARCHAR2(1000 BYTE), 
	"CAREPLAN" VARCHAR2(1000 BYTE), 
	"EXDISDATE" VARCHAR2(100 BYTE), 
	"DISDATE" TIMESTAMP (6), 
	 CONSTRAINT "PATIENT_1_PK" PRIMARY KEY ("PATIENTIDX")
   );



delete from PATIENT_1;
drop SEQUENCE PATIENT_1_Idx_seq;

create SEQUENCE PATIENT_1_Idx_seq start with 100001; 

SELECT * FROM PATIENT_1 order by patientidx;
DROP TABLE PATIENT_1;

-- PATIENT_1_idx_seq.nextval



-- 환자 추가
insert into PATIENT_1 (patientidx, name, registNum1, registNum2, age, gender, address, insurance, room, meal, doctorT, nurseT, discharge, adDate, disDate, 
cc, pi, histroy, allergy, alcohol, smoking, diagnosis, carePlan, exDisDate)
VALUES (PATIENT_1_idx_seq.nextval, '구창모', 961223, 1111111, 25, 'M', '서울시 성동구 성수동', '건강보험', 
'1인실', 'T', '의사A', '간호A', 'T', sysdate-2, null, '상복부 통증', 
'위염', '만성위염', '갑각류', 'Y', 'N', '위염', '만성위염 있는 환자로 상복부통증 호소. 증상치료 후 호전 시 퇴원 예정', 
'22-09-03');


insert into PATIENT_1 (patientidx, name, registNum1, registNum2, age, gender, address, insurance, room, meal, doctorT, nurseT, discharge, adDate, disDate, 
cc, pi, histroy, allergy, alcohol, smoking, diagnosis, carePlan, exDisDate)
VALUES (PATIENT_1_idx_seq.nextval, '전소연', 980816, 2222222, 24, 'F', '서울시 강남구 청담동', '건강보험', 
'2인실', 'Y', '의사A', '간호A', 'Y', sysdate-1, null, '하복부통증', '장염', null, '조영제', 'Y', 'N', '장염',
'이틀 전 저녁 회 섭취 이후 설사 및 하복부통증 발생한 환자로 설사증상은 사라졌으나 현재 간헐적 하복부통증 호소함. 
치료 후 호전 시 퇴원 예정', '22-09-05');


insert into PATIENT_1 (patientidx, name, registNum1, registNum2, age, gender, address, insurance, room, meal, doctorT, nurseT, discharge, adDate, disDate, 
cc, pi, histroy, allergy, alcohol, smoking, diagnosis, carePlan, exDisDate)
VALUES (PATIENT_1_idx_seq.nextval, '조미연', 970131, 2222222, 25, 'F', '서울시 성동구 성수동', '의료급여', '6인실',
 'Y', '의사B', '간호B', 'Y', sysdate-(4/24), null, '설사', '장염', null, '복숭아', 'Y', 'N', '장염',
 '이틀 전 상한 빵 섭취 후 설사증상 지속 중인 환자로 치료 후 호전 시 퇴원 예정', '22-09-07');





--퇴원환자

insert into PATIENT_1 (patientidx, name, registNum1, registNum2, age, gender, address, insurance, room, meal, doctorT, nurseT, discharge, adDate, disDate, 
cc, pi, histroy, allergy, alcohol, smoking, diagnosis, carePlan, exDisDate)
VALUES (100001, '우원재', 961223, 1111111, 25, 'M', '서울시 성동구 성수동', '건강보험', 
'1인실', 'T', '의사A', '간호A', 'T', '2022-09-01 10:55:43', '2022-09-03 08:30:43', '상복부 통증', 
'위염', '만성위염', '갑각류', 'Y', 'N', '위염', '만성위염 있는 환자로 상복부통증 호소. 증상치료 후 호전 시 퇴원 예정', 
'22-09-03');


insert into PATIENT_1 (patientidx, name, registNum1, registNum2, age, gender, address, insurance, room, meal, doctorT, nurseT, discharge, adDate, disDate, 
cc, pi, histroy, allergy, alcohol, smoking, diagnosis, carePlan, exDisDate)
VALUES (100002, '아이린', 980816, 2222222, 24, 'F', '서울시 강남구 청담동', '건강보험', '2인실', 'Y', '의사A', '간호A', 'Y',
 '2022-09-04 10:55:43', '2022-09-05 08:30:43', '하복부통증', '장염', null, '조영제', 'Y', 'N', '장염',
'이틀 전 저녁 회 섭취 이후 설사 및 하복부통증 발생한 환자로 설사증상은 사라졌으나 현재 간헐적 하복부통증 호소함. 치료 후 호전 시 퇴원 예정', '22-09-05');

insert into PATIENT_1 (patientidx, name, registNum1, registNum2, age, gender, address, insurance, room, meal, doctorT, nurseT, discharge, adDate, disDate, 
cc, pi, histroy, allergy, alcohol, smoking, diagnosis, carePlan, exDisDate)
VALUES (100003, '김태연', 970131, 2222222, 25, 'F', '서울시 성동구 성수동', '의료급여', '6인실',
 'Y', '의사B', '간호B', 'Y', '2022-09-06 10:55:43', '2022-09-07 08:30:43', '하복부통증 및 설사', '장염', null, null, 'Y', 'N', '장염',
 '이틀 전 상한 빵 섭취 후 설사증상 및 하복부통증 지속 중인 환자로 치료 후 호전 시 퇴원 예정', '22-09-07');

insert into PATIENT_1 (patientidx, name, registNum1, registNum2, age, gender, address, insurance, room, meal, doctorT, nurseT, discharge, adDate, disDate, 
cc, pi, histroy, allergy, alcohol, smoking, diagnosis, carePlan, exDisDate)
VALUES (100004, '정기석', 840309, 1111111, 38, 'M', '서울시 광진구 자양동', '건강보험', '1인실', 'Y', '의사B', '간호B', 'Y',
 '2022-09-08 10:55:43', '2022-09-09 08:30:43', '상복부 통증', '위염', '만성위염', '갑각류', 'Y', 'N', '위염',
 '만성위염 있는 환자로 상복부통증 호소. 증상치료 후 호전 시 퇴원 예정', '22-09-09'); 

insert into PATIENT_1 (patientidx, name, registNum1, registNum2, age, gender, address, insurance, room, meal, doctorT, nurseT, discharge, adDate, disDate, 
cc, pi, histroy, allergy, alcohol, smoking, diagnosis, carePlan, exDisDate)
VALUES (100005, '김지수', 980816, 2222222, 24, 'F', '서울시 강남구 청담동', '건강보험', '2인실',
 'N', '의사C', '간호C', 'Y', '2022-09-10 10:55:43', '2022-09-11 08:30:43', '하복부통증', '장염', null, '조영제', 'Y', 'N', '장염',
 '이틀 전 저녁 회 섭취 이후 설사 및 하복부통증 발생한 환자로 설사증상은 사라졌으나 현재 간헐적 하복부통증 호소함. 치료 후 호전 시 퇴원 예정',
 '22-09-11');

insert into PATIENT_1 (patientidx, name, registNum1, registNum2, age, gender, address, insurance, room, meal, doctorT, nurseT, discharge, adDate, disDate, 
cc, pi, histroy, allergy, alcohol, smoking, diagnosis, carePlan, exDisDate)
VALUES (100006, '김제니', 970131, 2222222, 25, 'F', '서울시 성동구 성수동', '의료급여', '6인실', 'Y',
 '의사C', '간호C', 'Y', '2022-10-01 10:55:43', '2022-10-26 08:30:43', '하복부통증 및 설사',
 '장염', null, '갑각류', 'Y', 'N', '장염',
 '이틀 전 상한 빵 섭취 후 설사증상 및 하복부통증 지속 중인 환자로 치료 후 호전 시 퇴원 예정',
 '22-10-26');

commit;


