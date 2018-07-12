CREATE TABLE [dbo].[RegistrationPlate] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [RegistrationNumber] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_RegistrationPlate] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Idx_RegistrationNumber]
    ON [dbo].[RegistrationPlate]([RegistrationNumber] ASC);

