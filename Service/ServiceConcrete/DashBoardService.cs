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
using DomainModel.DashBoard;

namespace ServiceConcrete
{
    [Log4Net]
    public class DashBoardService : IDashBoardService
    {
        IDashBoardRepository _IDashBoardRepository;


        public DashBoardService()
        {

            SqlInsightDbProvider.RegisterProvider();
            string sqlConnection = ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
            DbConnection c = new SqlConnection(sqlConnection);
            _IDashBoardRepository = c.As<IDashBoardRepository>();
        }

        
        public DashBoardWidget GetDashBoardWidgetDetails()
        {
          return  this._IDashBoardRepository.GetDashBoardWidgetDetails();
        }



        public List<DashBoardWidget> GetDashBoardGetFileEncryptionChart()
        {
            return this._IDashBoardRepository.GetDashBoardGetFileEncryptionChart();

        }

    }
}

