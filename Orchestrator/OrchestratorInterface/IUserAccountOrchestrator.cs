using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
namespace OrchestratorInterface
{
    public interface IUserAccountOrchestrator
    {
        List<UserAccountModel> GetAllUserAccountDetails();

        UserAccountModel ValidateUserLogin(UserAccountModel userAccountModel);

        DatabaseModel AddNewUser(UserAccountModel userAccountModel, DatabaseModel databaseInfoModel);

        bool ValidateUserLoginAndCredential(UserAccountModel userAccountModel);


        List<UserRoleModel> GetUserRoleDetailsForUserId(Int64 requestUserId, DatabaseModel databaseInfoModel);


    }
}
