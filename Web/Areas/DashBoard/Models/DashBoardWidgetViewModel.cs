using AutoMapperFramework;
using DomainModel.DashBoard;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Areas.DashBoard.Models
{
    public class DashBoardWidgetViewModel : IMapFrom<DashBoardWidget>, IMapTo<DashBoardWidget>
    {
        public int TotalFileEncrypted { get; set; }
        public int FileEncryptedToday { get; set; }
        public int TotalNoUsers { get; set; }
        public int TotalNoActiveUsers { get; set; }

        public int TotalNoActiveSessions { get; set; }

        public string FileUploadChartLables { get; set; }
        public string FileUploadChartData { get; set; }
        public string ApplicationCachesTotal { get; set; }
        public string ApplicationCachesLastUpdated { get; set; }

        public Int64 NoOfServersUp { get; set; }
        public Int64 NoOfServersDown { get; set; }
        public DateTime StatusRanOn { get; set; }
        public string StatusRanOnText { get; set; }
    }


    public class DashBoardViewModelDTO : IMapFrom<DashBoardWidgetDTO>, IMapTo<DashBoardWidgetDTO>
    {

        public DashBoardWidgetViewModel DashBoardWidgetDetails { get; set; }

        public List<DashBoardWidgetViewModel> FileEncryptionChartDetails { get; set; }


    }
}