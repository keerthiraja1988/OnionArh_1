using DomainModel;
using DomainModel.Admin;
using OrchestratorInterface;
using ServiceInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;

namespace OrchestratorConcrete
{
   
    public partial class AdminOrchestrator : ICacheOrchestrator
    {
        IAdminService _IAdminService;
        public AdminOrchestrator(IAdminService IAdminService)
        {
            this._IAdminService = IAdminService;
        }

        public DatabaseModel UpdateApplicationCacheValue(ApplicationCache applicationCache, DatabaseModel databaseInfoModel)
        {

            return _IAdminService.UpdateApplicationCacheValue(applicationCache, databaseInfoModel);
        }

        public List<ApplicationCache> GetAllApplicationCacheConfig()
        {
            return this._IAdminService.GetAllApplicationCacheConfig();
        }
    }

    public partial class AdminOrchestrator : IUserManageOrchestrator
    {
        public List<UserAccountModel> GetAllUserAccountDetails()
        {
            return this._IAdminService.GetAllUserAccountDetails();
        }

        public DatabaseModel UpdateUserDetailsForUserId(UserAccountModel userAccountModel, DatabaseModel databaseInfoModel)
        {
            return this._IAdminService.UpdateUserDetailsForUserId(userAccountModel, databaseInfoModel);
        }

    }

    public partial class AdminOrchestrator : IAuditOrchestrator
    {
        public void SaveMVCAuditTrail(AuditModel auditModel)
        {
            this._IAdminService.SaveMVCAuditTrail(auditModel);
        }

    }

}
