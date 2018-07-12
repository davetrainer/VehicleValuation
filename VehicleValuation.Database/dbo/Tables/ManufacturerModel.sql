CREATE TABLE [dbo].[ManufacturerModel] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [ManufacturerId] INT            NOT NULL,
    [Name]           NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_ManufacturerModel] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ManufacturerModel_Manufacturer] FOREIGN KEY ([ManufacturerId]) REFERENCES [dbo].[Manufacturer] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Idx_ManufacturerModel]
    ON [dbo].[ManufacturerModel]([ManufacturerId] ASC, [Name] ASC);

