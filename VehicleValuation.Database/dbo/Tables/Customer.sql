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
CREATE NONCLUSTERED INDEX [Idx_CustomerEmail]
    ON [dbo].[Customer]([CustomerEmail] ASC);

