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

-- DECLARE AND SET

create procedure Validate_Student
-- Add parameters for procedures
@AdmNo int
as
begin
	declare
	@AdmNoBackup int,
	@firstDigit int,
	@secondDigit int,
	@thirdDigit int,
	@fourthDigit int,
	@fifthDigit int,
	@checkDigit int

	set @AdmNoBackup = @AdmNo

	set @firstDigit = @AdmNo / 10000
	set @AdmNo = @AdmNo - (@firstDigit * 10000)

	set @secondDigit = @AdmNo / 1000
	set @AdmNo = @AdmNo - (@secondDigit * 1000)

	set @thirdDigit = @AdmNo / 100
	set @AdmNo = @AdmNo - (@thirdDigit * 100)

	set @fourthDigit = @AdmNo / 10
	set @AdmNo = @AdmNo - (@fourthDigit * 10)

	set @fifthDigit = @AdmNo

	set @checkDigit = 11 - ((@firstDigit * 6 + @secondDigit * 5 + @thirdDigit * 4 + @fourthDigit * 3 + @fifthDigit * 2) % 11)

	print 'Your check digit for admission number ' + cast(@AdmNoBackup as char(5)) + ' is ' + cast(@checkDigit as char(1))
end
go

exec validate_student 12345

-- MST TRIGGER

create table enrollment
(	studno	varchar(7),
	studname varchar(30),
	dateenrolled date)

insert into enrollment
values
('2', 'Mary Ana', '05 Apr 2016')

select * from enrollment

create table audit_change
(	studno varchar(7),
	olddate date,
	newdate date,
	updatedate date)

select * from audit_change

create trigger audit_trigger
on enrollment
after update
as
	insert into audit_change
		select i.studno, d.dateenrolled, i.dateenrolled, getDate()
		from inserted i, deleted d
		where i.studno = d.studno

update enrollment
set dateenrolled = '01 Apr 2001'
where studno = '1'
