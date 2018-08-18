CREATE TABLE [dbo].[LOG4NET] (
    [LOGID]           INT            IDENTITY (1, 1) NOT NULL,
    [DATE]            DATETIME       NOT NULL,
    [THREAD]          VARCHAR (1000) NOT NULL,
    [LEVEL]           VARCHAR (55)   NOT NULL,
    [USER]            VARCHAR (55)   NOT NULL,
    [REQUESTID]       VARCHAR (100)  NOT NULL,
    [UserHostAddress] VARCHAR (250)  NOT NULL,
    [RequestUrl]      VARCHAR (500)  NOT NULL,
    [BrowserAgent]    VARCHAR (200)  NOT NULL,
    [LOGGER]          NVARCHAR (MAX) NOT NULL,
    [MESSAGE]         NVARCHAR (MAX) NOT NULL,
    [EXCEPTION]       NVARCHAR (MAX) NOT NULL
);



