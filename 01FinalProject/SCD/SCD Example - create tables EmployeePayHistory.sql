USE neu_training
GO

drop TABLE EmployeePayHistory
go

CREATE TABLE EmployeePayHistory(
	[PayHistorySK] [int] identity(1,1) NOT NULL,

	[EmployeeID] [int] NOT NULL,   -- BusinessEntityID

	[NationalIDNumber] [nvarchar](15) NOT NULL,

	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,

	[LoginID] [nvarchar](256) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[MaritalStatus] [nchar](1) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[VacationHours] int  DEFAULT ((0)),
	[SickLeaveHours] int DEFAULT ((0)),
	[CurrentFlag] bit  DEFAULT ((1)),

	--[RateChangeDate] [datetime] NOT NULL,  use for Rate_EffectiveDate
	[Rate] numeric(15,2) NOT NULL,
	[PayFrequency] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,

	[Rate_EffectiveDate] [date] NOT NULL,  -- SCD_State
	[Rate_IneffectiveDate] [date] NULL,    -- SCD_End
	[SCD_Version] [int] NULL,
	[SCD_Active] [bit] NOT NULL DEFAULT ((0)),

        [DI_Job_ID] [nvarchar](20) NOT NULL,
	[DI_Create_Date] [datetime]  NOT NULL default getdate(),
	[DI_Modified_Date] [datetime]  NOT NULL default getdate(),
	PRIMARY KEY CLUSTERED ([PayHistorySK] ASC)
)

GO
drop TABLE EmployeePayHistory_Simple
go

CREATE TABLE EmployeePayHistory_Simple(
	[PayHistorySK] [int] identity(1,1) NOT NULL,
	[BusinessEntityID] [int] NOT NULL,   -- employee id
	-- [RateChangeDate] [datetime] NOT NULL,  use for SCD_start
	[Rate] numeric(15,2) NOT NULL,
	[PayFrequency] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[SCD_start] [date] NOT NULL,   -- RateChangeDate
	[SCD_end] [date] NULL,
	[SCD_Version] [int] NULL,
	[SCD_Active] [bit] NOT NULL DEFAULT ((0)),
        [DI_Job_ID] [nvarchar](20) NOT NULL,
	[DI_Create_Date] [datetime]  NOT NULL default getdate(),
	[DI_Modified_Date] [datetime]  NOT NULL default getdate(),
	PRIMARY KEY CLUSTERED ([PayHistorySK] ASC)
)

GO