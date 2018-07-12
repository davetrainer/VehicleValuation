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
    CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Vehicle_BodyStyle] FOREIGN KEY ([BodyStyleId]) REFERENCES [dbo].[BodyStyle] ([Id]),
    CONSTRAINT [FK_Vehicle_FuelType] FOREIGN KEY ([FuelTypeId]) REFERENCES [dbo].[FuelType] ([Id]),
    CONSTRAINT [FK_Vehicle_ManufacturerModelDerivative] FOREIGN KEY ([ManufacturerModelDerivativeId]) REFERENCES [dbo].[ManufacturerModelDerivative] ([Id]),
    CONSTRAINT [FK_Vehicle_TransmissionType] FOREIGN KEY ([TransmissionTypeId]) REFERENCES [dbo].[TransmissionType] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [Idx_ManufacturerModelDerivative]
    ON [dbo].[Vehicle]([ManufacturerModelDerivativeId] ASC);

