using DomainModel;
using DomainModel.Admin;
using Insight.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public interface IAdminRepository
    {
        #region Application Cache Management

        [Sql("SELECT * FROM [dbo].[ApplicationCacheConfig]")]
        List<ApplicationCache> GetAllApplicationCacheConfig();

        [Sql("UpdateApplicationCacheValue")]
        void UpdateApplicationCacheValue(ApplicationCache applicationCache, Int64 UserId, Boolean canDebug, out int returnError, out string returnErrorMessage, out Guid returnGuid);


        [Sql("GetAllUserAccountDetails")]
        List<UserAccountModel> GetAllUserAccountDetails();

        [Sql("P_UpdateUserDetailsForUserId")]
        DatabaseModel UpdateUserDetailsForUserId(UserAccountModel userAccountModel,List<UserRoleModel> t_UserRoles, Int64 UserId, Boolean canDebug, out int returnError, out string returnErrorMessage, out Guid returnGuid);

        [Sql("P_SaveMVCAuditTrail")]
        void SaveMVCAuditTrail(AuditModel auditModel);
        #endregion
    }
}
