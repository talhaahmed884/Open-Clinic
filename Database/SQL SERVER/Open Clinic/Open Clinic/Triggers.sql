/*CREATE TRIGGER CLINIC.RECORD_OC_PERSON 
    ON CLINIC.OC_PERSON AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @OPERATION_TYPE NUMERIC (1)

    IF EXISTS (SELECT TOP 1 1 FROM INSERTED)
    BEGIN

        IF EXISTS (SELECT TOP 1 1 FROM DELETED)
        BEGIN

            SET @OPERATION_TYPE = 3
            INSERT INTO AUDIT.OC_PERSON 
                (CNIC, 
                FIRST_NAME,
                LAST_NAME, 
                ADDRESS, 
                AGE, 
                GENDER, 
                DOB, 
                NATIONALITY, 
                EMAIL, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                CNIC, 
                FIRST_NAME, 
                LAST_NAME, 
                ADDRESS, 
                AGE, 
                GENDER, 
                DOB, 
                NATIONALITY, 
                EMAIL, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM DELETED

            SET @OPERATION_TYPE = 2
            INSERT INTO AUDIT.OC_PERSON 
                (CNIC, 
                FIRST_NAME, 
                LAST_NAME, 
                ADDRESS, 
                AGE, 
                GENDER,
                DOB, 
                NATIONALITY, 
                EMAIL, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                CNIC, 
                FIRST_NAME, 
                LAST_NAME, 
                ADDRESS, 
                AGE,
                GENDER,
                DOB,
                NATIONALITY,
                EMAIL,
                GETDATE(),
                @OPERATION_TYPE 
            FROM INSERTED

        END
        ELSE
        BEGIN

            SET @OPERATION_TYPE = 1
            INSERT INTO AUDIT.OC_PERSON 
                (CNIC, 
                FIRST_NAME, 
                LAST_NAME, 
                ADDRESS, 
                AGE, 
                GENDER, 
                DOB, 
                NATIONALITY, 
                EMAIL, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                CNIC, 
                FIRST_NAME, 
                LAST_NAME, 
                ADDRESS, 
                AGE, 
                GENDER, 
                DOB, 
                NATIONALITY, 
                EMAIL, 
                GETDATE(), 
                @OPERATION_TYPE
            FROM INSERTED

        END

    END
    ELSE
    BEGIN

        SET @OPERATION_TYPE = 3
        INSERT INTO AUDIT.OC_PERSON 
            (CNIC, 
            FIRST_NAME, 
            LAST_NAME, 
            ADDRESS, 
            AGE, 
            GENDER, 
            DOB, 
            NATIONALITY, 
            EMAIL, 
            EDIT_DATETIME, 
            OPERATION_TYPE)
        SELECT 
            CNIC, 
            FIRST_NAME, 
            LAST_NAME, 
            ADDRESS, 
            AGE, 
            GENDER, 
            DOB, 
            NATIONALITY, 
            EMAIL, 
            GETDATE(), 
            @OPERATION_TYPE 
        FROM DELETED

    END

END*/


/*CREATE TRIGGER CLINIC.RECORD_OC_PERSON_CONTACT 
    ON CLINIC.OC_PERSON_CONTACT AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    
    SET NOCOUNT ON

    DECLARE @OPERATION_TYPE NUMERIC (1)

    IF EXISTS (SELECT TOP 1 1 FROM INSERTED)
    BEGIN

        IF EXISTS (SELECT TOP 1 1 FROM DELETED)
        BEGIN

            SET @OPERATION_TYPE = 3
            INSERT INTO AUDIT.OC_PERSON_CONTACT
                (CNIC, 
                SR_NO, 
                CONTACT, 
                EDIT_DATETIME, 
                OPERATION_TYPE) 
            SELECT 
                CNIC, 
                SR_NO, 
                CONTACT, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM DELETED

            SET @OPERATION_TYPE = 2
            INSERT INTO AUDIT.OC_PERSON_CONTACT 
                (CNIC, 
                SR_NO, 
                CONTACT, 
                EDIT_DATETIME, 
                OPERATION_TYPE) 
            SELECT 
                CNIC, 
                SR_NO, 
                CONTACT, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END
        ELSE
		BEGIN

            SET @OPERATION_TYPE = 1
            INSERT INTO AUDIT.OC_PERSON_CONTACT 
                (CNIC, 
                SR_NO, 
                CONTACT, 
                EDIT_DATETIME, 
                OPERATION_TYPE) 
            SELECT 
                CNIC, 
                SR_NO, 
                CONTACT, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END

    END
    ELSE
    BEGIN

        SET @OPERATION_TYPE = 3
        INSERT INTO AUDIT.OC_PERSON_CONTACT 
            (CNIC, 
            SR_NO, 
            CONTACT, 
            EDIT_DATETIME, 
            OPERATION_TYPE) 
        SELECT 
            CNIC, 
            SR_NO, 
            CONTACT, 
            GETDATE(), 
            @OPERATION_TYPE 
        FROM DELETED

    END

END*/


/*CREATE TRIGGER CLINIC.RECORD_OC_PATIENT 
    ON CLINIC.OC_PATIENT AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @OPERATION_TYPE NUMERIC (1)

    IF EXISTS (SELECT TOP 1 1 FROM INSERTED)
    BEGIN

        IF EXISTS (SELECT TOP 1 1 FROM DELETED)
        BEGIN

            SET @OPERATION_TYPE = 3
            INSERT INTO AUDIT.OC_PATIENT
                (CNIC, 
                PAT_ID, 
                EDIT_DATETIME, 
                OPERATION_TYPE) 
            SELECT 
                CNIC, 
                PAT_ID, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM DELETED

            SET @OPERATION_TYPE = 2
            INSERT INTO AUDIT.OC_PATIENT 
                (CNIC, 
                PAT_ID, 
                EDIT_DATETIME, 
                OPERATION_TYPE) 
            SELECT 
                CNIC, 
                PAT_ID, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END
        ELSE
        BEGIN

            SET @OPERATION_TYPE = 1
            INSERT INTO AUDIT.OC_PATIENT 
                (CNIC, 
                PAT_ID, 
                EDIT_DATETIME, 
                OPERATION_TYPE) 
            SELECT 
                CNIC, 
                PAT_ID, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END

    END
    ELSE
    BEGIN

        SET @OPERATION_TYPE = 3
        INSERT INTO AUDIT.OC_PATIENT 
            (CNIC, 
            PAT_ID, 
            EDIT_DATETIME, 
            OPERATION_TYPE) 
        SELECT 
            CNIC, 
            PAT_ID, 
            GETDATE(), 
            @OPERATION_TYPE 
        FROM DELETED

    END

END*/


/*CREATE TRIGGER CLINIC.RECORD_OC_VISITS 
    ON CLINIC.OC_VISITS AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @OPERATION_TYPE NUMERIC (1)

    IF EXISTS(SELECT TOP 1 1 FROM INSERTED)
    BEGIN

        IF EXISTS(SELECT TOP 1 1 FROM DELETED)
        BEGIN

            SET @OPERATION_TYPE = 3
            INSERT INTO AUDIT.OC_VISITS 
                (VISIT_NO, 
                PAT_ID, 
                DOC_ID, 
                PROBLEMS, 
                DIAGNOSIS, 
                VISIT_DATE, 
                VISIT_TIME, 
                FEE, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                VISIT_NO, 
                PAT_ID, 
                DOC_ID, 
                PROBLEMS, 
                DIAGNOSIS, 
                VISIT_DATE, 
                VISIT_TIME, 
                FEE, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM DELETED

            SET @OPERATION_TYPE = 2
            INSERT INTO AUDIT.OC_VISITS 
                (VISIT_NO, 
                PAT_ID, 
                DOC_ID, 
                PROBLEMS, 
                DIAGNOSIS, 
                VISIT_DATE, 
                VISIT_TIME, 
                FEE, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                VISIT_NO, 
                PAT_ID, 
                DOC_ID, 
                PROBLEMS, 
                DIAGNOSIS, 
                VISIT_DATE, 
                VISIT_TIME, 
                FEE, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED


        END
        ELSE
        BEGIN

            SET @OPERATION_TYPE = 1
            INSERT INTO AUDIT.OC_VISITS 
                (VISIT_NO, 
                PAT_ID, 
                DOC_ID, 
                PROBLEMS, 
                DIAGNOSIS, 
                VISIT_DATE, 
                VISIT_TIME, 
                FEE, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                VISIT_NO, 
                PAT_ID, 
                DOC_ID, 
                PROBLEMS, 
                DIAGNOSIS, 
                VISIT_DATE, 
                VISIT_TIME, 
                FEE, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END

    END
    ELSE
    BEGIN

        SET @OPERATION_TYPE = 3
        INSERT INTO AUDIT.OC_VISITS 
            (VISIT_NO, 
            PAT_ID, 
            DOC_ID, 
            PROBLEMS, 
            DIAGNOSIS, 
            VISIT_DATE, 
            VISIT_TIME, 
            FEE, 
            EDIT_DATETIME, 
            OPERATION_TYPE)
        SELECT 
            VISIT_NO, 
            PAT_ID, 
            DOC_ID, 
            PROBLEMS, 
            DIAGNOSIS, 
            VISIT_DATE, 
            VISIT_TIME, 
            FEE, 
            GETDATE(), 
            @OPERATION_TYPE 
        FROM DELETED

    END

END*/


/*CREATE TRIGGER CLINIC.RECORD_OC_DOCTOR 
    ON CLINIC.OC_DOCTOR AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @OPERATION_TYPE NUMERIC (1)

    IF EXISTS(SELECT TOP 1 1 FROM INSERTED)
    BEGIN

        IF EXISTS(SELECT TOP 1 1 FROM DELETED)
        BEGIN

            SET @OPERATION_TYPE = 3
            INSERT INTO AUDIT.OC_DOCTOR 
                (DOC_ID, 
                CNIC, 
                QUALIFICATION, 
                SPECIALIZATION, 
                FEE, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                DOC_ID, 
                CNIC, 
                QUALIFICATION, 
                SPECIALIZATION, 
                FEE, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM DELETED

            SET @OPERATION_TYPE = 2
            INSERT INTO AUDIT.OC_DOCTOR 
                (DOC_ID, 
                CNIC, 
                QUALIFICATION, 
                SPECIALIZATION, 
                FEE, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                DOC_ID, 
                CNIC, 
                QUALIFICATION, 
                SPECIALIZATION, 
                FEE, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END
        ELSE
        BEGIN

            SET @OPERATION_TYPE = 1
            INSERT INTO AUDIT.OC_DOCTOR 
                (DOC_ID, 
                CNIC, 
                QUALIFICATION, 
                SPECIALIZATION, 
                FEE, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                DOC_ID, 
                CNIC, 
                QUALIFICATION, 
                SPECIALIZATION, 
                FEE, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END

    END
    ELSE
    BEGIN
    
        SET @OPERATION_TYPE = 3
        INSERT INTO AUDIT.OC_DOCTOR 
            (DOC_ID, 
            CNIC, 
            QUALIFICATION, 
            SPECIALIZATION, 
            FEE, 
            EDIT_DATETIME, 
            OPERATION_TYPE)
        SELECT 
            DOC_ID, 
            CNIC, 
            QUALIFICATION, 
            SPECIALIZATION, 
            FEE, 
            GETDATE(), 
            @OPERATION_TYPE 
        FROM DELETED

    END

END*/


/*CREATE TRIGGER CLINIC.RECORD_OC_MEDICINE 
    ON CLINIC.OC_MEDICINE AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @OPERATION_TYPE NUMERIC (1)

    IF EXISTS (SELECT TOP 1 1 FROM INSERTED)
    BEGIN

        IF EXISTS (SELECT TOP 1 1 FROM DELETED)
        BEGIN

            SET @OPERATION_TYPE = 3
            INSERT INTO AUDIT.OC_MEDICINE 
                (MED_ID, 
                MED_NAME, 
                MED_POTENCY, 
                "DESC", 
                MGF_DATE, 
                EXP_DATE, 
                QUANTITY, 
                PRICE, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                MED_ID, 
                MED_NAME, 
                MED_POTENCY, 
                "DESC", 
                MGF_DATE, 
                EXP_DATE, 
                QUANTITY, 
                PRICE, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM DELETED

            SET @OPERATION_TYPE = 2
            INSERT INTO AUDIT.OC_MEDICINE 
                (MED_ID, 
                MED_NAME, 
                MED_POTENCY, 
                "DESC", 
                MGF_DATE, 
                EXP_DATE, 
                QUANTITY, 
                PRICE, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                MED_ID, 
                MED_NAME, 
                MED_POTENCY, 
                "DESC", 
                MGF_DATE, 
                EXP_DATE, 
                QUANTITY, 
                PRICE, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END
        ELSE
        BEGIN

            SET @OPERATION_TYPE = 1
            INSERT INTO AUDIT.OC_MEDICINE 
                (MED_ID, 
                MED_NAME, 
                MED_POTENCY, 
                "DESC", 
                MGF_DATE, 
                EXP_DATE, 
                QUANTITY, 
                PRICE, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                MED_ID, 
                MED_NAME, 
                MED_POTENCY, 
                "DESC", 
                MGF_DATE, 
                EXP_DATE, 
                QUANTITY, 
                PRICE, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END

    END
    ELSE
    BEGIN

        SET @OPERATION_TYPE = 3
        INSERT INTO AUDIT.OC_MEDICINE 
            (MED_ID, 
            MED_NAME, 
            MED_POTENCY, 
            "DESC", 
            MGF_DATE, 
            EXP_DATE, 
            QUANTITY, 
            PRICE, 
            EDIT_DATETIME, 
            OPERATION_TYPE)
        SELECT 
            MED_ID, 
            MED_NAME, 
            MED_POTENCY, 
            "DESC", 
            MGF_DATE, 
            EXP_DATE, 
            QUANTITY, 
            PRICE, 
            GETDATE(), 
            @OPERATION_TYPE 
        FROM DELETED

    END

END*/


/*CREATE TRIGGER CLINIC.RECORD_OC_PERSCRIPTION 
    ON CLINIC.OC_PERSCRIPTION AFTER INSERT, UPDATE, DELETE
AS 
BEGIN

    SET NOCOUNT ON

    DECLARE @OPERATION_TYPE NUMERIC (1)

    IF EXISTS (SELECT TOP 1 1 FROM INSERTED)
    BEGIN

        IF EXISTS (SELECT TOP 1 1 FROM DELETED)
        BEGIN

            SET @OPERATION_TYPE = 3
            INSERT INTO AUDIT.OC_PERSCRIPTION 
                (PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                DOC_ID, 
                QUANTITY, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                DOC_ID, 
                QUANTITY, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM DELETED

            SET @OPERATION_TYPE = 2
            INSERT INTO AUDIT.OC_PERSCRIPTION 
                (PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                DOC_ID, 
                QUANTITY, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                DOC_ID, 
                QUANTITY, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END
        ELSE
        BEGIN

            SET @OPERATION_TYPE = 1
            INSERT INTO AUDIT.OC_PERSCRIPTION 
                (PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                DOC_ID, 
                QUANTITY, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                DOC_ID, 
                QUANTITY, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END

    END
    ELSE
    BEGIN

        SET @OPERATION_TYPE = 3
        INSERT INTO AUDIT.OC_PERSCRIPTION 
            (PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            DOC_ID, 
            QUANTITY, 
            EDIT_DATETIME, 
            OPERATION_TYPE)
        SELECT 
            PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            DOC_ID, 
            QUANTITY, 
            GETDATE(), 
            @OPERATION_TYPE 
        FROM DELETED
    
    END

END*/


/*CREATE TRIGGER CLINIC.RECORD_OC_RECEIPT 
    ON CLINIC.OC_RECEIPT AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @OPERATION_TYPE NUMERIC (1)

    IF EXISTS (SELECT TOP 1 1 FROM INSERTED)
    BEGIN

        IF EXISTS (SELECT TOP 1 1 FROM DELETED)
        BEGIN

            SET @OPERATION_TYPE = 3
            INSERT INTO AUDIT.OC_RECEIPT 
                (RECEIPT_NO, 
                RECEIPT_DATE, 
                RECEIPT_TIME, 
                TOTAL_COST, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                RECEIPT_NO, 
                RECEIPT_DATE, 
                RECEIPT_TIME, 
                TOTAL_COST, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM DELETED

            SET @OPERATION_TYPE = 2
            INSERT INTO AUDIT.OC_RECEIPT 
                (RECEIPT_NO, 
                RECEIPT_DATE, 
                RECEIPT_TIME, 
                TOTAL_COST, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                RECEIPT_NO, 
                RECEIPT_DATE, 
                RECEIPT_TIME, 
                TOTAL_COST, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END
        ELSE
        BEGIN

            SET @OPERATION_TYPE = 1
            INSERT INTO AUDIT.OC_RECEIPT 
                (RECEIPT_NO, 
                RECEIPT_DATE, 
                RECEIPT_TIME, 
                TOTAL_COST, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                RECEIPT_NO, 
                RECEIPT_DATE, 
                RECEIPT_TIME, 
                TOTAL_COST, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END
    END
    ELSE
    BEGIN

        SET @OPERATION_TYPE = 3
        INSERT INTO AUDIT.OC_RECEIPT 
            (RECEIPT_NO, 
            RECEIPT_DATE, 
            RECEIPT_TIME, 
            TOTAL_COST, 
            EDIT_DATETIME, 
            OPERATION_TYPE)
        SELECT 
            RECEIPT_NO, 
            RECEIPT_DATE, 
            RECEIPT_TIME, 
            TOTAL_COST, 
            GETDATE(), 
            @OPERATION_TYPE 
        FROM DELETED

    END

END*/


/*CREATE TRIGGER CLINIC.RECORD_OC_RECEIPT_DETAILS 
    ON CLINIC.OC_RECEIPT_DETAILS AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @OPERATION_TYPE NUMERIC (1)

    IF EXISTS (SELECT TOP 1 1 FROM INSERTED)
    BEGIN

        IF EXISTS (SELECT TOP 1 1 FROM DELETED)
        BEGIN

            SET @OPERATION_TYPE = 3
            INSERT INTO AUDIT.OC_RECEIPT_DETAILS
                (RECEIPT_NO, 
                PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                QUANTITY, 
                TOTAL_COST, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                RECEIPT_NO, 
                PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                QUANTITY, 
                TOTAL_COST, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM DELETED

            SET @OPERATION_TYPE = 2
            INSERT INTO AUDIT.OC_RECEIPT_DETAILS 
                (RECEIPT_NO, 
                PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                QUANTITY, 
                TOTAL_COST, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                RECEIPT_NO, 
                PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                QUANTITY, 
                TOTAL_COST, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END
        ELSE
        BEGIN

            SET @OPERATION_TYPE = 1
            INSERT INTO AUDIT.OC_RECEIPT_DETAILS 
                (RECEIPT_NO, 
                PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                QUANTITY, 
                TOTAL_COST, 
                EDIT_DATETIME, 
                OPERATION_TYPE)
            SELECT 
                RECEIPT_NO, 
                PER_ID, 
                VISIT_NO, 
                PAT_ID, 
                MED_ID, 
                QUANTITY, 
                TOTAL_COST, 
                GETDATE(), 
                @OPERATION_TYPE 
            FROM INSERTED

        END

    END
    ELSE
    BEGIN

        SET @OPERATION_TYPE = 3
        INSERT INTO AUDIT.OC_RECEIPT_DETAILS 
            (RECEIPT_NO, 
            PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            QUANTITY, 
            TOTAL_COST, 
            EDIT_DATETIME, 
            OPERATION_TYPE)
        SELECT 
            RECEIPT_NO, 
            PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            QUANTITY, 
            TOTAL_COST, 
            GETDATE(), 
            @OPERATION_TYPE 
        FROM DELETED

    END

END*/


/*CREATE TRIGGER CLINIC.PRIMARY_KEY_ROW_OC_VISITS 
    ON CLINIC.OC_VISITS INSTEAD OF INSERT
AS
BEGIN

	SET NOCOUNT ON

    DECLARE @VISIT_NO NUMERIC, @PAT_ID NUMERIC, @DOC_ID NUMERIC, @COUNT NUMERIC

    SELECT 
        @PAT_ID = PAT_ID, 
        @DOC_ID = DOC_ID 
    FROM INSERTED

    SELECT 
        @COUNT = COUNT(*) 
    FROM CLINIC.OC_VISITS 
    NOLOCK
    WHERE PAT_ID = @PAT_ID AND DOC_ID = @DOC_ID

    SET @VISIT_NO = 010001
    SET @VISIT_NO = @VISIT_NO + @COUNT

    INSERT INTO CLINIC.OC_VISITS 
        (VISIT_NO, 
        PAT_ID, 
        DOC_ID, 
        PROBLEMS, 
        DIAGNOSIS, 
        VISIT_DATE, 
        VISIT_TIME, 
        FEE)
    SELECT 
        @VISIT_NO, 
        @PAT_ID, 
        @DOC_ID, 
        PROBLEMS, 
        DIAGNOSIS, 
        VISIT_DATE, 
        VISIT_TIME, 
        FEE 
    FROM INSERTED

END*/


/*CREATE TRIGGER CLINIC.PRIMARY_KEY_ROW_OC_PERSON_CONTACT 
    ON CLINIC.OC_PERSON_CONTACT INSTEAD OF INSERT
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @CNIC NUMERIC, @SR_NO NUMERIC, @COUNT NUMERIC
    SELECT 
        @CNIC = CNIC 
    FROM INSERTED

    SELECT 
        @COUNT = COUNT(*)
    FROM CLINIC.OC_PERSON_CONTACT 
    NOLOCK
    WHERE CNIC = @CNIC
    SET @SR_NO = 1
    SET @SR_NO = @SR_NO + @COUNT

    INSERT INTO CLINIC.OC_PERSON_CONTACT
        (CNIC, 
        SR_NO, 
        CONTACT) 
    SELECT 
        @CNIC, 
        @SR_NO, 
        CONTACT 
    FROM INSERTED

END*/


/*CREATE TRIGGER CLINIC.PRIMARY_KEY_ROW_OC_PERSCRIPTION 
    ON CLINIC.OC_PERSCRIPTION INSTEAD OF INSERT
AS
BEGIN

    SET NOCOUNT ON
    DECLARE @PER_ID NUMERIC

    SELECT 
        @PER_ID = OCP.PER_ID 
    FROM CLINIC.OC_PERSCRIPTION OCP, INSERTED I 
    WHERE OCP.VISIT_NO = I.VISIT_NO 
        AND OCP.PAT_ID = I.PAT_ID 
        AND OCP.DOC_ID = I.DOC_ID

    IF @PER_ID IS NOT NULL
    BEGIN

        INSERT INTO CLINIC.OC_PERSCRIPTION 
            (PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            DOC_ID, 
            QUANTITY)
        SELECT
            @PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            DOC_ID, 
            QUANTITY 
        FROM INSERTED

    END
    ELSE
    BEGIN

        DECLARE @COUNT NUMERIC
        SET @COUNT = 0
		SELECT 
            @COUNT = MAX(PER_ID) 
        FROM CLINIC.OC_PERSCRIPTION
        NOLOCK
        SET @PER_ID = 000001

		IF @COUNT IS NOT NULL
		BEGIN

			SET @PER_ID = @PER_ID + @COUNT

		END

        INSERT INTO CLINIC.OC_PERSCRIPTION 
            (PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            DOC_ID, 
            QUANTITY)
        SELECT 
            @PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            DOC_ID, 
            QUANTITY 
        FROM INSERTED

    END

END*/


/*CREATE TRIGGER CLINIC.PRIMARY_KEY_ROW_OC_RECEIPT_DETAILS ON 
    CLINIC.OC_RECEIPT_DETAILS INSTEAD OF INSERT
AS
BEGIN

    SET NOCOUNT ON
    DECLARE @RECEIPT_NO NUMERIC

    SELECT 
        @RECEIPT_NO = OCRD.RECEIPT_NO 
    FROM CLINIC.OC_RECEIPT_DETAILS OCRD, INSERTED I 
    WHERE OCRD.PER_ID = I.PER_ID 
        AND OCRD.VISIT_NO = I.VISIT_NO 
        AND OCRD.PAT_ID = I.PAT_ID

    IF @RECEIPT_NO IS NOT NULL
    BEGIN

        INSERT INTO CLINIC.OC_RECEIPT_DETAILS 
            (RECEIPT_NO,
            PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            QUANTITY, 
            TOTAL_COST)
        SELECT 
            @RECEIPT_NO, 
            PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            QUANTITY, 
            TOTAL_COST 
        FROM INSERTED

    END
    ELSE
    BEGIN

        DECLARE @COUNT NUMERIC
        SET @COUNT = 0
        SELECT @COUNT = MAX(RECEIPT_NO) 
        FROM OC_RECEIPT_DETAILS
        NOLOCK

        IF @COUNT IS NULL
        BEGIN

            SET @RECEIPT_NO = 1100001

        END
        ELSE
        BEGIN

            SET @RECEIPT_NO = 1
            SET @RECEIPT_NO = @RECEIPT_NO + @COUNT

        END

        INSERT INTO CLINIC.OC_RECEIPT_DETAILS 
            (RECEIPT_NO, 
            PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            QUANTITY, 
            TOTAL_COST)
        SELECT 
            @RECEIPT_NO, 
            PER_ID, 
            VISIT_NO, 
            PAT_ID, 
            MED_ID, 
            QUANTITY, 
            TOTAL_COST 
        FROM INSERTED
    
    END


END*/


/*Triggers Deletion*/
DROP TRIGGER CLINIC.RECORD_OC_PERSON
DROP TRIGGER CLINIC.RECORD_OC_PERSON_CONTACT
DROP TRIGGER CLINIC.RECORD_OC_PATIENT
DROP TRIGGER CLINIC.RECORD_OC_VISITS
DROP TRIGGER CLINIC.RECORD_OC_DOCTOR
DROP TRIGGER CLINIC.RECORD_OC_MEDICINE
DROP TRIGGER CLINIC.RECORD_OC_PERSCRIPTION
DROP TRIGGER CLINIC.RECORD_OC_RECEIPT
DROP TRIGGER CLINIC.RECORD_OC_RECEIPT_DETAILS
DROP TRIGGER CLINIC.PRIMARY_KEY_ROW_OC_VISITS
DROP TRIGGER CLINIC.PRIMARY_KEY_ROW_OC_PERSON_CONTACT
DROP TRIGGER CLINIC.PRIMARY_KEY_ROW_OC_PERSCRIPTION
DROP TRIGGER CLINIC.PRIMARY_KEY_ROW_OC_RECEIPT_DETAILS