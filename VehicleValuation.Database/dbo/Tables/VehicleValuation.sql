CREATE TABLE [dbo].[VehicleValuation] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [VehicleId]       INT           NOT NULL,
    [CustomerId]      INT           NOT NULL,
    [ValuationDate]   DATETIME2 (7) NOT NULL,
    [ExpiryDate]      DATETIME2 (7) NOT NULL,
    [ValuationAmount] MONEY         NOT NULL,
    CONSTRAINT [PK_VehicleValuation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_VehicleValuation_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([Id]),
    CONSTRAINT [FK_VehicleValuation_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [Idx_VehicleValuation_Vehicle]
    ON [dbo].[VehicleValuation]([VehicleId] ASC);


GO
CREATE NONCLUSTERED INDEX [Idx_VehicleValuation_Customer]
    ON [dbo].[VehicleValuation]([CustomerId] ASC);

