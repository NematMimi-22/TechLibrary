DROP FUNCTION IF EXISTS fn_CalculateOverdueFees;
GO

CREATE FUNCTION fn_CalculateOverdueFees(@LoanID INT)
RETURNS INT
AS
BEGIN
    DECLARE @OverdueFee INT;
    DECLARE @DueDate DATE;
    DECLARE @DateReturned DATE;
    DECLARE @DaysOverdue INT;

    SELECT @DueDate = DueDate, @DateReturned = DateReturned
    FROM Loans
    WHERE LoanID = @LoanID;

    IF @DateReturned IS NULL
        SET @DateReturned = GETDATE();

    SET @DaysOverdue = DATEDIFF(DAY, @DueDate, @DateReturned);

    IF @DaysOverdue <= 30
        SET @OverdueFee = @DaysOverdue; 
    ELSE
        SET @OverdueFee = 30 + (@DaysOverdue - 30) * 2.00; 

    RETURN @OverdueFee;
END;
GO