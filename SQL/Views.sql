-- Create View
CREATE VIEW ForeignStudents
AS
SELECT AdmNo, StudentName, Nationality FROM Student WHERE Nationality != 'Singapore'
[ WITH CHECK OPTION ] -- Only rows satisfying the WHERE clause criteria can be inserted, updated or deleted
