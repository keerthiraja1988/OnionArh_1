


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