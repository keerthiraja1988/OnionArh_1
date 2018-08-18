CREATE TABLE [dbo].[FileEncryptionDetails] (
    [ID]              BIGINT         IDENTITY (10000, 1) NOT NULL,
    [EncryptionId]    NVARCHAR (MAX) NULL,
    [FileName]        VARCHAR (MAX)  NULL,
    [FileDescription] VARCHAR (MAX)  NULL,
    [Path]            VARCHAR (MAX)  NULL,
    [CreatedOn]       DATETIME       NULL,
    [CreatedBy]       BIGINT         NULL,
    [ModifiedOn]      DATETIME       NULL,
    [ModifiedBy]      BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);



