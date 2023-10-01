DROP PROCEDURE IF EXISTS sp_BorrowedBooksReport;
GO
CREATE PROCEDURE sp_BorrowedBooksReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT
        b.Title AS BookTitle,
        Borrowers.FirstName + ' ' + Borrowers.LastName AS FullName,
        l.DateBorrowed AS BorrowingDate
    FROM
        Loans l
     JOIN
        Books b ON l.BookID = b.BookID
     JOIN
        Borrowers ON l.BorrowerID = Borrowers.BorrowerID
    WHERE
        l.DateBorrowed >= @StartDate AND l.DateBorrowed <= @EndDate;
END;
GO