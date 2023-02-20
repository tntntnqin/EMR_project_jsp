CREATE TABLE "TJOEUNIT"."EMPLOYEE_20" 
   (	"EMPLOYEEIDX" NUMBER(11,0) DEFAULT NULL NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"GENDER" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"AGE" NUMBER(11,0) NOT NULL ENABLE, 
	"DPART" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"NURSET" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"DOCTORT" VARCHAR2(20 BYTE) DEFAULT NULL, 
	"DNUMBER" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ENUMBER" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 PRIMARY KEY ("EMPLOYEEIDX")
   );

delete from employee_20;
 
SELECT * FROM employee_20;
DROP TABLE employee_20;	

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber) 
values (2101, 'hospital1', '정호석', 'M', 25, '간호사', null, '간호A', '201', '01031621001');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber) 
values (2102, 'hospital2', '민윤기', 'M', 26, '간호사', null, '간호A', '201', '01031621002');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (2203, 'hospital3', '김남준', 'M', 27, '간호사', null, '간호B', '202', '01031621003');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (2204, 'hospital4', '방시혁', 'F', 28, '간호사', null, '간호B', '202', '01031621004');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (2305, 'hospital5', '박진영', 'F', 29, '간호사', null, '간호C', '203', '01031621005');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (2306, 'hospital6', '안보현', 'F', 30, '간호사', null, '간호C', '203', '01031621006');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (1101, 'hospital1', '권지용', 'M', 31, '의사', '의사A', null, '101', '01031621007');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (1102, 'hospital2', '김석진', 'F', 32, '의사', '의사A', null, '101', '01031621008');


insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (1103, 'hospital3', '김태형', 'F', 33, '의사', '의사A', null, '101', '01031621009');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (1204, 'hospital4', '조규현', 'M', 34, '의사', '의사B', null, '102', '01031621010');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (1205, 'hospital5', '송민호', 'M', 35, '의사', '의사B', null, '102', '01031621017');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (1306, 'hospital6', '김고은', 'M', 35, '의사', '의사C', null, '103', '01031621011');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (1307, 'hospital7', '이종석', 'M', 36, '의사', '의사C', null, '103', '01031621012');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (3001, 'hospital1', '표지훈', 'M', 37, '병리사', null, null, '300', '01031621013');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (3002, 'hospital2', '이찬혁', 'F', 38, '병리사', null, null, '300', '01031621014');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (4001, 'hospital1', '전정국', 'F', 39, '원무과', null, null, '400', '01031621015');

insert into EMPLOYEE_20 (employeeidx, password, name, gender, age, dpart, doctort, nurset, dnumber, enumber)
values (4002, 'hospital2', '조광일', 'F', 40, '원무과', null, null, '400', '01031621016');

commit;