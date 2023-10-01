DROP FUNCTION IF EXISTS fn_BookBorrowingFrequency;
GO
CREATE FUNCTION fn_BookBorrowingFrequency
(
    @BookID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @BorrowingCount INT;
    SELECT @BorrowingCount = COUNT(*) FROM Loans WHERE BookID = @BookID;
    RETURN @BorrowingCount;
END;
GO