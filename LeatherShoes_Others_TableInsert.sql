--Create Stored Procedure for ETL Process -> Person Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkPerson')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkPerson
GO

CREATE PROCEDURE InsertBulkPerson
AS
BEGIN
		--Prepare Parameters for Person Table
	DECLARE @Gender VARCHAR(30)
		, @MarriageStatus VARCHAR(30)
		, @FirstName VARCHAR(30)
		, @LastName VARCHAR(30)
		, @DOB DATETIME
		, @SSN VARCHAR(11)

	DECLARE @PersonID INT
		, @GenderID INT
		, @MarriageStatusID INT


	DECLARE ImportCursor CURSOR FOR
	SELECT Gender, MarriageStatus, FirstName, LastName, DOB, SSN
	FROM PersonData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @Gender, @MarriageStatus, @FirstName, @LastName, @DOB, @SSN

	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @Gender

		--Inserting Gender Data
		IF NOT EXISTS ( SELECT * FROM Gender
						WHERE Gender = @Gender
						AND Gender IS NOT NULL)
		BEGIN
			INSERT INTO Gender(Gender) VALUES (@Gender)
		END
		SET @GenderID = (SELECT GenderID FROM Gender WHERE Gender = @Gender AND Gender IS NOT NULL)
		PRINT 'GenderID'
		PRINT @GenderID

		--Inserting MarriageStatus Data
		IF NOT EXISTS (SELECT * FROM MarriageStatus 
						WHERE MarriageStatus = @MarriageStatus)
		BEGIN
			INSERT INTO MarriageStatus(MarriageStatus) VALUES (@MarriageStatus)
		END
		SET @MarriageStatusID = (SELECT MarriageStatusID FROM MarriageStatus WHERE MarriageStatus = @MarriageStatus)
		PRINT 'MarriageStatusID'
		PRINT @MarriageStatusID

		--Inserting Person Data
		IF NOT EXISTS (SELECT * FROM Person
						WHERE SSN = @SSN)
		BEGIN
			INSERT INTO Person(GenderID, MarriageStatusID, FirstName, LastName, DOB, SSN) VALUES (@GenderID, @MarriageStatusID, @FirstName, @LastName, @DOB, @SSN)
		END
		SET @PersonID = (SELECT PersonID FROM Person WHERE SSN = @SSN)
		PRINT 'PersonID'
		PRINT @PersonID

		FETCH NEXT FROM ImportCursor
		INTO @Gender, @MarriageStatus, @FirstName, @LastName, @DOB, @SSN

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Address Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkAddress')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkAddress;
GO

CREATE PROCEDURE InsertBulkAddress
AS
BEGIN

		--Prepare Parameters for Address Table
		DECLARE @AddressType VARCHAR(30)
		, @PersonID INT
		, @Country VARCHAR(30)
		, @State	VARCHAR(30)
		, @City VARCHAR(30)
		, @Street VARCHAR(60)
		, @Floor VARCHAR(30)
		, @Unit VARCHAR(30)
		DECLARE @AddressTypeID INT
		, @AddressID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT AddressType, PersonID, Country, [State], City, Street, [Floor], Unit
	FROM AddressData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @AddressType, @PersonID, @Country, @State, @City, @Street, @Floor, @Unit

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting AddressType Data
		IF NOT EXISTS ( SELECT * FROM AddressType
						WHERE AddressType = @AddressType)
		BEGIN
			INSERT INTO AddressType(AddressType) VALUES (@AddressType)
		END
		SET @AddressTypeID = (SELECT AddressTypeID FROM AddressType WHERE AddressType = @AddressType)
		PRINT 'AddressTypeID'
		PRINT @AddressTypeID

		--Inserting Address Data
		IF NOT EXISTS ( SELECT * FROM [Address]
						WHERE [State] = @State
						AND City = @City
						AND Street = @Street)
		BEGIN
			INSERT INTO [Address](AddressTypeID, PersonID, Country, [State], City, Street, [Floor], Unit) VALUES (@AddressTypeID, @PersonID, @Country, @State, @City, @Street, @Floor, @Unit)
		END
		SET @AddressID = (SELECT AddressID FROM [Address] WHERE [State] = @State AND City = @City AND Street = @Street)
		PRINT 'AddressID'
		PRINT @AddressID

		FETCH NEXT FROM ImportCursor
		INTO @AddressType, @PersonID, @Country, @State, @City, @Street, @Floor, @Unit

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Promotion Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkPromotion')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkPromotion
GO

CREATE PROCEDURE InsertBulkPromotion
AS
BEGIN

		--Prepare Parameters for Address Table
		DECLARE @PromotionID VARCHAR(30)
		, @PromotionType VARCHAR(30)
		, @PromotionName VARCHAR(30)
		, @DiscountAmount FLOAT
		, @StartDate DATETIME
		, @EndDate DATETIME

		DECLARE @PromotionTypeID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT PromotionID, PromotionType, PromotionName, DiscountAmount, StartDate, EndDate
	FROM PromotionData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @PromotionID, @PromotionType, @PromotionName, @DiscountAmount, @StartDate, @EndDate

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting PromotionType Data
		IF NOT EXISTS ( SELECT * FROM PromotionType
						WHERE PromotionType = @PromotionType)
		BEGIN
			INSERT INTO PromotionType(PromotionType) VALUES (@PromotionType)
		END
		SET @PromotionTypeID = (SELECT PromotionTypeID FROM PromotionType WHERE PromotionType = @PromotionType)
		PRINT 'PromotionTypeID'
		PRINT @PromotionTypeID

		--Inserting Promotion Data
		IF NOT EXISTS ( SELECT * FROM Promotion
						WHERE PromotionID = @PromotionID)
		BEGIN
			INSERT INTO Promotion(PromotionID, PromotionTypeID, PromotionName, DiscountAmount, StartDate, EndDate) VALUES (@PromotionID, @PromotionTypeID, @PromotionName, @DiscountAmount, @StartDate, @EndDate)
		END
		PRINT 'PromotionID'
		PRINT @PromotionID

		FETCH NEXT FROM ImportCursor
		INTO @PromotionID, @PromotionType, @PromotionName, @DiscountAmount, @StartDate, @EndDate

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> PhoneNumber Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkPhoneNumber')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkPhoneNumber
GO

CREATE PROCEDURE InsertBulkPhoneNumber
AS
BEGIN

	--Prepare Parameters for PhoneNumber Table
	DECLARE @PhoneNumberType VARCHAR(30)
	, @PersonID INT
	, @PhoneNumber VARCHAR(20)

	DECLARE @PhoneNumberTypeID INT
	, @PhoneNumberID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT PhoneNumberType, PersonID, PhoneNumber
	FROM PhoneNumberData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @PhoneNumberType, @PersonID, @PhoneNumber

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting PhoneNumberType Data
		IF NOT EXISTS ( SELECT * FROM PhoneNumberType
						WHERE PhoneNumberType = @PhoneNumberType)
		BEGIN
			INSERT INTO PhoneNumberType(PhoneNumberType) VALUES (@PhoneNumberType)
		END
		SET @PhoneNumberTypeID = (SELECT PhoneNumberTypeID FROM PhoneNumberType WHERE PhoneNumberType = @PhoneNumberType)
		PRINT 'PhoneNumberTypeID'
		PRINT @PhoneNumberTypeID

		--Inserting PhoneNumber Data
		IF NOT EXISTS ( SELECT * FROM PhoneNumber
						WHERE PhoneNumber = @PhoneNumber)
		BEGIN
			INSERT INTO PhoneNumber(PhoneNumberTypeID, PersonID, PhoneNumber) VALUES (@PhoneNumberTypeID, @PersonID, @PhoneNumber)
		END
		SET @PhoneNumberID = (SELECT PhoneNumberID FROM PhoneNumber WHERE PhoneNumber = @PhoneNumber)
		PRINT 'PhoneNumberID'
		PRINT @PhoneNumberID

		FETCH NEXT FROM ImportCursor
		INTO @PhoneNumberType, @PersonID, @PhoneNumber

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Email Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkEmail')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkEmail
GO

CREATE PROCEDURE InsertBulkEmail
AS
BEGIN

		--Prepare Parameters for Email Table
		DECLARE @EmailType VARCHAR(30)
		, @PersonID INT
		, @SupplierID INT
		, @SupplierType VARCHAR(30)
		, @EmailAddress VARCHAR(30)
		, @Supplier VARCHAR(30)

		DECLARE @EmailTypeID INT
		, @SupplierTypeID INT
		, @EmailID INT



	DECLARE ImportCursor CURSOR FOR
	SELECT EmailType, PersonID, SupplierID, EmailAddress, SupplierType, Supplier

	FROM EmailData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @EmailType, @PersonID, @SupplierID, @EmailAddress, @SupplierType, @Supplier

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET IDENTITY_INSERT Supplier ON
		--Inserting SupplierType Data
		IF NOT EXISTS ( SELECT * FROM SupplierType
						WHERE SupplierType = @SupplierType)
		BEGIN
			INSERT INTO SupplierType(SupplierType) VALUES (@SupplierType)
		END
		SET @SupplierTypeID = (SELECT SupplierTypeID FROM SupplierType WHERE SupplierType = @SupplierType)
		PRINT 'SupplierTypeID'
		PRINT @SupplierTypeID

		--Inserting Supplier Data
		IF NOT EXISTS ( SELECT * FROM Supplier
						WHERE Supplier = @Supplier)
		AND @Supplier IS NOT NULL
		BEGIN
			INSERT INTO Supplier(SupplierID, SupplierTypeID, Supplier) VALUES (@SupplierID, @SupplierTypeID, @Supplier)
		END
		PRINT 'SupplierID'
		PRINT @SupplierID

		--Inserting EmailType Data
		IF NOT EXISTS ( SELECT * FROM EmailType
						WHERE EmailType = @EmailType)
		BEGIN
			INSERT INTO EmailType(EmailType) VALUES (@EmailType)
		END
		SET @EmailTypeID = (SELECT EmailTypeID FROM EmailType WHERE EmailType = @EmailType)
		PRINT 'EmailTypeID'
		PRINT @EmailTypeID

		--Inserting Email Data
		IF NOT EXISTS ( SELECT * FROM Email
						WHERE EmailAddress = @EmailAddress)
		BEGIN
			INSERT INTO Email(EmailTypeID, PersonID, SupplierID, EmailAddress) VALUES (@EmailTypeID, @PersonID, @SupplierID, @EmailAddress)
		END
		SET @EmailID = (SELECT EmailID FROM Email WHERE EmailAddress = @EmailAddress)
		PRINT 'EmailID'
		PRINT @EmailID

		FETCH NEXT FROM ImportCursor
		INTO @EmailType, @PersonID, @SupplierID, @EmailAddress, @SupplierType, @Supplier

		SET IDENTITY_INSERT Supplier OFF
	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Customer Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkCustomer')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkCustomer
GO

CREATE PROCEDURE InsertBulkCustomer
AS
BEGIN

	--Prepare Parameters for Customer Table
	DECLARE @PersonID INT
	, @PreferredContact VARCHAR(30)

	DECLARE @PreferredContactID INT
	, @CustomerID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT PersonID, PreferredContactID
	FROM CustomerData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @PersonID, @PreferredContact

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting PreferredContact Data
		IF NOT EXISTS ( SELECT * FROM PreferredContact
						WHERE PreferredContact = @PreferredContact)
		BEGIN
			INSERT INTO PreferredContact(PreferredContact) VALUES (@PreferredContact)
		END
		SET @PreferredContactID = (SELECT PreferredContactID FROM PreferredContact WHERE PreferredContact = @PreferredContact)
		PRINT 'PreferredContactID'
		PRINT @PreferredContactID

		--Inserting Customer Data
		IF NOT EXISTS ( SELECT * FROM Customer
						WHERE PersonID = @PersonID)
		BEGIN
			INSERT INTO Customer(PersonID, PreferredContactID) VALUES (@PersonID, @PreferredContactID)
		END
		SET @CustomerID = (SELECT CustomerID FROM Customer WHERE PersonID = @PersonID)
		PRINT 'CustomerID'
		PRINT @CustomerID

		FETCH NEXT FROM ImportCursor
		INTO @PersonID, @PreferredContact

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Employee Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkEmployee')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkEmployee
GO

CREATE PROCEDURE InsertBulkEmployee
AS
BEGIN

	--Prepare Parameters for Employee Table
	DECLARE @PersonID INT
	, @ValidStatus VARCHAR(30)
	, @HireDate DATETIME

	DECLARE @ValidStatusID INT
	, @EmployeeID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT PersonID, ValidStatusID, HireDate
	FROM EmployeeData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @PersonID, @ValidStatus, @HireDate

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting ValidStatus Data
		IF NOT EXISTS ( SELECT * FROM ValidStatus
						WHERE ValidStatus = @ValidStatus)
		BEGIN
			INSERT INTO ValidStatus(ValidStatus) VALUES (@ValidStatus)
		END
		SET @ValidStatusID = (SELECT ValidStatusID FROM ValidStatus WHERE ValidStatus = @ValidStatus)
		PRINT 'ValidStatusID'
		PRINT @ValidStatusID

		--Inserting Employee Data
		IF NOT EXISTS ( SELECT * FROM Employee
						WHERE PersonID = @PersonID)
		BEGIN
			INSERT INTO Employee(PersonID, ValidStatusID, HireDate) VALUES (@PersonID, @ValidStatusID, @HireDate)
		END
		SET @EmployeeID = (SELECT EmployeeID FROM Employee WHERE PersonID = @PersonID)
		PRINT 'EmployeeID'
		PRINT @EmployeeID

		FETCH NEXT FROM ImportCursor
		INTO @PersonID, @ValidStatus, @HireDate

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Branch Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkBranch')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkBranch
GO

CREATE PROCEDURE InsertBulkBranch
AS
BEGIN
	--Prepare Parameters for Branch Table
	DECLARE @BranchID INT
	, @AddressID INT
	, @PhoneNumberID INT
	, @Fax VARCHAR(30)
	, @ValidStatusID INT
	, @InventoryShown VARCHAR(30)
	, @BranchCategory VARCHAR(30)
	, @BranchName VARCHAR(30)
	, @BranchNameAbbr VARCHAR(30)

	DECLARE @InventoryShownID INT
	, @BranchCategoryID INT
	, @FaxID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT BranchID, AddressID, PhoneNumberID, Fax, ValidStatus, InventoryShown, BranchCategory, BranchName, BranchNameAbbr
	FROM BranchData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @BranchID, @AddressID, @PhoneNumberID, @Fax, @ValidStatusID, @InventoryShown, @BranchCategory, @BranchName, @BranchNameAbbr

	WHILE @@FETCH_STATUS = 0
	BEGIN
	SET IDENTITY_INSERT Branch ON
		--Inserting InventoryShown Data
		IF NOT EXISTS ( SELECT * FROM InventoryShown
						WHERE InventoryShown = @InventoryShown)
		BEGIN
			INSERT INTO InventoryShown(InventoryShown) VALUES (@InventoryShown)
		END
		SET @InventoryShownID = (SELECT InventoryShownID FROM InventoryShown WHERE InventoryShown = @InventoryShown)
		PRINT 'InventoryShownID'
		PRINT @InventoryShownID

		--Inserting BranchCategory Data
		IF NOT EXISTS ( SELECT * FROM BranchCategory
						WHERE BranchCategory = @BranchCategory)
		BEGIN
			INSERT INTO BranchCategory(BranchCategory) VALUES (@BranchCategory)
		END
		SET @BranchCategoryID = (SELECT BranchCategoryID FROM BranchCategory WHERE BranchCategory = @BranchCategory)
		PRINT 'BranchCategoryID'
		PRINT @BranchCategoryID

		--Inserting Fax Data
		IF NOT EXISTS ( SELECT * FROM Fax
						WHERE FaxNumber = @Fax)
		BEGIN
			INSERT INTO Fax(FaxNumber) VALUES (@Fax)
		END
		SET @FaxID = (SELECT FaxID FROM Fax WHERE FaxNumber = @Fax)
		PRINT 'FaxID'
		PRINT @FaxID

		--Inserting Branch Data
		IF NOT EXISTS ( SELECT * FROM Branch
						WHERE BranchID = @BranchID)
		BEGIN
			INSERT INTO Branch(BranchID, AddressID, PhoneNumberID, FaxID, ValidStatusID, InventoryShownID, BranchCategoryID) VALUES (@BranchID, @AddressID, @PhoneNumberID, @FaxID, @ValidStatusID, @InventoryShownID, @BranchCategoryID)
		END
		PRINT 'BranchID'
		PRINT @BranchID

		

		FETCH NEXT FROM ImportCursor
		INTO @BranchID, @AddressID, @PhoneNumberID, @Fax, @ValidStatusID, @InventoryShown, @BranchCategory, @BranchName, @BranchNameAbbr
	
	SET IDENTITY_INSERT Branch OFF

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Accounting Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkAccounting')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkAccounting
GO

CREATE PROCEDURE InsertBulkAccounting
AS
BEGIN

	--Prepare Parameters for Accounting Table
	DECLARE @EmployeeID INT
	, @BranchID INT
	, @TransactionType VARCHAR(30)
	, @CostCategory VARCHAR(30)
	, @Amount FLOAT
	, @TransactionDate DATETIME
	, @Description VARCHAR(30)

	DECLARE @TransactionTypeID INT
	, @CostCategoryID INT
	, @AccountingID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT TransactionType, CostCategory, EmployeeID, BranchID, Amount, TransactionDate, [Description]
	FROM AccountingData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @TransactionType, @CostCategory, @EmployeeID, @BranchID, @Amount, @TransactionDate, @Description

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting TransactionType Data
		IF NOT EXISTS ( SELECT * FROM TransactionType
						WHERE TransactionType = @TransactionType)
		BEGIN
			INSERT INTO TransactionType(TransactionType) VALUES (@TransactionType)
		END
		SET @TransactionTypeID = (SELECT TransactionTypeID FROM TransactionType WHERE TransactionType = @TransactionType)
		PRINT 'TransactionTypeID'
		PRINT @TransactionTypeID

		--Inserting CostCategory Data
		IF NOT EXISTS ( SELECT * FROM CostCategory
						WHERE CostCategory = @CostCategory)
		BEGIN
			INSERT INTO CostCategory(CostCategory) VALUES (@CostCategory)
		END
		SET @CostCategoryID = (SELECT CostCategoryID FROM CostCategory WHERE CostCategory = @CostCategory)
		PRINT 'CostCategoryID'
		PRINT @CostCategoryID

		--Inserting Accounting Data
		IF NOT EXISTS ( SELECT * FROM Accounting
						WHERE Amount = @Amount
						AND TransactionDate = @TransactionDate)
		BEGIN
			INSERT INTO Accounting(TransactionTypeID, CostCategoryID, EmployeeID, BranchID, Amount, TransactionDate, [Description]) VALUES (@TransactionTypeID, @CostCategoryID, @EmployeeID, @BranchID, @Amount, @TransactionDate, @Description)
		END
		SET @AccountingID = (SELECT AccountingID FROM Accounting WHERE Amount = @Amount AND TransactionDate = @TransactionDate)
		PRINT 'AccountingID'
		PRINT @AccountingID

		FETCH NEXT FROM ImportCursor
		INTO @TransactionType, @CostCategory, @EmployeeID, @BranchID, @Amount, @TransactionDate, @Description

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Track Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkTrack')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkTrack
GO

CREATE PROCEDURE InsertBulkTrack
AS
BEGIN

	--Prepare Parameters for Track Table
	DECLARE @CustomerID INT
	, @ValidStatusID VARCHAR(30)
	, @MembershipLevel	VARCHAR(30)
	, @EffectiveDate DATETIME

	DECLARE @TrackID INT
	, @MembershipLevelID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT CustomerID, ValidStatus, MembershipLevel, EffectiveDate
	FROM TrackData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @CustomerID, @ValidStatusID, @MembershipLevel, @EffectiveDate

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting MembershipLevel Data
		IF NOT EXISTS ( SELECT * FROM MembershipLevel
						WHERE MembershipLevel = @MembershipLevel
						AND EffectiveDate = @EffectiveDate)
		BEGIN
			INSERT INTO MembershipLevel(MembershipLevel, EffectiveDate) VALUES (@MembershipLevel, @EffectiveDate)
		END
		SET @MembershipLevelID = (SELECT MembershipLevelID FROM MembershipLevel WHERE MembershipLevel = @MembershipLevel AND EffectiveDate = @EffectiveDate)
		PRINT 'MembershipLevelID'
		PRINT @MembershipLevelID

		--Inserting Track Data
		IF NOT EXISTS ( SELECT * FROM Track
						WHERE CustomerID = @CustomerID
						AND ValidStatusID = @ValidStatusID
						AND MemberShipLevelID = @MemberShipLevelID
)
		BEGIN
			INSERT INTO Track(CustomerID, ValidStatusID, MembershipLevelID) VALUES (@CustomerID, @ValidStatusID, @MembershipLevelID)
		END
		SET @TrackID = (SELECT TrackID FROM Track WHERE TrackID = @TrackID)
		PRINT 'TrackID'
		PRINT @TrackID

		FETCH NEXT FROM ImportCursor
		INTO @CustomerID, @ValidStatusID, @MembershipLevel, @EffectiveDate

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Announcement Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkAnnouncement')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkAnnouncement
GO

CREATE PROCEDURE InsertBulkAnnouncement
AS
BEGIN

	--Prepare Parameters for Announcement Table
	DECLARE @EmployeeID INT
	, @ValidStatusID INT
	, @Description VARCHAR(30)
	, @StartTime DATETIME
	, @EndTime DATETIME

	DECLARE @AnnouncementID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT EmployeeID, ValidStatusID, [Description], StartTime, EndTime
	FROM AnnouncementData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @EmployeeID, @ValidStatusID, @Description, @StartTime, @EndTime

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting Announcement Data
		IF NOT EXISTS ( SELECT * FROM Announcement
						WHERE [Description] = @Description)
		BEGIN
			INSERT INTO Announcement(EmployeeID, ValidStatusID, [Description], StartTime, EndTime) VALUES (@EmployeeID, @ValidStatusID, @Description, @StartTime, @EndTime)
		END
		SET @AnnouncementID = (SELECT AnnouncementID FROM Announcement WHERE [Description] = @Description)
		PRINT 'AnnouncementID'
		PRINT @AnnouncementID

		FETCH NEXT FROM ImportCursor
		INTO @EmployeeID, @ValidStatusID, @Description, @StartTime, @EndTime

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> JobHistory Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkJobHistory')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkJobHistory
GO

CREATE PROCEDURE InsertBulkJobHistory
AS
BEGIN

	--Prepare Parameters for JobHistory Table
	DECLARE @EmployeeID INT
	, @BranchID INT
	, @JobTitle VARCHAR(30)
	, @EffectiveDate DATETIME

	DECLARE @JobTitleID INT
	, @JobHistoryID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT EmployeeID, BranchID, JobTitleID, EffectiveDate
	FROM JobHistoryData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @EmployeeID, @BranchID, @JobTitle, @EffectiveDate

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting JobTitle Data
		IF NOT EXISTS ( SELECT * FROM JobTitle
						WHERE JobTitle = @JobTitle)
		BEGIN
			INSERT INTO JobTitle(JobTitle) VALUES (@JobTitle)
		END
		SET @JobTitleID = (SELECT JobTitleID FROM JobTitle WHERE JobTitle = @JobTitle)
		PRINT 'JobTitleID'
		PRINT @JobTitleID

		--Inserting JobHistory Data
		IF NOT EXISTS ( SELECT * FROM JobHistory
						WHERE EmployeeID = @EmployeeID
						AND EffectiveDate = @EffectiveDate)
		BEGIN
			INSERT INTO JobHistory(EmployeeID, BranchID, JobTitleID, EffectiveDate) VALUES (@EmployeeID, @BranchID, @JobTitleID, @EffectiveDate)
		END
		SET @JobHistoryID = (SELECT JobHistoryID FROM JobHistory WHERE EmployeeID = @EmployeeID AND EffectiveDate = @EffectiveDate)
		PRINT 'JobHistoryID'
		PRINT @JobHistoryID

		FETCH NEXT FROM ImportCursor
		INTO @EmployeeID, @BranchID, @JobTitle, @EffectiveDate

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> SalaryHistory Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkSalaryHistory')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkSalaryHistory
GO

CREATE PROCEDURE InsertBulkSalaryHistory
AS
BEGIN

	--Prepare Parameters for SalaryHistory Table
	DECLARE @EmployeeID INT
	, @GradeName VARCHAR(30)
	, @MinSalary DECIMAL(10,2)
	, @MaxSalary DECIMAL(10,2)
	, @HourlyRate DECIMAL(10,2)
	, @EffectiveDate DATETIME

	DECLARE @SalaryGradeID INT
	, @SalaryHistoryID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT EmployeeID, GradeName, MinSalary, MaxSalary, HourlyRate, EffectiveDate
	FROM SalaryHistoryData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @EmployeeID, @GradeName, @MinSalary, @MaxSalary, @HourlyRate, @EffectiveDate

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting SalaryGrade Data
		IF NOT EXISTS ( SELECT * FROM SalaryGrade
						WHERE GradeName = @GradeName)
		BEGIN
			INSERT INTO SalaryGrade(GradeName, MinSalary, MaxSalary) VALUES (@GradeName, @MinSalary, @MaxSalary)
		END
		SET @SalaryGradeID = (SELECT SalaryGradeID FROM SalaryGrade WHERE GradeName = @GradeName)
		PRINT 'SalaryGradeID'
		PRINT @SalaryGradeID

		--Inserting SalaryHistory Data
		IF NOT EXISTS ( SELECT * FROM SalaryHistory
						WHERE EmployeeID = @EmployeeID
						AND SalaryGradeID = @SalaryGradeID)
		BEGIN
			INSERT INTO SalaryHistory(EmployeeID, SalaryGradeID, HourlyRate, EffectiveDate) VALUES (@EmployeeID, @SalaryGradeID, @HourlyRate, @EffectiveDate)
		END
		SET @SalaryHistoryID = (SELECT SalaryHistoryID FROM SalaryHistory WHERE EmployeeID = @EmployeeID AND SalaryGradeID = @SalaryGradeID)
		PRINT 'SalaryHistoryID'
		PRINT @SalaryHistoryID

		FETCH NEXT FROM ImportCursor
		INTO @EmployeeID, @GradeName, @MinSalary, @MaxSalary, @HourlyRate, @EffectiveDate

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Schedule Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkSchedule')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkSchedule
GO

CREATE PROCEDURE InsertBulkSchedule
AS
BEGIN

	--Prepare Parameters for Schedule Table
	DECLARE @EmployeeID INT
	, @ShiftType VARCHAR(30)
	, @MinSalary DECIMAL(10,2)
	, @StartTime DATETIME
	, @EndTime DATETIME
	, @EffectiveDate DATETIME

	DECLARE @ShiftTypeID INT
	, @ShiftID INT
	, @ScheduleID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT EmployeeID, ShiftType, StartTime, EndTime, EffectiveDate
	FROM ScheduleData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @EmployeeID, @ShiftType, @StartTime, @EndTime, @EffectiveDate

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting ShiftType Data
		IF NOT EXISTS ( SELECT * FROM ShiftType
						WHERE ShiftType = @ShiftType)
		BEGIN
			INSERT INTO ShiftType(ShiftType) VALUES (@ShiftType)
		END
		SET @ShiftTypeID = (SELECT ShiftTypeID FROM ShiftType WHERE ShiftType = @ShiftType)
		PRINT 'ShiftTypeID'
		PRINT @ShiftTypeID

		--Inserting Shift Data
		IF NOT EXISTS ( SELECT * FROM [Shift]
						WHERE ShiftTypeID = @ShiftTypeID
						AND  StartTime = @StartTime
						AND EndTime = @EndTime)
		BEGIN
			INSERT INTO [Shift](ShiftTypeID, StartTime, EndTime) VALUES (@ShiftTypeID, @StartTime, @EndTime)
		END
		SET @ShiftID = (SELECT ShiftID FROM [Shift] WHERE 
						ShiftTypeID = @ShiftTypeID
						AND  StartTime = @StartTime
						AND EndTime = @EndTime)
		PRINT 'ShiftID'
		PRINT @ShiftID

		--Inserting Schedule Data
		IF NOT EXISTS ( SELECT * FROM Schedule
						WHERE EmployeeID = @EmployeeID
						AND ShiftID = @ShiftID
						AND EffectiveDate = @EffectiveDate)
		BEGIN
			INSERT INTO Schedule(EmployeeID, ShiftID, EffectiveDate) VALUES (@EmployeeID, @ShiftID, @EffectiveDate)
		END
		SET @ScheduleID = (SELECT ScheduleID FROM Schedule WHERE EmployeeID = @EmployeeID AND ShiftID = @ShiftID AND EffectiveDate = @EffectiveDate)
		PRINT 'ScheduleID'
		PRINT @ScheduleID

		FETCH NEXT FROM ImportCursor
		INTO @EmployeeID, @ShiftType, @StartTime, @EndTime, @EffectiveDate

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> SupplierEmployee Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkSupplierEmployee')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkSupplierEmployee
GO

CREATE PROCEDURE InsertBulkSupplierEmployee
AS
BEGIN

	--Prepare Parameters for SupplierEmployee Table
	DECLARE @PersonID INT
	, @SupplierID INT
	, @ValidStatusID INT
	, @Role VARCHAR(30)

	DECLARE @SupplierEmployeeID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT PersonID, SupplierID, ValidStatus, [Role]
	FROM SupplierEmployeeData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @PersonID, @SupplierID, @ValidStatusID, @Role

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting SupplierEmployee Data
		IF NOT EXISTS ( SELECT * FROM SupplierEmployee
						WHERE PersonID = @PersonID)
		BEGIN
			INSERT INTO SupplierEmployee(PersonID, SupplierID, ValidStatusID, [Role]) VALUES (@PersonID, @SupplierID, @ValidStatusID, @Role)
		END
		SET @SupplierEmployeeID = (SELECT SupplierEmployeeID FROM SupplierEmployee WHERE PersonID = @PersonID)
		PRINT 'SupplierEmployeeID'
		PRINT @SupplierEmployeeID

		FETCH NEXT FROM ImportCursor
		INTO @PersonID, @SupplierID, @ValidStatusID, @Role

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> Inventory Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkInventory')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkInventory
GO

CREATE PROCEDURE InsertBulkInventory
AS
BEGIN

	--Prepare Parameters for Inventory Table
	DECLARE @InventoryID VARCHAR(30)
	, @InventoryType VARCHAR(30)
	, @UpperMaterial VARCHAR(30)
	, @SoleMaterial VARCHAR(30)
	, @StockQuantity INT
	, @SellingPrice	DECIMAL(10,2)

	DECLARE @InventoryTypeID INT
	, @UpperMaterialID INT
	, @SoleMaterialID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT InventoryID, InventoryType, UpperMaterial, SoleMaterial, StockQuantity, SellingPrice
	FROM InventoryData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @InventoryID, @InventoryType, @UpperMaterial, @SoleMaterial, @StockQuantity, @SellingPrice

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting InventoryType Data
		IF NOT EXISTS ( SELECT * FROM InventoryType
						WHERE InventoryType = @InventoryType)
		BEGIN
			INSERT INTO InventoryType(InventoryType) VALUES (@InventoryType)
		END
		SET @InventoryTypeID = (SELECT InventoryTypeID FROM InventoryType WHERE InventoryType = @InventoryType)
		PRINT 'InventoryTypeID'
		PRINT @InventoryTypeID

		--Inserting UpperMaterial Data
		IF NOT EXISTS ( SELECT * FROM UpperMaterial
						WHERE UpperMaterial = @UpperMaterial)
		BEGIN
			INSERT INTO UpperMaterial(UpperMaterial) VALUES (@UpperMaterial)
		END
		SET @UpperMaterialID = (SELECT UpperMaterialID FROM UpperMaterial WHERE UpperMaterial = @UpperMaterial)
		PRINT 'UpperMaterialID'
		PRINT @UpperMaterialID

		--Inserting SoleMaterial Data
		IF NOT EXISTS ( SELECT * FROM SoleMaterial
						WHERE SoleMaterial = @SoleMaterial)
		BEGIN
			INSERT INTO SoleMaterial(SoleMaterial) VALUES (@SoleMaterial)
		END
		SET @SoleMaterialID = (SELECT SoleMaterialID FROM SoleMaterial WHERE SoleMaterial = @SoleMaterial)
		PRINT 'SoleMaterialID'
		PRINT @SoleMaterialID

		--Inserting Inventory Data
		IF NOT EXISTS ( SELECT * FROM Inventory
						WHERE InventoryID = @InventoryID)
		BEGIN
			INSERT INTO Inventory(InventoryID, InventoryTypeID, UpperMaterialID, SoleMaterialID, StockQuantity, SellingPrice) VALUES (@InventoryID, @InventoryTypeID, @UpperMaterialID, @SoleMaterialID, @StockQuantity, @SellingPrice)
		END
		PRINT 'InventoryID'
		PRINT @InventoryID

		FETCH NEXT FROM ImportCursor
		INTO @InventoryID, @InventoryType, @UpperMaterial, @SoleMaterial, @StockQuantity, @SellingPrice

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO

--------------------------------------------------------------------------
--Create Stored Procedure for ETL Process -> SupplierEmployee Related Table
IF EXISTS (SELECT * FROM sys.objects
			WHERE object_id = OBJECT_ID(N'InsertBulkSupplierEmployee')
			AND TYPE IN (N'P',N'PC'))
	DROP PROCEDURE InsertBulkSupplierEmployee
GO

CREATE PROCEDURE InsertBulkSupplierEmployee
AS
BEGIN

	--Prepare Parameters for SupplierEmployee Table
	DECLARE @PersonID INT
	, @SupplierID INT
	, @ValidStatusID INT
	, @Role VARCHAR(30)

	DECLARE @SupplierEmployeeID INT

	DECLARE ImportCursor CURSOR FOR
	SELECT PersonID, SupplierID, ValidStatus, [Role]
	FROM SupplierEmployeeData

	OPEN ImportCursor

	FETCH NEXT FROM ImportCursor
	INTO @PersonID, @SupplierID, @ValidStatusID, @Role

	WHILE @@FETCH_STATUS = 0
	BEGIN

		--Inserting SupplierEmployee Data
		IF NOT EXISTS ( SELECT * FROM SupplierEmployee
						WHERE PersonID = @PersonID)
		BEGIN
			INSERT INTO SupplierEmployee(PersonID, SupplierID, ValidStatusID, [Role]) VALUES (@PersonID, @SupplierID, @ValidStatusID, @Role)
		END
		SET @SupplierEmployeeID = (SELECT SupplierEmployeeID FROM SupplierEmployee WHERE PersonID = @PersonID)
		PRINT 'SupplierEmployeeID'
		PRINT @SupplierEmployeeID

		FETCH NEXT FROM ImportCursor
		INTO @PersonID, @SupplierID, @ValidStatusID, @Role

	END
	CLOSE ImportCursor
	DEALLOCATE ImportCursor
END
GO