SELECT
    b.Title,
    b.Author,
    l.DueDate,
    DATEDIFF(DAY, l.DueDate, GETDATE()) AS DaysOverdue,
    br.FirstName,
    br.LastName
FROM
    Loans l
JOIN
    Books b ON l.BookID = b.BookID
JOIN
    Borrowers br ON l.BorrowerID = br.BorrowerID
WHERE
    l.DateReturned IS NULL
    AND DATEDIFF(DAY, l.DueDate, GETDATE()) > 30;