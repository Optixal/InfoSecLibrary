-- Database, Files (.mdf, .ndf, .ldf) and Filegroup Creation

create database testDB
on primary
(	name = 'testDB_primary',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\testDB_primary.mdf',
	size = 5MB,
	maxsize = 10MB,
	filegrowth = 1MB	),
filegroup filegroup1
(	name = 'filegroup1_data1',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\filegroup1_data1.ndf',
	size = 1MB,
	maxsize = 10MB,
	filegrowth = 1MB	),
(	name = 'filegroup1_data2',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\filegroup1_data2.ndf',
	size = 1MB,
	maxsize = 10MB,
	filegrowth = 0		)
log on
(	name = 'test_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\test_log.ldf',
	size = 1MB,
	maxsize = 10MB,
	filegrowth = 1MB	)



-- Alteration

alter database testDB
modify filegroup
filegroup1 default

alter database testDB
modify file
(name = 'filegroup1_data1', size = 30MB, maxsize = 60MB)

alter database testDB
add filegroup filegroup2
go -- batch seperator
alter database testDB
add file
(	name = filegroup2_data1,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\filegroup2_data1.ndf',
	size = 10MB,
	maxsize = 20MB,
	filegrowth = 0	)
to filegroup filegroup2



-- Table Creation

create table SalesPerson
( EmpID       char(4) primary key,
  EmpName  varchar(50) )
on [primary]

create table SalesPeople
( EmpID       char(4) primary key,
  EmpName  varchar(50) )
on filegroup1
