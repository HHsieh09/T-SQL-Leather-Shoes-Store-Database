--Create Stored Procedure for ETL Process -> Order Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkOrder')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkOrder
GO

CREATE PROCEDURE InsertBulkOrder
AS
BEGIN

	--Prepare Parameters for Order Table
	DECLARE @OrderID INT
	, @BranchID INT
	, @EmployeeID INT
	, @CustomerID INT
	, @InventoryID VARCHAR(30)
	, @InvoiceDate DATETIME
	, @AddressID INT
	, @PaymentMethod VARCHAR(30)
	, @DeliveryTypeID INT
	, @DeliverySupplierID INT
	, @DeliveryStatusID INT
	, @StartTime DATETIME
	, @EndTime DATETIME
	, @ConfirmedStatusID INT
	, @UnitPrice DECIMAL(10,2)
	, @Quantity INT
	, @Tax DECIMAL(10,2)
	, @OrderDate DATETIME
	, @PromotionID VARCHAR(30)

	DECLARE @DeliveryID INT
	, @OrderDetailID INT
	, @InvoiceID INT
	, @PaymentMethodID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT OrderID, OrderDate, BranchID, InvoiceDate, CustomerID, DeliveryTypeID, DeliverySupplierID, DeliveryStatusID, StartTime, EndTime, AddressID, EmployeeID
	, InventoryID, UnitPrice, Quantity, Tax, PromotionID, PaymentMethodID, ConfirmedStatusID
	FROM OrderData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @OrderID, @OrderDate, @BranchID, @InvoiceDate, @CustomerID, @DeliveryTypeID, @DeliverySupplierID, @DeliveryStatusID, @StartTime, @EndTime, @AddressID, @EmployeeID
	, @InventoryID, @UnitPrice, @Quantity, @Tax, @PromotionID, @PaymentMethod, @ConfirmedStatusID

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting Delivery Data
		IF NOT EXISTS ( SELECT * FROM Delivery
						WHERE DeliveryTypeID = @DeliveryTypeID
						AND DeliverySupplierID = @DeliverySupplierID
						AND DeliveryStatusID = @DeliveryStatusID
						AND StartTime = @StartTime
						AND EndTime = @EndTime)
		BEGIN
			INSERT INTO Delivery(DeliveryTypeID, DeliverySupplierID, DeliveryStatusID, StartTime, EndTime) VALUES (@DeliveryTypeID, @DeliverySupplierID, @DeliveryStatusID, @StartTime, @EndTime)
		END
		SET @DeliveryID = (SELECT DeliveryID FROM Delivery WHERE DeliveryTypeID = @DeliveryTypeID
						AND DeliverySupplierID = @DeliverySupplierID
						AND DeliveryStatusID = @DeliveryStatusID
						AND StartTime = @StartTime
						AND EndTime = @EndTime)
		PRINT 'DeliveryID'
		PRINT @DeliveryID

		--Inserting PaymentMethod Data
		IF NOT EXISTS ( SELECT * FROM PaymentMethod
						WHERE PaymentMethod = @PaymentMethod)
		BEGIN
			INSERT INTO PaymentMethod(PaymentMethod) VALUES (@PaymentMethod)
		END
		SET @PaymentMethodID = (SELECT PaymentMethodID FROM PaymentMethod WHERE PaymentMethod = @PaymentMethod)
		PRINT 'PaymentMethodID'
		PRINT @PaymentMethodID

		--Inserting Invoice Data
		IF NOT EXISTS ( SELECT * FROM Invoice
						WHERE InvoiceDate = @InvoiceDate)
		BEGIN
			INSERT INTO Invoice(InvoiceDate) VALUES (@InvoiceDate)
		END
		SET @InvoiceID = (SELECT InvoiceID FROM Invoice WHERE InvoiceDate = @InvoiceDate)
		PRINT 'InvoiceID'
		PRINT @InvoiceID

		--Inserting Order Data
		IF NOT EXISTS ( SELECT * FROM [Order]
						WHERE OrderDate = @OrderDate)
		BEGIN
			INSERT INTO [Order](BranchID, EmployeeID, CustomerID, InvoiceID, AddressID, PaymentMethodID, DeliveryID, ConfirmStatusID, Tax, OrderDate) VALUES (@BranchID, @EmployeeID, @CustomerID, @InvoiceID, @AddressID, @PaymentMethodID, @DeliveryID, @ConfirmedStatusID, @Tax, @OrderDate)
		END
		SET @OrderID = (SELECT OrderID FROM [Order] WHERE OrderDate = @OrderDate)
		PRINT 'OrderID'
		PRINT @OrderID

		--Inserting OrderDetail Data
		IF NOT EXISTS ( SELECT * FROM OrderDetail
						WHERE OrderID = @OrderID
						AND PromotionID = @PromotionID
						AND UnitPrice = @UnitPrice
						AND Quantity = @Quantity)
		BEGIN
			INSERT INTO OrderDetail(InventoryID, OrderID, PromotionID, UnitPrice, Quantity) VALUES (@InventoryID, @OrderID, @PromotionID, @UnitPrice, @Quantity)
		END
		SET @OrderDetailID = (SELECT OrderDetailID FROM OrderDetail WHERE OrderID = @OrderID
						AND PromotionID = @PromotionID
						AND UnitPrice = @UnitPrice
						AND Quantity = @Quantity)
		PRINT 'OrderDetailID'
		PRINT @OrderDetailID

		FETCH NEXT FROM ImportCursor
		INTO @OrderID, @OrderDate, @BranchID, @InvoiceDate, @CustomerID, @DeliveryTypeID, @DeliverySupplierID, @DeliveryStatusID, @StartTime, @EndTime, @AddressID, @EmployeeID
	, @InventoryID, @UnitPrice, @Quantity, @Tax, @PromotionID, @PaymentMethod, @ConfirmedStatusID

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO