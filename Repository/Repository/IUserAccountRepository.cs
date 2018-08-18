using DomainModel;
using Insight.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public interface IUserAccountRepository
    {
        [Sql("GetAllUserAccountDetails")]
        List<UserAccountModel> GetAllUserAccountDetails();

        [Sql("ValidateUserLoginDetails")]
        UserAccountModel ValidateUserLoginDetails(UserAccountModel userAccountModel);

        [Sql("P_AddNewUser")]
        void AddNewUser(UserAccountModel userAccountModel , Int64 userId, Boolean canDebug, out int returnError, out string returnErrorMessage, out Guid returnGuid);

        [Sql("P_GetUserRoleDetailsForUserId")]
        List<UserRoleModel> GetUserRoleDetailsForUserId(Int64 requestUserId, Int64 userId, Boolean canDebug, out int returnError, out string returnErrorMessage, out Guid returnGuid);

    }
}
