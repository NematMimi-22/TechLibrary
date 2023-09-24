CREATE TRIGGER LogStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CurrentStatus)
    BEGIN
        INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
        SELECT i.BookID, i.CurrentStatus, GETDATE()
        FROM inserted i
        JOIN deleted d ON i.BookID = d.BookID
        WHERE i.CurrentStatus <> d.CurrentStatus
    END
END;