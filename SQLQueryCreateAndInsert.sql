-- Create LargeBank database & use it
CREATE DATABASE LargeBank;
GO
USE LargeBank;
GO

-- Create tables: Customer, Account, Transaction, Statement,
-- Use identity property for the primary keys, and link the foreign keys
CREATE TABLE Customer
(
	CustomerId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CreatedDate DATETIME NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Address1 VARCHAR(150) NOT NULL,
	Address2 VARCHAR(150),
	City VARCHAR(150) NOT NULL,
	[State] VARCHAR(20) NOT NULL,
	Zip VARCHAR(20)
)
CREATE TABLE Account
(
	AccountId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CustomerId INT NOT NULL,
	CreatedDate DATETIME NOT NULL,
	AccountNumber VARCHAR(50) NOT NULL,
	Balance MONEY NOT NULL,
	FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId)
)
CREATE TABLE [Transaction]
(
	TransactionId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	AccountId INT NOT NULL,
	TransactionDate DATETIME NOT NULL,
	Amount MONEY NOT NULL,
	FOREIGN KEY (AccountId) REFERENCES Account (AccountId)
)
CREATE TABLE [Statement]
(
	StatementId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	AccountId INT NOT NULL,
	CreatedDate DATETIME,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	FOREIGN KEY (AccountId) REFERENCES Account (AccountId)
)
go
-- Insert data for Customer, inserting ID values explicitly
-- John Doe: Customer ID=1
SET IDENTITY_INSERT Customer ON;
INSERT INTO Customer
(CustomerId, CreatedDate, FirstName, LastName, Address1, City, [State], Zip) 
VALUES (1, '2013-06-09','John','Doe','123 Fake Street','San Diego','CA','92101');
--Jane Doe: Customer ID=2
INSERT INTO Customer
(CustomerId, CreatedDate, FirstName, LastName, Address1, City, [State], Zip) 
VALUES (2, '2014-02-01','Jane','Doe','124 Fake Street','San Diego','CA','92101');
SET IDENTITY_INSERT Customer OFF;

-- Insert data for Account, inserting ID values explicitly
SET IDENTITY_INSERT Account ON;
-- John Doe: Customer ID=1, Account ID=1
INSERT INTO Account
(AccountId, CustomerId, CreatedDate, AccountNumber, Balance)
VALUES (1, 1, '2013-06-09', '1000', 937.67);
-- John Doe: Customer ID=1, Account ID=2
INSERT INTO Account
(AccountId, CustomerId, CreatedDate, AccountNumber, Balance)
VALUES (2, 1, '2013-07-28', '1001', 5000);
-- Jane Doe: Customer ID=2, Account ID=3
INSERT INTO Account
(AccountId, CustomerId, CreatedDate, AccountNumber, Balance)
VALUES (3, 2, '2014-02-01', '1002', 1197465.05);
SET IDENTITY_INSERT Account OFF;

-- Insert data for [Transaction], inserting ID values implicitly
-- (John Doe: Customer ID=1) Account ID=1
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (1, '2013-06-09', 1000);
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (1, '2013-06-10', -55.34);
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (1, '2013-07-22', -6.99);
-- (John Doe: Customer ID=1) Account ID=2
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-07-28', 1000);
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-08-28', 1000);
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-09-28', 1000);
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-09-28', 1000);
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (2, '2013-10-28', 1000);
-- (Jane Doe: Customer ID=2) Account ID=3
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (3, '2014-02-01', 1200000);
INSERT INTO [Transaction]
(AccountId, TransactionDate, Amount)
VALUES (3, '2014-02-10', -2534.95);

-- Insert data for Statement, inserting ID values implicitly
-- (John Doe: Customer ID=1) Account ID=1
INSERT INTO [Statement]
(AccountId, StartDate, EndDate)
VALUES (1, '2013-06-09', '2013-06-30');
INSERT INTO [Statement]
(AccountId, StartDate, EndDate)
VALUES (1, '2013-07-01', '2013-07-31');
-- (John Doe: Customer ID=1) Account ID=2
INSERT INTO [Statement]
(AccountId, StartDate, EndDate)
VALUES (2, '2013-07-28', '2013-07-31');
INSERT INTO [Statement]
(AccountId, StartDate, EndDate)
VALUES (2, '2013-08-01', '2013-08-31');
INSERT INTO [Statement]
(AccountId, StartDate, EndDate)
VALUES (2, '2013-09-01', '2013-09-30');
INSERT INTO [Statement]
(AccountId, StartDate, EndDate)
VALUES (2, '2013-10-01', '2013-10-31');
-- (Jane Doe: Customer ID=2) Account ID=3
INSERT INTO [Statement]
(AccountId, StartDate, EndDate)
VALUES (3, '2014-02-01', '2014-02-28');






