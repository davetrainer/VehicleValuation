CREATE DATABASE [VehicleValuation] ON  PRIMARY 
( NAME = N'VehicleValuation', FILENAME = N'YOURPATHHERE\VehicleValuation.mdf' , SIZE = 512000KB , FILEGROWTH = 25%)
 LOG ON 
( NAME = N'VehicleValuation_log', FILENAME = N'YOURPATHHERE\VehicleValuation_log.ldf' , SIZE = 128000KB , FILEGROWTH = 25%)
GO
ALTER DATABASE [VehicleValuation] SET COMPATIBILITY_LEVEL = 100
GO
ALTER DATABASE [VehicleValuation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VehicleValuation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VehicleValuation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VehicleValuation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VehicleValuation] SET ARITHABORT OFF 
GO
ALTER DATABASE [VehicleValuation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VehicleValuation] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [VehicleValuation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VehicleValuation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VehicleValuation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VehicleValuation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VehicleValuation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VehicleValuation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VehicleValuation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VehicleValuation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VehicleValuation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VehicleValuation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VehicleValuation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VehicleValuation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VehicleValuation] SET  READ_WRITE 
GO
ALTER DATABASE [VehicleValuation] SET RECOVERY FULL 
GO
ALTER DATABASE [VehicleValuation] SET  MULTI_USER 
GO
ALTER DATABASE [VehicleValuation] SET PAGE_VERIFY CHECKSUM  
GO
USE [VehicleValuation]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [VehicleValuationTest] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO

PRINT N'Creating [dbo].[BodyStyle]...';


GO
CREATE TABLE [dbo].[BodyStyle] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_BodyStyle] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Customer]...';


GO
CREATE TABLE [dbo].[Customer] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [CustomerName]    NVARCHAR (MAX) NOT NULL,
    [CustomerEmail]   NVARCHAR (255) NOT NULL,
    [TelephoneNumber] NVARCHAR (MAX) NOT NULL,
    [PostCode]        NVARCHAR (MAX) NOT NULL,
    [Salt]            NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Customer].[Idx_CustomerEmail]...';


GO
CREATE NONCLUSTERED INDEX [Idx_CustomerEmail]
    ON [dbo].[Customer]([CustomerEmail] ASC);


GO
PRINT N'Creating [dbo].[FuelType]...';


GO
CREATE TABLE [dbo].[FuelType] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_FuelType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Manufacturer]...';


GO
CREATE TABLE [dbo].[Manufacturer] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ManufacturerModel]...';


GO
CREATE TABLE [dbo].[ManufacturerModel] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [ManufacturerId] INT            NOT NULL,
    [Name]           NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_ManufacturerModel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ManufacturerModel].[Idx_ManufacturerModel]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [Idx_ManufacturerModel]
    ON [dbo].[ManufacturerModel]([ManufacturerId] ASC, [Name] ASC);


GO
PRINT N'Creating [dbo].[ManufacturerModelDerivative]...';


GO
CREATE TABLE [dbo].[ManufacturerModelDerivative] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [ManufacturerModelId] INT            NOT NULL,
    [Name]                NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_ManufacturerModelDerivative] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ManufacturerModelDerivative].[Idx_ManufacturerModelDerivative]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [Idx_ManufacturerModelDerivative]
    ON [dbo].[ManufacturerModelDerivative]([ManufacturerModelId] ASC, [Name] ASC);


GO
PRINT N'Creating [dbo].[RegistrationPlate]...';


GO
CREATE TABLE [dbo].[RegistrationPlate] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [RegistrationNumber] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_RegistrationPlate] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[RegistrationPlate].[Idx_RegistrationNumber]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [Idx_RegistrationNumber]
    ON [dbo].[RegistrationPlate]([RegistrationNumber] ASC);


GO
PRINT N'Creating [dbo].[TransmissionType]...';


GO
CREATE TABLE [dbo].[TransmissionType] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TransmissionType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ValuationQuestion]...';


GO
CREATE TABLE [dbo].[ValuationQuestion] (
    [Id]                      INT            IDENTITY (1, 1) NOT NULL,
    [ValuationQuestionTypeId] INT            NOT NULL,
    [Name]                    NVARCHAR (50)  NOT NULL,
    [Description]             NVARCHAR (MAX) NOT NULL,
    [AdditionalInformation]   NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_ValuationQuestion] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ValuationQuestionAnswer]...';


GO
CREATE TABLE [dbo].[ValuationQuestionAnswer] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [ValuationQuestionId] INT            NOT NULL,
    [Description]         NVARCHAR (MAX) NOT NULL,
    [AdjustmentAmount]    MONEY          NOT NULL,
    [StopValuation]       BIT            NOT NULL,
    CONSTRAINT [PK_ValuationQuestionAnswer] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ValuationQuestionType]...';


GO
CREATE TABLE [dbo].[ValuationQuestionType] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ValuationQuestionType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Vehicle]...';


GO
CREATE TABLE [dbo].[Vehicle] (
    [Id]                            INT            IDENTITY (1, 1) NOT NULL,
    [ManufacturerModelDerivativeId] INT            NOT NULL,
    [FuelTypeId]                    INT            NOT NULL,
    [TransmissionTypeId]            INT            NOT NULL,
    [BodyStyleId]                   INT            NOT NULL,
    [Colour]                        NVARCHAR (100) NOT NULL,
    [EngineSize]                    INT            NOT NULL,
    [SpecifiedMileage]              INT            NOT NULL,
    [CapImageUrl]                   NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Vehicle].[Idx_ManufacturerModelDerivative]...';


GO
CREATE NONCLUSTERED INDEX [Idx_ManufacturerModelDerivative]
    ON [dbo].[Vehicle]([ManufacturerModelDerivativeId] ASC);


GO
PRINT N'Creating [dbo].[VehicleRegistrationPlate]...';


GO
CREATE TABLE [dbo].[VehicleRegistrationPlate] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [VehicleId]           INT           NOT NULL,
    [RegistrationPlateId] INT           NOT NULL,
    [DateFrom]            DATETIME2 (7) NOT NULL,
    [DateTo]              DATETIME2 (7) NULL,
    CONSTRAINT [PK_VehicleRegistrationPlate] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[VehicleRegistrationPlate].[Idx_VehicleRegistrationPlate]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [Idx_VehicleRegistrationPlate]
    ON [dbo].[VehicleRegistrationPlate]([VehicleId] ASC, [RegistrationPlateId] ASC);


GO
PRINT N'Creating [dbo].[VehicleValuation]...';


GO
CREATE TABLE [dbo].[VehicleValuation] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [VehicleId]       INT           NOT NULL,
    [CustomerId]      INT           NOT NULL,
    [ValuationDate]   DATETIME2 (7) NOT NULL,
    [ExpiryDate]      DATETIME2 (7) NOT NULL,
    [ValuationAmount] MONEY         NOT NULL,
    CONSTRAINT [PK_VehicleValuation] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[VehicleValuation].[Idx_VehicleValuation_Vehicle]...';


GO
CREATE NONCLUSTERED INDEX [Idx_VehicleValuation_Vehicle]
    ON [dbo].[VehicleValuation]([VehicleId] ASC);


GO
PRINT N'Creating [dbo].[VehicleValuation].[Idx_VehicleValuation_Customer]...';


GO
CREATE NONCLUSTERED INDEX [Idx_VehicleValuation_Customer]
    ON [dbo].[VehicleValuation]([CustomerId] ASC);


GO
PRINT N'Creating [dbo].[VehicleValuationQuestionAnswer]...';


GO
CREATE TABLE [dbo].[VehicleValuationQuestionAnswer] (
    [Id]                        INT            IDENTITY (1, 1) NOT NULL,
    [VehicleValuationId]        INT            NOT NULL,
    [ValuationQuestionAnswerId] INT            NOT NULL,
    [AdditionalInformation]     NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_VehicleValuationQuestionAnswer] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[VehicleValuationQuestionAnswer].[Idx_VehicleValuationQuestionAnswer]...';


GO
CREATE NONCLUSTERED INDEX [Idx_VehicleValuationQuestionAnswer]
    ON [dbo].[VehicleValuationQuestionAnswer]([VehicleValuationId] ASC, [ValuationQuestionAnswerId] ASC);


GO
PRINT N'Creating [dbo].[FK_ManufacturerModel_Manufacturer]...';


GO
ALTER TABLE [dbo].[ManufacturerModel] WITH NOCHECK
    ADD CONSTRAINT [FK_ManufacturerModel_Manufacturer] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[Manufacturer] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ManufacturerModelDerivative_ManufacturerModel]...';


GO
ALTER TABLE [dbo].[ManufacturerModelDerivative] WITH NOCHECK
    ADD CONSTRAINT [FK_ManufacturerModelDerivative_ManufacturerModel] FOREIGN KEY ([ManufacturerModelId]) REFERENCES [dbo].[ManufacturerModel] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ValuationQuestion_ValuationQuestionType]...';


GO
ALTER TABLE [dbo].[ValuationQuestion] WITH NOCHECK
    ADD CONSTRAINT [FK_ValuationQuestion_ValuationQuestionType] FOREIGN KEY ([ValuationQuestionTypeId]) REFERENCES [dbo].[ValuationQuestionType] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ValuationQuestionAnswer_ValuationQuestion]...';


GO
ALTER TABLE [dbo].[ValuationQuestionAnswer] WITH NOCHECK
    ADD CONSTRAINT [FK_ValuationQuestionAnswer_ValuationQuestion] FOREIGN KEY ([ValuationQuestionId]) REFERENCES [dbo].[ValuationQuestion] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Vehicle_BodyStyle]...';


GO
ALTER TABLE [dbo].[Vehicle] WITH NOCHECK
    ADD CONSTRAINT [FK_Vehicle_BodyStyle] FOREIGN KEY ([BodyStyleId]) REFERENCES [dbo].[BodyStyle] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Vehicle_FuelType]...';


GO
ALTER TABLE [dbo].[Vehicle] WITH NOCHECK
    ADD CONSTRAINT [FK_Vehicle_FuelType] FOREIGN KEY ([FuelTypeId]) REFERENCES [dbo].[FuelType] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Vehicle_ManufacturerModelDerivative]...';


GO
ALTER TABLE [dbo].[Vehicle] WITH NOCHECK
    ADD CONSTRAINT [FK_Vehicle_ManufacturerModelDerivative] FOREIGN KEY ([ManufacturerModelDerivativeId]) REFERENCES [dbo].[ManufacturerModelDerivative] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Vehicle_TransmissionType]...';


GO
ALTER TABLE [dbo].[Vehicle] WITH NOCHECK
    ADD CONSTRAINT [FK_Vehicle_TransmissionType] FOREIGN KEY ([TransmissionTypeId]) REFERENCES [dbo].[TransmissionType] ([Id]);


GO
PRINT N'Creating [dbo].[FK_VehicleRegistrationPlate_RegistrationPlate]...';


GO
ALTER TABLE [dbo].[VehicleRegistrationPlate] WITH NOCHECK
    ADD CONSTRAINT [FK_VehicleRegistrationPlate_RegistrationPlate] FOREIGN KEY ([RegistrationPlateId]) REFERENCES [dbo].[RegistrationPlate] ([Id]);


GO
PRINT N'Creating [dbo].[FK_VehicleRegistrationPlate_Vehicle]...';


GO
ALTER TABLE [dbo].[VehicleRegistrationPlate] WITH NOCHECK
    ADD CONSTRAINT [FK_VehicleRegistrationPlate_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id]);


GO
PRINT N'Creating [dbo].[FK_VehicleValuation_Customer]...';


GO
ALTER TABLE [dbo].[VehicleValuation] WITH NOCHECK
    ADD CONSTRAINT [FK_VehicleValuation_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creating [dbo].[FK_VehicleValuation_Vehicle]...';


GO
ALTER TABLE [dbo].[VehicleValuation] WITH NOCHECK
    ADD CONSTRAINT [FK_VehicleValuation_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id]);


GO
PRINT N'Creating [dbo].[FK_VehicleValuationQuestionAnswer_ValuationQuestionAnswer]...';


GO
ALTER TABLE [dbo].[VehicleValuationQuestionAnswer] WITH NOCHECK
    ADD CONSTRAINT [FK_VehicleValuationQuestionAnswer_ValuationQuestionAnswer] FOREIGN KEY ([ValuationQuestionAnswerId]) REFERENCES [dbo].[ValuationQuestionAnswer] ([Id]);


GO
PRINT N'Creating [dbo].[FK_VehicleValuationQuestionAnswer_VehicleValuation]...';


GO
ALTER TABLE [dbo].[VehicleValuationQuestionAnswer] WITH NOCHECK
    ADD CONSTRAINT [FK_VehicleValuationQuestionAnswer_VehicleValuation] FOREIGN KEY ([VehicleValuationId]) REFERENCES [dbo].[VehicleValuation] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';

GO
ALTER TABLE [dbo].[ManufacturerModel] WITH CHECK CHECK CONSTRAINT [FK_ManufacturerModel_Manufacturer];

ALTER TABLE [dbo].[ManufacturerModelDerivative] WITH CHECK CHECK CONSTRAINT [FK_ManufacturerModelDerivative_ManufacturerModel];

ALTER TABLE [dbo].[ValuationQuestion] WITH CHECK CHECK CONSTRAINT [FK_ValuationQuestion_ValuationQuestionType];

ALTER TABLE [dbo].[ValuationQuestionAnswer] WITH CHECK CHECK CONSTRAINT [FK_ValuationQuestionAnswer_ValuationQuestion];

ALTER TABLE [dbo].[Vehicle] WITH CHECK CHECK CONSTRAINT [FK_Vehicle_BodyStyle];

ALTER TABLE [dbo].[Vehicle] WITH CHECK CHECK CONSTRAINT [FK_Vehicle_FuelType];

ALTER TABLE [dbo].[Vehicle] WITH CHECK CHECK CONSTRAINT [FK_Vehicle_ManufacturerModelDerivative];

ALTER TABLE [dbo].[Vehicle] WITH CHECK CHECK CONSTRAINT [FK_Vehicle_TransmissionType];

ALTER TABLE [dbo].[VehicleRegistrationPlate] WITH CHECK CHECK CONSTRAINT [FK_VehicleRegistrationPlate_RegistrationPlate];

ALTER TABLE [dbo].[VehicleRegistrationPlate] WITH CHECK CHECK CONSTRAINT [FK_VehicleRegistrationPlate_Vehicle];

ALTER TABLE [dbo].[VehicleValuation] WITH CHECK CHECK CONSTRAINT [FK_VehicleValuation_Customer];

ALTER TABLE [dbo].[VehicleValuation] WITH CHECK CHECK CONSTRAINT [FK_VehicleValuation_Vehicle];

ALTER TABLE [dbo].[VehicleValuationQuestionAnswer] WITH CHECK CHECK CONSTRAINT [FK_VehicleValuationQuestionAnswer_ValuationQuestionAnswer];

ALTER TABLE [dbo].[VehicleValuationQuestionAnswer] WITH CHECK CHECK CONSTRAINT [FK_VehicleValuationQuestionAnswer_VehicleValuation];


GO
PRINT N'Update complete.';


GO