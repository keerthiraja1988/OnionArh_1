

using Insight.Database;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace CrossCutting.Database
{
    public abstract class AbstractDatabase
    {
        public virtual DbConnection Connection { get; set; }
        public virtual DbCommand Command { get; set; }
    }

    public interface IConnectionFactory
    {
        IDbConnection GetConnection();
    }

    public sealed class SqlServerDatabase : AbstractDatabase, IConnectionFactory
    {
        private DbConnection _connection = null;
        private DbCommand _command = null;

        public override DbConnection Connection
        {
            get
            {
                if (_connection == null)
                {
                    _connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString);


                    // _connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlServerConnection"].ConnectionString);
                }
                return _connection;
            }
            set
            {
                _connection = value;
            }
        }

        public override DbCommand Command
        {
            get
            {
                if (_command == null)
                {
                    _command = new SqlCommand();
                    _command.Connection = Connection;
                }
                return _command;
            }
            set
            {
                _command = value;
            }
        }

        public IDbConnection GetConnection()
        {
            SqlInsightDbProvider.RegisterProvider();
            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection connection = new SqlConnection(sqlConnection);

            return connection;

        }
    }
}
