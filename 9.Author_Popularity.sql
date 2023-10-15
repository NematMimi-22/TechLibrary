SELECT
    b.Author AS AuthorName,
    COUNT(*) AS BorrowingFrequency
FROM
    Loans l
 JOIN
    Books b ON l.BookID = b.BookID
GROUP BY
    b.Author
ORDER BY
    BorrowingFrequency DESC;