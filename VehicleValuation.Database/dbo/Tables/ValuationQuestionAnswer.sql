CREATE TABLE [dbo].[ValuationQuestionAnswer] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [ValuationQuestionId] INT            NOT NULL,
    [Description]         NVARCHAR (MAX) NOT NULL,
    [AdjustmentAmount]    MONEY          NOT NULL,
    [StopValuation]       BIT            NOT NULL,
    CONSTRAINT [PK_ValuationQuestionAnswer] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ValuationQuestionAnswer_ValuationQuestion] FOREIGN KEY ([ValuationQuestionId]) REFERENCES [dbo].[ValuationQuestion] ([Id])
);

