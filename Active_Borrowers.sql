use Tech_Library;
WITH BorrowerCount AS (
    SELECT BorrowerID, COUNT(*) AS BorrowedCount
    FROM Loans
    WHERE DateReturned IS NULL
    GROUP BY BorrowerID
)
SELECT *
FROM Borrowers B
JOIN BorrowerCount BC ON B.BorrowerID = BC.BorrowerID
WHERE BC.BorrowedCount >= 2;