using DomainModel;
using Repository;
using ServiceInterface;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Insight.Database;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Web;
using System.Data;
using CrossCutting.Caching;
using CrossCutting.Logging;
using DomainModel.Admin;

namespace ServiceConcrete
{
    [Log4Net]
    public class AdminService : IAdminService
    {
        IAdminRepository _IAdminRepository;


        public AdminService()
        {

            SqlInsightDbProvider.RegisterProvider();
            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection c = new SqlConnection(sqlConnection);
            _IAdminRepository = c.As<IAdminRepository>();
        }

        public List<ApplicationCache> GetAllApplicationCacheConfig()
        {
            return this._IAdminRepository.GetAllApplicationCacheConfig();
        }

        public DatabaseModel UpdateApplicationCacheValue(ApplicationCache applicationCache, DatabaseModel databaseInfoModel)
        {

            int returnError;
            Guid returnGuid;
            string returnErrorMessage;
            Boolean canDebug = Convert.ToBoolean((GlobalCachingProvider.Instance.GetItem("LOGdbOperation") as string).ToLower());

            this._IAdminRepository.UpdateApplicationCacheValue(applicationCache, databaseInfoModel.UserId, canDebug, out returnError, out returnErrorMessage, out returnGuid);

            databaseInfoModel.ReturnError = returnError;
            databaseInfoModel.ReturnErrorMessage = returnErrorMessage;
            databaseInfoModel.ReturnGuid = returnGuid;

            return databaseInfoModel;
        }

        public List<UserAccountModel> GetAllUserAccountDetails()
        {
            return this._IAdminRepository.GetAllUserAccountDetails();
        }

        public DatabaseModel UpdateUserDetailsForUserId(UserAccountModel userAccountModel, DatabaseModel databaseInfoModel)
        {
            int returnError;
            Guid returnGuid;
            string returnErrorMessage;
            Boolean canDebug = Convert.ToBoolean((GlobalCachingProvider.Instance.GetItem("LOGdbOperation") as string).ToLower());

            this._IAdminRepository.UpdateUserDetailsForUserId(userAccountModel
                ,userAccountModel.Roles.Where(a => a.RoleActive == true).ToList()
                , databaseInfoModel.UserId, canDebug, out returnError, out returnErrorMessage, out returnGuid);

            databaseInfoModel.ReturnError = returnError;
            databaseInfoModel.ReturnErrorMessage = returnErrorMessage;
            databaseInfoModel.ReturnGuid = returnGuid;

            return databaseInfoModel;
        }
        public void SaveMVCAuditTrail(AuditModel auditModel)
        {
            this._IAdminRepository.SaveMVCAuditTrail(auditModel);
        }
    }
}

