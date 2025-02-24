--Create Stored Procedure for ETL Process -> InventoryPurchaseDetail Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkInventoryPurchaseDetail')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkInventoryPurchaseDetail
GO

CREATE PROCEDURE InsertBulkInventoryPurchaseDetail
AS
BEGIN

	--Prepare Parameters for InventoryPurchaseDetail Table
	DECLARE @InventoryPurchaseID INT
	, @InventoryID VARCHAR(30)
	, @Color VARCHAR(30)
	, @Size FLOAT
	, @Quantity INT
	, @UnitCost	DECIMAL(10,2)
	, @SignOffStatus VARCHAR(30)
	, @ConfirmStatus VARCHAR(30)
	, @DeliveryType VARCHAR(30)
	, @DeliverySupplier VARCHAR(30)
	, @DeliveryStatus VARCHAR(30)
	, @Supplier VARCHAR(30)
	, @StartTime DATETIME
	, @EndTime DATETIME
	, @OrderDate DATETIME
	, @SupplierID INT

	DECLARE @ColorID INT
	, @SizeID INT
	, @SignOffStatusID INT
	, @ConfirmStatusID INT
	, @DeliveryTypeID INT
	, @DeliverySupplierID INT
	, @DeliveryStatusID INT
	, @DeliveryID INT
	, @InventoryPurchaseDetailID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT InventoryPurchaseID, SupplierID, DeliveryType, DeliverySupplier, DeliveryStatus, StartTime, EndTime, OrderDate, SignOffStatus, ConfirmStatus, InventoryID, ColorID, Size, Quantity, UnitCost
	FROM InventoryPurchaseData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @InventoryPurchaseID, @SupplierID, @DeliveryType, @DeliverySupplier, @DeliveryStatus, @StartTime, @EndTime, @OrderDate, @SignOffStatus, @ConfirmStatus, @InventoryID, @Color, @Size, @Quantity, @UnitCost

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting Color Data
		IF NOT EXISTS ( SELECT * FROM Color
						WHERE Color = @Color)
		BEGIN
			INSERT INTO Color(Color) VALUES (@Color)
		END
		SET @ColorID = (SELECT ColorID FROM Color WHERE Color = @Color)
		PRINT 'ColorID'
		PRINT @ColorID

		--Inserting Size Data
		IF NOT EXISTS ( SELECT * FROM Size
						WHERE Size = @Size)
		BEGIN
			INSERT INTO Size(Size) VALUES (@Size)
		END
		SET @SizeID = (SELECT SizeID FROM Size WHERE Size = @Size)
		PRINT 'SizeID'
		PRINT @SizeID

		--Inserting SignOffStatus Data
		IF NOT EXISTS ( SELECT * FROM SignOffStatus
						WHERE SignOffStatus = @SignOffStatus)
		BEGIN
			INSERT INTO SignOffStatus(SignOffStatus) VALUES (@SignOffStatus)
		END
		SET @SignOffStatusID = (SELECT SignOffStatusID FROM SignOffStatus WHERE SignOffStatus = @SignOffStatus)
		PRINT 'SignOffStatusID'
		PRINT @SignOffStatusID

		--Inserting ConfirmStatus Data
		IF NOT EXISTS ( SELECT * FROM ConfirmStatus
						WHERE ConfirmStatus = @ConfirmStatus)
		BEGIN
			INSERT INTO ConfirmStatus(ConfirmStatus) VALUES (@ConfirmStatus)
		END
		SET @ConfirmStatusID = (SELECT ConfirmStatusID FROM ConfirmStatus WHERE ConfirmStatus = @ConfirmStatus)
		PRINT 'ConfirmStatusID'
		PRINT @ConfirmStatusID

		--Inserting DeliveryType Data
		IF NOT EXISTS ( SELECT * FROM DeliveryType
						WHERE DeliveryType = @DeliveryType)
		BEGIN
			INSERT INTO DeliveryType(DeliveryType) VALUES (@DeliveryType)
		END
		SET @DeliveryTypeID = (SELECT DeliveryTypeID FROM DeliveryType WHERE DeliveryType = @DeliveryType)
		PRINT 'DeliveryTypeID'
		PRINT @DeliveryTypeID

		--Inserting DeliverySupplier Data
		IF NOT EXISTS ( SELECT * FROM DeliverySupplier
						WHERE DeliverySupplier = @DeliverySupplier)
		BEGIN
			INSERT INTO DeliverySupplier(DeliverySupplier) VALUES (@DeliverySupplier)
		END
		SET @DeliverySupplierID = (SELECT DeliverySupplierID FROM DeliverySupplier WHERE DeliverySupplier = @DeliverySupplier)
		PRINT 'DeliverySupplierID'
		PRINT @DeliverySupplierID

		--Inserting DeliveryStatus Data
		IF NOT EXISTS ( SELECT * FROM DeliveryStatus
						WHERE DeliveryStatus = @DeliveryStatus)
		BEGIN
			INSERT INTO DeliveryStatus(DeliveryStatus) VALUES (@DeliveryStatus)
		END
		SET @DeliveryStatusID = (SELECT DeliveryStatusID FROM DeliveryStatus WHERE DeliveryStatus = @DeliveryStatus)
		PRINT 'DeliveryStatusID'
		PRINT @DeliveryStatusID

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

		--Inserting InventoryPurchase Data
		IF NOT EXISTS ( SELECT * FROM InventoryPurchase
						WHERE SupplierID = @SupplierID
						AND DeliveryID = @DeliveryID
						AND SignOffStatusID = @SignOffStatusID
						AND ConfirmStatusID = @ConfirmStatusID
						AND OrderDate = @OrderDate)
		BEGIN
			INSERT INTO InventoryPurchase(SupplierID, DeliveryID, SignOffStatusID, ConfirmStatusID, OrderDate) VALUES (@SupplierID, @DeliveryID, @SignOffStatusID, @ConfirmStatusID, @OrderDate)
		END
		SET @InventoryPurchaseID = (SELECT InventoryPurchaseID FROM InventoryPurchase WHERE SupplierID = @SupplierID
						AND DeliveryID = @DeliveryID
						AND SignOffStatusID = @SignOffStatusID
						AND ConfirmStatusID = @ConfirmStatusID
						AND OrderDate = @OrderDate)
		PRINT 'InventoryPurchaseID'
		PRINT @InventoryPurchaseID

		--Inserting InventoryPurchaseDetail Data
		IF NOT EXISTS ( SELECT * FROM InventoryPurchaseDetail
						WHERE InventoryPurchaseID = @InventoryPurchaseID
						AND InventoryID = @InventoryID
						AND ColorID = @ColorID
						AND SizeID = @SizeID
						AND Quantity = @Quantity
						AND UnitCost = @UnitCost)
		BEGIN
			INSERT INTO InventoryPurchaseDetail(InventoryPurchaseID, InventoryID, ColorID, SizeID, Quantity, UnitCost) VALUES (@InventoryPurchaseID, @InventoryID, @ColorID, @SizeID, @Quantity, @UnitCost)
		END
		SET @InventoryPurchaseDetailID = (SELECT InventoryPurchaseDetailID FROM InventoryPurchaseDetail WHERE InventoryPurchaseID = @InventoryPurchaseID
						AND InventoryID = @InventoryID
						AND ColorID = @ColorID
						AND SizeID = @SizeID
						AND Quantity = @Quantity
						AND UnitCost = @UnitCost)
		PRINT 'InventoryPurchaseDetailID'
		PRINT @InventoryPurchaseDetailID

		FETCH NEXT FROM ImportCursor
		INTO @InventoryPurchaseID, @Supplier, @DeliveryType, @DeliverySupplier, @DeliveryStatus, @StartTime, @EndTime, @OrderDate, @SignOffStatus, @ConfirmStatus, @InventoryID, @Color, @Size, @Quantity, @UnitCost

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO