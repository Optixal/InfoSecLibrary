CREATE TABLE Loan
(Loan_ID varchar(4),
Loan_Amt integer,
Cust_ID varchar(5),
Loan_Start_Date date,
Loan_End_Date date,
Amt_Paid integer,
PRIMARY KEY (Loan_ID))

SELECT * FROM Loan

INSERT INTO Loan
VALUES
('L908', 486700, 'C7321', '05/09/1999', '05/08/2019', 130000)

CREATE PROCEDURE OutstandingAmt
	@ID varchar(5)
AS
SELECT Loan_ID, Loan_Start_Date, Loan_End_Date, ISNULL(Loan_Amt, 0) - ISNULL(Amt_Paid, 0) AS 'Outstanding Amount'
FROM Loan
WHERE Cust_ID = @ID

EXEC OutstandingAmt 'C9934'

CREATE TRIGGER Loan_Updated_Alert
ON Loan
FOR UPDATE -- After and For is the same
AS
PRINT 'Please note that loan data have been updated'

UPDATE Loan
SET Loan_End_Date = '2016-03-22'
WHERE Loan_ID = 'L245'
