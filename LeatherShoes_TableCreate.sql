IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'CreateTables')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE CreateTables
GO

CREATE PROCEDURE CreateTables
AS
BEGIN

--InventoryShown
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[InventoryShown]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE InventoryShown
	(
	InventoryShownID INT PRIMARY KEY IDENTITY(1,1)
	, InventoryShown VARCHAR(30)
	)
	PRINT('Create InventoryShown Table')
END
ELSE
BEGIN
	PRINT 'InventoryShown Table Exists'
END


--Fax
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Fax]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Fax
	(
	FaxID INT PRIMARY KEY IDENTITY(1,1)
	, FaxNumber VARCHAR(20)
	)
	PRINT('Create Fax Table')
END
ELSE
BEGIN
	PRINT 'Fax Table Exists'
END


--BranchCategory
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[BranchCategory]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE BranchCategory
	(
	BranchCategoryID INT PRIMARY KEY IDENTITY(1,1)
	, BranchCategory VARCHAR(30)
	)
	PRINT('Create BranchCategory Table')
END
ELSE
BEGIN
	PRINT 'BranchCategory Table Exists'
END


--AddressType
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[AddressType]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE AddressType
	(
	AddressTypeID INT PRIMARY KEY IDENTITY(1,1)
	, AddressType VARCHAR(30)
	)
	PRINT('Create AddressType Table')
END
ELSE
BEGIN
	PRINT 'AddressType Table Exists'
END


--EmailType
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[EmailType]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE EmailType
	(
	EmailTypeID INT PRIMARY KEY IDENTITY(1,1)
	, EmailType VARCHAR(30)
	)
	PRINT('Create EmailType Table')
END
ELSE
BEGIN
	PRINT 'EmailType Table Exists'
END


--TransactionType
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[TransactionType]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE TransactionType
	(
	TransactionTypeID INT PRIMARY KEY IDENTITY(1,1)
	, TransactionType VARCHAR(30)
	)
	PRINT('Create TransactionType Table')
END
ELSE
BEGIN
	PRINT 'TransactionType Table Exists'
END


--CostCategory
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[CostCategory]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE CostCategory
	(
	CostCategoryID INT PRIMARY KEY IDENTITY(1,1)
	, CostCategory VARCHAR(30)
	)
	PRINT('Create CostCategory Table')
END
ELSE
BEGIN
	PRINT 'CostCategory Table Exists'
END


--MarriageStatus
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[MarriageStatus]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE MarriageStatus
	(
	MarriageStatusID INT PRIMARY KEY IDENTITY(1,1)
	, MarriageStatus VARCHAR(30)
	)
	PRINT('Create MarriageStatus Table')
END
ELSE
BEGIN
	PRINT 'MarriageStatus Table Exists'
END


--ValidStatus
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[ValidStatus]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE ValidStatus
	(
	ValidStatusID INT PRIMARY KEY IDENTITY(1,1)
	, ValidStatus VARCHAR(30)
	)
	PRINT('Create ValidStatus Table')
END
ELSE
BEGIN
	PRINT 'ValidStatus Table Exists'
END


--CostCategory
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[CostCategory]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE CostCategory
	(
	CostCategoryID INT PRIMARY KEY IDENTITY(1,1)
	, CostCategory VARCHAR(30)
	)
	PRINT('Create CostCategory Table')
END
ELSE
BEGIN
	PRINT 'CostCategory Table Exists'
END


--PreferredContact
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[PreferredContact]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE PreferredContact
	(
	PreferredContactID INT PRIMARY KEY IDENTITY(1,1)
	, PreferredContact VARCHAR(30)
	)
	PRINT('Create PreferredContact Table')
END
ELSE
BEGIN
	PRINT 'PreferredContact Table Exists'
END


--PhoneNumberType
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[PhoneNumberType]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE PhoneNumberType
	(
	PhoneNumberTypeID INT PRIMARY KEY IDENTITY(1,1)
	, PhoneNumberType VARCHAR(30)
	)
	PRINT('Create PhoneNumberType Table')
END
ELSE
BEGIN
	PRINT 'PhoneNumberType Table Exists'
END


--JobTitle
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[JobTitle]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE JobTitle
	(
	JobTitleID INT PRIMARY KEY IDENTITY(1,1)
	, JobTitle VARCHAR(30)
	)
	PRINT('Create JobTitle Table')
END
ELSE
BEGIN
	PRINT 'JobTitle Table Exists'
END


--PromotionType
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[PromotionType]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE PromotionType
	(
	PromotionTypeID INT PRIMARY KEY IDENTITY(1,1)
	, PromotionType VARCHAR(30)
	)
	PRINT('Create PromotionType Table')
END
ELSE
BEGIN
	PRINT 'PromotionType Table Exists'
END


--SupplierType
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[SupplierType]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE SupplierType
	(
	SupplierTypeID INT PRIMARY KEY IDENTITY(1,1)
	, SupplierType VARCHAR(30)
	)
	PRINT('Create SupplierType Table')
END
ELSE
BEGIN
	PRINT 'SupplierType Table Exists'
END


--ShiftType
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[ShiftType]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE ShiftType
	(
	ShiftTypeID INT PRIMARY KEY IDENTITY(1,1)
	, ShiftType VARCHAR(30)
	)
	PRINT('Create ShiftType Table')
END
ELSE
BEGIN
	PRINT 'ShiftType Table Exists'
END


--Invoice
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Invoice]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Invoice
	(
	InvoiceID INT PRIMARY KEY IDENTITY(1,1)
	, InvoiceDate DATETIME
	)
	PRINT('Create Invoice Table')
END
ELSE
BEGIN
	PRINT 'Invoice Table Exists'
END


--PaymentMethod
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[PaymentMethod]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE PaymentMethod
	(
	PaymentMethodID INT PRIMARY KEY IDENTITY(1,1)
	, PaymentMethod VARCHAR(30)
	)
	PRINT('Create PaymentMethod Table')
END
ELSE
BEGIN
	PRINT 'PaymentMethod Table Exists'
END


--DeliveryType
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[DeliveryType]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE DeliveryType
	(
	DeliveryTypeID INT PRIMARY KEY IDENTITY(1,1)
	, DeliveryType VARCHAR(30)
	)
	PRINT('Create DeliveryType Table')
END
ELSE
BEGIN
	PRINT 'DeliveryType Table Exists'
END


--DeliveryStatus
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[DeliveryStatus]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE DeliveryStatus
	(
	DeliveryStatusID INT PRIMARY KEY IDENTITY(1,1)
	, DeliveryStatus VARCHAR(30)
	)
	PRINT('Create DeliveryStatus Table')
END
ELSE
BEGIN
	PRINT 'DeliveryStatus Table Exists'
END


--Color
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Color]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Color
	(
	ColorID INT PRIMARY KEY IDENTITY(1,1)
	, Color VARCHAR(30)
	)
	PRINT('Create Color Table')
END
ELSE
BEGIN
	PRINT 'Color Table Exists'
END


--Size
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Size]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Size
	(
	SizeID INT PRIMARY KEY IDENTITY(1,1)
	, Size VARCHAR(30)
	)
	PRINT('Create Size Table')
END
ELSE
BEGIN
	PRINT 'Size Table Exists'
END


--InventoryType
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[InventoryType]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE InventoryType
	(
	InventoryTypeID INT PRIMARY KEY IDENTITY(1,1)
	, InventoryType VARCHAR(30)
	)
	PRINT('Create InventoryType Table')
END
ELSE
BEGIN
	PRINT 'InventoryType Table Exists'
END


--DeliverySupplier
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[DeliverySupplier]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE DeliverySupplier
	(
	DeliverySupplierID INT PRIMARY KEY IDENTITY(1,1)
	, DeliverySupplier VARCHAR(30)
	)
	PRINT('Create DeliverySupplier Table')
END
ELSE
BEGIN
	PRINT 'DeliverySupplier Table Exists'
END


--Gender
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Gender]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Gender
	(
	GenderID INT PRIMARY KEY IDENTITY(1,1)
	, Gender VARCHAR(30)
	)
	PRINT('Create Gender Table')
END
ELSE
BEGIN
	PRINT 'Gender Table Exists'
END


--SignOffStatus
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[SignOffStatus]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE SignOffStatus
	(
	SignOffStatusID INT PRIMARY KEY IDENTITY(1,1)
	, SignOffStatus VARCHAR(30)
	)
	PRINT('Create SignOffStatus Table')
END
ELSE
BEGIN
	PRINT 'SignOffStatus Table Exists'
END


--ConfirmStatus
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[ConfirmStatus]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE ConfirmStatus
	(
	ConfirmStatusID INT PRIMARY KEY IDENTITY(1,1)
	, ConfirmStatus VARCHAR(30)
	)
	PRINT('Create ConfirmStatus Table')
END
ELSE
BEGIN
	PRINT 'ConfirmStatus Table Exists'
END


--SoleMaterial
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[SoleMaterial]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE SoleMaterial
	(
	SoleMaterialID INT PRIMARY KEY IDENTITY(1,1)
	, SoleMaterial VARCHAR(30)
	)
	PRINT('Create SoleMaterial Table')
END
ELSE
BEGIN
	PRINT 'SoleMaterial Table Exists'
END


--UpperMaterial
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[UpperMaterial]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE UpperMaterial
	(
	UpperMaterialID INT PRIMARY KEY IDENTITY(1,1)
	, UpperMaterial VARCHAR(30)
	)
	PRINT('Create UpperMaterial Table')
END
ELSE
BEGIN
	PRINT 'UpperMaterial Table Exists'
END

--3 Layers+


--MembershipLevel
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[MembershipLevel]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE MembershipLevel
	(
	MembershipLevelID INT PRIMARY KEY IDENTITY(1,1)
	, MembershipLevel VARCHAR(30)
	, EffectiveDate DATETIME
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create MembershipLevel Table')
END
ELSE
BEGIN
	PRINT 'MembershipLevel Table Exists'
END


--Shift
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Shift]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE [Shift]
	(
	ShiftID INT PRIMARY KEY IDENTITY(1,1)
	, ShiftTypeID INT FOREIGN KEY REFERENCES ShiftType(ShiftTypeID)
	, StartTime DATETIME
	, EndTime DATETIME

	)
	PRINT('Create Shift Table')
END
ELSE
BEGIN
	PRINT 'Shift Table Exists'
END


--Supplier
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Supplier]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Supplier
	(
	SupplierID INT PRIMARY KEY IDENTITY(1,1)
	, SupplierTypeID INT FOREIGN KEY REFERENCES SupplierType(SupplierTypeID)
	, Supplier VARCHAR(30)
	)
	PRINT('Create Supplier Table')
END
ELSE
BEGIN
	PRINT 'Supplier Table Exists'
END


--Promotion
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Promotion]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Promotion
	(
	PromotionID VARCHAR(30) PRIMARY KEY
	, PromotionTypeID INT FOREIGN KEY REFERENCES PromotionType(PromotionTypeID)
	, PromotionName	VARCHAR(30)
	, DiscountAmount FLOAT
	, StartDate	DATETIME
	, EndDate DATETIME
	)
	PRINT('Create Promotion Table')
END
ELSE
BEGIN
	PRINT 'Promotion Table Exists'
END


--SalaryGrade
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[SalaryGrade]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE SalaryGrade
	(
	SalaryGradeID INT PRIMARY KEY IDENTITY(1,1)
	, GradeName	VARCHAR(30)
	, MinSalary	DECIMAL(10,2)
	, MaxSalary	DECIMAL(10,2)
	)
	PRINT('Create SalaryGrade Table')
END
ELSE
BEGIN
	PRINT 'SalaryGrade Table Exists'
END


--Delivery
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Delivery]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Delivery
	(
	DeliveryID INT PRIMARY KEY IDENTITY(1,1)
	, DeliveryTypeID INT FOREIGN KEY REFERENCES DeliveryType(DeliveryTypeID)
	, DeliverySupplierID INT FOREIGN KEY REFERENCES DeliverySupplier(DeliverySupplierID)
	, DeliveryStatusID INT FOREIGN KEY REFERENCES DeliveryStatus(DeliveryStatusID)
	, StartTime DATETIME
	, EndTime DATETIME
	)
	PRINT('Create Delivery Table')
END
ELSE
BEGIN
	PRINT 'Delivery Table Exists'
END


--Inventory
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Inventory]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Inventory
	(
	InventoryID VARCHAR(30) PRIMARY KEY
	, InventoryTypeID INT FOREIGN KEY REFERENCES InventoryType(InventoryTypeID)
	, UpperMaterialID INT FOREIGN KEY REFERENCES UpperMaterial(UpperMaterialID)
	, SoleMaterialID INT FOREIGN KEY REFERENCES SoleMaterial(SoleMaterialID)
	, StockQuantity INT
	, SellingPrice DECIMAL(10,2)
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create Inventory Table')
END
ELSE
BEGIN
	PRINT 'Inventory Table Exists'
END


--InventoryPurchase
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[InventoryPurchase]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE InventoryPurchase
	(
	InventoryPurchaseID INT PRIMARY KEY IDENTITY(1,1)
	, SupplierID INT FOREIGN KEY REFERENCES Supplier(SupplierID)
	, DeliveryID INT FOREIGN KEY REFERENCES Delivery(DeliveryID)
	, SignOffStatusID INT FOREIGN KEY REFERENCES SignOffStatus(SignOffStatusID)
	, ConfirmStatusID INT FOREIGN KEY REFERENCES ConfirmStatus(ConfirmStatusID)
	, OrderDate DATETIME
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create InventoryPurchase Table')
END
ELSE
BEGIN
	PRINT 'InventoryPurchase Table Exists'
END


--InventoryPurchaseDetail
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[InventoryPurchaseDetail]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE InventoryPurchaseDetail
	(
	InventoryPurchaseDetailID INT PRIMARY KEY IDENTITY(1,1)
	, InventoryPurchaseID INT FOREIGN KEY REFERENCES InventoryPurchase(InventoryPurchaseID)
	, InventoryID VARCHAR(30) FOREIGN KEY REFERENCES Inventory(InventoryID)
	, ColorID INT FOREIGN KEY REFERENCES Color(ColorID)
	, SizeID INT FOREIGN KEY REFERENCES Size(SizeID)
	, Quantity INT
	, UnitCost DECIMAL(10,2)
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create InventoryPurchaseDetail Table')
END
ELSE
BEGIN
	PRINT 'InventoryPurchaseDetail Table Exists'
END


--Person
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Person]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Person
	(
	PersonID INT PRIMARY KEY IDENTITY(1,1)
	, GenderID INT FOREIGN KEY REFERENCES Gender(GenderID)
	, MarriageStatusID INT FOREIGN KEY REFERENCES MarriageStatus(MarriageStatusID)
	, FirstName VARCHAR(30)
	, LastName VARCHAR(30)
	, DOB DATETIME
	, SSN VARCHAR(11)
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create Person Table')
END
ELSE
BEGIN
	PRINT 'Person Table Exists'
END


--Employee
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Employee]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Employee
	(
	EmployeeID INT PRIMARY KEY IDENTITY(1,1)
	, PersonID INT FOREIGN KEY REFERENCES Person(PersonID)
	, ValidStatusID INT FOREIGN KEY REFERENCES ValidStatus(ValidStatusID)
	, HireDate DATETIME
	)
	PRINT('Create Employee Table')
END
ELSE
BEGIN
	PRINT 'Employee Table Exists'
END


--Customer
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Customer]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Customer
	(
	CustomerID INT PRIMARY KEY IDENTITY(1,1)
	, PersonID INT FOREIGN KEY REFERENCES Person(PersonID)
	, PreferredContactID INT FOREIGN KEY REFERENCES PreferredContact(PreferredContactID)
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create Customer Table')
END
ELSE
BEGIN
	PRINT 'Customer Table Exists'
END


--Address
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Address]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE [Address]
	(
	AddressID INT PRIMARY KEY IDENTITY(1,1)
	, AddressTypeID	INT FOREIGN KEY REFERENCES AddressType(AddressTypeID)
	, PersonID INT FOREIGN KEY REFERENCES Person(PersonID)
	, Country VARCHAR(30)
	, [State] VARCHAR(30)
	, City VARCHAR(30)
	, Street VARCHAR(60)
	, [Floor] VARCHAR(30)
	, Unit VARCHAR(30)
	)
	PRINT('Create Address Table')
END
ELSE
BEGIN
	PRINT 'Address Table Exists'
END


--PhoneNumber
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[PhoneNumber]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE PhoneNumber
	(
	PhoneNumberID INT PRIMARY KEY IDENTITY(1,1)
	, PhoneNumberTypeID INT FOREIGN KEY REFERENCES PhoneNumberType(PhoneNumberTypeID)
	, PersonID INT FOREIGN KEY REFERENCES Person(PersonID)
	, PhoneNumber VARCHAR(20)
	)
	PRINT('Create PhoneNumber Table')
END
ELSE
BEGIN
	PRINT 'PhoneNumber Table Exists'
END


--Branch
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Branch]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Branch
	(
	BranchID INT PRIMARY KEY IDENTITY(1,1)
	, AddressID INT FOREIGN KEY REFERENCES [Address](AddressID)
	, PhoneNumberID INT FOREIGN KEY REFERENCES PhoneNumber(PhoneNumberID)
	, FaxID INT FOREIGN KEY REFERENCES Fax(FaxID)
	, ValidStatusID INT FOREIGN KEY REFERENCES ValidStatus(ValidStatusID)
	, InventoryShownID INT FOREIGN KEY REFERENCES InventoryShown(InventoryShownID)
	, BranchCategoryID INT FOREIGN KEY REFERENCES BranchCategory(BranchCategoryID)
	, BranchName VARCHAR(30)
	, BranchNameAbbr VARCHAR(30)
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create Branch Table')
END
ELSE
BEGIN
	PRINT 'Branch Table Exists'
END


--Email
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Email]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Email
	(
	EmailID INT PRIMARY KEY IDENTITY(1,1)
	, EmailTypeID INT FOREIGN KEY REFERENCES EmailType(EmailTypeID)
	, PersonID INT FOREIGN KEY REFERENCES Person(PersonID)
	, SupplierID INT FOREIGN KEY REFERENCES Supplier(SupplierID)
	, EmailAddress VARCHAR(30)
	)
	PRINT('Create Email Table')
END
ELSE
BEGIN
	PRINT 'Email Table Exists'
END


--Accounting
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Accounting]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Accounting
	(
	AccountingID INT PRIMARY KEY IDENTITY(1,1)
	, TransactionTypeID INT FOREIGN KEY REFERENCES TransactionType(TransactionTypeID)
	, CostCategoryID INT FOREIGN KEY REFERENCES CostCategory(CostCategoryID)
	, EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID)
	, BranchID INT FOREIGN KEY REFERENCES Branch(BranchID)
	, Amount DECIMAL(10,2)
	, TransactionDate DATETIME
	, [Description] VARCHAR(60)
	)
	PRINT('Create Accounting Table')
END
ELSE
BEGIN
	PRINT 'Accounting Table Exists'
END


--Announcement
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Announcement]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Announcement
	(
	AnnouncementID INT PRIMARY KEY IDENTITY(1,1)
	, EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID)
	, ValidStatusID INT FOREIGN KEY REFERENCES ValidStatus(ValidStatusID)
	, [Description] VARCHAR(200)
	, StartTime DATETIME
	, EndTime DATETIME
	)
	PRINT('Create Announcement Table')
END
ELSE
BEGIN
	PRINT 'Announcement Table Exists'
END


--Schedule
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Schedule]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Schedule
	(
	ScheduleID INT PRIMARY KEY IDENTITY(1,1)
	, EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID)
	, ShiftID INT FOREIGN KEY REFERENCES [Shift](ShiftID)
	, EffectiveDate DATETIME
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create Schedule Table')
END
ELSE
BEGIN
	PRINT 'Schedule Table Exists'
END


--JobHistory
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[JobHistory]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE JobHistory
	(
	JobHistoryID INT PRIMARY KEY IDENTITY(1,1)
	, EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID)
	, BranchID INT FOREIGN KEY REFERENCES Branch(BranchID)
	, JobTitleID INT FOREIGN KEY REFERENCES JobTitle(JobTitleID)
	, EffectiveDate DATETIME
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create JobHistory Table')
END
ELSE
BEGIN
	PRINT 'JobHistory Table Exists'
END


--SalaryHistory
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[SalaryHistory]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE SalaryHistory
	(
	SalaryHistoryID INT PRIMARY KEY IDENTITY(1,1)
	, EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID)
	, SalaryGradeID INT FOREIGN KEY REFERENCES SalaryGrade(SalaryGradeID)
	, HourlyRate DECIMAL(10,2)
	, EffectiveDate DATETIME
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create SalaryHistory Table')
END
ELSE
BEGIN
	PRINT 'SalaryHistory Table Exists'
END


--Track
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Track]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE Track
	(
	TrackID INT PRIMARY KEY IDENTITY(1,1)
	, CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
	, ValidStatusID INT FOREIGN KEY REFERENCES ValidStatus(ValidStatusID)
	, MemberShipLevelID INT FOREIGN KEY REFERENCES MemberShipLevel(MemberShipLevelID)
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create Track Table')
END
ELSE
BEGIN
	PRINT 'Track Table Exists'
END


--SupplierEmployee
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[SupplierEmployee]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE SupplierEmployee
	(
	SupplierEmployeeID INT PRIMARY KEY IDENTITY(1,1)
	, PersonID INT FOREIGN KEY REFERENCES Person(PersonID)
	, SupplierID INT FOREIGN KEY REFERENCES Supplier(SupplierID)
	, ValidStatusID INT FOREIGN KEY REFERENCES ValidStatus(ValidStatusID)
	, [Role] VARCHAR(30)
	)
	PRINT('Create SupplierEmployee Table')
END
ELSE
BEGIN
	PRINT 'SupplierEmployee Table Exists'
END


--Order
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[Order]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE [Order]
	(
	OrderID INT PRIMARY KEY IDENTITY(1,1)
	, BranchID INT FOREIGN KEY REFERENCES Branch(BranchID)
	, EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID)
	, CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
	, InvoiceID INT FOREIGN KEY REFERENCES Invoice(InvoiceID)
	, AddressID INT FOREIGN KEY REFERENCES [Address](AddressID)
	, PaymentMethodID INT FOREIGN KEY REFERENCES PaymentMethod(PaymentMethodID)
	, DeliveryID INT FOREIGN KEY REFERENCES Delivery(DeliveryID)
	, ConfirmStatusID INT FOREIGN KEY REFERENCES ConfirmStatus(ConfirmStatusID)
	, Tax DECIMAL(10,2)
	, OrderDate DATETIME
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create Order Table')
END
ELSE
BEGIN
	PRINT 'Order Table Exists'
END


--OrderDetail
IF NOT EXISTS ( SELECT * FROM sysobjects
				WHERE id = OBJECT_ID(N'[dbo].[OrderDetail]')
				AND OBJECTPROPERTY(id,N'IsUserTable')=1)
BEGIN
	CREATE TABLE OrderDetail
	(
	OrderDetailID INT PRIMARY KEY IDENTITY(1,1)
	, InventoryID VARCHAR(30) FOREIGN KEY REFERENCES Inventory(InventoryID)
	, OrderID INT FOREIGN KEY REFERENCES [Order](OrderID)
	, PromotionID VARCHAR(30) FOREIGN KEY REFERENCES Promotion(PromotionID)
	, UnitPrice DECIMAL(10,2)
	, Quantity INT
	, CreatedDate DATETIME DEFAULT GETDATE()
	, UpdatedDate DATETIME DEFAULT GETDATE()
	)
	PRINT('Create OrderDetail Table')
END
ELSE
BEGIN
	PRINT 'OrderDetail Table Exists'
END

END
GO