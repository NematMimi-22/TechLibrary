WITH BorrowedBooks AS (
    SELECT
        b.Genre,
        DATEPART(YEAR, l.DateBorrowed) AS BorrowYear,
        DATEPART(MONTH, l.DateBorrowed) AS BorrowMonth,
        COUNT(*) AS GenreCount,
        ROW_NUMBER() OVER (PARTITION BY DATEPART(YEAR, l.DateBorrowed), DATEPART(MONTH, l.DateBorrowed) ORDER BY COUNT(*) DESC) AS GenreRank
    FROM
        Loans l
     JOIN
        Books b ON l.BookID = b.BookID
    WHERE
        l.DateBorrowed IS NOT NULL
    GROUP BY
        b.Genre, DATEPART(YEAR, l.DateBorrowed), DATEPART(MONTH, l.DateBorrowed)
)
SELECT 
 BB.Genre,
 BB.BorrowMonth,
 BB.BorrowYear
FROM
    BorrowedBooks BB
WHERE
    BB.BorrowMonth = 9 
	AND GenreRank = 1;