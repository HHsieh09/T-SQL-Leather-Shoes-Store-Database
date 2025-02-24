--Create Stored Procedure for Query Frequently Purchase Customers Excluding Employees
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'QueryFrequentCustomers')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE QueryFrequentCustomers
GO

CREATE PROCEDURE QueryFrequentCustomers

--Ensure Stored Procedure Can Run Even without Declaring Parameters
@BoundaryAmount INT = 0 -- Filter by Minimum Amount of Total Orders

AS
BEGIN

    SELECT 
        C.CustomerID,
        CONCAT(P.FirstName, ' ', P.LastName) AS CustomerName,
        COUNT(O.OrderID) AS TotalOrders,
        MAX(O.OrderDate) AS LastPurchaseDate
    FROM Customer C
    INNER JOIN Person P ON C.PersonID = P.PersonID
    INNER JOIN [Order] O ON C.CustomerID = O.CustomerID
	--Exclude Employee But Being Customer
	LEFT JOIN Employee E ON P.PersonID = E.PersonID
	WHERE E.PersonID IS NULL
    GROUP BY C.CustomerID, P.FirstName, P.LastName
    HAVING COUNT(O.OrderID) >= @BoundaryAmount
    ORDER BY TotalOrders DESC

END