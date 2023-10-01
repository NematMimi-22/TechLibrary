WITH BorrowerCount AS (
    SELECT BorrowerID, COUNT(*) AS BorrowedCount
    FROM Loans
    WHERE DateReturned IS NULL
    GROUP BY BorrowerID
	HAVING COUNT(*) >= 2
)
SELECT *
FROM Borrowers B
JOIN BorrowerCount BC ON B.BorrowerID = BC.BorrowerID;