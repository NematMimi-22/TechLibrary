CREATE PROCEDURE sp_OverdueBorrowers
AS
BEGIN
    CREATE TABLE #TempOverdueBorrowers (
        BorrowerID INT,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50)
    );

    INSERT INTO #TempOverdueBorrowers (BorrowerID, FirstName, LastName)
    SELECT DISTINCT B.BorrowerID, B.FirstName, B.LastName
    FROM Loans L
    JOIN Borrowers B ON L.BorrowerID = B.BorrowerID
    WHERE L.DateReturned IS NULL AND L.DueDate < GETDATE();

    SELECT
        T.BorrowerID,
        T.FirstName,
        T.LastName,
        L.BookID,
        B.Title AS BookTitle,
        L.DateBorrowed,
        L.DueDate
    FROM #TempOverdueBorrowers T
     JOIN Loans L ON T.BorrowerID = L.BorrowerID
     JOIN Books B ON L.BookID = B.BookID
    WHERE L.DateReturned IS NULL AND L.DueDate < GETDATE();

    DROP TABLE #TempOverdueBorrowers;
END;