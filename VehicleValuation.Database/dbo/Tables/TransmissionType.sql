CREATE TABLE [dbo].[TransmissionType] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TransmissionType] PRIMARY KEY CLUSTERED ([Id] ASC)
);

