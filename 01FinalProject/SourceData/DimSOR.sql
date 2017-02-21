USE [neu_stage]
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
	SOR_AppTable   varchar(255) NULL,
	DW_CreateDate  datetime NOT NULL DEFAULT (getdate()),
	DW_ModifyDate  datetime NOT NULL DEFAULT (getdate())
	)
GO



