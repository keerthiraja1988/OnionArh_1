
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



