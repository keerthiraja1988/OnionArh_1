
using CrossCutting.Logging;
using DomainModel;
using OrchestratorInterface;
using ServiceInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
namespace OrchestratorConcrete
{
    [Log4Net]
    public class UserAccountOrchestrator : IUserAccountOrchestrator
    {
        private IUserAccountService _IUserAccountService;
        private ISercurityService _ISercurityService;

        public UserAccountOrchestrator(IUserAccountService UserAccountService, ISercurityService ISercurityService)
        {
            this._IUserAccountService = UserAccountService;
            this._ISercurityService = ISercurityService;
        }

        public List<UserAccountModel> GetAllUserAccountDetails()
        {
            return _IUserAccountService.GetAllUserAccountDetails();
        }

        public UserAccountModel ValidateUserLogin(UserAccountModel userAccountModel)
        {
            UserAccountModel userAccount = new UserAccountModel();

            userAccount = this._IUserAccountService.ValidateUserLoginDetails(userAccountModel);

            // string ecryptPassword = this._ISercurityService.Encrypt(userAccountModel.Password);

            //string decryptPassword;  // = this._ISercurityService.Decrypt(userAccount.EncryptedPassword);

            //if (decryptPassword == userAccountModel.Password)
            //{
            //    userAccount.LoginStatus = "LoginSuccess";
            //}

            return userAccount;
        }

        public DatabaseModel AddNewUser(UserAccountModel userAccountModel, DatabaseModel databaseInfoModel)
        {
            userAccountModel = this._ISercurityService.GenerateHashAndSaltForPassword(userAccountModel);

            return this._IUserAccountService.AddNewUser(userAccountModel, databaseInfoModel);
        }

        public bool ValidateUserLoginAndCredential(UserAccountModel userAccountModel)
        {
            bool isValidUser = this._ISercurityService.ValidateUserLoginAndCredential(userAccountModel);

            return isValidUser;
        }
        public List<UserRoleModel> GetUserRoleDetailsForUserId(Int64 requestUserId, DatabaseModel databaseInfoModel)
        {
            return this._IUserAccountService.GetUserRoleDetailsForUserId(requestUserId, databaseInfoModel);
        }


    }
}
