-- ============================================================
-- Q.3 - ALTER TABLE
-- ============================================================

-- a. Add VenueCode to CourseOffering: must be NULL, or start with 'VEN'
ALTER TABLE CourseOffering ADD VenueCode VARCHAR(10) NULL;
GO

ALTER TABLE CourseOffering
ADD CONSTRAINT CK_CourseOffering_VenueCode
CHECK (VenueCode IS NULL OR VenueCode LIKE 'VEN%');
GO

-- b. Add CompletionDate to Enrolment: must be NULL, or on/after EnrolDate
ALTER TABLE Enrolment ADD CompletionDate DATE NULL;
GO

ALTER TABLE Enrolment
ADD CONSTRAINT CK_Enrolment_CompletionDate
CHECK (CompletionDate IS NULL OR CompletionDate >= EnrolDate);
GO

-- c. Metadata verification: proof both columns and both constraints exist
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN ('VenueCode','CompletionDate');

SELECT
    con.name AS ConstraintName,
    tab.name AS TableName,
    con.type_desc AS ConstraintType
FROM sys.check_constraints con
JOIN sys.tables tab ON con.parent_object_id = tab.object_id
WHERE con.name IN ('CK_CourseOffering_VenueCode','CK_Enrolment_CompletionDate');
GO