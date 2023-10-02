use Tech_Library;
SELECT Title FROM Books JOIN Loans ON Books.BookID = Loans.BookID WHERE Loans.BorrowerID = 1;