CREATE TABLE [dbo].[ManufacturerModelDerivative] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [ManufacturerModelId] INT            NOT NULL,
    [Name]                NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_ManufacturerModelDerivative] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ManufacturerModelDerivative_ManufacturerModel] FOREIGN KEY ([ManufacturerModelId]) REFERENCES [dbo].[ManufacturerModel] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Idx_ManufacturerModelDerivative]
    ON [dbo].[ManufacturerModelDerivative]([ManufacturerModelId] ASC, [Name] ASC);

