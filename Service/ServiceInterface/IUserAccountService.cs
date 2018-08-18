using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ServiceInterface
{
    public interface IUserAccountService
    {
        List<UserAccountModel> GetAllUserAccountDetails();

        UserAccountModel ValidateUserLoginDetails(UserAccountModel userAccountModel);

        DatabaseModel AddNewUser(UserAccountModel userAccountModel, DatabaseModel databaseInfoModel);

        List<UserRoleModel> GetUserRoleDetailsForUserId(Int64 requestUserId, DatabaseModel databaseInfoModel);
    }
}
