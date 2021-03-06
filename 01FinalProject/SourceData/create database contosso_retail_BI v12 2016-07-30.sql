use Contoso_Retail_BI_Project
go

/****** Object:  Table dbo.DimAccount    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimAccount(
	AccountKey int IDENTITY(1,1) NOT NULL,
	ParentAccountKey int NULL,
	AccountLabel nvarchar(100) NULL,
	AccountName nvarchar(50) NULL,
	AccountDescription nvarchar(50) NULL,
	AccountType nvarchar(50) NULL,
	Operator nvarchar(50) NULL,
	CustomMembers nvarchar(300) NULL,
	ValueType nvarchar(50) NULL,
	CustomMemberOptions nvarchar(200) NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (AccountKey ASC) 
)
GO

/****** Object:  Table dbo.DimChannel    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimChannel(
	ChannelKey int IDENTITY(1,1) NOT NULL,
	ChannelLabel nvarchar(100) NOT NULL,
	ChannelName nvarchar(20) NULL,
	ChannelDescription nvarchar(50) NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (ChannelKey ASC) 
)

GO
/****** Object:  Table dbo.DimCurrency    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimCurrency(
	CurrencyKey int IDENTITY(1,1) NOT NULL,
	CurrencyLabel nvarchar(10) NOT NULL,
	CurrencyName nvarchar(20) NOT NULL,
	CurrencyDescription nvarchar(50) NOT NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
 PRIMARY KEY CLUSTERED (CurrencyKey ASC) ,
 UNIQUE NONCLUSTERED (CurrencyLabel ASC) 
)

GO
/****** Object:  Table dbo.DimCustomer    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimCustomer(
	CustomerKey int IDENTITY(1,1) NOT NULL,
	GeographyKey int NOT NULL,
	CustomerLabel nvarchar(100) NOT NULL,

	CustomerType nvarchar(15) NULL,
	CompanyName nvarchar(100) NULL,

	YearlyIncome numeric(15,2)  NULL,

	Title nvarchar(8) NULL,
	FirstName nvarchar(50) NULL,
	MiddleName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	NameStyle bit NULL,
	BirthDate date NULL,
	MaritalStatus nchar(1) NULL,
	Suffix nvarchar(10) NULL,
	Gender nvarchar(1) NULL,
	EmailAddress nvarchar(50) NULL,
	TotalChildren int NULL,
	NumberChildrenAtHome int NULL,
	Education nvarchar(40) NULL,
	Occupation nvarchar(100) NULL,
	HouseOwnerFlag nchar(1) NULL,
	NumberCarsOwned int NULL,
	AddressLine1 nvarchar(120) NULL,
	AddressLine2 nvarchar(120) NULL,
	Phone nvarchar(20) NULL,
	DateFirstPurchase date NULL,
	BirthDateSK int NULL,
	DateFirstPurchaseSK int NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (CustomerKey ASC) ,
UNIQUE NONCLUSTERED (CustomerLabel ASC) 
)
GO

/****** Object:  Table dbo.DimDate    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimDate(
	DateSK int NOT NULL,
	DateAK date NOT NULL,
	DatetimeAK datetime NULL,
	CalendarYear int NULL,
	CalendarYearLabel nvarchar(30) NULL,
	CalendarQuarter int NULL,
	CalendarYearQuarter int NULL,
	CalendarQuarterLabel nvarchar(31) NULL,
	CalendarMonth int NULL,
	CalendarYearMonth int NULL,
	CalendarMonthLabel nvarchar(30) NULL,
	CalendarMonthAbbreviation nvarchar(3) NULL,
	DayNumberOfYear int NULL,
	CalendarYearDay int NULL,
	CalendarWeek int NULL,
	CalendarWeekLabel nvarchar(30) NULL,
	CalendarYearWeek int NULL,
	CalendarDayOfWeek int NULL,
	CalendarDayOfWeekLabel nvarchar(3) NULL,
	IsWorkDay int NULL,
	NorthAmericaSeason nvarchar(50) NULL,
	EuropeSeason nvarchar(50) NULL,
	AsiaSeason nvarchar(50) NULL,
PRIMARY KEY CLUSTERED ( DateSK ASC) -- added
)
GO

/****** Object:  Table dbo.DimEmployee    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimEmployee(
	EmployeeKey int IDENTITY(1,1) NOT NULL,
	ParentEmployeeKey int NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	MiddleName nvarchar(50) NULL,
	Title nvarchar(50) NULL,
	HireDate date NULL,
	HireDateSK int NULL,
	BirthDate date NULL,
	BirthDateSK int NULL,
	EmailAddress nvarchar(50) NULL,
	Phone nvarchar(25) NULL,
	MaritalStatus nchar(1) NULL,
	EmergencyContactName nvarchar(50) NULL,
	EmergencyContactPhone nvarchar(25) NULL,
	SalariedFlag bit NULL,
	Gender nchar(1) NULL,
	PayFrequency int NULL,
	BaseRate numeric(15,2)  NULL,
	VacationHours smallint NULL,
	CurrentFlag bit NOT NULL,
	SalesPersonFlag bit NOT NULL,
	DepartmentName nvarchar(50) NULL,
	StartDate date NULL,
	StartDateSK int NULL,
	EndDate date NULL,
	EndDateSK int NULL,
	Status nvarchar(50) NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (EmployeeKey ASC) 
)
GO


/****** Object:  Table dbo.DimGeography    Script Date: 7/23/2016 11:26:16 AM ******/

-- Revised Summer 2016 
CREATE TABLE dbo.DimGeography(
	GeographyKey int IDENTITY(1,1) NOT NULL,
	GeographyType nvarchar(50) NOT NULL,
	CityName nvarchar(100) NULL,
	StateProvinceName nvarchar(100) NULL,
	StateProvinceCode nvarchar(3) NULL,
	ContinentName nvarchar(50) NOT NULL,
	ContinentCode nchar(2) NULL,
	RegionCountryName nvarchar(100) NULL,
	ISO_3166_numeric int NULL,
	ISO_3166_alpha_2 nchar(2) NULL,
	ISO_3166_alpha_3 nchar(3) NULL,
        Latitude   numeric(10,6)  NULL,  -- added
        Longitude  numeric(10,6)  NULL,  -- added

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (GeographyKey ASC) 
)
GO


/****** Object:  Table dbo.DimProduct    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimProduct(
	ProductKey int IDENTITY(1,1) NOT NULL,
	ProductLabel nvarchar(255) NULL,
	ProductName nvarchar(500) NULL,
	ProductDescription nvarchar(400) NULL,
	ProductSubcategoryKey int NULL,
	Manufacturer nvarchar(50) NULL,
	BrandName nvarchar(50) NULL,
	ClassID nvarchar(10) NULL,
	ClassName nvarchar(20) NULL,
	StyleID nvarchar(10) NULL,
	StyleName nvarchar(20) NULL,
	ColorID nvarchar(10) NULL,
	ColorName nvarchar(20) NOT NULL,
	Size nvarchar(50) NULL,
	SizeRange nvarchar(50) NULL,
	SizeUnitMeasureID nvarchar(20) NULL,
	Weight float NULL,
	WeightUnitMeasureID nvarchar(20) NULL,
	UnitOfMeasureID nvarchar(10) NULL,
	UnitOfMeasureName nvarchar(40) NULL,
	StockTypeID nvarchar(10) NULL,
	StockTypeName nvarchar(40) NULL,
	UnitCost numeric(15,2)  NULL,    -- current value
	UnitPrice numeric(15,2)  NULL,   -- current value
	AvailableForSaleDate datetime NULL,
	StopSaleDate datetime NULL,
	AvailableForSaleDateSK int NULL,
	StopSaleDateSK int NULL,
	Status nvarchar(7) NULL,
	--ImageURL nvarchar(150) NULL,    dropped
	--ProductURL nvarchar(150) NULL,    dropped
	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,

	ProductSubcategoryLabel nvarchar(100) NULL,
	ProductSubcategoryName nvarchar(50) NULL,
	ProductSubcategoryDescription nvarchar(100) NULL,
	ProductCategoryKey int NULL,
	ProductCategoryLabel nvarchar(100) NULL,
	ProductCategoryName nvarchar(30) NULL,
	ProductCategoryDescription nvarchar(50) NULL,
	--ProductBridgeSK int NULL,      --  dropped

	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (ProductKey ASC) 
)
GO

/****** Object:  Table dbo.DimProductCost    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimProductCost(
	SCD_ProductCostSK int IDENTITY(1,1) NOT NULL,
	ProductKey int NOT NULL,
	ProductLabel nvarchar(255) NULL,
	ProductCategoryKey int NULL,
	ProductSubcategoryKey int NULL,
	CurrencyKey int NOT NULL,
	UnitCost numeric(15,2)  NULL,

	SCD_EffectiveDate date NULL,
	SCD_IneffectiveDate date NULL,
	SCD_Current_Flag int NOT NULL,
	SCD_EffectiveDateSK int NULL,
	SCD_IneffectiveDateSK int NULL,

	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (SCD_ProductCostSK ASC) -- added
)
GO


/****** Object:  Table dbo.DimProductPrice    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimProductPrice(
	SCD_ProductPriceSK int IDENTITY(1,1) NOT NULL,
	ProductKey int NOT NULL,
	ProductLabel nvarchar(255) NULL,
	ProductCategoryKey int NULL,
	ProductSubcategoryKey int NULL,
	CurrencyKey int NOT NULL,
	UnitPrice numeric(15,2)  NULL,

	SCD_EffectiveDate date NULL,
	SCD_IneffectiveDate date NULL,
	SCD_Current_Flag int NOT NULL,
	SCD_EffectiveDateSK int NULL,
	SCD_IneffectiveDateSK int NULL,

	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED ( SCD_ProductPriceSK ASC) -- added
)
GO


/****** Object:  Table dbo.DimPromotion    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimPromotion(
	PromotionKey int IDENTITY(1,1) NOT NULL,
	PromotionLabel nvarchar(100) NULL,
	PromotionName nvarchar(100) NULL,
	PromotionDescription nvarchar(255) NULL,
	DiscountPercent float NULL,
	PromotionType nvarchar(50) NULL,
	PromotionCategory nvarchar(50) NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NULL,
	StartDateSK int NULL,
	EndDateSK int NULL,
	MinQuantity int NULL,
	MaxQuantity int NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (PromotionKey ASC) ,
UNIQUE NONCLUSTERED (PromotionLabel ASC) 
)
GO

/****** Object:  Table dbo.DimSalesTerritory    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimSalesTerritory(
	SalesTerritoryKey int IDENTITY(1,1) NOT NULL,
	GeographyKey int NOT NULL,
	SalesTerritoryLabel nvarchar(100) NULL,
	SalesTerritoryName nvarchar(50) NOT NULL,
	SalesTerritoryRegion nvarchar(50) NOT NULL,
	SalesTerritoryCountry nvarchar(50) NOT NULL,
	SalesTerritoryGroup nvarchar(50) NULL,
	SalesTerritoryLevel nvarchar(10) NULL,
	SalesTerritoryManager int NULL,
	StartDate datetime NULL,
	EndDate datetime NULL,
	StartDateSK int NULL,
	EndDateSK int NULL,
	Status nvarchar(50) NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (SalesTerritoryKey ASC) ,
UNIQUE NONCLUSTERED (SalesTerritoryLabel ASC) 
)
GO


/****** Object:  Table dbo.DimStore    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimStore(
	StoreKey int IDENTITY(1,1) NOT NULL,
	GeographyKey int NOT NULL,
	ChannelKey int NOT NULL,   -- added 2016-07-30
	StoreManager int NULL,
	StoreType nvarchar(15) NULL,
	StoreName nvarchar(100) NOT NULL,
	StoreDescription nvarchar(300) NOT NULL,
	Status nvarchar(20) NOT NULL,
	OpenDate datetime NOT NULL,
	CloseDate datetime NULL,
	OpenDateSK int NULL,
	CloseDateSK int NULL,
	LastRemodelDateSK int NULL,
	EntityKey int NULL,
	ZipCode nvarchar(20) NULL,
	ZipCodeExtension nvarchar(10) NULL,
	StorePhone nvarchar(15) NULL,
	StoreFax nvarchar(14) NULL,
	AddressLine1 nvarchar(100) NULL,
	AddressLine2 nvarchar(100) NULL,
	CloseReason nvarchar(20) NULL,
	EmployeeCount int NULL,
	SellingAreaSize float NULL,
	LastRemodelDate datetime NULL,
	--GeoLocation geography NULL,
	--Geometry geometry NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (StoreKey ASC) 
) 
GO


/* ----------- based on imported data  ------ */
CREATE TABLE dbo.FactExchangeRate(
	DateSK           int NOT NULL,
	DateKey          date NULL,
	USDtoUSD         numeric(19, 4) NOT NULL,
	USDtoEUR         numeric(19, 4) NOT NULL,
	USDtoCNY         numeric(19, 4) NOT NULL,

	SOR_LoadDate     datetime NULL,
	SOR_UpdateDate   datetime NULL,
	SOR_ID           int NULL,
	DI_Job_ID        nchar(20) NULL,
	DI_Create_Date   datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (DateSK ASC)
) 
GO

/****** Object:  Table dbo.FactInventory    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.FactInventory(
	InventoryKey int IDENTITY(1,1) NOT NULL,
	DateKey datetime NOT NULL,
	DateSK int NULL,
	StoreKey int NOT NULL,
	ProductKey int NOT NULL,
	CurrencyKey int NOT NULL,
	OnHandQuantity int NOT NULL,
	OnOrderQuantity int NOT NULL,
	SafetyStockQuantity int NULL,
	UnitCost numeric(15,2)  NOT NULL,  -- curent value od UnitCost
	DaysInStock int NULL,
	MinDayInStock int NULL,
	MaxDayInStock int NULL,
	Aging int NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (InventoryKey ASC) 
)
GO

CREATE TABLE dbo.FactInventory_Rejects(
	InventoryKey int IDENTITY(1,1) NOT NULL,
	DateKey datetime NULL,
	DateSK int NULL,
	StoreKey int NULL,
	ProductKey int NULL,
	CurrencyKey int NULL,
	OnHandQuantity int NULL,
	OnOrderQuantity int NULL,
	SafetyStockQuantity int NULL,
	UnitCost numeric(15,2)  NULL,   -- curent value od UnitCost
	DaysInStock int NULL,
	MinDayInStock int NULL,
	MaxDayInStock int NULL,
	Aging int NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,

	RejectReason nvarchar(50) NULL,  -- Rejection Reason
        Product_ID nchar(24) NULL,
	Brand_ID nchar(24) NULL,
	ProductLabel nvarchar(255) NULL,
	CustomerLabel nvarchar(100) NOT NULL,
	PromotionLabel nvarchar(100) NULL,

	DI_Job_ID nchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (InventoryKey ASC) 
)
GO

/****** Object:  Table dbo.FactOnlineSales    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.FactOnlineSales(
	OnlineSalesKey int IDENTITY(1,1) NOT NULL,
	DateKey datetime NOT NULL,
	DateSK int NULL,
	StoreKey int NOT NULL,
	ProductKey int NOT NULL,
	PromotionKey int NOT NULL,
	CurrencyKey int NOT NULL,
	CustomerKey int NOT NULL,
	SalesOrderNumber nvarchar(20) NOT NULL,
	SalesOrderLineNumber int NULL,
	SalesQuantity int NOT NULL,
	SalesAmount numeric(15,2)  NOT NULL,
	ReturnQuantity int NOT NULL,
	ReturnAmount numeric(15,2)  NULL,
	-- DiscountQuantity int NULL,      -- dropped 2016-07-30
	DiscountAmount numeric(15,2)  NULL,
	TotalCost numeric(15,2)  NOT NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,

	DI_Job_ID nchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
	GeographyKey int NULL,
PRIMARY KEY CLUSTERED (OnlineSalesKey ASC) 
)
GO

CREATE TABLE dbo.FactOnlineSales_Rejects(
	OnlineSalesKey int IDENTITY(1,1) NOT NULL,
	DateKey datetime NULL,
	DateSK int NULL,
	StoreKey int NULL,
	ProductKey int NULL,
	PromotionKey int NULL,
	CurrencyKey int NULL,
	CustomerKey int NULL,
	SalesOrderNumber nvarchar(20) NULL,
	SalesOrderLineNumber int NULL,
	SalesQuantity int NULL,
	SalesAmount numeric(15,2)  NULL,
	ReturnQuantity int NULL,
	ReturnAmount numeric(15,2)  NULL,
	-- DiscountQuantity int NULL,   -- dropped 2016-07-30
	DiscountAmount numeric(15,2)  NULL,
	TotalCost numeric(15,2)  NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,

	RejectReason nvarchar(50) NULL,  -- Rejection Reason
        Product_ID nchar(24) NULL,
	Brand_ID nchar(24) NULL,
	ProductLabel nvarchar(255) NULL,
	CustomerLabel nvarchar(100) NOT NULL,
	PromotionLabel nvarchar(100) NULL,

	DI_Job_ID nchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
	GeographyKey int NULL,
PRIMARY KEY CLUSTERED (OnlineSalesKey ASC) 
)
GO

/****** Object:  Table dbo.FactSales    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.FactSales(
	SalesKey int IDENTITY(1,1) NOT NULL,
	DateKey datetime NOT NULL,
	DateSK int NULL,
	ChannelKey int NOT NULL,
	StoreKey int NOT NULL,
	ProductKey int NOT NULL,
	PromotionKey int NOT NULL,
	CurrencyKey int NOT NULL,
	GeographyKey int NULL,

	SalesQuantity int NOT NULL,
	ReturnQuantity int NOT NULL,
	ReturnAmount numeric(15,2)  NULL,
	-- DiscountQuantity int NULL,    -- dropped 2016-07-30
	DiscountAmount numeric(15,2)  NULL,
	TotalCost numeric(15,2)  NOT NULL,
	SalesAmount numeric(15,2)  NOT NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (SalesKey ASC) 
)
GO

CREATE TABLE dbo.FactSales_Rejects(
	SalesKey int IDENTITY(1,1) NOT NULL,
	DateKey datetime NULL,
	DateSK int NULL,
	channelKey int NULL,
	StoreKey int NULL,
	ProductKey int NULL,
	PromotionKey int NULL,
	CurrencyKey int NULL,
	GeographyKey int NULL,

	SalesQuantity int NULL,
	ReturnQuantity int NULL,
	ReturnAmount numeric(15,2)  NULL,
	-- DiscountQuantity int NULL,   -- dropped 2016-07-30
	DiscountAmount numeric(15,2)  NULL,
	TotalCost numeric(15,2)  NULL,
	SalesAmount numeric(15,2)  NULL,

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,

	RejectReason nvarchar(50) NULL,  -- Rejection Reason
        Product_ID nchar(24) NULL,
	Brand_ID nchar(24) NULL,
	ProductLabel nvarchar(255) NULL,
	CustomerLabel nvarchar(100) NOT NULL,
	PromotionLabel nvarchar(100) NULL,

	DI_Job_ID nchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (SalesKey ASC) 
)
GO

CREATE TABLE DimSOR
(
	SOR_ID         int  identity(1,1) NOT NULL,
	SOR_Name       varchar(80) NULL,
        SOR_Type       varchar(80) NULL,
	SOR_DBMS       varchar(80) NULL,
        SOR_DBName     varchar(80) NULL,
        SOR_DBSchema   varchar(80) NULL,
        SOR_FileType   varchar(80) NULL,
	SOR_Filename   varchar(255) NULL,
	SOR_AppName    varchar(255) NULL,
        SOR_AppModule  varchar(255) NULL,
	DW_CreateDate  datetime NOT NULL DEFAULT (getdate()),
	DW_ModifyDate  datetime NOT NULL DEFAULT (getdate())
	)
GO


/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */

use Contoso_Retail_SOR_Reference
go

CREATE TABLE dbo.DimCustomer_Company_Crossmap(
	CustomerKey int NOT NULL,   -- IDENTITY(1,1) 
	CustomerLabel nvarchar(100) NOT NULL,
	CustomerType nvarchar(15) NULL,

	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (CustomerKey ASC) ,
UNIQUE NONCLUSTERED (CustomerLabel ASC) 
)
GO

CREATE TABLE dbo.DimCustomer_Person_Crossmap(
	CustomerKey int NOT NULL,   -- IDENTITY(1,1) 
	CustomerLabel nvarchar(100) NOT NULL,
	CustomerType nvarchar(15) NULL,

	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (CustomerKey ASC) ,
UNIQUE NONCLUSTERED (CustomerLabel ASC) 
)
GO

CREATE TABLE dbo.DimProduct_CrossMap(
	ProductKey int NOT NULL,
	Product_ID nchar(24) NULL,
	Brand_ID nchar(24) NULL,
	ProductLabel nvarchar(255) NULL,
	ProductName nvarchar(500) NULL,
	ProductSubcategoryKey int NULL,
	ProductCategoryKey int NULL,

	ETLLoadID int NULL,
	LoadDate datetime NULL,
	UpdateDate datetime NULL,

	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (ProductKey ASC)
)
GO

/****** Object:  Table dbo.DimDate    Script Date: 7/23/2016 11:26:16 AM ******/

CREATE TABLE dbo.DimDate(
	DateSK int NOT NULL,
	DateAK date NOT NULL,
	DatetimeAK datetime NULL,
	CalendarYear int NULL,
	CalendarYearLabel nvarchar(30) NULL,
	CalendarQuarter int NULL,
	CalendarYearQuarter int NULL,
	CalendarQuarterLabel nvarchar(31) NULL,
	CalendarMonth int NULL,
	CalendarYearMonth int NULL,
	CalendarMonthLabel nvarchar(30) NULL,
	CalendarMonthAbbreviation nvarchar(3) NULL,
	DayNumberOfYear int NULL,
	CalendarYearDay int NULL,
	CalendarWeek int NULL,
	CalendarWeekLabel nvarchar(30) NULL,
	CalendarYearWeek int NULL,
	CalendarDayOfWeek int NULL,
	CalendarDayOfWeekLabel nvarchar(3) NULL,
	IsWorkDay int NULL,
	NorthAmericaSeason nvarchar(50) NULL,
	EuropeSeason nvarchar(50) NULL,
	AsiaSeason nvarchar(50) NULL,
PRIMARY KEY CLUSTERED ( DateSK ASC) -- added
)
GO


/****** Object:  Table dbo.DimGeography    Script Date: 7/23/2016 11:26:16 AM ******/

-- Revised Summer 2016 
CREATE TABLE dbo.DimGeography(
	GeographyKey int IDENTITY(1,1) NOT NULL,
	GeographyType nvarchar(50) NOT NULL,
	CityName nvarchar(100) NULL,
	StateProvinceName nvarchar(100) NULL,
	StateProvinceCode nvarchar(3) NULL,
	ContinentName nvarchar(50) NOT NULL,
	ContinentCode nchar(2) NULL,
	RegionCountryName nvarchar(100) NULL,
	ISO_3166_numeric int NULL,
	ISO_3166_alpha_2 nchar(2) NULL,
	ISO_3166_alpha_3 nchar(3) NULL,
        Latitude   numeric(10,6)  NULL,  -- added
        Longitude  numeric(10,6)  NULL,  -- added

	SOR_LoadDate datetime NULL,
	SOR_UpdateDate datetime NULL,
	SOR_ID int NULL,
	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (GeographyKey ASC) 
)
GO


CREATE TABLE DimSOR
(
	SOR_ID         int  identity(1,1) NOT NULL,
	SOR_Name       varchar(80) NULL,
        SOR_Type       varchar(80) NULL,
	SOR_DBMS       varchar(80) NULL,
        SOR_DBName     varchar(80) NULL,
        SOR_DBSchema   varchar(80) NULL,
        SOR_FileType   varchar(80) NULL,
	SOR_Filename   varchar(255) NULL,
	SOR_AppName    varchar(255) NULL,
        SOR_AppModule  varchar(255) NULL,
	DW_CreateDate  datetime NOT NULL DEFAULT (getdate()),
	DW_ModifyDate  datetime NOT NULL DEFAULT (getdate())
	)
GO


CREATE TABLE dbo.DimStore_Channel_Crossmap(
	StoreKey int IDENTITY(1,1) NOT NULL,
	ChannelKey int NOT NULL,   -- added 2016-07-30

	DI_Job_ID nvarchar(20) NULL,
	DI_Create_Date datetime NOT NULL DEFAULT (getdate()),
	DI_Modified_Date datetime NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED (StoreKey ASC) 
) 
GO
