--Create Stored Procedure for Executing All the ETL Process
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'ExecuteAllETLProcesses')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE ExecuteAllETLProcesses
GO

CREATE PROCEDURE ExecuteAllETLProcesses
AS
BEGIN

	PRINT 'Executing CreateTables'
    EXEC CreateTables;
    PRINT 'CreateTables Executed Successful'	

	PRINT 'Executing InsertBulkPerson'
    EXEC InsertBulkPerson;
    PRINT 'InsertBulkPerson Executed Successful'

    PRINT 'Executing InsertBulkAddress'
    EXEC InsertBulkAddress;
    PRINT 'InsertBulkAddress Executed Successful'

    PRINT 'Executing InsertBulkPromotion'
    EXEC InsertBulkPromotion;
    PRINT 'InsertBulkPromotion Executed Successful'

    PRINT 'Executing InsertBulkPhoneNumber'
    EXEC InsertBulkPhoneNumber;
    PRINT 'InsertBulkPhoneNumber Executed Successful'

    PRINT 'Executing InsertBulkEmail'
    EXEC InsertBulkEmail;
    PRINT 'InsertBulkEmail Executed Successful'

    PRINT 'Executing InsertBulkCustomer'
    EXEC InsertBulkCustomer;
    PRINT 'InsertBulkCustomer Executed Successful'

    PRINT 'Executing InsertBulkEmployee'
    EXEC InsertBulkEmployee;
    PRINT 'InsertBulkEmployee Executed Successful'

    PRINT 'Executing InsertBulkBranch'
    EXEC InsertBulkBranch;
    PRINT 'InsertBulkBranch Executed Successful'

    PRINT 'Executing InsertBulkAccounting'
    EXEC InsertBulkAccounting;
    PRINT 'InsertBulkAccounting Executed Successful'

    PRINT 'Executing InsertBulkTrack'
    EXEC InsertBulkTrack; 
    PRINT 'InsertBulkTrack Executed Successful'

    PRINT 'Executing InsertBulkAnnouncement'
    EXEC InsertBulkAnnouncement;
    PRINT 'InsertBulkAnnouncement Executed Successful'

    PRINT 'Executing InsertBulkJobHistory'
    EXEC InsertBulkJobHistory;
    PRINT 'InsertBulkJobHistory Executed Successful'

    PRINT 'Executing InsertBulkSalaryHistory'
    EXEC InsertBulkSalaryHistory;
    PRINT 'InsertBulkSalaryHistory Executed Successful'

    PRINT 'Executing InsertBulkSchedule'
    EXEC InsertBulkSchedule;
    PRINT 'InsertBulkSchedule Executed Successful'

    PRINT 'Executing InsertBulkSupplierEmployee'
    EXEC InsertBulkSupplierEmployee;
    PRINT 'InsertBulkSupplierEmployee Executed Successful'

    PRINT 'Executing InsertBulkInventory'
    EXEC InsertBulkInventory;
    PRINT 'InsertBulkInventory Executed Successful'

    PRINT 'Executing InsertBulkInventoryPurchaseDetail'
    EXEC InsertBulkInventoryPurchaseDetail;
    PRINT 'InsertBulkInventoryPurchaseDetail Executed Successful'

    PRINT 'Executing InsertBulkOrder'
    EXEC InsertBulkOrder; 
    PRINT 'InsertBulkOrder Executed Successful'

    PRINT 'All stored procedures Executed Successful'
END