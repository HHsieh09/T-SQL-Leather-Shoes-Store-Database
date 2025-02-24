--Execute the Stored Procedures Here, the Database will be Created, Inserted with Data with ETL, and Query to Solve 3 Business Issues

--Create and Insert Data with ETL
--IMPORTANT! IMPORT THE FLAT FILES FIRST!
PRINT 'Executing ExecuteAllETLProcesses'
EXEC ExecuteAllETLProcesses;
PRINT 'ExecuteAllETLProcesses Executed Successful'	

--Query Customers who Frequently Purchased Excluding Employees, You can Set the Minimum Amount of Total Orders by Modifying @BoundaryAmount Here or Using the Default Value of 0
PRINT 'Executing QueryFrequentCustomers'
EXEC QueryFrequentCustomers;
--@BoundaryAmount = 
PRINT 'QueryFrequentCustomers Executed Successful'	

--Identify Current Stock Levels and Assesses the Need for Additional Inventory Orders from Suppliers, You can Set the Minimum Stock Threshold by Modifying @StockThreshold Here or Using the Default Value of 30
PRINT 'Executing InventoryAnalysis'
EXEC InventoryAnalysis;
--@StockThreshold = 
PRINT 'InventoryAnalysis Executed Successful'	

--Analyze the Sales Performance of Employees, , You can Set the Minimum Revenue Boundary & Performance Category by Modifying @RevenueThreshold & @PerformanceCategory Here or Using the Default Value of 0.00 & NULL
PRINT 'Executing EmployeePerformance'
EXEC EmployeePerformance;
--@RevenueThreshold
--@PerformanceCategory
--Top Performer
--Good Performer
--Needs Improvement
PRINT 'EmployeePerformance Executed Successful'	