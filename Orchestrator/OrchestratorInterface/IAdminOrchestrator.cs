using DomainModel;
using DomainModel.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrchestratorInterface
{
    public interface ICacheOrchestrator
    {
        DatabaseModel UpdateApplicationCacheValue(ApplicationCache applicationCache, DatabaseModel databaseInfoModel);

        List<ApplicationCache> GetAllApplicationCacheConfig();

    }

    public interface IUserManageOrchestrator
    {
        List<UserAccountModel> GetAllUserAccountDetails();
        DatabaseModel UpdateUserDetailsForUserId(UserAccountModel userAccountModel, DatabaseModel databaseInfoModel);
    }

    public interface IAuditOrchestrator
    {
        void SaveMVCAuditTrail(AuditModel auditModel);
    }
}
