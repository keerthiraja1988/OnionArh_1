


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