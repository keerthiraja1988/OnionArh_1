
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