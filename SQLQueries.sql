USE LargeBank;
GO
--Show all Customers
SELECT * from Customer;

--Show all Customers with a balance greater than 50,000
 SELECT * FROM Customer 
 WHERE 
 (SELECT SUM(Balance) FROM Account WHERE Account.CustomerId=Customer.CustomerId) > 50000;
 --SELECT Customer.CustomerId,Customer.FirstName FROM Customer JOIN Account ON Customer.CustomerId=Account.CustomerId
 --GROUP BY Customer.CustomerId,Customer.FirstName
 --HAVING SUM(Balance) > 50000

 --Show all Transactions for Account #1001 that would be included 
 -- in the statement beginning 2013-08-01
 SELECT * FROM [Transaction] WHERE
 AccountId=(SELECT AccountId from Account WHERE AccountNumber='1001') AND
 TransactionDate BETWEEN 
 (SELECT StartDate FROM Statement 
 WHERE Statement.AccountId=(SELECT AccountId from Account WHERE AccountNumber='1001') 
 AND StartDate='2013-08-01') AND 
 (SELECT EndDate FROM Statement 
 WHERE Statement.AccountId=(SELECT AccountId from Account WHERE AccountNumber='1001') 
 AND StartDate='2013-08-01')


 