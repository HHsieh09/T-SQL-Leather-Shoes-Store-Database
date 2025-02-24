--Create Stored Procedure for Identifing the Stock and Check if is Required to Order More Inventory from Suppliers
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InventoryAnalysis')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InventoryAnalysis
GO

CREATE PROCEDURE InventoryAnalysis

--Ensure Stored Procedure Can Run Even without Declaring Parameters
@StockThreshold INT = 30 -- Filter by Minimum Stock Threshold

AS
BEGIN

    -- Check Inventory and Supplier Related Information
    SELECT 
        I.InventoryID,
        IT.InventoryType,
        I.StockQuantity,
		--Categorize the Stock Qunatity
        CASE 
            WHEN I.StockQuantity < 50 THEN 'Low'
            WHEN I.StockQuantity BETWEEN 50 AND 150 THEN 'Normal'
            ELSE 'Many'
        END AS StockStatus,
        S.Supplier,
        ID.Quantity AS PurchasedQuantity,
        ID.UnitCost AS PurchaseCost,
        D.EndTime AS DeliveryEnd
    FROM Inventory I
    INNER JOIN InventoryType IT ON I.InventoryTypeID = IT.InventoryTypeID
    INNER JOIN InventoryPurchaseDetail ID ON I.InventoryID = ID.InventoryID
    INNER JOIN InventoryPurchase IU ON ID.InventoryPurchaseID = IU.InventoryPurchaseID
    INNER JOIN Supplier S ON IU.SupplierID = S.SupplierID
    INNER JOIN Delivery D ON IU.DeliveryID = D.DeliveryID
    WHERE I.StockQuantity < @StockThreshold
    ORDER BY I.StockQuantity
END
GO