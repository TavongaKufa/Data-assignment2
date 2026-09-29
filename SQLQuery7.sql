-- ============================================================
-- Q.6 - JOINS
-- ============================================================

-- a. INNER JOIN: every enrolment with learner name, course, start date, status
SELECT
    e.EnrolmentID,
    (l.FirstName + ' ' + l.LastName) AS LearnerName,
    c.CourseName,
    co.StartDate,
    e.Status
FROM Enrolment e
JOIN Learner l ON e.LearnerID = l.LearnerID
JOIN CourseOffering co ON e.OfferingID = co.OfferingID
JOIN Course c ON co.CourseID = c.CourseID
ORDER BY e.EnrolmentID ASC;

-- b. LEFT OUTER JOIN: every course offering, including those with no enrolments
SELECT
    co.OfferingID,
    c.CourseName,
    COUNT(e.EnrolmentID) AS TotalEnrolments
FROM CourseOffering co
JOIN Course c ON co.CourseID = c.CourseID
LEFT OUTER JOIN Enrolment e ON co.OfferingID = e.OfferingID
GROUP BY co.OfferingID, c.CourseName
ORDER BY co.OfferingID ASC;

-- c. LEFT OUTER JOIN: facilitator's full name, or 'Unallocated' if none
SELECT
    co.OfferingID,
    c.CourseName,
    ISNULL(f.FirstName + ' ' + f.LastName, 'Unallocated') AS Facilitator
FROM CourseOffering co
JOIN Course c ON co.CourseID = c.CourseID
LEFT OUTER JOIN Facilitator f ON co.FacilitatorID = f.FacilitatorID
ORDER BY co.OfferingID ASC;
GO