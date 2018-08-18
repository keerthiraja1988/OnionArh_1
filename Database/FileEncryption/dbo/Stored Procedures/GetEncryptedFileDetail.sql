

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




