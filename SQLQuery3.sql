-- ============================================================
-- Q.2 - POPULATE AND DISPLAY THE TABLES
-- Parent tables are loaded before child tables.
-- ============================================================

INSERT INTO Learner (LearnerID, FirstName, LastName, Province, EmailAddress) VALUES
('L00001','Ayanda','Mokoena','Gauteng','ayanda.mokoena@example.org'),
('L00002','Thandi','Naidoo','KwaZulu-Natal','thandi.naidoo@example.org'),
('L00003','Lerato','Molefe','North West','lerato.molefe@example.org'),
('L00004','Sipho','Dlamini','Mpumalanga','sipho.dlamini@example.org'),
('L00005','Zanele','Khumalo','Gauteng','zanele.khumalo@example.org'),
('L00006','Peter','Jacobs','Western Cape','peter.jacobs@example.org');

INSERT INTO Course (CourseID, CourseName, Category, Fee) VALUES
('C1001','SQL Fundamentals','Database',1850.00),
('C1002','Data Reporting with SQL','Database',2400.00),
('C1003','Cyber Safety Essentials','Cybersecurity',1650.00),
('C1004','Cloud Foundations','Cloud',2100.00);

INSERT INTO Facilitator (FacilitatorID, FirstName, LastName, Specialisation) VALUES
('F0001','Naledi','Nkosi','Database Systems'),
('F0002','Imraan','Patel','Cybersecurity'),
('F0003','Boitumelo','Maseko','Cloud Computing');

-- CourseOffering has supplied OfferingID values (101-105), so we must
-- temporarily allow explicit values into the IDENTITY column.
SET IDENTITY_INSERT CourseOffering ON;

INSERT INTO CourseOffering (OfferingID, CourseID, FacilitatorID, StartDate, DeliveryMode, Capacity) VALUES
(101,'C1001','F0001','2026-09-07','Online',25),
(102,'C1002','F0001','2026-09-14','Contact',20),
(103,'C1003','F0002','2026-09-21','Online',30),
(104,'C1004','F0003','2026-10-05','Contact',18),
(105,'C1002',NULL,'2026-10-12','Online',20);

SET IDENTITY_INSERT CourseOffering OFF;

-- Enrolment has supplied EnrolmentID values (1001-1010), same approach.
SET IDENTITY_INSERT Enrolment ON;

INSERT INTO Enrolment (EnrolmentID, LearnerID, OfferingID, EnrolDate, Status, FinalMark) VALUES
(1001,'L00001',101,'2026-08-15','Completed',78.00),
(1002,'L00002',101,'2026-08-16','Completed',64.00),
(1003,'L00003',101,'2026-08-17','Active',NULL),
(1004,'L00001',102,'2026-08-20','Active',NULL),
(1005,'L00004',102,'2026-08-21','Cancelled',NULL),
(1006,'L00005',102,'2026-08-22','Active',NULL),
(1007,'L00002',103,'2026-08-25','Completed',82.00),
(1008,'L00004',103,'2026-08-26','Completed',56.00),
(1009,'L00006',103,'2026-08-27','Active',NULL),
(1010,'L00005',104,'2026-08-30','Active',NULL);

SET IDENTITY_INSERT Enrolment OFF;
GO

-- Display the complete contents of each table, in primary-key order
SELECT * FROM Learner ORDER BY LearnerID;
SELECT * FROM Course ORDER BY CourseID;
SELECT * FROM Facilitator ORDER BY FacilitatorID;
SELECT * FROM CourseOffering ORDER BY OfferingID;
SELECT * FROM Enrolment ORDER BY EnrolmentID;
GO