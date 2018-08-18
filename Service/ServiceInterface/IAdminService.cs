using DomainModel;
using DomainModel.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ServiceInterface
{
    public interface IAdminService
    {
        DatabaseModel UpdateApplicationCacheValue(ApplicationCache applicationCache, DatabaseModel databaseInfoModel);

        List<ApplicationCache> GetAllApplicationCacheConfig();

        List<UserAccountModel> GetAllUserAccountDetails();

        DatabaseModel UpdateUserDetailsForUserId(UserAccountModel userAccountModel, DatabaseModel databaseInfoModel);
        void SaveMVCAuditTrail(AuditModel auditModel);

    }
}
