CREATE TABLE [dbo].[Notification] (
    [NotificationId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [Type]             INT             NULL,
    [Details]          NVARCHAR (1000) NULL,
    [Title]            NVARCHAR (100)  NULL,
    [DetailsURL]       NVARCHAR (500)  NULL,
    [UserID]           NVARCHAR (50)   NULL,
    [Date]             DATE            NULL,
    [IsRead]           BIT             NULL,
    [IsDeleted]        BIT             NULL,
    [IsReminder]       BIT             NULL,
    [Code]             NVARCHAR (100)  NULL,
    [NotificationType] NVARCHAR (100)  NULL,
    CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED ([NotificationId] ASC)
);

