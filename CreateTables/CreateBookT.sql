IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Books')
BEGIN
    CREATE TABLE Books (
        BookID INT IDENTITY(1,1) PRIMARY KEY,
        Title VARCHAR(255),
        Author VARCHAR(255),
        ISBN VARCHAR(20),
        PublishedDate DATE,
        Genre VARCHAR(50),
        ShelfLocation VARCHAR(50),
        CurrentStatus VARCHAR(20) CHECK (CurrentStatus IN ('Available', 'Borrowed'))
    );
END