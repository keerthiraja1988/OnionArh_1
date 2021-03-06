USE [FileEncryption]
GO
/****** Object:  StoredProcedure [dbo].[SaveFileEncryptionDetails]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveFileEncryptionDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SaveFileEncryptionDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetEncryptedFileDetails]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetEncryptedFileDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetEncryptedFileDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetEncryptedFileDetail]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetEncryptedFileDetail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetEncryptedFileDetail]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_LogError]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ELMAH_LogError]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorXml]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ELMAH_GetErrorXml]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorsXml]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ELMAH_GetErrorsXml]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ELMAH_Error_ErrorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ELMAH_Error] DROP CONSTRAINT [DF_ELMAH_Error_ErrorId]
END

GO
/****** Object:  Index [IX_ELMAH_Error_App_Time_Seq]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'IX_ELMAH_Error_App_Time_Seq')
DROP INDEX [IX_ELMAH_Error_App_Time_Seq] ON [dbo].[ELMAH_Error]
GO
/****** Object:  Index [PK_ELMAH_Error]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'PK_ELMAH_Error')
ALTER TABLE [dbo].[ELMAH_Error] DROP CONSTRAINT [PK_ELMAH_Error]
GO
/****** Object:  Table [dbo].[LOG4NET]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOG4NET]') AND type in (N'U'))
DROP TABLE [dbo].[LOG4NET]
GO
/****** Object:  Table [dbo].[FileEncryptionDetails]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FileEncryptionDetails]') AND type in (N'U'))
DROP TABLE [dbo].[FileEncryptionDetails]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND type in (N'U'))
DROP TABLE [dbo].[ELMAH_Error]
GO
/****** Object:  Table [dbo].[ApplicationCacheConfig]    Script Date: 24-03-2018 22:24:07 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationCacheConfig]') AND type in (N'U'))
DROP TABLE [dbo].[ApplicationCacheConfig]
GO
/****** Object:  Table [dbo].[ApplicationCacheConfig]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationCacheConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationCacheConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](1000) NOT NULL,
	[Value] [varchar](1000) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FileEncryptionDetails]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FileEncryptionDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FileEncryptionDetails](
	[ID] [bigint] IDENTITY(10000,1) NOT NULL,
	[EncryptionId] [nvarchar](max) NULL,
	[FileName] [varchar](max) NULL,
	[FileDescription] [varchar](max) NULL,
	[Path] [varchar](max) NULL,
	[UploadedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOG4NET]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOG4NET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LOG4NET](
	[LOGID] [int] IDENTITY(1,1) NOT NULL,
	[DATE] [datetime] NOT NULL,
	[THREAD] [varchar](1000) NOT NULL,
	[LEVEL] [varchar](55) NOT NULL,
	[LOGGER] [nvarchar](max) NOT NULL,
	[MESSAGE] [nvarchar](max) NOT NULL,
	[EXCEPTION] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ApplicationCacheConfig] ON 

GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (41, N'LOGDEBUG', N'TRUE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (42, N'LOGINFO', N'TRUE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (43, N'LOGServiceDEBUG', N'TRUE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (44, N'LOGServiceINFO', N'TRUE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (45, N'LOGOrchestratorDEBUG', N'TRUE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (46, N'LOGOrchestratorINFO', N'TRUE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (47, N'LOGWebAppDEBUG', N'TRUE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (48, N'LOGWebAppINFO', N'TRUE')
GO
SET IDENTITY_INSERT [dbo].[ApplicationCacheConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[FileEncryptionDetails] ON 

GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [UploadedOn]) VALUES (10000, N'100', N'100', N'100', N'100', CAST(N'2018-02-24 00:20:30.050' AS DateTime))
GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [UploadedOn]) VALUES (10001, N'100', N'100', N'100', N'100', CAST(N'2018-02-24 00:20:32.723' AS DateTime))
GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [UploadedOn]) VALUES (10002, N'pa05i46G', N'Tes.csv', N'Encrypted with DES Data Encryption Standard algorithm', N'G:\Carrier\EncryptFilePath\', CAST(N'2018-03-23 00:32:10.843' AS DateTime))
GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [UploadedOn]) VALUES (10003, N'ktEODi11', N'Tes.csv', N'Encrypted with DES Data Encryption Standard algorithm', N'G:\Carrier\EncryptFilePath\', CAST(N'2018-03-23 22:07:32.283' AS DateTime))
GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [UploadedOn]) VALUES (10004, N'ty54OJ33', N'Tes.csv', N'Encrypted with DES Data Encryption Standard algorithm', N'G:\Carrier\EncryptFilePath\', CAST(N'2018-03-23 22:36:51.187' AS DateTime))
GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [UploadedOn]) VALUES (10005, N'rPvERoi4', N'We Love Russia Compilation June 2014 -- TNL.mp4', N'Encrypted with DES Data Encryption Standard algorithm', N'G:\Carrier\EncryptFilePath\', CAST(N'2018-03-23 23:00:49.993' AS DateTime))
GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [UploadedOn]) VALUES (10006, N'46gHr9ip', N'Tes.csv', N'Encrypted with DES Data Encryption Standard algorithm', N'G:\Carrier\EncryptFilePath\', CAST(N'2018-03-24 15:17:50.480' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[FileEncryptionDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[LOG4NET] ON 

GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30800, CAST(N'2018-03-24 22:22:52.720' AS DateTime), N'12', N'DEBUG', N'System.Reflection.MethodBase', N'Deleted Logs', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30801, CAST(N'2018-03-24 22:22:52.730' AS DateTime), N'12', N'DEBUG', N'WebApp.CacheManager', N'Entering CacheManager.IsExists.', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30802, CAST(N'2018-03-24 22:22:52.740' AS DateTime), N'12', N'DEBUG', N'WebApp.CacheManager', N'Method IsExists
Arguments:
 System.String Arg0 = FxRates', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30803, CAST(N'2018-03-24 22:22:52.747' AS DateTime), N'12', N'INFO', N'WebApp.CacheManager', N'CacheManager.IsExists. Return value <?xml version="1.0" encoding="utf-16"?>
<boolean>false</boolean>', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30804, CAST(N'2018-03-24 22:22:52.750' AS DateTime), N'12', N'DEBUG', N'WebApp.CacheManager', N'Leaving CacheManager.IsExists. Return value False', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30805, CAST(N'2018-03-24 22:23:12.767' AS DateTime), N'9', N'DEBUG', N'System.Reflection.MethodBase', N'Deleted Logs', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30806, CAST(N'2018-03-24 22:23:12.770' AS DateTime), N'9', N'DEBUG', N'WebApp.CacheManager', N'Entering CacheManager.IsExists.', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30807, CAST(N'2018-03-24 22:23:12.773' AS DateTime), N'9', N'DEBUG', N'WebApp.CacheManager', N'Method IsExists
Arguments:
 System.String Arg0 = FxRates', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30808, CAST(N'2018-03-24 22:23:12.777' AS DateTime), N'9', N'INFO', N'WebApp.CacheManager', N'CacheManager.IsExists. Return value <?xml version="1.0" encoding="utf-16"?>
<boolean>false</boolean>', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30809, CAST(N'2018-03-24 22:23:12.783' AS DateTime), N'9', N'DEBUG', N'WebApp.CacheManager', N'Leaving CacheManager.IsExists. Return value False', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30810, CAST(N'2018-03-24 22:23:32.790' AS DateTime), N'5', N'DEBUG', N'System.Reflection.MethodBase', N'Deleted Logs', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30811, CAST(N'2018-03-24 22:23:32.793' AS DateTime), N'5', N'DEBUG', N'WebApp.CacheManager', N'Entering CacheManager.IsExists.', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30812, CAST(N'2018-03-24 22:23:32.797' AS DateTime), N'5', N'DEBUG', N'WebApp.CacheManager', N'Method IsExists
Arguments:
 System.String Arg0 = FxRates', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30813, CAST(N'2018-03-24 22:23:32.800' AS DateTime), N'5', N'INFO', N'WebApp.CacheManager', N'CacheManager.IsExists. Return value <?xml version="1.0" encoding="utf-16"?>
<boolean>false</boolean>', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30814, CAST(N'2018-03-24 22:23:32.803' AS DateTime), N'5', N'DEBUG', N'WebApp.CacheManager', N'Leaving CacheManager.IsExists. Return value False', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30815, CAST(N'2018-03-24 22:23:52.817' AS DateTime), N'11', N'DEBUG', N'System.Reflection.MethodBase', N'Deleted Logs', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30816, CAST(N'2018-03-24 22:23:53.077' AS DateTime), N'11', N'DEBUG', N'WebApp.CacheManager', N'Entering CacheManager.IsExists.', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30817, CAST(N'2018-03-24 22:23:53.087' AS DateTime), N'11', N'DEBUG', N'WebApp.CacheManager', N'Method IsExists
Arguments:
 System.String Arg0 = FxRates', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30818, CAST(N'2018-03-24 22:23:53.090' AS DateTime), N'11', N'INFO', N'WebApp.CacheManager', N'CacheManager.IsExists. Return value <?xml version="1.0" encoding="utf-16"?>
<boolean>false</boolean>', N'')
GO
INSERT [dbo].[LOG4NET] ([LOGID], [DATE], [THREAD], [LEVEL], [LOGGER], [MESSAGE], [EXCEPTION]) VALUES (30819, CAST(N'2018-03-24 22:23:53.093' AS DateTime), N'11', N'DEBUG', N'WebApp.CacheManager', N'Leaving CacheManager.IsExists. Return value False', N'')
GO
SET IDENTITY_INSERT [dbo].[LOG4NET] OFF
GO
/****** Object:  Index [PK_ELMAH_Error]    Script Date: 24-03-2018 22:24:07 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'PK_ELMAH_Error')
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ELMAH_Error_App_Time_Seq]    Script Date: 24-03-2018 22:24:07 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_Error]') AND name = N'IX_ELMAH_Error_App_Time_Seq')
CREATE NONCLUSTERED INDEX [IX_ELMAH_Error_App_Time_Seq] ON [dbo].[ELMAH_Error]
(
	[Application] ASC,
	[TimeUtc] DESC,
	[Sequence] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ELMAH_Error_ErrorId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
END

GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorsXml]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml] AS' 
END
GO

ALTER PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

    SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO



GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_GetErrorXml]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml] AS' 
END
GO

ALTER PROCEDURE [dbo].[ELMAH_GetErrorXml]
(
    @Application NVARCHAR(60),
    @ErrorId UNIQUEIDENTIFIER
)
AS

    SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application



GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ELMAH_LogError]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ELMAH_LogError] AS' 
END
GO

ALTER PROCEDURE [dbo].[ELMAH_LogError]
(
    @ErrorId UNIQUEIDENTIFIER,
    @Application NVARCHAR(60),
    @Host NVARCHAR(30),
    @Type NVARCHAR(100),
    @Source NVARCHAR(60),
    @Message NVARCHAR(500),
    @User NVARCHAR(50),
    @AllXml NTEXT,
    @StatusCode INT,
    @TimeUtc DATETIME
)
AS

	IF @Source = ''
	BEGIN
		SET @Source = 'Jquery'
	END

    SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )



GO
/****** Object:  StoredProcedure [dbo].[GetEncryptedFileDetail]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetEncryptedFileDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetEncryptedFileDetail] AS' 
END
GO


ALTER PROC [dbo].[GetEncryptedFileDetail] 
		  @Id	BIGINT
  AS
begin

SELECT  [ID]
      ,[EncryptionId]
      ,[FileName]
      ,[FileDescription]
      ,[Path]
      ,[UploadedOn]
  FROM [dbo].[FileEncryptionDetails]
  where [ID] = @Id
end





GO
/****** Object:  StoredProcedure [dbo].[GetEncryptedFileDetails]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetEncryptedFileDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetEncryptedFileDetails] AS' 
END
GO

ALTER PROC [dbo].[GetEncryptedFileDetails] 
		  
  AS
begin

SELECT TOP 1000 [ID]
      ,[EncryptionId]
      ,[FileName]
      ,[FileDescription]
      ,[Path]
      ,[UploadedOn]
  FROM [FileEncryption].[dbo].[FileEncryptionDetails]
end




GO
/****** Object:  StoredProcedure [dbo].[SaveFileEncryptionDetails]    Script Date: 24-03-2018 22:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveFileEncryptionDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SaveFileEncryptionDetails] AS' 
END
GO

ALTER PROC [dbo].[SaveFileEncryptionDetails] 
		   @EncryptionId	varchar(max),
           @FileName		varchar(max),
           @FileDescription varchar(max),
           @Path			varchar(max),
           @UploadedOn		datetime
  AS
begin

  INSERT INTO [dbo].[FileEncryptionDetails]
           ([EncryptionId]
           ,[FileName]
           ,[FileDescription]
           ,[Path]
           ,[UploadedOn]
		   )
		   select

		    @EncryptionId	
		   , @FileName		
		   , @FileDescription 
		   , @Path			
		   , @UploadedOn
		   
		  select cast( SCOPE_IDENTITY() as BIGINT)

end




GO
