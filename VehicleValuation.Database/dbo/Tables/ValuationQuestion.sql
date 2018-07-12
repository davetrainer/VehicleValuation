CREATE TABLE [dbo].[ValuationQuestion] (
    [Id]                      INT            IDENTITY (1, 1) NOT NULL,
    [ValuationQuestionTypeId] INT            NOT NULL,
    [Name]                    NVARCHAR (50)  NOT NULL,
    [Description]             NVARCHAR (MAX) NOT NULL,
    [AdditionalInformation]   NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_ValuationQuestion] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ValuationQuestion_ValuationQuestionType] FOREIGN KEY ([ValuationQuestionTypeId]) REFERENCES [dbo].[ValuationQuestionType] ([Id])
);

