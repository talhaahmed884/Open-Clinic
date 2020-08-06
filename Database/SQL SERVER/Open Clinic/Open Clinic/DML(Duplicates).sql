/*OC_PERSON DATA ENTERIES*/

EXEC CLINIC.INSERT_ROW_OC_PERSON '3526210098805', 'Landon', 'Maxwell', '1359 Sizavu Place', 28, F, '8/5/1998', PAKISTANI, 'kacal@safifa.ca
'
EXEC CLINIC.INSERT_ROW_OC_PERSON '3526210098806', 'Emilie', 'Horton', '1352 Guka Heights', 50, F, '1/25/1991', PAKISTANI, 'kacvev@ebeh.ki
'
EXEC CLINIC.INSERT_ROW_OC_PERSON '3526210098807', 'Trevor', 'Cannon', '1989 Nuowa Center', 44, M, '2/28/1957', PAKISTANI, 'vosbuhej@aweim.cr
'
EXEC CLINIC.INSERT_ROW_OC_PERSON '3526210098808', 'Isabelle', 'Aguilar', '1685 Hokbe Extension', 26, M, '7/31/1973', PAKISTANI, 'ewokifo@vasoz.ve
'
EXEC CLINIC.INSERT_ROW_OC_PERSON '3526210098809', 'Sean', 'Foster', '1149 Gader Lane', 48, F, '3/1/1983', PAKISTANI, 'jik@tu.gh
'
EXEC CLINIC.INSERT_ROW_OC_PERSON '3526210098810', 'Thomas', 'Craig', '521 Jeso Highway', 43, F, '8/8/1963', PAKISTANI, 'ubihag@fok.tw
'


/*CLINIC.OC_DOCTOR DATA ENTERIES*/

INSERT INTO CLINIC.OC_DOCTOR (CNIC, QUALIFICATION, SPECIALIZATION, FEE) VALUES (1644425695241, 'BHMS, MD - Homeopathy', 'Homeopath', 1000
)
INSERT INTO CLINIC.OC_DOCTOR (CNIC, QUALIFICATION, SPECIALIZATION, FEE) VALUES (1644425695242, 'BAMS, MD - Ayurveda Medicine', 'Ayurveda', 3500
)
INSERT INTO CLINIC.OC_DOCTOR (CNIC, QUALIFICATION, SPECIALIZATION, FEE) VALUES (1644425695243, 'MBBS, MS - Otorhinolaryngology', 'ENT Specialist', 3000
)
INSERT INTO CLINIC.OC_DOCTOR (CNIC, QUALIFICATION, SPECIALIZATION, FEE) VALUES (1644425695244, 'BSc - Zoology, BAMS', 'Ayurveda', 2500
)
INSERT INTO CLINIC.OC_DOCTOR (CNIC, QUALIFICATION, SPECIALIZATION, FEE) VALUES (1644425695245, 'BAMS', 'Ayurveda', 2500
)
INSERT INTO CLINIC.OC_DOCTOR (CNIC, QUALIFICATION, SPECIALIZATION, FEE) VALUES (1644425695246, 'BAMS', 'Ayurveda', 1000
)


/*CLINIC.OC_MEDICINE DATA ENTERIES*/

INSERT INTO CLINIC.OC_MEDICINE (MED_NAME, MED_POTENCY, "DESC", MGF_DATE, EXP_DATE, QUANTITY, PRICE) VALUES ('ABSTRAL', '2 MG', 'FENTANYL CITRATE', '1/1/2020', '1/1/2025', 20, 100
)
INSERT INTO CLINIC.OC_MEDICINE (MED_NAME, MED_POTENCY, "DESC", MGF_DATE, EXP_DATE, QUANTITY, PRICE) VALUES ('ACETAMINOPHEN-CODEINE', '3 MG', 'ACETAMINOPHEN WITH CODEINE', '1/2/2020', '1/2/2025', 20, 101
)
INSERT INTO CLINIC.OC_MEDICINE (MED_NAME, MED_POTENCY, "DESC", MGF_DATE, EXP_DATE, QUANTITY, PRICE) VALUES ('ACTIQ', '4 MG', 'FENTANYL CITRATE', '1/3/2020', '1/3/2025', 20, 102
)
INSERT INTO CLINIC.OC_MEDICINE (MED_NAME, MED_POTENCY, "DESC", MGF_DATE, EXP_DATE, QUANTITY, PRICE) VALUES ('ASCOMP WITH CODEINE', '5 MG', 'CODEINE/BUTALBITAL/ASA/CAFFEIN', '1/4/2020', '1/4/2025', 20, 103
)
INSERT INTO CLINIC.OC_MEDICINE (MED_NAME, MED_POTENCY, "DESC", MGF_DATE, EXP_DATE, QUANTITY, PRICE) VALUES ('ASPIRIN-CAFFEINE-DIHYDROCODEIN', '6 MG', 'DIHYDROCODEINE/ASPIRIN/CAFFEIN', '1/5/2020', '1/5/2025', 20, 104
)
INSERT INTO CLINIC.OC_MEDICINE (MED_NAME, MED_POTENCY, "DESC", MGF_DATE, EXP_DATE, QUANTITY, PRICE) VALUES ('AVINZA', '7 MG', 'MORPHINE SULFATE', '1/6/2020', '1/6/2025', 20, 105
)


/*CLINIC.OC_PATIENT DATA ENTERIES*/

INSERT INTO CLINIC.OC_PATIENT (CNIC) VALUES (1644425695232
)
INSERT INTO CLINIC.OC_PATIENT (CNIC) VALUES (1644425695233
)
INSERT INTO CLINIC.OC_PATIENT (CNIC) VALUES (1644425695234
)
INSERT INTO CLINIC.OC_PATIENT (CNIC) VALUES (1644425695235
)
INSERT INTO CLINIC.OC_PATIENT (CNIC) VALUES (1644425695236
)
INSERT INTO CLINIC.OC_PATIENT (CNIC) VALUES (1644425695237
)
INSERT INTO CLINIC.OC_PATIENT (CNIC) VALUES (1644425695218
)
INSERT INTO CLINIC.OC_PATIENT (CNIC) VALUES (1644425695219
)
INSERT INTO CLINIC.OC_PATIENT (CNIC) VALUES (1644425695220
)