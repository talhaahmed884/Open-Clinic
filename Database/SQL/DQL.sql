/*REPORTS*/

/*1*/
SELECT 
	OCV.DOC_ID AS 'Doctor ID', OCP.FIRST_NAME AS 'First Name', OCP.LAST_NAME AS 'Last Name',
	COUNT(PAT_ID) AS 'Total patients examined' 
FROM CLINIC.OC_VISITS OCV INNER JOIN
	CLINIC.OC_DOCTOR OCD 
ON	OCV.DOC_ID = OCD.DOC_ID INNER JOIN
	CLINIC.OC_PERSON OCP
ON OCP.CNIC = OCD.CNIC
GROUP BY OCV.DOC_ID, OCP.FIRST_NAME, OCP.LAST_NAME


/*2*/
SELECT OCV.PAT_ID AS 'Patient ID', OCPE.FIRST_NAME AS 'First Name' , OCPE.LAST_NAME AS 'Last Name',
	SUM(OCV.FEE) AS 'Total Fee paid' 
FROM CLINIC.OC_VISITS OCV INNER JOIN
	CLINIC.OC_PATIENT OCP
ON OCV.PAT_ID = OCP.PAT_ID INNER JOIN
	CLINIC.OC_PERSON OCPE
ON OCP.CNIC = OCPE.CNIC
GROUP BY OCV.PAT_ID, OCPE.FIRST_NAME, OCPE.LAST_NAME

SELECT OCRD.PAT_ID AS 'Patient ID', OCPE.FIRST_NAME AS 'First Name', OCPE.LAST_NAME AS 'Last Name',
	SUM(OCRD.TOTAL_COST) AS 'Total Fee paid'
FROM CLINIC.OC_RECEIPT_DETAILS OCRD INNER JOIN
	CLINIC.OC_PATIENT OCP
ON OCRD.PAT_ID = OCP.PAT_ID INNER JOIN
	CLINIC.OC_PERSON OCPE
ON OCPE.CNIC = OCP.CNIC
GROUP BY OCRD.PAT_ID, OCPE.FIRST_NAME, OCPE.LAST_NAME


/*3*/
IF OBJECT_ID('TEMPDB..#TEMP') IS NOT NULL

	DROP TABLE #TEMP
	SELECT ROW_NUMBER() OVER(PARTITION BY RECEIPT_NO ORDER BY RECEIPT_NO) AS ROWNUM,
		PAT_ID,
		RECEIPT_NO
	INTO #TEMP
	FROM CLINIC.OC_RECEIPT_DETAILS

SELECT T.PAT_ID AS 'Patient ID', 
	OCPE.FIRST_NAME AS 'First Name', 
	OCPE.LAST_NAME AS 'Last Name',
	SUM(OCR.TOTAL_COST) AS 'Total Cost paid'
FROM #TEMP T INNER JOIN
	CLINIC.OC_RECEIPT OCR
ON T.RECEIPT_NO = OCR.RECEIPT_NO INNER JOIN
	CLINIC.OC_PATIENT OCP
ON T.PAT_ID = OCP.PAT_ID INNER JOIN
	CLINIC.OC_PERSON OCPE
ON OCP.CNIC = OCPE.CNIC
WHERE T.ROWNUM = 1
GROUP BY T.PAT_ID, OCPE.FIRST_NAME, OCPE.LAST_NAME


/*4*/
IF OBJECT_ID('TEMPDB..#TEMP') IS NOT NULL

	DROP TABLE #TEMP
	SELECT ROW_NUMBER() OVER(PARTITION BY RECEIPT_NO ORDER BY RECEIPT_NO) AS ROWNUM,
		PAT_ID,
		RECEIPT_NO
	INTO #TEMP
	FROM CLINIC.OC_RECEIPT_DETAILS

SELECT TOP 3 T.PAT_ID AS 'Patient ID', 
	OCPE.FIRST_NAME AS 'First Name', 
	OCPE.LAST_NAME AS 'Last Name',
	SUM(OCR.TOTAL_COST) AS "Total Cost paid"
FROM #TEMP T INNER JOIN
	CLINIC.OC_RECEIPT OCR
ON T.RECEIPT_NO = OCR.RECEIPT_NO INNER JOIN
	CLINIC.OC_PATIENT OCP
ON T.PAT_ID = OCP.PAT_ID INNER JOIN
	CLINIC.OC_PERSON OCPE
ON OCP.CNIC = OCPE.CNIC
WHERE T.ROWNUM = 1
GROUP BY T.PAT_ID, OCPE.FIRST_NAME, OCPE.LAST_NAME
ORDER BY "Total Cost paid" DESC


/*5*/
SELECT T.VISIT_NO AS 'Visit No',
	T.PAT_ID AS 'Patient ID',
	T.DOC_ID AS 'Doctor ID',
	T.FEE AS 'Fee',
	LEAD(T.FEE,1) OVER (PARTITION BY T.PAT_ID ORDER BY (T.PAT_ID)) AS 'Next Visit Fee'
FROM CLINIC.OC_VISITS T


/*6A*/
SELECT FIRST_NAME AS 'First Name', 
	LAST_NAME AS 'Last Name', 
	ADDRESS as 'Address', 
	AGE AS 'Age', 
	GENDER AS 'Gender', 
	DOB AS 'Date of Birth', 
	NATIONALITY AS 'Nationality',
	EMAIL AS 'Email',
	COUNT(*) AS 'Total Duplicate Records'
FROM CLINIC.OC_PERSON
GROUP BY FIRST_NAME,
	LAST_NAME,
	ADDRESS,
	AGE,
	GENDER,
	DOB,
	NATIONALITY,
	EMAIL

SELECT FIRST_NAME AS 'First Name', 
	LAST_NAME AS 'Last Name', 
	ADDRESS as 'Address', 
	AGE AS 'Age', 
	GENDER AS 'Gender', 
	DOB AS 'Date of Birth', 
	NATIONALITY AS 'Nationality',
	EMAIL AS 'Email',
	COUNT(*) AS "Total Duplicate Records"
FROM CLINIC.OC_PERSON
GROUP BY FIRST_NAME,
	LAST_NAME,
	ADDRESS,
	AGE,
	GENDER,
	DOB,
	NATIONALITY,
	EMAIL
HAVING COUNT(*) >= 2


/*6B*/
SELECT CNIC, 
	QUALIFICATION AS 'Qualification', 
	SPECIALIZATION AS 'Specialization', 
	FEE AS 'Fee',
	COUNT(*) AS 'Total Duplicate Records'
FROM CLINIC.OC_DOCTOR
GROUP BY CNIC,
	QUALIFICATION,
	SPECIALIZATION,
	FEE

SELECT CNIC, 
	QUALIFICATION AS 'Qualification', 
	SPECIALIZATION AS 'Specialization', 
	FEE AS 'Fee',
	COUNT(*) AS 'Total Duplicate Records'
FROM CLINIC.OC_DOCTOR
GROUP BY CNIC,
	QUALIFICATION,
	SPECIALIZATION,
	FEE
HAVING COUNT(*) >= 2


/*6C*/
SELECT MED_NAME AS 'Medicine Name',
	MED_POTENCY AS 'Medicine Potency',
	"DESC" AS 'Description',
	MGF_DATE AS 'Manufacturing Date',
	EXP_DATE AS 'Expiry Date',
	COUNT(*) AS 'Total Duplicate Records'
FROM CLINIC.OC_MEDICINE
GROUP BY MED_NAME,
	MED_POTENCY,
	"DESC",
	MGF_DATE,
	EXP_DATE

SELECT MED_NAME AS 'Medicine Name',
	MED_POTENCY AS 'Medicine Potency',
	"DESC" AS 'Description',
	MGF_DATE AS 'Manufacturing Date',
	EXP_DATE AS 'Expiry Date',
	COUNT(*) AS 'Total Duplicate Records'
FROM CLINIC.OC_MEDICINE
GROUP BY MED_NAME,
	MED_POTENCY,
	"DESC",
	MGF_DATE,
	EXP_DATE
HAVING COUNT(*) >= 2


/*6D*/
SELECT CNIC,
	COUNT(*) AS 'Total Duplicate Records'
FROM CLINIC.OC_PATIENT
GROUP BY CNIC

SELECT CNIC,
	COUNT(*) AS 'Total Duplicate Records'
FROM CLINIC.OC_PATIENT
GROUP BY CNIC
HAVING COUNT(*) >= 2


/*7*/
SELECT * FROM
(SELECT VISIT_NO, 
		DATENAME(MONTH,
		VISIT_DATE) AS TMONTH,
		PAT_ID
FROM CLINIC.OC_VISITS) T
PIVOT
(COUNT(VISIT_NO) FOR TMONTH IN (January, February, March, April, May, June, July, August, September, October, November, December)) AS PIVOT_TABLE

SELECT * FROM
(SELECT VISIT_NO, 
		DATENAME(MONTH,
		VISIT_DATE) AS TMONTH
FROM CLINIC.OC_VISITS) T
PIVOT
(COUNT(VISIT_NO) FOR TMONTH IN (January, February, March, April, May, June, July, August, September, October, November, December)) AS PIVOT_TABLE


/*8*/
SELECT * FROM
(SELECT DOC_ID, 
		DATENAME(MONTH,
		ENROLLMENT_DATE) AS TMONTH,
		DOC_ID AS 'Doctor ID',
		CNIC
FROM CLINIC.OC_DOCTOR) T
PIVOT
(COUNT(DOC_ID) FOR TMONTH IN (January, February, March, April, May, June, July, August, September, October, November, December)) AS PIVOT_TABLE

SELECT * FROM
(SELECT DOC_ID, 
		DATENAME(MONTH,
		ENROLLMENT_DATE) AS TMONTH
FROM CLINIC.OC_DOCTOR) T
PIVOT
(COUNT(DOC_ID) FOR TMONTH IN (January, February, March, April, May, June, July, August, September, October, November, December)) AS PIVOT_TABLE