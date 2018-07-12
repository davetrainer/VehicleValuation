CREATE TABLE [dbo].[BodyStyle] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_BodyStyle] PRIMARY KEY CLUSTERED ([Id] ASC)
);

