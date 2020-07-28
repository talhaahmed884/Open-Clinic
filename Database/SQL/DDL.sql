/*TABLE CREATION*/

CREATE TABLE [OC_PERSON] (
  [CNIC] NUMERIC(13) PRIMARY KEY,
  [FIRST_NAME] VARCHAR(30) NOT NULL,
  [LAST_NAME] VARCHAR(30) NOT NULL,
  [ADDRESS] VARCHAR(100) NOT NULL,
  [AGE] NUMERIC(2) NOT NULL,
  [GENDER] VARCHAR(1) NOT NULL,
  [DOB] DATE NOT NULL,
  [NATIONALITY] VARCHAR(10) NOT NULL,
  [EMAIL] VARCHAR(30) NOT NULL
)
GO

CREATE TABLE [OC_PERSON_HISTORY] (
  [SR_NO] NUMERIC,
  [CNIC] NUMERIC(13),
  [FIRST_NAME] VARCHAR(30) NOT NULL,
  [LAST_NAME] VARCHAR(30) NOT NULL,
  [ADDRESS] VARCHAR(100) NOT NULL,
  [AGE] NUMERIC(2) NOT NULL,
  [GENDER] VARCHAR(1) NOT NULL,
  [DOB] DATE NOT NULL,
  [NATIONALITY] VARCHAR(10) NOT NULL,
  [EMAIL] VARCHAR(30) NOT NULL,
  PRIMARY KEY ([SR_NO], [CNIC])
)
GO

CREATE TABLE [OC_PERSON_CONTACT] (
  [CNIC] NUMERIC(13),
  [SR_NO] NUMERIC,
  [CONTACT] NUMERIC(13),
  PRIMARY KEY ([CNIC], [SR_NO])
)
GO

CREATE TABLE [OC_PATIENT] (
  [CNIC] NUMERIC(13) NOT NULL,
  [PAT_ID] NUMERIC PRIMARY KEY
)
GO

CREATE TABLE [OC_VISITS] (
  [VISIT_NO] NUMERIC,
  [PAT_ID] NUMERIC,
  [DOC_ID] NUMERIC,
  [PROBLEMS] TEXT NOT NULL,
  [DIAGNOSIS] TEXT NOT NULL,
  [VISIT_DATE] DATE NOT NULL,
  [VISIT_TIME] TIME NOT NULL,
  [FEE] NUMERIC NOT NULL
  PRIMARY KEY ([VISIT_NO], [PAT_ID], [DOC_ID])
)
GO

CREATE TABLE [OC_DOCTOR] (
  [DOC_ID] NUMERIC PRIMARY KEY,
  [CNIC] NUMERIC(13) NOT NULL,
  [QUALIFICATION] TEXT NOT NULL,
  [SPECIALIZATION] TEXT NOT NULL,
  [FEE] NUMERIC NOT NULL
)
GO

CREATE TABLE [OC_DOCTOR_HISTORY] (
  [SR_NO] NUMERIC,
  [DOC_ID] NUMERIC,
  [CNIC] NUMERIC(13) NOT NULL,
  [QUALIFICATION] TEXT NOT NULL,
  [SPECIALIZATION] TEXT NOT NULL,
  [FEE] NUMERIC NOT NULL,
  PRIMARY KEY ([SR_NO], [DOC_ID])
)
GO

CREATE TABLE [OC_MEDICINE] (
  [MED_ID] NUMERIC PRIMARY KEY,
  [MED_NAME] VARCHAR(30) NOT NULL,
  [MED_POTENCY] VARCHAR(10) NOT NULL,
  [DESC] TEXT NOT NULL,
  [MGF_DATE] DATE NOT NULL,
  [EXP_DATE] DATE NOT NULL,
  [QUANTITY] NUMERIC NOT NULL,
  [PRICE] NUMERIC NOT NULL
)
GO

CREATE TABLE [OC_MEDICINE_HISTORY] (
  [SR_NO] NUMERIC,
  [MED_ID] NUMERIC,
  [MED_NAME] VARCHAR(30) NOT NULL,
  [MED_POTENCY] VARCHAR(10) NOT NULL,
  [DESC] TEXT NOT NULL,
  [MGF_DATE] DATE NOT NULL,
  [EXP_DATE] DATE NOT NULL,
  [QUANTITY] NUMERIC NOT NULL,
  [PRICE] NUMERIC NOT NULL,
  PRIMARY KEY ([SR_NO], [MED_ID])
)
GO

CREATE TABLE [OC_PERSCRIPTION] (
  [PER_ID] NUMERIC,
  [VISIT_NO] NUMERIC,
  [PAT_ID] NUMERIC,
  [MED_ID] NUMERIC,
  [DOC_ID] NUMERIC NOT NULL,
  [QUANTITY] NUMERIC NOT NULL,
  PRIMARY KEY ([PER_ID], [VISIT_NO], [PAT_ID], [MED_ID])
)
GO

CREATE TABLE [OC_RECEIPT] (
  [RECEIPT_NO] NUMERIC PRIMARY KEY,
  [RECEIPT_DATE] DATE NOT NULL,
  [RECEIPT_TIME] TIME NOT NULL,
  [TOTAL_COST] NUMERIC NOT NULL
)
GO

CREATE TABLE [OC_RECEIPT_DETAILS] (
  [RECEIPT_NO] NUMERIC,
  [PER_ID] NUMERIC,
  [VISIT_NO] NUMERIC,
  [PAT_ID] NUMERIC,
  [MED_ID] NUMERIC,
  [QUANTITY] NUMERIC NOT NULL,
  [TOTAL_COST] NUMERIC NOT NULL,
  PRIMARY KEY ([RECEIPT_NO], [PER_ID], [VISIT_NO], [PAT_ID], [MED_ID])
)
GO

ALTER TABLE [OC_PERSON_CONTACT] ADD FOREIGN KEY ([CNIC]) REFERENCES [OC_PERSON] ([CNIC])
GO

ALTER TABLE [OC_PATIENT] ADD FOREIGN KEY ([CNIC]) REFERENCES [OC_PERSON] ([CNIC])
GO

ALTER TABLE [OC_VISITS] ADD FOREIGN KEY ([PAT_ID]) REFERENCES [OC_PATIENT] ([PAT_ID])
GO

ALTER TABLE [OC_VISITS] ADD FOREIGN KEY ([DOC_ID]) REFERENCES [OC_DOCTOR] ([DOC_ID])
GO

ALTER TABLE [OC_DOCTOR] ADD FOREIGN KEY ([CNIC]) REFERENCES [OC_PERSON] ([CNIC])
GO

ALTER TABLE [OC_PERSCRIPTION] ADD FOREIGN KEY ([VISIT_NO],[PAT_ID],[DOC_ID]) REFERENCES [OC_VISITS] ([VISIT_NO],[PAT_ID],[DOC_ID])
GO

ALTER TABLE [OC_PERSCRIPTION] ADD FOREIGN KEY ([MED_ID]) REFERENCES [OC_MEDICINE] ([MED_ID])
GO

ALTER TABLE [OC_RECEIPT_DETAILS] ADD FOREIGN KEY ([RECEIPT_NO]) REFERENCES [OC_RECEIPT] ([RECEIPT_NO])
GO

ALTER TABLE [OC_RECEIPT_DETAILS] ADD FOREIGN KEY ([PER_ID],[VISIT_NO],[PAT_ID],[MED_ID]) REFERENCES [OC_PERSCRIPTION] ([PER_ID],[VISIT_NO],[PAT_ID],[MED_ID])
GO

ALTER TABLE [OC_RECEIPT_DETAILS] ADD FOREIGN KEY ([MED_ID]) REFERENCES [OC_MEDICINE] ([MED_ID])
GO

/* TABLE DELETION */
DROP TABLE [OC_RECEIPT_DETAILS];
DROP TABLE [OC_RECEIPT];
DROP TABLE [OC_PERSCRIPTION];
DROP TABLE [OC_MEDICINE_HISTORY];
DROP TABLE [OC_MEDICINE];
DROP TABLE [OC_VISITS];
DROP TABLE [OC_DOCTOR_HISTORY];
DROP TABLE [OC_DOCTOR];
DROP TABLE [OC_PATIENT];
DROP TABLE [OC_PERSON_CONTACT];
DROP TABLE [OC_PERSON_HISTORY];
DROP TABLE [OC_PERSON];