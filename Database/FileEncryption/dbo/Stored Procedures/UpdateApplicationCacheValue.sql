
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