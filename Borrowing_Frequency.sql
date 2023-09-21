WITH BorrowerCount AS (
    SELECT
        BorrowerID,
        COUNT(*) AS BorrowCount
    FROM
        Loans
    GROUP BY
        BorrowerID
)
SELECT
    B.BorrowerID,
    B.FirstName,
    B.LastName,
    BC.BorrowCount,
    DENSE_RANK() OVER (ORDER BY BC.BorrowCount DESC) AS BorrowerRank
FROM
    Borrowers B
JOIN
    BorrowerCount BC ON B.BorrowerID = BC.BorrowerID;