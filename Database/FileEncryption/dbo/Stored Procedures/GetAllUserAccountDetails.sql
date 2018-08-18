

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