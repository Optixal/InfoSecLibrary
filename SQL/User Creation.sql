-- Creation of SQL Server Login
CREATE LOGIN alice
WITH PASSWORD = '12345678', DEFAULT_DATABASE = SingPoly -- More options: must_change, check_policy, check_expiration

-- Creation of Windows Login
CREATE LOGIN alice 
FROM Windows
WITH DEFAULT_DATABASE = SingPoly

-- Creation of Database User, by mapping SQL Server Login 
CREATE USER elise
FOR LOGIN alice
WITH DEFAULT_SCHEMA = SingPoly

-- Creation of Database User, for contained (portable) databases
CREATE USER alice
WITH PASSWORD = '12345678', DEFAULT_SCHEMA = SingPoly



-- Alteration of SQL Server Login
ALTER LOGIN alice
WITH PASSWORD = '87654321' 

-- Deletion of Login
DROP LOGIN alice
