-- ============================================================
-- Q.5 - MANIPULATE RECORDS WITH QUERY CLAUSES
-- ============================================================

-- a. WHERE + ORDER BY: learners from Gauteng or KwaZulu-Natal
SELECT LearnerID, FirstName, LastName, Province
FROM Learner
WHERE Province = 'Gauteng' OR Province = 'KwaZulu-Natal'
ORDER BY LastName ASC, FirstName ASC;

-- b. GROUP BY: enrolment count per status, largest first
SELECT Status, COUNT(*) AS EnrolmentCount
FROM Enrolment
GROUP BY Status
ORDER BY EnrolmentCount DESC;

-- c. GROUP BY + HAVING: offerings with at least 3 enrolments
SELECT OfferingID, COUNT(*) AS EnrolmentCount
FROM Enrolment
GROUP BY OfferingID
HAVING COUNT(*) >= 3
ORDER BY OfferingID ASC;

-- d. WHERE + GROUP BY + HAVING: offerings with an average completed FinalMark >= 60
SELECT OfferingID, ROUND(AVG(FinalMark), 2) AS AvgFinalMark
FROM Enrolment
WHERE Status = 'Completed'
GROUP BY OfferingID
HAVING AVG(FinalMark) >= 60
ORDER BY AvgFinalMark DESC;
GO