-- ============================================================
-- Q.4 - UPDATE AND DISPLAY TABLE CONTENTS
-- ============================================================

-- a. Set VenueCode for the two Contact offerings only (102 and 104)
UPDATE CourseOffering SET VenueCode = 'VEN-MID' WHERE OfferingID = 102 AND DeliveryMode = 'Contact';
UPDATE CourseOffering SET VenueCode = 'VEN-CPT' WHERE OfferingID = 104 AND DeliveryMode = 'Contact';

SELECT OfferingID, DeliveryMode, VenueCode
FROM CourseOffering
WHERE OfferingID IN (102, 104);

-- b. Set CompletionDate for completed enrolments in offerings 101 and 103
UPDATE Enrolment SET CompletionDate = '2026-09-12' WHERE OfferingID = 101 AND Status = 'Completed';
UPDATE Enrolment SET CompletionDate = '2026-09-26' WHERE OfferingID = 103 AND Status = 'Completed';

SELECT EnrolmentID, OfferingID, Status, CompletionDate
FROM Enrolment
WHERE OfferingID IN (101, 103) AND Status = 'Completed';

-- c. Increase the fee of Database category courses by 5%
UPDATE Course SET Fee = ROUND(Fee * 1.05, 2) WHERE Category = 'Database';

SELECT CourseID, CourseName, Category, Fee
FROM Course
WHERE Category = 'Database';
GO