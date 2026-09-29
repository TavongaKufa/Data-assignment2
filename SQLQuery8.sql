-- ============================================================
-- Q.7 - Course Offering Participation Report
-- ============================================================

SELECT
    co.OfferingID,
    c.CourseName,
    co.DeliveryMode,
    ISNULL(f.FirstName + ' ' + f.LastName, 'Unallocated') AS Facilitator,
    COUNT(e.EnrolmentID) AS TotalEnrolments,
    SUM(CASE WHEN e.Status = 'Completed' THEN 1 ELSE 0 END) AS CompletedEnrolments,
    ROUND(AVG(CASE WHEN e.Status = 'Completed' THEN e.FinalMark ELSE NULL END), 2) AS AvgFinalMark
FROM CourseOffering co
JOIN Course c ON co.CourseID = c.CourseID
LEFT OUTER JOIN Facilitator f ON co.FacilitatorID = f.FacilitatorID
LEFT OUTER JOIN Enrolment e ON co.OfferingID = e.OfferingID
GROUP BY co.OfferingID, c.CourseName, co.DeliveryMode, f.FirstName, f.LastName, co.StartDate
ORDER BY co.StartDate ASC, co.OfferingID ASC;
GO