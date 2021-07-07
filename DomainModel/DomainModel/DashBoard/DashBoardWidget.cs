using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel.DashBoard
{
    public class DashBoardWidget
    {
        public int TotalFileEncrypted { get; set; }
        public int FileEncryptedToday { get; set; }
        public int TotalNoUsers { get; set; }
        public int TotalNoActiveUsers { get; set; }

        public int TotalNoActiveSessions { get; set; }

        public string FileUploadChartData { get; set; }
        public string FileUploadChartLables { get; set; }
        public string ApplicationCachesTotal { get; set; }
        public string ApplicationCachesLastUpdated { get; set; }

        public Int64 NoOfServersUp { get; set; }
        public Int64 NoOfServersDown { get; set; }
        public DateTime StatusRanOn { get; set; }        	
    }


    public class DashBoardWidgetDTO
    {
        public DashBoardWidget DashBoardWidgetDetails { get; set; }

        public List<DashBoardWidget> FileEncryptionChartDetails { get; set; }

    }
}
