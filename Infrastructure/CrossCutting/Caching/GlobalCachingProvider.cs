using Insight.Database;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CrossCutting.Caching
{
    public class GlobalCachingProvider : CachingProviderBase, IGlobalCachingProvider
    {
        #region Singleton 

        protected GlobalCachingProvider()
        {

        }

        public static GlobalCachingProvider Instance
        {
            get
            {
                return Nested.instance;
            }
        }

        class Nested
        {
            // Explicit static constructor to tell C# compiler
            // not to mark type as beforefieldinit
            static Nested()
            {
            }
            internal static readonly GlobalCachingProvider instance = new GlobalCachingProvider();
        }

        #endregion


        public interface IBeerRepository
        {
            [Sql("select * from ApplicationCacheConfig")]
            IList<ApplicationCacheModel> GetBeerByType();

            [Sql("select * from dbo.users where isactive = 1")]
            IList<UserAccountCacheModel> GetAllUsers();

            [Sql("P_GetAllUserRoleDetails")]
            IList<UserRolesCacheModel> GetAllUserRoleDetails();

            [Sql("P_GetAllRoleDetails")]
            IList<UserRolesCacheModel> GetAllRoleDetails();

            [Sql("P_DashBoardWidgetDetails")]
            DashBoardWidgetCacheModel RefreshDashBoardWidgetDetails();

            [Sql("P_GetFileEncryptionDetailsForDashBoard")]
            List<DashBoardWidgetCacheModel> GetFileEncryptionDetailsForDashBoard();
        }

        #region ICachingProvider

        public virtual void RefreshDashBoardWidgetDetails()
        {
            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection c = new SqlConnection(sqlConnection);
            IBeerRepository i = c.As<IBeerRepository>();
            DashBoardWidgetCacheModel dashBoardWidgetCacheModel = new DashBoardWidgetCacheModel();
            dashBoardWidgetCacheModel = i.RefreshDashBoardWidgetDetails();

            List<DashBoardWidgetCacheModel> fileEncryptionDetailsChart = new List<DashBoardWidgetCacheModel>();

            fileEncryptionDetailsChart = i.GetFileEncryptionDetailsForDashBoard();

            dashBoardWidgetCacheModel.FileUploadChartLables = "'" + string.Join("','", fileEncryptionDetailsChart.Select(x => x.FileUploadChartLables)) + "'";

            dashBoardWidgetCacheModel.FileUploadChartData = string.Join(",", fileEncryptionDetailsChart.Select(x => x.FileUploadChartData));


            base.AddDashBoardDetails("Widgets", dashBoardWidgetCacheModel);
        }

        public virtual void RemoveDashBoardWidgetDetails()
        {

            base.RemoveDashBoardDetails("Widgets");

        }
        public virtual void RegisterAllUserAccount()
        {
            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection c = new SqlConnection(sqlConnection);

            // DbConnection c = new SqlConnection("Data Source=.;Initial Catalog=FileEncryption;Integrated Security=True");

            IBeerRepository i = c.As<IBeerRepository>();


        }

        public virtual new DashBoardWidgetCacheModel GetDashBoardWidgetDetails()
        {
            return base.GetDashBoardWidgetDetails();//Remove default is true because it's Global ApplicationCache!
        }

        public virtual new List<UserRolesCacheModel> GetAllUserRoles()
        {
            return base.GetAllUserRoles();//Remove default is true because it's Global ApplicationCache!

        }


        public virtual void AddUserRolesCache()
        {
            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection c = new SqlConnection(sqlConnection);

            // DbConnection c = new SqlConnection("Data Source=.;Initial Catalog=FileEncryption;Integrated Security=True");

            IBeerRepository i = c.As<IBeerRepository>();

            IList<UserRolesCacheModel> v = i.GetAllRoleDetails();


            foreach (var item in v)
            {

                base.AddUserRolesCache(item.RoleId, item.RoleName);
            }
        }


        public virtual new UserAccountCacheModel GetUserAccount(string userName)
        {
            return base.GetUserAccount(userName);//Remove default is true because it's Global ApplicationCache!
        }


        public virtual new List<UserAccountCacheModel> GetAllUsersAccountsFromCache()
        {
            return base.GetAllUsersAccountsFromCache();
        }

        public virtual new void GetAllUsersAccountsToCache()
        {

            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection c = new SqlConnection(sqlConnection);

            // DbConnection c = new SqlConnection("Data Source=.;Initial Catalog=FileEncryption;Integrated Security=True");

            IBeerRepository i = c.As<IBeerRepository>();

            IList<UserAccountCacheModel> v = i.GetAllUsers();
            IList<UserRolesCacheModel> v1 = i.GetAllUserRoleDetails();

            foreach (var item in v)
            {
                item.Roles = v1.Where(x => x.UserId == item.UserId).Select(x => x.RoleName).ToList();
                AddUserAccountToCache(item.UserName, item);
            }


        }


        public virtual new void AddItems()
        {

            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection c = new SqlConnection(sqlConnection);

            // DbConnection c = new SqlConnection("Data Source=.;Initial Catalog=FileEncryption;Integrated Security=True");

            IBeerRepository i = c.As<IBeerRepository>();

            IList<ApplicationCacheModel> v = i.GetBeerByType();

            foreach (var item in v)
            {
                AddItem(item.Key, item.Value.ToUpper());

            }
            AddItem("TotalCaches", v.Count.ToString());
            AddItem("LastCachedOn", DateTime.Now.ToString("MM-dd-yyyy  hh:mm tt"));
        }

        public virtual new void RemoveUserCacheItems()
        {
            base.RemoveUserCacheItems();
        }

        public virtual void RefreshApplicationCacheItems()
        {

            base.RemoveApplicationCacheItems();

            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection c = new SqlConnection(sqlConnection);

            // DbConnection c = new SqlConnection("Data Source=.;Initial Catalog=FileEncryption;Integrated Security=True");

            IBeerRepository i = c.As<IBeerRepository>();

            IList<ApplicationCacheModel> v = i.GetBeerByType();

            foreach (var item in v)
            {
                AddItem(item.Key, item.Value.ToUpper());

            }
        }

        public virtual new void AddItem(string key, object value)
        {
            base.AddItem(key, value);
        }

        public virtual object GetItem(string key)
        {
            return base.GetItem(key, false);//Remove default is true because it's Global ApplicationCache!
        }

        public virtual new object GetItem(string key, bool remove)
        {
            return base.GetItem(key, remove);
        }


        #endregion

    }


    public class ApplicationCacheModel
    {
        public string Key { get; set; }
        public string Value { get; set; }

    }

    public class UserAccountCacheModel
    {
        public int UserId { get; set; }

        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }
        public List<string> Roles { get; set; }

        public DateTime CreatedOn { get; set; }
        public Int64 CreatedBy { get; set; }

        public DateTime ModifiedOn { get; set; }
        public Int64 ModifiedBy { get; set; }
    }

    public class UserRolesCacheModel
    {
        public int UserId { get; set; }

        public string RoleName { get; set; }

        public string RoleId { get; set; }


    }

    public class DashBoardWidgetCacheModel
    {
        public int TotalFileEncrypted { get; set; }
        public int FileEncryptedToday { get; set; }
        public string FileUploadChartLables { get; set; }
        public string FileUploadChartData { get; set; }
    }
}
