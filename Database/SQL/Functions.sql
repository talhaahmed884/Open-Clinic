/*CREATE FUNCTION CLINIC.CALCULATE_AGE (
	@DOB DATE)
RETURNS INT
AS
BEGIN

	RETURN DATEDIFF(YEAR, @DOB, CONVERT(DATE, GETDATE()))

END
*/


/*CREATE FUNCTION CLINIC.STRING_SPLIT_ROWS(
	@DOC_ID VARCHAR(MAX))
RETURNS TABLE
AS

	RETURN 
		SELECT VALUE AS 'ID' FROM string_split(@DOC_ID, ',')
*/


/*CREATE FUNCTION CLINIC.STRING_SPLIT_ROWS(
	@ID VARCHAR(MAX), 
	@TOOL VARCHAR(1))
RETURNS @TEMP TABLE(
	ID VARCHAR(MAX))
AS
BEGIN

	WHILE CHARINDEX(@TOOL, @ID) >0
	BEGIN
		
		DECLARE @STR VARCHAR(MAX)
		SELECT @STR = TRIM(SUBSTRING(@ID, 0, CHARINDEX(@TOOL, @ID)))
		INSERT INTO @TEMP VALUES(@STR)
		SELECT @ID = RIGHT(@ID, LEN(@ID)-CHARINDEX(@TOOL, @ID))

	END
	INSERT INTO @TEMP VALUES(TRIM(@ID))
	
	RETURN

END
*/


/*DROP FUNCTIONS*/
DROP FUNCTION CLINIC.CALCULATE_AGE
DROP FUNCTION CLINIC.STRING_SPLIT_ROWS