


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