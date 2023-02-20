  CREATE TABLE "TJOEUNIT"."MEDICINE_22" 
   (	"CODE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"MEDICINE" VARCHAR2(1000 BYTE) NOT NULL ENABLE, 
	"DOSAGE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ROUTE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"INJECTTIME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "MEDICINE_PK" PRIMARY KEY ("CODE")
   );
   
delete from MEDICINE_22;

SELECT * FROM MEDICINE_22;
DROP TABLE MEDICINE_22;

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D1', 'NS 0.9% [수액제]', '3000ml', 'IV', '24h');

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D2', 'NaCl 0.45% [수액제]', '3000ml', 'IV', '24h');

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D3', 'Asec Tab [진통소염제]', '100mg',	'PO', 'tid');

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D4', 'Soften Tab [근육이완제]', '1000mg', 'PO', 'tid');

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D5', 'Taron Tab [진경제]', '100mg', 'PO', 'tid');

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D6', 'Iziton Tab [진경제]', '50mg', 'PO', 'tid',);

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D7', 'Aldrin Tab [제산제]', '500mg', 'PO', 'tid');

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D8', 'Stavic Suspension [지사제]',	'20ml',	'PO', 'tid');

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D9', 'Bacillis Cap [정장제]', '2250mg', 'PO', 'tid');

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D10', 'Lopmin Cap [지사제]', '2mg', 'PO', 'tid');

insert into MEDICINE_22 (code, medicine, dosage, route, injectTime) 
values ('D11', 'Anisphen Tab [해열제]',	'650mg', 'PO', 'qid');
