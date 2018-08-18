



CREATE PROC [dbo].P_GetAllRoleDetails 
	
		
  AS
begin

	
SELECT  [RoleId]
      ,[RoleName]
  FROM [dbo].[Roles]
	
	
end