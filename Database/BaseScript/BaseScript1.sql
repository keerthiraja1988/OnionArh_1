USE [FileEncryption]
GO
/****** Object:  StoredProcedure [dbo].[ValidateUserLoginDetails]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[ValidateUserLoginDetails]
GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationCacheValue]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[UpdateApplicationCacheValue]
GO
/****** Object:  StoredProcedure [dbo].[SaveNotification]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[SaveNotification]
GO
/****** Object:  StoredProcedure [dbo].[SaveFileEncryptionDetails]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[SaveFileEncryptionDetails]
GO
/****** Object:  StoredProcedure [dbo].[P_UpdateUserDetailsForUserId]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_UpdateUserDetailsForUserId]
GO
/****** Object:  StoredProcedure [dbo].[P_SQLDebugLogger]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_SQLDebugLogger]
GO
/****** Object:  StoredProcedure [dbo].[P_SaveMVCAuditTrail]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_SaveMVCAuditTrail]
GO
/****** Object:  StoredProcedure [dbo].[P_RegisterNewUser]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_RegisterNewUser]
GO
/****** Object:  StoredProcedure [dbo].[P_GetUserRoleDetailsForUserId]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_GetUserRoleDetailsForUserId]
GO
/****** Object:  StoredProcedure [dbo].[P_GetUserRoleDetailsForLogin]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_GetUserRoleDetailsForLogin]
GO
/****** Object:  StoredProcedure [dbo].[P_GetUserDetailsForLogin]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_GetUserDetailsForLogin]
GO
/****** Object:  StoredProcedure [dbo].[P_GetFileEncryptionDetailsForDashBoard]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_GetFileEncryptionDetailsForDashBoard]
GO
/****** Object:  StoredProcedure [dbo].[P_GetAllUserRoleDetails]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_GetAllUserRoleDetails]
GO
/****** Object:  StoredProcedure [dbo].[P_GetAllRoleDetails]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_GetAllRoleDetails]
GO
/****** Object:  StoredProcedure [dbo].[P_DashBoardWidgetDetails]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_DashBoardWidgetDetails]
GO
/****** Object:  StoredProcedure [dbo].[P_DashBoardGetFileEncryptionChart]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_DashBoardGetFileEncryptionChart]
GO
/****** Object:  StoredProcedure [dbo].[P_AddNewUser]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[P_AddNewUser]
GO
/****** Object:  StoredProcedure [dbo].[GetEncryptedFileDetails]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[GetEncryptedFileDetails]
GO
/****** Object:  StoredProcedure [dbo].[GetEncryptedFileDetail]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[GetEncryptedFileDetail]
GO
/****** Object:  StoredProcedure [dbo].[GetAllUserAccountDetails]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[GetAllUserAccountDetails]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[ELMAH_LogError]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[ELMAH_GetErrorXml]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 25-04-2018 10:42:12 ******/
DROP PROCEDURE [dbo].[ELMAH_GetErrorsXml]
GO
ALTER TABLE [HangFire].[State] DROP CONSTRAINT [FK_HangFire_State_Job]
GO
ALTER TABLE [HangFire].[JobParameter] DROP CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[ELMAH_Error] DROP CONSTRAINT [DF_ELMAH_Error_ErrorId]
GO
/****** Object:  Index [IX_HangFire_State_JobId]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_State_JobId] ON [HangFire].[State]
GO
/****** Object:  Index [UX_HangFire_Set_KeyAndValue]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [UX_HangFire_Set_KeyAndValue] ON [HangFire].[Set]
GO
/****** Object:  Index [IX_HangFire_Set_Key]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_Set_Key] ON [HangFire].[Set]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
GO
/****** Object:  Index [IX_HangFire_List_Key]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_List_Key] ON [HangFire].[List]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
GO
/****** Object:  Index [IX_HangFire_JobQueue_QueueAndFetchedAt]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_JobQueue_QueueAndFetchedAt] ON [HangFire].[JobQueue]
GO
/****** Object:  Index [IX_HangFire_JobParameter_JobIdAndName]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_JobParameter_JobIdAndName] ON [HangFire].[JobParameter]
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
GO
/****** Object:  Index [UX_HangFire_Hash_Key_Field]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [UX_HangFire_Hash_Key_Field] ON [HangFire].[Hash]
GO
/****** Object:  Index [IX_HangFire_Hash_Key]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_Hash_Key] ON [HangFire].[Hash]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
GO
/****** Object:  Index [IX_HangFire_Counter_Key]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [IX_HangFire_Counter_Key] ON [HangFire].[Counter]
GO
/****** Object:  Index [UX_HangFire_CounterAggregated_Key]    Script Date: 25-04-2018 10:42:12 ******/
DROP INDEX [UX_HangFire_CounterAggregated_Key] ON [HangFire].[AggregatedCounter]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[State]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[Set]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[Server]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[Schema]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[List]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[JobQueue]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[JobParameter]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[Job]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[Hash]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[Counter]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [HangFire].[AggregatedCounter]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[UserRoles]
GO
/****** Object:  Table [dbo].[SQLLogs]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[SQLLogs]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[Notification]
GO
/****** Object:  Table [dbo].[MVCAuditTrail]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[MVCAuditTrail]
GO
/****** Object:  Table [dbo].[LOG4NET]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[LOG4NET]
GO
/****** Object:  Table [dbo].[FileEncryptionDetails]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[FileEncryptionDetails]
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[ELMAH_Error]
GO
/****** Object:  Table [dbo].[ApplicationCacheConfig]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[ApplicationCacheConfig]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 25-04-2018 10:42:12 ******/
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  UserDefinedTableType [dbo].[T_UserRoles]    Script Date: 25-04-2018 10:42:12 ******/
DROP TYPE [dbo].[T_UserRoles]
GO
/****** Object:  Schema [HangFire]    Script Date: 25-04-2018 10:42:12 ******/
DROP SCHEMA [HangFire]
GO
/****** Object:  Schema [HangFire]    Script Date: 25-04-2018 10:42:12 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  UserDefinedTableType [dbo].[T_UserRoles]    Script Date: 25-04-2018 10:42:12 ******/
CREATE TYPE [dbo].[T_UserRoles] AS TABLE(
	[UserId] [int] NULL,
	[RoleId] [int] NULL
)
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApplicationCacheConfig]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApplicationCacheConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Key] [varchar](1000) NOT NULL,
	[Value] [varchar](1000) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
	[AllXml] [ntext] NOT NULL,
 CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FileEncryptionDetails]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileEncryptionDetails](
	[ID] [bigint] IDENTITY(10000,1) NOT NULL,
	[EncryptionId] [nvarchar](max) NULL,
	[FileName] [varchar](max) NULL,
	[FileDescription] [varchar](max) NULL,
	[Path] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOG4NET]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOG4NET](
	[LOGID] [int] IDENTITY(1,1) NOT NULL,
	[DATE] [datetime] NOT NULL,
	[THREAD] [varchar](1000) NOT NULL,
	[LEVEL] [varchar](55) NOT NULL,
	[USER] [varchar](55) NOT NULL,
	[REQUESTID] [varchar](100) NOT NULL,
	[UserHostAddress] [varchar](250) NOT NULL,
	[RequestUrl] [varchar](500) NOT NULL,
	[BrowserAgent] [varchar](200) NOT NULL,
	[LOGGER] [nvarchar](max) NOT NULL,
	[MESSAGE] [nvarchar](max) NOT NULL,
	[EXCEPTION] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MVCAuditTrail]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MVCAuditTrail](
	[UsersAuditID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[SessionID] [nvarchar](max) NULL,
	[IPAddress] [nvarchar](max) NULL,
	[PageAccessed] [nvarchar](max) NULL,
	[ConnectedOn] [datetime] NULL,
	[DisconnectedOn] [datetime] NULL,
	[LoginStatus] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](max) NULL,
	[ActionName] [nvarchar](300) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_UsersAuditID] PRIMARY KEY CLUSTERED 
(
	[UsersAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Details] [nvarchar](1000) NULL,
	[Title] [nvarchar](100) NULL,
	[DetailsURL] [nvarchar](500) NULL,
	[UserID] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[IsRead] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[IsReminder] [bit] NULL,
	[Code] [nvarchar](100) NULL,
	[NotificationType] [nvarchar](100) NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SQLLogs]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SQLLogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[SPNAME] [varchar](300) NOT NULL,
	[LEVEL] [varchar](20) NOT NULL,
	[MESSAGE] [varchar](max) NOT NULL,
	[ExecutionTimeInMillSecInDAYS:HH:MM:SS] [varchar](300) NULL,
	[ExecutionTimeInSec] [varchar](300) NULL,
	[CREATEDON] [datetime] NOT NULL,
	[CREATEDBY] [varchar](200) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](300) NULL,
	[PasswordSalt] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [smallint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Job]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[List]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Server]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Set]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[State]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_CounterAggregated_Key]    Script Date: 25-04-2018 10:42:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_CounterAggregated_Key] ON [HangFire].[AggregatedCounter]
(
	[Key] ASC
)
INCLUDE ( 	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Counter_Key]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Counter_Key] ON [HangFire].[Counter]
(
	[Key] ASC
)
INCLUDE ( 	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Hash_Key]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_Key] ON [HangFire].[Hash]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_Hash_Key_Field]    Script Date: 25-04-2018 10:42:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Hash_Key_Field] ON [HangFire].[Hash]
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_JobParameter_JobIdAndName]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobParameter_JobIdAndName] ON [HangFire].[JobParameter]
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_JobQueue_QueueAndFetchedAt]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobQueue_QueueAndFetchedAt] ON [HangFire].[JobQueue]
(
	[Queue] ASC,
	[FetchedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_List_Key]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_Key] ON [HangFire].[List]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt],
	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Set_Key]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Key] ON [HangFire].[Set]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt],
	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_Set_KeyAndValue]    Script Date: 25-04-2018 10:42:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Set_KeyAndValue] ON [HangFire].[Set]
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_JobId]    Script Date: 25-04-2018 10:42:12 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_JobId] ON [HangFire].[State]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo.UserRoles_dbo.Users_UserId]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml]
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
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml]
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
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELMAH_LogError]
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
		
		if @Message like '%Jquery Debug%'
		BEGIN
			SET @Source = 'Jquery Debug'
		END
		ELSE
			SET @Source = 'Jquery Error'			
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
/****** Object:  StoredProcedure [dbo].[GetAllUserAccountDetails]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetAllUserAccountDetails] 		
  AS
begin

SELECT  [UserId]
      ,[Username]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Password]
      ,[PasswordHash]
      ,[PasswordSalt]
      ,[IsActive]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[ModifiedOn]
      ,[ModifiedBy]
  FROM [FileEncryption].[dbo].[Users]
end






GO
/****** Object:  StoredProcedure [dbo].[GetEncryptedFileDetail]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetEncryptedFileDetail] 
		  @Id	BIGINT
  AS
begin

SELECT  [ID]
      ,[EncryptionId]
      ,[FileName]
      ,[FileDescription]
      ,[Path]
			,[CreatedOn] 
			,[CreatedBy] 
			,[ModifiedOn]
			,[ModifiedBy]
  FROM [dbo].[FileEncryptionDetails]
  where [ID] = @Id
end






GO
/****** Object:  StoredProcedure [dbo].[GetEncryptedFileDetails]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GetEncryptedFileDetails] 
		  @CanDebug  BIT = 1
		 ,@ReturnError int OUT
		 ,@ReturnErrorMessage [varchar](MAX) OUT
		 ,@ReturnGuid UNIQUEIDENTIFIER OUT
		
  AS
begin

	DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
			,@SPStartDateTIme datetime
			,@SPEndDateTIme datetime
			,@MESSAGE [varchar](MAX)
			,@ExecutionTime  VARCHAR(300)
			,@ExecutionTimeInSec [varchar](300) 
	SET @ReturnGuid =  NEWID()  

	BEGIN TRY

	IF @CanDebug = 1
		BEGIN
			SET @SPStartDateTIme = GETDATE()
			SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPStartDateTIme, 25)
			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPStartDateTIme,
					@LEVEL = 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
		END
--------------------------------------------------------------  Your Query Start-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------


	SELECT [ID]
		  ,[EncryptionId]
		  ,[FileName]
		  ,[FileDescription]
		  ,[Path]
		  ,[CreatedOn]
		  ,[CreatedBy]
		  ,[ModifiedOn]
		  ,[ModifiedBy]		 
	  FROM [dbo].[FileEncryptionDetails]


--------------------------------------------------------------  Your Query End-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

	
--INSERT INTO [dbo].[FileEncryptionDetails]
--           (ID
--          )
--		  SELECT 1

	IF @CanDebug = 1
		BEGIN
			SET @SPEndDateTIme = GETDATE()
			SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)


			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName				= @SpName,
					@GUID				= @ReturnGuid,
					@CREATEDBY			= '',
					@MESSAGE			= @MESSAGE,
					@DATE				= @SPEndDateTIme,
					@LEVEL				= 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
		END
		
	END TRY

	BEGIN CATCH	
		  DECLARE 	@ErrorNumber	 [int] = NULL,
					@ErrorSeverity  [int] = NULL,
					@ErrorState		[int] = NULL,
					@ErrorLine		[int] = NULL,
					@ErrorMessage  [varchar](max)  = NULL

		SELECT @ErrorNumber	= ERROR_NUMBER(),
			   @ErrorSeverity = 	ERROR_SEVERITY(),
			   @ErrorState		= ERROR_STATE(),
			   @ErrorLine		= 	ERROR_LINE(),
			   @ErrorMessage  =ERROR_MESSAGE()

			SET @SPEndDateTIme = GETDATE()
		
			SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)
			
		EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPEndDateTIme,
					@LEVEL = 'ERROR'
					,@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
				,@ErrorNumber		=		@ErrorNumber,	
				@ErrorSeverity		=		@ErrorSeverity,	
				@ErrorState			=		@ErrorState	,	
				@ErrorLine			=		@ErrorLine	,	
				@ErrorMessage		=		@ErrorMessage;	

		SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	END CATCH

	
end





GO
/****** Object:  StoredProcedure [dbo].[P_AddNewUser]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[P_AddNewUser] 
	@Username [nvarchar](max) ,
	@FirstName [nvarchar](max) ,
	@LastName [nvarchar](max) ,
	@Email [nvarchar](max) ,
	@Password [nvarchar](max) ,

	@PasswordHash [nvarchar](300) ,
	@PasswordSalt [nvarchar](100) ,
		  @CanDebug  BIT = 1
		 ,@ReturnError int OUT
		 ,@ReturnErrorMessage [varchar](MAX) OUT
		 ,@ReturnGuid UNIQUEIDENTIFIER OUT
		
  AS
begin

	DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
			,@SPStartDateTIme datetime
			,@SPEndDateTIme datetime
			,@MESSAGE [varchar](MAX)
			,@ExecutionTime  VARCHAR(300)
			,@ExecutionTimeInSec [varchar](300) 
	SET @ReturnGuid =  NEWID()  

	BEGIN TRY

	IF @CanDebug = 1
		BEGIN
			SET @SPStartDateTIme = GETDATE()
			SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPStartDateTIme, 25)
			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPStartDateTIme,
					@LEVEL = 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
		END
--------------------------------------------------------------  Your Query Start-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO [dbo].[Users]
           ([Username]
           ,[FirstName]
           ,[LastName]
           ,[Email]
           ,[Password]
           ,[PasswordHash]
           ,[PasswordSalt]
           ,[IsActive])
	SELECT 	@Username ,
			@FirstName  ,
			@LastName  ,
			@Email ,
			@Password  ,

			@PasswordHash  ,
			@PasswordSalt 
			,1
	
	DECLARE @ID BIGINT = SCOPE_IDENTITY()

	INSERT INTO [dbo].[UserRoles]
           ([UserId]
           ,[RoleId])
	SELECT @ID
      ,[RoleId]
		 FROM [dbo].[Roles]
--------------------------------------------------------------  Your Query End-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

	
--INSERT INTO [dbo].[FileEncryptionDetails]
--           (ID
--          )
--		  SELECT 1

	IF @CanDebug = 1
		BEGIN
			SET @SPEndDateTIme = GETDATE()
			SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)


			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName				= @SpName,
					@GUID				= @ReturnGuid,
					@CREATEDBY			= '',
					@MESSAGE			= @MESSAGE,
					@DATE				= @SPEndDateTIme,
					@LEVEL				= 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
		END
		
	END TRY

	BEGIN CATCH	
		  DECLARE 	@ErrorNumber	 [int] = NULL,
					@ErrorSeverity  [int] = NULL,
					@ErrorState		[int] = NULL,
					@ErrorLine		[int] = NULL,
					@ErrorMessage  [varchar](max)  = NULL

		SELECT @ErrorNumber	= ERROR_NUMBER(),
			   @ErrorSeverity = 	ERROR_SEVERITY(),
			   @ErrorState		= ERROR_STATE(),
			   @ErrorLine		= 	ERROR_LINE(),
			   @ErrorMessage  =ERROR_MESSAGE()

			SET @SPEndDateTIme = GETDATE()
		
			SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)
			
		EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPEndDateTIme,
					@LEVEL = 'ERROR'
					,@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
				,@ErrorNumber		=		@ErrorNumber,	
				@ErrorSeverity		=		@ErrorSeverity,	
				@ErrorState			=		@ErrorState	,	
				@ErrorLine			=		@ErrorLine	,	
				@ErrorMessage		=		@ErrorMessage;	

		SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	END CATCH

	
end






GO
/****** Object:  StoredProcedure [dbo].[P_DashBoardGetFileEncryptionChart]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--- EXEC [dbo].[P_GetFileEncryptionDetailsForDashBoard] 

CREATE PROC [dbo].[P_DashBoardGetFileEncryptionChart] 
	
		
  AS
begin

DECLARE @FileEncryptionDetailsDaily TABLE(
	 ID int IDENTITY(1,1)
	,[WeekDay] VARCHAR(50) NULL
	,[DATE] VARCHAR(50) NULL
	,FileUploadChartData BIGINT NULL
	 
)
	INSERT INTO @FileEncryptionDetailsDaily ([WeekDay],[DATE]) 
	VALUES (DATENAME(DW,GETDATE()), CONVERT(VARCHAR(10), GETDATE(), 110))
	      , (DATENAME(DW,GETDATE()-1), CONVERT(VARCHAR(10), GETDATE()-1, 110))
	      , (DATENAME(DW,GETDATE()-2), CONVERT(VARCHAR(10), GETDATE()-2, 110))
		   , (DATENAME(DW,GETDATE()-3), CONVERT(VARCHAR(10), GETDATE()-3, 110))
		    , (DATENAME(DW,GETDATE()-4), CONVERT(VARCHAR(10), GETDATE()-4, 110))
			 , (DATENAME(DW,GETDATE()-5), CONVERT(VARCHAR(10), GETDATE()-5, 110))
			  , (DATENAME(DW,GETDATE()-6), CONVERT(VARCHAR(10), GETDATE()-6, 110))
			  	
SELECT  		
		CONVERT(VARCHAR(10), fed.CreatedOn, 110) AS [DATE]
	   ,COUNT(fed.ID) AS FileUploadChartData
	 
	INTO #TempFileEncryptionDetails
FROM 	dbo.FileEncryptionDetails fed	
GROUP BY CONVERT(VARCHAR(10), fed.CreatedOn, 110)  



SELECT  TEMP1.ID
		,ISNULL(TEMP2.FileUploadChartData,0) AS FileUploadChartData
		,TEMP1.WeekDay FileUploadChartLables
		,10 AS TotalNoUsers
FROM @FileEncryptionDetailsDaily TEMP1
LEFT JOIN #TempFileEncryptionDetails TEMP2
ON TEMP1.[DATE] = TEMP2.[DATE]
ORDER BY TEMP1.ID DESC

	
DROP TABLE #TempFileEncryptionDetails
	
end










GO
/****** Object:  StoredProcedure [dbo].[P_DashBoardWidgetDetails]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- EXEC [dbo].[P_DashBoardWidgetDetails] 

CREATE PROC [dbo].[P_DashBoardWidgetDetails] 
	
		
  AS
begin

	
DECLARE @TotalFileEncrypted BIGINT ,  @FileEncryptedToday BIGINT

SELECT 10000000 AS TotalFileEncrypted , 600 AS FileEncryptedToday
	
	
end









GO
/****** Object:  StoredProcedure [dbo].[P_GetAllRoleDetails]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[P_GetAllRoleDetails] 
	
		
  AS
begin

	
SELECT  [RoleId]
      ,[RoleName]
  FROM [dbo].[Roles]
	
	
end








GO
/****** Object:  StoredProcedure [dbo].[P_GetAllUserRoleDetails]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[P_GetAllUserRoleDetails] 
		--	@UserId INT
		-- @Username			[nvarchar](max)		
		--,@FirstName			[nvarchar](max)		
		--,@LastName			[nvarchar](max)		
		--,@Email				[nvarchar](max)		
		--,@Password			[nvarchar](max)		


		 --,@CanDebug  BIT = 1
		 --,@ReturnError int OUT
		 --,@ReturnErrorMessage [varchar](MAX) OUT
		 --,@ReturnGuid UNIQUEIDENTIFIER OUT
		
  AS
begin

	--DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
	--		,@SPDATE datetime
	--		,@MESSAGE [varchar](MAX)

	--SET @ReturnGuid =  NEWID()  

	--BEGIN TRY

	--IF @CanDebug = 1
	--	BEGIN
	--		SET @SPDATE = GETDATE()
	--		SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPDATE, 25)
	--		EXEC	[dbo].[P_SQLDebugLogger]
	--				@SpName = @SpName,
	--				@GUID = @ReturnGuid,
	--				@CREATEDBY = '',
	--				@MESSAGE = @MESSAGE,
	--				@DATE = @SPDATE,
	--				@LEVEL = 'INFO'
	--	END


		SELECT  USRROLE.[UserId]
			  ,USRROLE.[RoleId]
			  ,ROL.[RoleName]
		  FROM [dbo].[UserRoles] USRROLE
		  INNER JOIN Roles ROL
			ON ROL.[RoleId] = USRROLE.[RoleId]
		 -- WHERE USRROLE.[UserId] = @UserId

	--IF @CanDebug = 1
	--	BEGIN
	--		SET @SPDATE = GETDATE()
	--		SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPDATE, 25)

	--		EXEC	[dbo].[P_SQLDebugLogger]
	--				@SpName = @SpName,
	--				@GUID = @ReturnGuid,
	--				@CREATEDBY = '',
	--				@MESSAGE = @MESSAGE,
	--				@DATE = @SPDATE,
	--				@LEVEL = 'INFO'
	--	END
		
	--END TRY

	--BEGIN CATCH	
	--	  DECLARE 	@ErrorNumber	 [int] = NULL,
	--				@ErrorSeverity  [int] = NULL,
	--				@ErrorState		[int] = NULL,
	--				@ErrorLine		[int] = NULL,
	--				@ErrorMessage  [varchar](max)  = NULL

	--	SELECT @ErrorNumber	= ERROR_NUMBER(),
	--		   @ErrorSeverity = 	ERROR_SEVERITY(),
	--		   @ErrorState		= ERROR_STATE(),
	--		   @ErrorLine		= 	ERROR_LINE(),
	--		   @ErrorMessage  =ERROR_MESSAGE()

	--		SET @SPDATE = GETDATE()
	--		SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPDATE, 25)
			
	--	EXEC	[dbo].[P_SQLDebugLogger]
	--				@SpName = @SpName,
	--				@GUID = @ReturnGuid,
	--				@CREATEDBY = '',
	--				@MESSAGE = @MESSAGE,
	--				@DATE = @SPDATE,
	--				@LEVEL = 'ERROR',
	--			@ErrorNumber		=		@ErrorNumber,	
	--			@ErrorSeverity		=		@ErrorSeverity,	
	--			@ErrorState			=		@ErrorState	,	
	--			@ErrorLine			=		@ErrorLine	,	
	--			@ErrorMessage		=		@ErrorMessage;	

	--	SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	--END CATCH

	
end







GO
/****** Object:  StoredProcedure [dbo].[P_GetFileEncryptionDetailsForDashBoard]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--- EXEC [dbo].[P_GetFileEncryptionDetailsForDashBoard] 

CREATE PROC [dbo].[P_GetFileEncryptionDetailsForDashBoard] 
	
		
  AS
begin

DECLARE @FileEncryptionDetailsDaily TABLE(
	 ID int IDENTITY(1,1)
	,[WeekDay] VARCHAR(50) NULL
	,[DATE] VARCHAR(50) NULL
	,FileUploadChartData BIGINT NULL
	 
)
	INSERT INTO @FileEncryptionDetailsDaily ([WeekDay],[DATE]) 
	VALUES (DATENAME(DW,GETDATE()), CONVERT(VARCHAR(10), GETDATE(), 110))
	      , (DATENAME(DW,GETDATE()-1), CONVERT(VARCHAR(10), GETDATE()-1, 110))
	      , (DATENAME(DW,GETDATE()-2), CONVERT(VARCHAR(10), GETDATE()-2, 110))
		   , (DATENAME(DW,GETDATE()-3), CONVERT(VARCHAR(10), GETDATE()-3, 110))
		    , (DATENAME(DW,GETDATE()-4), CONVERT(VARCHAR(10), GETDATE()-4, 110))
			 , (DATENAME(DW,GETDATE()-5), CONVERT(VARCHAR(10), GETDATE()-5, 110))
			  , (DATENAME(DW,GETDATE()-6), CONVERT(VARCHAR(10), GETDATE()-6, 110))
			  	
SELECT  		
		CONVERT(VARCHAR(10), fed.CreatedOn, 110) AS [DATE]
	   ,COUNT(fed.ID) AS FileUploadChartData
	 
	INTO #TempFileEncryptionDetails
FROM 	dbo.FileEncryptionDetails fed	
GROUP BY CONVERT(VARCHAR(10), fed.CreatedOn, 110)  



SELECT  TEMP1.ID
		,ISNULL(TEMP2.FileUploadChartData,0) AS FileUploadChartData
		,TEMP1.WeekDay FileUploadChartLables
		
FROM @FileEncryptionDetailsDaily TEMP1
LEFT JOIN #TempFileEncryptionDetails TEMP2
ON TEMP1.[DATE] = TEMP2.[DATE]
ORDER BY TEMP1.ID DESC

	
DROP TABLE #TempFileEncryptionDetails
	
end









GO
/****** Object:  StoredProcedure [dbo].[P_GetUserDetailsForLogin]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[P_GetUserDetailsForLogin] 

		 @Username			[nvarchar](max)		
		--,@FirstName			[nvarchar](max)		
		--,@LastName			[nvarchar](max)		
		,@Email				[nvarchar](max)		
		,@Password			[nvarchar](max)		


		 ,@CanDebug  BIT = 1
		 ,@ReturnError int OUT
		 ,@ReturnErrorMessage [varchar](MAX) OUT
		 ,@ReturnGuid UNIQUEIDENTIFIER OUT
		
  AS
begin

	DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
			,@SPStartDateTIme datetime
			,@SPEndDateTIme datetime
			,@MESSAGE [varchar](MAX)
			,@ExecutionTime  VARCHAR(300)
			,@ExecutionTimeInSec [varchar](300) 
	SET @ReturnGuid =  NEWID()  

	BEGIN TRY

	IF @CanDebug = 1
		BEGIN
			SET @SPStartDateTIme = GETDATE()
			SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPStartDateTIme, 25)
			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPStartDateTIme,
					@LEVEL = 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
		END
--------------------------------------------------------------  Your Query Start-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------


			SELECT TOP 1 [UserId]
				  ,[Username]
				  ,[FirstName]
				  ,[LastName]
				  ,[Email]
				  ,[Password]
				  ,[IsActive]
				 -- ,[ActivationCode]
			  FROM [dbo].[Users]
			WHERE [Username] = @Username AND  [IsActive] = 1

--------------------------------------------------------------  Your Query End-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
		IF @CanDebug = 1
			BEGIN
				SET @SPEndDateTIme = GETDATE()
				SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)


				EXEC	[dbo].[P_SQLDebugLogger]
						@SpName				= @SpName,
						@GUID				= @ReturnGuid,
						@CREATEDBY			= '',
						@MESSAGE			= @MESSAGE,
						@DATE				= @SPEndDateTIme,
						@LEVEL				= 'INFO',
						@SPStartDateTIme		= @SPStartDateTIme
					   ,@SPEndDateTIme = @SPEndDateTIme
			END
		
	END TRY

	BEGIN CATCH	
		
		  DECLARE 	@ErrorNumber	 [int] = NULL,
					@ErrorSeverity  [int] = NULL,
					@ErrorState		[int] = NULL,
					@ErrorLine		[int] = NULL,
					@ErrorMessage  [varchar](max)  = NULL

		SELECT @ErrorNumber	= ERROR_NUMBER(),
			   @ErrorSeverity = 	ERROR_SEVERITY(),
			   @ErrorState		= ERROR_STATE(),
			   @ErrorLine		= 	ERROR_LINE(),
			   @ErrorMessage  =ERROR_MESSAGE()

			SET @SPEndDateTIme = GETDATE()
		
			SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)
			
		EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPEndDateTIme,
					@LEVEL = 'ERROR'
					,@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
				,@ErrorNumber		=		@ErrorNumber,	
				@ErrorSeverity		=		@ErrorSeverity,	
				@ErrorState			=		@ErrorState	,	
				@ErrorLine			=		@ErrorLine	,	
				@ErrorMessage		=		@ErrorMessage;	

		SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[P_GetUserRoleDetailsForLogin]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[P_GetUserRoleDetailsForLogin] 
			@UserId INT
		-- @Username			[nvarchar](max)		
		--,@FirstName			[nvarchar](max)		
		--,@LastName			[nvarchar](max)		
		--,@Email				[nvarchar](max)		
		--,@Password			[nvarchar](max)		


		 ,@CanDebug  BIT = 1
		 ,@ReturnError int OUT
		 ,@ReturnErrorMessage [varchar](MAX) OUT
		 ,@ReturnGuid UNIQUEIDENTIFIER OUT
		
  AS
begin

	DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
			,@SPStartDateTIme datetime
			,@SPEndDateTIme datetime
			,@MESSAGE [varchar](MAX)
			,@ExecutionTime  VARCHAR(300)
			,@ExecutionTimeInSec [varchar](300) 
	SET @ReturnGuid =  NEWID()  

	BEGIN TRY

	IF @CanDebug = 1
		BEGIN
			SET @SPStartDateTIme = GETDATE()
			SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPStartDateTIme, 25)
			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPStartDateTIme,
					@LEVEL = 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
		END
--------------------------------------------------------------  Your Query Start-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
	
		SELECT  USRROLE.[UserId]
			  ,USRROLE.[RoleId]
			  ,ROL.[RoleName]
		  FROM [dbo].[UserRoles] USRROLE
		  INNER JOIN Roles ROL
			ON ROL.[RoleId] = USRROLE.[RoleId]
		  WHERE USRROLE.[UserId] = @UserId


--------------------------------------------------------------  Your Query End-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
		IF @CanDebug = 1
			BEGIN
				SET @SPEndDateTIme = GETDATE()
				SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)


				EXEC	[dbo].[P_SQLDebugLogger]
						@SpName				= @SpName,
						@GUID				= @ReturnGuid,
						@CREATEDBY			= '',
						@MESSAGE			= @MESSAGE,
						@DATE				= @SPEndDateTIme,
						@LEVEL				= 'INFO',
						@SPStartDateTIme		= @SPStartDateTIme
					   ,@SPEndDateTIme = @SPEndDateTIme
			END
		
	END TRY

	BEGIN CATCH	

		  DECLARE 	@ErrorNumber	 [int] = NULL,
					@ErrorSeverity  [int] = NULL,
					@ErrorState		[int] = NULL,
					@ErrorLine		[int] = NULL,
					@ErrorMessage  [varchar](max)  = NULL

		SELECT @ErrorNumber	= ERROR_NUMBER(),
			   @ErrorSeverity = 	ERROR_SEVERITY(),
			   @ErrorState		= ERROR_STATE(),
			   @ErrorLine		= 	ERROR_LINE(),
			   @ErrorMessage  =ERROR_MESSAGE()

			SET @SPEndDateTIme = GETDATE()
		
			SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)
			
		EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPEndDateTIme,
					@LEVEL = 'ERROR'
					,@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
				,@ErrorNumber		=		@ErrorNumber,	
				@ErrorSeverity		=		@ErrorSeverity,	
				@ErrorState			=		@ErrorState	,	
				@ErrorLine			=		@ErrorLine	,	
				@ErrorMessage		=		@ErrorMessage;	

		SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	END CATCH

end






GO
/****** Object:  StoredProcedure [dbo].[P_GetUserRoleDetailsForUserId]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[P_GetUserRoleDetailsForUserId] 
			
		-- @Username			[nvarchar](max)		
		--,@FirstName			[nvarchar](max)		
		--,@LastName			[nvarchar](max)		
		--,@Email				[nvarchar](max)		
		--,@Password			[nvarchar](max)		
		@RequestUserId bigint
		 ,@UserId bigint
		 ,@CanDebug  BIT = 1
		 ,@ReturnError int OUT
		 ,@ReturnErrorMessage [varchar](MAX) OUT
		 ,@ReturnGuid UNIQUEIDENTIFIER OUT
		
  AS
begin

	DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
			,@SPStartDateTIme datetime
			,@SPEndDateTIme datetime
			,@MESSAGE [varchar](MAX)
			,@ExecutionTime  VARCHAR(300)
			,@ExecutionTimeInSec [varchar](300) 
	SET @ReturnGuid =  NEWID()  

	BEGIN TRY

	IF @CanDebug = 1
		BEGIN
			SET @SPStartDateTIme = GETDATE()
			SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPStartDateTIme, 25)
			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPStartDateTIme,
					@LEVEL = 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
		END
--------------------------------------------------------------  Your Query Start-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
	
		SELECT  USRROLE.[UserId]
			  ,USRROLE.[RoleId]
			  ,ROL.[RoleName]
		  FROM [dbo].[UserRoles] USRROLE
		  INNER JOIN Roles ROL
			ON ROL.[RoleId] = USRROLE.[RoleId]
		  WHERE USRROLE.[UserId] = @RequestUserId


--------------------------------------------------------------  Your Query End-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
		IF @CanDebug = 1
			BEGIN
				SET @SPEndDateTIme = GETDATE()
				SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)


				EXEC	[dbo].[P_SQLDebugLogger]
						@SpName				= @SpName,
						@GUID				= @ReturnGuid,
						@CREATEDBY			= '',
						@MESSAGE			= @MESSAGE,
						@DATE				= @SPEndDateTIme,
						@LEVEL				= 'INFO',
						@SPStartDateTIme		= @SPStartDateTIme
					   ,@SPEndDateTIme = @SPEndDateTIme
			END
		
	END TRY

	BEGIN CATCH	

		  DECLARE 	@ErrorNumber	 [int] = NULL,
					@ErrorSeverity  [int] = NULL,
					@ErrorState		[int] = NULL,
					@ErrorLine		[int] = NULL,
					@ErrorMessage  [varchar](max)  = NULL

		SELECT @ErrorNumber	= ERROR_NUMBER(),
			   @ErrorSeverity = 	ERROR_SEVERITY(),
			   @ErrorState		= ERROR_STATE(),
			   @ErrorLine		= 	ERROR_LINE(),
			   @ErrorMessage  =ERROR_MESSAGE()

			SET @SPEndDateTIme = GETDATE()
		
			SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)
			
		EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPEndDateTIme,
					@LEVEL = 'ERROR'
					,@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
				,@ErrorNumber		=		@ErrorNumber,	
				@ErrorSeverity		=		@ErrorSeverity,	
				@ErrorState			=		@ErrorState	,	
				@ErrorLine			=		@ErrorLine	,	
				@ErrorMessage		=		@ErrorMessage;	

		SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	END CATCH

end






GO
/****** Object:  StoredProcedure [dbo].[P_RegisterNewUser]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[P_RegisterNewUser] 

		 @Username			[nvarchar](max)		
		,@FirstName			[nvarchar](max)		
		,@LastName			[nvarchar](max)		
		,@Email				[nvarchar](max)		
		,@Password			[nvarchar](max)		
		,@IsActive			[bit]				
		,@ActivationCode	[uniqueidentifier] 

		 ,@CanDebug  BIT = 1
		 ,@ReturnError int OUT
		 ,@ReturnErrorMessage [varchar](MAX) OUT
		 ,@ReturnGuid UNIQUEIDENTIFIER OUT
		
  AS
begin

	DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
			,@SPStartDateTIme datetime
			,@SPEndDateTIme datetime
			,@MESSAGE [varchar](MAX)
			,@ExecutionTime  VARCHAR(300)
			,@ExecutionTimeInSec [varchar](300) 
	SET @ReturnGuid =  NEWID()  

	BEGIN TRY

	IF @CanDebug = 1
		BEGIN
			SET @SPStartDateTIme = GETDATE()
			SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPStartDateTIme, 25)
			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPStartDateTIme,
					@LEVEL = 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
		END
--------------------------------------------------------------  Your Query Start-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------


		BEGIN TRANSACTION

		INSERT INTO [dbo].[Users]
				   ([Username]
				   ,[FirstName]
				   ,[LastName]
				   ,[Email]
				   ,[Password]
				   ,[IsActive]
				 --  ,[ActivationCode]
				 )
			SELECT   @Username		
					,@FirstName		
					,@LastName		
					,@Email			
					,@Password		
					,1		
					--,@ActivationCode

		COMMIT TRANSACTION


--------------------------------------------------------------  Your Query End-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
		IF @CanDebug = 1
			BEGIN
				SET @SPEndDateTIme = GETDATE()
				SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)


				EXEC	[dbo].[P_SQLDebugLogger]
						@SpName				= @SpName,
						@GUID				= @ReturnGuid,
						@CREATEDBY			= '',
						@MESSAGE			= @MESSAGE,
						@DATE				= @SPEndDateTIme,
						@LEVEL				= 'INFO',
						@SPStartDateTIme		= @SPStartDateTIme
					   ,@SPEndDateTIme = @SPEndDateTIme
			END
		
	END TRY

	BEGIN CATCH	

		ROLLBACK TRANSACTION
		  DECLARE 	@ErrorNumber	 [int] = NULL,
					@ErrorSeverity  [int] = NULL,
					@ErrorState		[int] = NULL,
					@ErrorLine		[int] = NULL,
					@ErrorMessage  [varchar](max)  = NULL

		SELECT @ErrorNumber	= ERROR_NUMBER(),
			   @ErrorSeverity = 	ERROR_SEVERITY(),
			   @ErrorState		= ERROR_STATE(),
			   @ErrorLine		= 	ERROR_LINE(),
			   @ErrorMessage  =ERROR_MESSAGE()

			SET @SPEndDateTIme = GETDATE()
		
			SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)
			
		EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPEndDateTIme,
					@LEVEL = 'ERROR'
					,@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
				,@ErrorNumber		=		@ErrorNumber,	
				@ErrorSeverity		=		@ErrorSeverity,	
				@ErrorState			=		@ErrorState	,	
				@ErrorLine			=		@ErrorLine	,	
				@ErrorMessage		=		@ErrorMessage;	

		SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	END CATCH

end
GO
/****** Object:  StoredProcedure [dbo].[P_SaveMVCAuditTrail]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 

 

create PROC [dbo].[P_SaveMVCAuditTrail]

       @UserId [bigint] ,

       @SessionID [nvarchar](max) ,

       @IPAddress [nvarchar](max) ,

       @PageAccessed [nvarchar](max) ,

       @ConnectedOn [datetime] ,

      @DisconnectedOn [datetime] ,

       @LoginStatus [nvarchar](max) ,

       @ControllerName [nvarchar](max) ,

       @ActionName [nvarchar](300)

      

        

  AS

begin

 

INSERT INTO [dbo].[MVCAuditTrail]

           ([UserId]

           ,[SessionID]

           ,[IPAddress]

           ,[PageAccessed]

			,[ConnectedOn]	
			,[DisconnectedOn]
           ,[LoginStatus]

           ,[ControllerName]

           ,[ActionName]

           ,[CreatedOn])

 

       select        @UserId  ,

                     @SessionID  ,

                     @IPAddress  ,

                     @PageAccessed  ,

			@ConnectedOn,	
			@DisconnectedOn,

                     @LoginStatus  ,

                     @ControllerName  ,

                     @ActionName ,

                     GETDATE()

 

end

GO
/****** Object:  StoredProcedure [dbo].[P_SQLDebugLogger]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[P_SQLDebugLogger] 
		   @SpName [varchar](300),
           @GUID UNIQUEIDENTIFIER ,
		   @LEVEL [varchar](20),
           @CREATEDBY [varchar](200) ,         
		   @MESSAGE [varchar](MAX),
           @DATE datetime,
			@SPStartDateTIme datetime = NULL,
			@SPEndDateTIme datetime = NULL,
		   	@ErrorNumber	[int] = NULL,
			@ErrorSeverity  [int] = NULL,
			@ErrorState		[int] = NULL,
			@ErrorLine		[int] = NULL,
			@ErrorMessage  [varchar](max)  = NULL
  AS
begin

	DECLARE
			 @ExecutionTime  VARCHAR(300) 
			,@ExecutionTimeInSec [varchar](300) 

			SET @ExecutionTimeInSec = (SELECT
			 Coalesce( Convert(varchar(5),DateDiff(day, (@SPEndDateTIme-@SPStartDateTIme),'1900-01-01'))  + ':'
			 + Convert(varchar(14),(@SPEndDateTIme-@SPStartDateTIme), 114),'00:00:00:00.000'))
 
			SET @ExecutionTime = (SELECT CAST(DATEDIFF(ms , @SPStartDateTIme , @SPEndDateTIme ) AS VARCHAR(300)))
			

INSERT INTO [dbo].[SQLLogs]
           ([GUID]
           ,[SPNAME]
           ,[LEVEL]
           ,[MESSAGE]
			,[ExecutionTimeInMillSecIndays:hh:mm:ss]
			,[ExecutionTimeInSec]
           ,[CREATEDON]
           ,[CREATEDBY]
           ,[ErrorNumber]
           ,[ErrorSeverity]
           ,[ErrorState]     
           ,[ErrorLine]
           ,[ErrorMessage])

		 SELECT  @GUID
				,@SpName
				,@LEVEL
				,@MESSAGE						   
				,@ExecutionTimeInSec 
				,@ExecutionTime
				,@DATE			
				,@CREATEDBY				
		     	,@ErrorNumber	
		  		,@ErrorSeverity
		  		,@ErrorState		
		  		,@ErrorLine		
		  		,@ErrorMessage 

end





GO
/****** Object:  StoredProcedure [dbo].[P_UpdateUserDetailsForUserId]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[P_UpdateUserDetailsForUserId] 
			
		 @Username			[nvarchar](max)		
		,@FirstName			[nvarchar](max)		
		,@LastName			[nvarchar](max)		
		,@Email				[nvarchar](max)		
		,@Password			[nvarchar](max)		
		,@RequestUserId		 bigint
		,@IsActive			 [bit] 
		,@T_UserRoles       [T_UserRoles] READONLY

		 ,@UserId bigint
		 ,@CanDebug  BIT = 1
		 ,@ReturnError int OUT
		 ,@ReturnErrorMessage [varchar](MAX) OUT
		 ,@ReturnGuid UNIQUEIDENTIFIER OUT
		
  AS
begin

	DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
			,@SPStartDateTIme datetime
			,@SPEndDateTIme datetime
			,@MESSAGE [varchar](MAX)
			,@ExecutionTime  VARCHAR(300)
			,@ExecutionTimeInSec [varchar](300) 
	SET @ReturnGuid =  NEWID()  

	BEGIN TRY

	IF @CanDebug = 1
		BEGIN
			SET @SPStartDateTIme = GETDATE()
			SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPStartDateTIme, 25)
			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPStartDateTIme,
					@LEVEL = 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
		END
--------------------------------------------------------------  Your Query Start-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

		DECLARE @SPGetDate datetime = GETDATE()

		UPDATE [dbo].[Users]
		   SET [Username] = @Username
			  ,[FirstName] = @FirstName
			  ,[LastName] = @LastName
			  ,[Email] = @Email

			  ,[IsActive] = @IsActive

			  ,[ModifiedOn] = @SPGetDate
			  ,[ModifiedBy] = @UserId
		 WHERE UserId = @RequestUserId
		
		--SELECT * INTO TEMPP1
		--FROM @T_UserRoles

		MERGE INTO [UserRoles] AS TARGETTABLE
		USING @T_UserRoles AS SOURCETABLE
				ON TARGETTABLE.[UserId] = @RequestUserId
					AND TARGETTABLE.[RoleId] = SOURCETABLE.[RoleId]
		WHEN NOT MATCHED THEN 
			  INSERT   ([UserId]
							 ,[RoleId])
			  VALUES (@RequestUserId
							 ,SOURCETABLE.[RoleId])
			WHEN NOT MATCHED BY SOURCE  
				AND  TARGETTABLE.[UserId] = @RequestUserId THEN
							DELETE 
							 ;


--------------------------------------------------------------  Your Query End-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
		IF @CanDebug = 1
			BEGIN
				SET @SPEndDateTIme = GETDATE()
				SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)


				EXEC	[dbo].[P_SQLDebugLogger]
						@SpName				= @SpName,
						@GUID				= @ReturnGuid,
						@CREATEDBY			= '',
						@MESSAGE			= @MESSAGE,
						@DATE				= @SPEndDateTIme,
						@LEVEL				= 'INFO',
						@SPStartDateTIme		= @SPStartDateTIme
					   ,@SPEndDateTIme = @SPEndDateTIme
			END
		
	END TRY

	BEGIN CATCH	

		  DECLARE 	@ErrorNumber	 [int] = NULL,
					@ErrorSeverity  [int] = NULL,
					@ErrorState		[int] = NULL,
					@ErrorLine		[int] = NULL,
					@ErrorMessage  [varchar](max)  = NULL

		SELECT @ErrorNumber	= ERROR_NUMBER(),
			   @ErrorSeverity = 	ERROR_SEVERITY(),
			   @ErrorState		= ERROR_STATE(),
			   @ErrorLine		= 	ERROR_LINE(),
			   @ErrorMessage  =ERROR_MESSAGE()

			SET @SPEndDateTIme = GETDATE()
		
			SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)
			
		EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPEndDateTIme,
					@LEVEL = 'ERROR'
					,@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
				,@ErrorNumber		=		@ErrorNumber,	
				@ErrorSeverity		=		@ErrorSeverity,	
				@ErrorState			=		@ErrorState	,	
				@ErrorLine			=		@ErrorLine	,	
				@ErrorMessage		=		@ErrorMessage;	

		SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	END CATCH

end






GO
/****** Object:  StoredProcedure [dbo].[SaveFileEncryptionDetails]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SaveFileEncryptionDetails] 
		   @EncryptionId	varchar(max),
           @FileName		varchar(max),
           @FileDescription varchar(max),
           @Path			varchar(max),
		   @CreatedBy		bigint

		 ,@CanDebug  BIT = 1
		 ,@ReturnError int OUT
		 ,@ReturnErrorMessage [varchar](MAX) OUT
		 ,@ReturnGuid UNIQUEIDENTIFIER OUT
  AS
begin

    DECLARE @DateTime datetime = GETDATE()

	DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
			,@SPStartDateTIme datetime
			,@SPEndDateTIme datetime
			,@MESSAGE [varchar](MAX)
			,@ExecutionTime  VARCHAR(300)
			,@ExecutionTimeInSec [varchar](300) 
	SET @ReturnGuid =  NEWID()  

	BEGIN TRY

	IF @CanDebug = 1
		BEGIN
			SET @SPStartDateTIme = GETDATE()
			SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPStartDateTIme, 25)
			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPStartDateTIme,
					@LEVEL = 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
		END
--------------------------------------------------------------  Your Query Start-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
  BEGIN TRANSACTION
  INSERT INTO [dbo].[FileEncryptionDetails]
           ([EncryptionId]
           ,[FileName]
           ,[FileDescription]
           ,[Path]
			,[CreatedOn] 
			,[CreatedBy] 
			,[ModifiedOn]
			,[ModifiedBy]
		   )
		   select
		    @EncryptionId	
		   , @FileName		
		   , @FileDescription 
		   , @Path	
		    , @DateTime	
		   ,@CreatedBy	
		   , @DateTime
		   ,@CreatedBy	
	
		   		   
		  select cast( SCOPE_IDENTITY() as BIGINT)

	 COMMIT TRANSACTION
--------------------------------------------------------------  Your Query End-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------


	IF @CanDebug = 1
		BEGIN
			SET @SPEndDateTIme = GETDATE()
			SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)


			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName				= @SpName,
					@GUID				= @ReturnGuid,
					@CREATEDBY			= '',
					@MESSAGE			= @MESSAGE,
					@DATE				= @SPEndDateTIme,
					@LEVEL				= 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
		END
		
	END TRY

	BEGIN CATCH	
		
		if @@trancount > 0 
		BEGIN
			rollback TRANSACTION 
		END

		  DECLARE 	@ErrorNumber	 [int] = NULL,
					@ErrorSeverity  [int] = NULL,
					@ErrorState		[int] = NULL,
					@ErrorLine		[int] = NULL,
					@ErrorMessage  [varchar](max)  = NULL

		SELECT @ErrorNumber	= ERROR_NUMBER(),
			   @ErrorSeverity = 	ERROR_SEVERITY(),
			   @ErrorState		= ERROR_STATE(),
			   @ErrorLine		= 	ERROR_LINE(),
			   @ErrorMessage  =ERROR_MESSAGE()

			SET @SPEndDateTIme = GETDATE()
		
			SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)
			
		EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = '',
					@MESSAGE = @MESSAGE,
					@DATE = @SPEndDateTIme,
					@LEVEL = 'ERROR'
					,@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
				,@ErrorNumber		=		@ErrorNumber,	
				@ErrorSeverity		=		@ErrorSeverity,	
				@ErrorState			=		@ErrorState	,	
				@ErrorLine			=		@ErrorLine	,	
				@ErrorMessage		=		@ErrorMessage;	

		SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	END CATCH

end





GO
/****** Object:  StoredProcedure [dbo].[SaveNotification]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[SaveNotification] 
		   @UserID		varchar(max),
           @Message		varchar(max),
           @Title		varchar(max)
        
  AS
begin

	DECLARE @NotificationId BIGINT;

  INSERT INTO [dbo].[Notification]
           (
                    
            [UserID]
			,[Details]
		   ,[Title]

          
		)
		select 
		@UserID		
		,@Message		
		,@Title		

	  select cast( SCOPE_IDENTITY() as BIGINT)

end







GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationCacheValue]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpdateApplicationCacheValue] 
		  @Key  VARCHAR(300)
		 ,@Value  VARCHAR(300)
		 ,@UserId  VARCHAR(100)
		 ,@CanDebug  BIT = 1
		 ,@ReturnError int OUT
		 ,@ReturnErrorMessage [varchar](MAX) OUT
		 ,@ReturnGuid UNIQUEIDENTIFIER OUT
		
  AS
begin

	DECLARE @SpName [varchar](300) = OBJECT_NAME(@@PROCID)		
			,@SPStartDateTIme datetime
			,@SPEndDateTIme datetime
			,@MESSAGE [varchar](MAX)
			,@ExecutionTime  VARCHAR(300)
			,@ExecutionTimeInSec [varchar](300) 
			,@CREATEDBY [varchar](200)  = @UserId
	SET @ReturnGuid =  NEWID()  

	BEGIN TRY

	IF @CanDebug = 1
		BEGIN
			SET @SPStartDateTIme = GETDATE()
			SET @MESSAGE = 'START - ' + @SpName + ' Execution Started at ' + convert(nvarchar(MAX), @SPStartDateTIme, 25)
			EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = @CREATEDBY,
					@MESSAGE = @MESSAGE,
					@DATE = @SPStartDateTIme,
					@LEVEL = 'INFO',
					@SPStartDateTIme		= @SPStartDateTIme
		END
--------------------------------------------------------------  Your Query Start Here-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------


		BEGIN TRANSACTION

		UPDATE ApplicationCacheConfig SET VALUE = @Value
				WHERE [Key] = @Key

		COMMIT TRANSACTION


--------------------------------------------------------------  Your Query End Here-------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
		IF @CanDebug = 1
			BEGIN
				SET @SPEndDateTIme = GETDATE()
				SET @MESSAGE = 'END - ' + @SpName + ' Execution Ended at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)


				EXEC	[dbo].[P_SQLDebugLogger]
						@SpName				= @SpName,
						@GUID				= @ReturnGuid,
						@CREATEDBY			= @CREATEDBY,
						@MESSAGE			= @MESSAGE,
						@DATE				= @SPEndDateTIme,
						@LEVEL				= 'INFO',
						@SPStartDateTIme		= @SPStartDateTIme
					   ,@SPEndDateTIme = @SPEndDateTIme
			END
		
	END TRY

	BEGIN CATCH	

		ROLLBACK TRANSACTION
		  DECLARE 	@ErrorNumber	 [int] = NULL,
					@ErrorSeverity  [int] = NULL,
					@ErrorState		[int] = NULL,
					@ErrorLine		[int] = NULL,
					@ErrorMessage  [varchar](max)  = NULL

		SELECT @ErrorNumber	= ERROR_NUMBER(),
			   @ErrorSeverity = 	ERROR_SEVERITY(),
			   @ErrorState		= ERROR_STATE(),
			   @ErrorLine		= 	ERROR_LINE(),
			   @ErrorMessage  =ERROR_MESSAGE()

			SET @SPEndDateTIme = GETDATE()
		
			SET @MESSAGE = 'ERROR - ' + @SpName + ' Execution UnSuccessful at ' + convert(nvarchar(MAX), @SPEndDateTIme, 25)
			
		EXEC	[dbo].[P_SQLDebugLogger]
					@SpName = @SpName,
					@GUID = @ReturnGuid,
					@CREATEDBY = @CREATEDBY,
					@MESSAGE = @MESSAGE,
					@DATE = @SPEndDateTIme,
					@LEVEL = 'ERROR'
					,@SPStartDateTIme		= @SPStartDateTIme
				   ,@SPEndDateTIme = @SPEndDateTIme
				,@ErrorNumber		=		@ErrorNumber,	
				@ErrorSeverity		=		@ErrorSeverity,	
				@ErrorState			=		@ErrorState	,	
				@ErrorLine			=		@ErrorLine	,	
				@ErrorMessage		=		@ErrorMessage;	

		SELECT  @ReturnError = @ErrorNumber , @ReturnErrorMessage = @ErrorMessage
	END CATCH

	
end





GO
/****** Object:  StoredProcedure [dbo].[ValidateUserLoginDetails]    Script Date: 25-04-2018 10:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[ValidateUserLoginDetails] 		
	@Email [varchar](max),
	@Password [varchar](max) 
  AS
begin

SELECT [UserID]
      ,[Email]
      ,[Roles]
      ,[Password]
	  ,EncryptedPassword  
  FROM [dbo].[UserAccount]
  WHERE Email = @Email
end







GO
USE [FileEncryption]
GO
DELETE FROM [dbo].[SQLLogs]
GO
DELETE FROM [dbo].[Notification]
GO
DELETE FROM [dbo].[FileEncryptionDetails]
GO
DELETE FROM [dbo].[ApplicationCacheConfig]
GO
DELETE FROM [dbo].[UserRoles]
GO
DELETE FROM [dbo].[Roles]
GO
DELETE FROM [dbo].[Users]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (1, N'DD', NULL, NULL, NULL, N'DD', N'hFHlMoMJ65GkrgFOsxhF8hYVo3f/BV0KeNkO/JtcEWxJ3epK', N'hFHlMoMJ65GkrgFOsxhF8g==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, N'd', NULL, NULL, NULL, N'd', N'szkul0jHQJfY2zWVQakR+A3NZAfnsKLlcxDBanRHFLu0SJGD', N'szkul0jHQJfY2zWVQakR+A==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, N'v', NULL, NULL, NULL, N'v', N'HYk2UCOaz7wMaVUZiqyYDrWbma76U4+cIKdka9BHSQTwLmDr', N'HYk2UCOaz7wMaVUZiqyYDg==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (4, N'test ', N'123', N'456', NULL, N'test', N'Fx0vJOjTgW5pLim15eghEnmuwr0CJa6vvSeyhQbMiENnWL5X', N'Fx0vJOjTgW5pLim15eghEg==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (5, N'r', N'rrr', N'rrrrrrr', NULL, N'r', N'xEVx+WCkwERC77E6DVgN8mJZeqtyWVBkbAXTB3Rkj3ASUYQ8', N'xEVx+WCkwERC77E6DVgN8g==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (6, N'User Name', N'First Name', N'Last Name', N'Email', N'Password', N'Wc9VsdY7aTTuDPEHNk2t43gCxuMxPSCguCS6WmOO1pTz/2j+', N'Wc9VsdY7aTTuDPEHNk2t4w==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (7, N'e', N'First Name', N'Last Name', N'Email', N'e', N'YEM2HQODEGRnjGu1CY0S3D9npfHNXDJK6vH7bUbW+S0s27+7', N'YEM2HQODEGRnjGu1CY0S3A==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, CAST(N'2018-04-23 22:30:36.967' AS DateTime), 17)
GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (8, N'User12', N'FIrstName1', N'lastName1', N'sakdsadflkjh@gmail.com', N'1', N'yuhOtHJqcLdQixSwDzHddyAIRbooVg30rKG6xXO7LL2/PeAc', N'yuhOtHJqcLdQixSwDzHddw==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, CAST(N'2018-04-23 22:09:55.213' AS DateTime), 0)
GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (9, N'2', N'2vvdvsdv', N'222gggghhhhh', N'2', N'2', N'9hmZ891Y4JoXy9yk8hV1TivuWb4ZTfeGP/nkocFNrM+6C/ET', N'9hmZ891Y4JoXy9yk8hV1Tg==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, CAST(N'2018-04-23 22:10:10.913' AS DateTime), 0)
GO
INSERT [dbo].[Users] ([UserId], [Username], [FirstName], [LastName], [Email], [Password], [PasswordHash], [PasswordSalt], [IsActive], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (17, N'3', N'3', N'3', N'3', N'3', N'ZPrKLFtU4ottzJ4pmdeJjUD1jhal8SWApbhpV35oxxG4Uazt', N'ZPrKLFtU4ottzJ4pmdeJjQ==', 1, CAST(N'2018-04-22 15:07:32.130' AS DateTime), NULL, CAST(N'2018-04-23 22:30:18.483' AS DateTime), 17)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'User')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Test')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (3, N'FileEncrypt')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (4, N'Admin')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (5, N'Manager')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (6, N'DashBoard')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (7, 1)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (7, 2)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (7, 3)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (7, 4)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (7, 5)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (7, 6)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (8, 1)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (8, 2)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (8, 3)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (8, 4)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (8, 5)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (8, 6)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (9, 1)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (9, 2)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (9, 3)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (9, 4)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (9, 5)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (9, 6)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (17, 1)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (17, 2)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (17, 3)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (17, 4)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (17, 5)
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (17, 6)
GO
SET IDENTITY_INSERT [dbo].[ApplicationCacheConfig] ON 

GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (41, N'LOGDEBUG', N'FALSE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (42, N'LOGINFO', N'FALSE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (43, N'LOGServiceDEBUG', N'FALSE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (44, N'LOGServiceINFO', N'FALSE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (45, N'LOGOrchestratorDEBUG', N'FALSE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (46, N'LOGOrchestratorINFO', N'FALSE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (47, N'LOGWebAppDEBUG', N'FALSE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (48, N'LOGWebAppINFO', N'FALSE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (48, N'UseCdnForJsCss', N'FALSE')
GO
INSERT [dbo].[ApplicationCacheConfig] ([ID], [Key], [Value]) VALUES (49, N'LOGdbOperation', N'FALSE')
GO
SET IDENTITY_INSERT [dbo].[ApplicationCacheConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[FileEncryptionDetails] ON 

GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (10000, N'huupMSzE', N'u.ini', N'Encrypted with DES Data Encryption Standard algorithm', NULL, CAST(N'2018-04-21 12:56:51.653' AS DateTime), 0, CAST(N'2018-04-21 12:56:51.653' AS DateTime), 0)
GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (10001, N'4Qt4th41', N'u.ini', N'Encrypted with DES Data Encryption Standard algorithm', NULL, CAST(N'2018-04-21 13:01:10.220' AS DateTime), 0, CAST(N'2018-04-21 13:01:10.220' AS DateTime), 0)
GO
INSERT [dbo].[FileEncryptionDetails] ([ID], [EncryptionId], [FileName], [FileDescription], [Path], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (10002, N'75344AML', N'IMG-20180421-WA0005.jpg', N'Encrypted with DES Data Encryption Standard algorithm', NULL, CAST(N'2018-04-21 17:10:27.790' AS DateTime), 0, CAST(N'2018-04-21 17:10:27.790' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[FileEncryptionDetails] OFF
GO
