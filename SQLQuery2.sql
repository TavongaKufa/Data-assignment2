-- ============================================================
-- Q.1 - CREATE DATABASE AND TABLES
-- ============================================================

CREATE DATABASE MzansiSkillsDB;
GO
USE MzansiSkillsDB;
GO

CREATE TABLE Learner (
    LearnerID     CHAR(6) PRIMARY KEY,
    FirstName     VARCHAR(40) NOT NULL,
    LastName      VARCHAR(40) NOT NULL,
    Province      VARCHAR(30) NOT NULL,
    EmailAddress  VARCHAR(100) NOT NULL,
    CONSTRAINT UQ_Learner_Email UNIQUE (EmailAddress)
);

CREATE TABLE Course (
    CourseID    CHAR(5) PRIMARY KEY,
    CourseName  VARCHAR(80) NOT NULL,
    Category    VARCHAR(30) NOT NULL,
    Fee         DECIMAL(8,2) NOT NULL
);

CREATE TABLE Facilitator (
    FacilitatorID   CHAR(5) PRIMARY KEY,
    FirstName       VARCHAR(40) NOT NULL,
    LastName        VARCHAR(40) NOT NULL,
    Specialisation  VARCHAR(60) NOT NULL
);

CREATE TABLE CourseOffering (
    OfferingID     INT IDENTITY(1,1) PRIMARY KEY,
    CourseID       CHAR(5) NOT NULL,
    FacilitatorID  CHAR(5) NULL,
    StartDate      DATE NOT NULL,
    DeliveryMode   VARCHAR(10) NOT NULL,
    Capacity       INT NOT NULL CONSTRAINT DF_CourseOffering_Capacity DEFAULT 20,
    CONSTRAINT FK_CourseOffering_Course FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    CONSTRAINT FK_CourseOffering_Facilitator FOREIGN KEY (FacilitatorID) REFERENCES Facilitator(FacilitatorID)
);

CREATE TABLE Enrolment (
    EnrolmentID  INT IDENTITY(1,1) PRIMARY KEY,
    LearnerID    CHAR(6) NOT NULL,
    OfferingID   INT NOT NULL,
    EnrolDate    DATE NOT NULL CONSTRAINT DF_Enrolment_EnrolDate DEFAULT GETDATE(),
    Status       VARCHAR(12) NOT NULL,
    FinalMark    DECIMAL(5,2) NULL,
    CONSTRAINT FK_Enrolment_Learner FOREIGN KEY (LearnerID) REFERENCES Learner(LearnerID),
    CONSTRAINT FK_Enrolment_Offering FOREIGN KEY (OfferingID) REFERENCES CourseOffering(OfferingID),
    CONSTRAINT UQ_Enrolment_Learner_Offering UNIQUE (LearnerID, OfferingID)
);
GO

-- Proof all 5 tables were created
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';
GO