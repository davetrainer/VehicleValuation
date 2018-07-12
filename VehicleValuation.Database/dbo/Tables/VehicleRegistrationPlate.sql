CREATE TABLE [dbo].[VehicleRegistrationPlate] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [VehicleId]           INT           NOT NULL,
    [RegistrationPlateId] INT           NOT NULL,
    [DateFrom]            DATETIME2 (7) NOT NULL,
    [DateTo]              DATETIME2 (7) NULL,
    CONSTRAINT [PK_VehicleRegistrationPlate] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_VehicleRegistrationPlate_RegistrationPlate] FOREIGN KEY ([RegistrationPlateId]) REFERENCES [dbo].[RegistrationPlate] ([Id]),
    CONSTRAINT [FK_VehicleRegistrationPlate_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Idx_VehicleRegistrationPlate]
    ON [dbo].[VehicleRegistrationPlate]([VehicleId] ASC, [RegistrationPlateId] ASC);

