using Insight.Database;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Caching;
using System.Configuration;
using static CrossCutting.Caching.GlobalCachingProvider;

namespace CrossCutting.Caching
{

    public abstract class CachingProviderBase
    {
        public CachingProviderBase()
        {
            DeleteLog();
        }

        protected MemoryCache ApplicationCache = new MemoryCache("ApplicationCache");
        protected MemoryCache UserAccountCache = new MemoryCache("UserAccountCache");
        protected MemoryCache UserRolesCache = new MemoryCache("UserRolesCache");
        protected MemoryCache DashBoardDetails = new MemoryCache("DashBoardDetails");

        static readonly object padlock = new object();

        protected virtual void AddItems()
        {

        }

        protected virtual DashBoardWidgetCacheModel GetDashBoardWidgetDetails()
        {
            lock (padlock)
            {
                DashBoardWidgetCacheModel dashBoardWidgetCacheModel = new DashBoardWidgetCacheModel();
                var v = DashBoardDetails;

                foreach (var item in v)
                {
                    dashBoardWidgetCacheModel = (DashBoardWidgetCacheModel)item.Value;
                }

                return dashBoardWidgetCacheModel;
            }
        }

        protected virtual void AddDashBoardDetails(string key, DashBoardWidgetCacheModel value)
        {
            lock (padlock)
            {
                DashBoardDetails.Add(key, value, DateTimeOffset.MaxValue);
            }
        }

        protected virtual void RemoveDashBoardDetails(string key)
        {
            lock (padlock)
            {
                DashBoardDetails.Remove(key);
            }
        }

        protected virtual List<UserAccountCacheModel> GetAllUsersAccountsFromCache()
        {
            lock (padlock)
            {
                List<UserAccountCacheModel> vv = new List<UserAccountCacheModel>();

                var v = UserAccountCache;

                foreach (var item in v)
                {
                    UserAccountCacheModel roles = new UserAccountCacheModel();

                    roles = GetUserAccount(item.Key);
                    vv.Add(roles);
                }

                return vv;
            }
        }

        protected virtual void GetAllUsersAccountsToCache()
        {

        }

        public virtual List<UserRolesCacheModel> GetAllUserRoles()
        {
            lock (padlock)
            {
                List<UserRolesCacheModel> vv = new List<UserRolesCacheModel>();

                var v = UserRolesCache;

                foreach (var item in v)
                {
                    UserRolesCacheModel roles = new UserRolesCacheModel();
                    roles.RoleId = item.Key;
                    roles.RoleName = (string)item.Value;

                    vv.Add(roles);
                }

                return vv;
            }

        }


        protected virtual void AddUserRolesCache(string key, string value)
        {
            lock (padlock)
            {
                UserRolesCache.Add(key, value, DateTimeOffset.MaxValue);
            }
        }

        protected virtual void RemoveApplicationCacheItems()
        {
            lock (padlock)
            {
                List<string> keys = new List<string>();
                keys = ApplicationCache.Select(x => x.Key).ToList();

                foreach (var item in keys)
                {
                    ApplicationCache.Remove(item);
                }
            }
        }

        protected virtual void RemoveUserCacheItems()
        {
            lock (padlock)
            {
                List<string> keys = new List<string>();
                keys = UserAccountCache.Select(x => x.Key).ToList();

                foreach (var item in keys)
                {
                    ApplicationCache.Remove(item);
                }
            }
        }

        protected virtual void AddItem(string key, object value)
        {
            lock (padlock)
            {
                ApplicationCache.Add(key, value, DateTimeOffset.MaxValue);
            }
        }

        protected virtual void AddUserAccountToCache(string key, UserAccountCacheModel value)
        {
            lock (padlock)
            {
                UserAccountCache.Add(key, value, DateTimeOffset.MaxValue);
            }
        }

        protected virtual void RemoveItem(string key)
        {
            lock (padlock)
            {
                ApplicationCache.Remove(key);
            }
        }


        public virtual UserAccountCacheModel GetUserAccount(string userName)
        {
            lock (padlock)
            {
                UserAccountCacheModel userAccountCacheModel = new UserAccountCacheModel();
                userAccountCacheModel = (UserAccountCacheModel)UserAccountCache[userName];
                return userAccountCacheModel;
            }

        }



        protected virtual object GetItem(string key, bool remove)
        {
            lock (padlock)
            {
                var res = ApplicationCache[key];

                if (res != null)
                {
                    if (remove == true)
                        ApplicationCache.Remove(key);
                }
                else
                {
                    WriteToLog("CachingProvider-GetItem: Don't contains key: " + key);
                }

                return res;
            }
        }



        #region Error Logs

        string LogPath = System.Environment.GetEnvironmentVariable("TEMP");

        protected void DeleteLog()
        {
            System.IO.File.Delete(string.Format("{0}\\CachingProvider_Errors.txt", LogPath));
        }

        protected void WriteToLog(string text)
        {
            using (System.IO.TextWriter tw = System.IO.File.AppendText(string.Format("{0}\\CachingProvider_Errors.txt", LogPath)))
            {
                tw.WriteLine(text);
                tw.Close();
            }
        }

        #endregion
    }
}
