CREATE PROCEDURE INSERT_ROW_OC_PERSON @CNIC NUMERIC, @FIRST_NAME VARCHAR(30), @LAST_NAME VARCHAR(30), @ADDRESS VARCHAR(100), @AGE NUMERIC(2), @GENDER VARCHAR(1), @DOB DATE, @NATIONALITY VARCHAR(30), @EMAIL VARCHAR(30)
AS
    IF EXISTS(SELECT * FROM OC_PERSON WHERE CNIC = @CNIC)

        UPDATE OC_PERSON SET FIRST_NAME = @FIRST_NAME, LAST_NAME = @LAST_NAME, ADDRESS = @ADDRESS, AGE = @AGE, GENDER = @GENDER, DOB = @DOB, NATIONALITY = @NATIONALITY, EMAIL = @EMAIL WHERE CNIC = @CNIC
	
	ELSE
		
		INSERT INTO OC_PERSON (CNIC, FIRST_NAME, LAST_NAME, ADDRESS, AGE, GENDER, DOB, NATIONALITY, EMAIL) VALUES (@CNIC, @FIRST_NAME, @LAST_NAME, @ADDRESS, @AGE, @GENDER, @DOB, @NATIONALITY, @EMAIL)

	DECLARE @COUNT NUMERIC

	SELECT @COUNT = COUNT(*) FROM OC_PERSON_HISTORY WHERE CNIC = @CNIC
	INSERT INTO OC_PERSON_HISTORY (SR_NO, CNIC, FIRST_NAME, LAST_NAME, ADDRESS, AGE, GENDER, DOB, NATIONALITY, EMAIL) VALUES (@COUNT + 1, @CNIC, @FIRST_NAME, @LAST_NAME, @ADDRESS, @AGE, @GENDER, @DOB, @NATIONALITY, @EMAIL)

RETURN




/*DROP PROCEDURES*/
DROP PROCEDURE INSERT_ROW_OC_PERSON