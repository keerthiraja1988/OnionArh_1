CREATE TABLE [dbo].[SQLLogs] (
    [ID]                                    INT              IDENTITY (1, 1) NOT NULL,
    [GUID]                                  UNIQUEIDENTIFIER NOT NULL,
    [SPNAME]                                VARCHAR (300)    NOT NULL,
    [LEVEL]                                 VARCHAR (20)     NOT NULL,
    [MESSAGE]                               VARCHAR (MAX)    NOT NULL,
    [ExecutionTimeInMillSecInDAYS:HH:MM:SS] VARCHAR (300)    NULL,
    [ExecutionTimeInSec]                    VARCHAR (300)    NULL,
    [CREATEDON]                             DATETIME         NOT NULL,
    [CREATEDBY]                             VARCHAR (200)    NULL,
    [ErrorNumber]                           INT              NULL,
    [ErrorSeverity]                         INT              NULL,
    [ErrorState]                            INT              NULL,
    [ErrorLine]                             INT              NULL,
    [ErrorMessage]                          VARCHAR (MAX)    NULL
);

