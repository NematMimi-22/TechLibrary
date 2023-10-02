SELECT
    CASE
        WHEN DateDiff(YEAR, DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
        WHEN DateDiff(YEAR, DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
        WHEN DateDiff(YEAR, DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
        ELSE '31+'
    END AS AgeGroup,
    b.Genre AS PreferredGenre,
    COUNT(*) AS GenreCount
FROM
    Borrowers br
 JOIN
    Loans l ON br.BorrowerID = l.BorrowerID
 JOIN
    Books b ON l.BookID = b.BookID
GROUP BY
    CASE
        WHEN DateDiff(YEAR, DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
        WHEN DateDiff(YEAR, DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
        WHEN DateDiff(YEAR, DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
        ELSE '31+'
    END,
    b.Genre
ORDER BY
    AgeGroup,
    GenreCount DESC;