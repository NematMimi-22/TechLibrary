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

CREATE TABLE Borrowers (
    BorrowerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DateOfBirth DATE,
    MembershipDate DATE
);

CREATE TABLE Loans (
    LoanID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    BorrowerID INT,
    DateBorrowed DATE,
    DueDate DATE,
    DateReturned DATE NULL,
    FOREIGN KEY (BookID) REFERENCES Books (BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers (BorrowerID)
);
