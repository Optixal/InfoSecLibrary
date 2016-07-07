CREATE TABLE student
(StudID varchar(4),
StudName varchar(30),
DOB date,
GPA decimal (4,2),
primary key (StudID))

SELECT * FROM student

CREATE PROCEDURE Check_Student
	@StudID varchar(4),
	@StudName varchar(30),
	@dob date,
	@GPA decimal(4,2)
AS
BEGIN
	IF @dob IS NULL
		BEGIN
			PRINT @studID + ' ' + @StudName + '-' + 'Student dob is unknown'
			ROLLBACK;
		END
	ELSE
		BEGIN
			INSERT INTO Student
			VALUES
			(@StudID, @StudName, @DOB, @GPA)
			SELECT * FROM student
		END
	END

EXEC Check_Student 'S125', 'David Wong', null, 3.56



-- INSERT Trigger

CREATE TRIGGER Show_Records_Inserted ON Student
AFTER INSERT
AS
SELECT * FROM inserted

INSERT INTO student
VALUES
('S112', 'Jane Wong', '12/23/2005', 4.00)


-- DELETE Trigger

CREATE TRIGGER Show_Records_Deleted ON Student
AFTER DELETE
AS
SELECT * FROM deleted

DELETE FROM student
WHERE StudID = 'S112'


-- UPDATE Trigger - An update is treated as a delete then insert

CREATE TRIGGER Show_Records_Updated ON Student
AFTER UPDATE
AS
PRINT 'Old values are shown'
SELECT * FROM deleted
PRINT 'New values are shown'
SELECT * FROM inserted

UPDATE Student
SET StudName = 'James Wong'
WHERE StudID = 'S123'


-- INSTEAD OF UPDATE Trigger - Instead of updating, does smth else

CREATE TRIGGER Show_Records_Otherwise ON Student
INSTEAD OF UPDATE
AS
PRINT 'The record is not updated as there is an INSTEAD of trigger at work'

SELECT * FROM student

UPDATE student
SET GPA = 3.00
WHERE studID = 'S123'


-- TRIGGER THAT FIRES WHEN A TABLE IS DROPPED
CREATE TRIGGER Print_Table_Drop ON DATABASE
FOR Drop_Table
AS
PRINT 'Table dropped!'
