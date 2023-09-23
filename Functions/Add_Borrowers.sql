CREATE PROC sp_AddNewBorrower 
	@firstname NVARCHAR(64),
	@lastname NVARCHAR(64),
	@email NVARCHAR(256),
	@birthdate DATE,
	@membershipDate Date
AS
BEGIN

	IF EXISTS (SELECT '*' FROM Borrowers WHERE Email = @email)
	BEGIN
        SELECT 'Email already exists. Please use a different email.' AS ErrorMessage;
	END
	
	INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate) VALUES (@firstname, @lastname, @email, @birthdate, @membershipDate);
	
END