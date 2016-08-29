-- General Format
[ GRANT | DENY | REVOKE ] [ STATEMENT | OBJECT ON [ OBJECT:: || SCHEMA:: ] ] TO [ USER ]
[ WITH GRANT OPTION ]



-- Grant Statement Permission
GRANT CREATE TABLE TO Mary

-- Grant Statement Permission with Grant Option (Right to give others the same permission)
GRANT CREATE TABLE TO Mary
WITH GRANT OPTION

-- Grant Object Permission on Schema
GRANT CONTROL ON SCHEMA::Sales TO Mary



-- Deny Statement Permission
DENY CREATE ANY DATABASE TO John

-- Deny Object Permission
DENY UPDATE ON OBJECT::Sales.Customer TO John



-- Revoke with Cascade (Required if Mary has been given "WITH GRANT OPTION")
REVOKE CREATE TABLE TO Mary CASCADE
