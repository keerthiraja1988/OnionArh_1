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

namespace ServiceConcrete
{
    [Log4Net]
    public class UserAccountService : IUserAccountService
    {
        IUserAccountRepository _IUserAccountRepository;


        public UserAccountService()
        {

            SqlInsightDbProvider.RegisterProvider();
            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection c = new SqlConnection(sqlConnection);
            _IUserAccountRepository = c.As<IUserAccountRepository>();
        }
        public UserAccountService(IUserAccountRepository UserAccountRepository)
        {
            _IUserAccountRepository = UserAccountRepository;
        }

        public List<UserAccountModel> GetAllUserAccountDetails()
        {
            List<UserAccountModel> userAccounts = new List<UserAccountModel>();
            userAccounts = this._IUserAccountRepository.GetAllUserAccountDetails();
            return userAccounts;
        }

        public UserAccountModel ValidateUserLoginDetails(UserAccountModel userAccountModel)
        {
            UserAccountModel userAccount = new UserAccountModel();
            userAccount = this._IUserAccountRepository.ValidateUserLoginDetails(userAccountModel);
            return userAccount;
        }

        public DatabaseModel AddNewUser(UserAccountModel userAccountModel, DatabaseModel databaseInfoModel)
        {


            int returnError;
            Guid returnGuid;
            string returnErrorMessage;
            Boolean canDebug = Convert.ToBoolean((GlobalCachingProvider.Instance.GetItem("LOGdbOperation") as string).ToLower());

            this._IUserAccountRepository.AddNewUser(userAccountModel, databaseInfoModel.UserId, canDebug, out returnError, out returnErrorMessage, out returnGuid);

            databaseInfoModel.ReturnError = returnError;
            databaseInfoModel.ReturnErrorMessage = returnErrorMessage;
            databaseInfoModel.ReturnGuid = returnGuid;

            return databaseInfoModel;
        }

        public List<UserRoleModel> GetUserRoleDetailsForUserId(Int64 requestUserId, DatabaseModel databaseInfoModel)
        {

            int returnError;
            Guid returnGuid;
            string returnErrorMessage;
            Boolean canDebug = Convert.ToBoolean((GlobalCachingProvider.Instance.GetItem("LOGdbOperation") as string).ToLower());

            List<UserRoleModel> userRoles = new List<UserRoleModel>();

            userRoles =  this._IUserAccountRepository.GetUserRoleDetailsForUserId(requestUserId, databaseInfoModel.UserId, canDebug, out returnError, out returnErrorMessage, out returnGuid);

            databaseInfoModel.ReturnError = returnError;
            databaseInfoModel.ReturnErrorMessage = returnErrorMessage;
            databaseInfoModel.ReturnGuid = returnGuid;

            return userRoles;
        }

    }
}

