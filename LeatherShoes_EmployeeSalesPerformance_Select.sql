--Create Stored Procedure for Analyzing Employee Sales Performance and Able to Filter by Minimum Revenue Boundary & Performance Category
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'EmployeePerformance')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE EmployeePerformance
GO

CREATE PROCEDURE EmployeePerformance

--Ensure Stored Procedure Can Run Even without Declaring Parameters
@RevenueThreshold DECIMAL(10, 2) = 0.00 -- Filter by Minimum Revenue Threshold
, @PerformanceCategory VARCHAR(20) = NULL -- Filter by Performance Category

AS
BEGIN

    -- Create A Temp Table for Capturing Aggregated Sales
    CREATE TABLE #SalesSummary (
        EmployeeID INT
        , TotalOrders INT
        , TotalRevenue DECIMAL(10, 2)
        , PerformanceCategory VARCHAR(20)
    )

    -- Insert Data into Temp Table
    INSERT INTO #SalesSummary (EmployeeID, TotalOrders, TotalRevenue, PerformanceCategory)
    SELECT 
        E.EmployeeID,
        COUNT(O.OrderID) AS TotalOrders,
        SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue,
		--Categorize the Total Revenue
        CASE 
            WHEN SUM(OD.Quantity * OD.UnitPrice) > 10000 THEN 'Top Performer'
            WHEN SUM(OD.Quantity * OD.UnitPrice) BETWEEN 5000 AND 10000 THEN 'Good Performer'
            ELSE 'Needs Improvement'
        END AS PerformanceCategory
    FROM Employee E
    INNER JOIN [Order] O ON E.EmployeeID = O.EmployeeID
    INNER JOIN OrderDetail OD ON O.OrderID = OD.OrderID
    GROUP BY E.EmployeeID

    -- Query Table & Filter the Data by Parameters
    SELECT 
        SS.EmployeeID,
        CONCAT(P.FirstName, ' ', P.LastName) AS EmployeeName,
        SS.TotalOrders,
        SS.TotalRevenue,
        SS.PerformanceCategory
    FROM #SalesSummary SS
    INNER JOIN Employee E ON SS.EmployeeID = E.EmployeeID
    INNER JOIN Person P ON E.PersonID = P.PersonID
    WHERE SS.TotalRevenue >= @RevenueThreshold -- Filter by Minimum Threshold
			 AND (@PerformanceCategory IS NULL OR SS.PerformanceCategory = @PerformanceCategory) -- Filter by Performance Category
    ORDER BY SS.TotalRevenue DESC

    -- Drop Temp Table
    DROP TABLE #SalesSummary
END
GO