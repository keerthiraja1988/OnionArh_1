
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