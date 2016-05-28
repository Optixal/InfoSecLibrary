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

EXEC sp_addrolemember 'db_owner', 'willy'



-- Alteration of SQL Server Login
ALTER LOGIN alice
WITH PASSWORD = '87654321' 

-- Deletion of Login
DROP LOGIN alice



-- Addition of Members to Fixed Server Role
alter server role sysadmin
add member shawn
-- Or
sp_addsrvrolemember 'sysadmin', 'shawn'

-- Deletion of Members from Fixed Server Role
alter server role sysadmin
drop member shawn
-- Or
sp_dropsrvrolemember 'sysadmin', 'shawn'

-- Creation of Custom Database Role
create role lecturers

-- Addition of Members to Custom Database Role
sp_addrolemember 'lecturers', 'tim'

-- Deletion of Members from Custom Database Role
sp_droprolemember 'lecturers', 'tim'

-- Deletion of Custom Database Role 
drop role lecturers

-- Creation of Application Role
create application role updatemarks
with password = '12345678',
default_schema = SingPoly

-- Activation of Application Role
sp_setapprole 'updatemarks', '12345678'

