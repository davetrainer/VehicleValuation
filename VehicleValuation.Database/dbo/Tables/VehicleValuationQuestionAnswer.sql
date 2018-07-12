CREATE TABLE [dbo].[VehicleValuationQuestionAnswer] (
    [Id]                        INT            IDENTITY (1, 1) NOT NULL,
    [VehicleValuationId]        INT            NOT NULL,
    [ValuationQuestionAnswerId] INT            NOT NULL,
    [AdditionalInformation]     NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_VehicleValuationQuestionAnswer] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_VehicleValuationQuestionAnswer_ValuationQuestionAnswer] FOREIGN KEY ([ValuationQuestionAnswerId]) REFERENCES [dbo].[ValuationQuestionAnswer] ([Id]),
    CONSTRAINT [FK_VehicleValuationQuestionAnswer_VehicleValuation] FOREIGN KEY ([VehicleValuationId]) REFERENCES [dbo].[VehicleValuation] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [Idx_VehicleValuationQuestionAnswer]
    ON [dbo].[VehicleValuationQuestionAnswer]([VehicleValuationId] ASC, [ValuationQuestionAnswerId] ASC);

