using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CrossCutting.Caching
{
    public interface IGlobalCachingProvider
    {

        void GetAllUsersAccountsToCache();
        void AddItems();
        void AddItem(string key, object value);
        object GetItem(string key);
        void RegisterAllUserAccount();
        UserAccountCacheModel GetUserAccount(string userName);
        void RefreshApplicationCacheItems();
        void RemoveUserCacheItems();
        void AddUserRolesCache();
        List<UserAccountCacheModel> GetAllUsersAccountsFromCache();
        List<UserRolesCacheModel> GetAllUserRoles();
        void RefreshDashBoardWidgetDetails();
        void RemoveDashBoardWidgetDetails();
        DashBoardWidgetCacheModel GetDashBoardWidgetDetails();
    }
}
