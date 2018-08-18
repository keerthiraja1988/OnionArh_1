using DomainModel;
using DomainModel.Admin;
using DomainModel.DashBoard;
using OrchestratorInterface;
using ServiceInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrchestratorConcrete
{
    public class DashBoardOrchestrator : IDashBoardOrchestrator
    {
        IDashBoardService _IDashBoardService;
        public DashBoardOrchestrator(IDashBoardService IDashBoardService)
        {
            this._IDashBoardService = IDashBoardService;
        }

        public DashBoardWidgetDTO GetDashBoardWidgetDetails()
        {
            DashBoardWidgetDTO dashBoardWidgetDTO = new DashBoardWidgetDTO();

            dashBoardWidgetDTO.DashBoardWidgetDetails = this._IDashBoardService.GetDashBoardWidgetDetails();
            dashBoardWidgetDTO.FileEncryptionChartDetails = this._IDashBoardService.GetDashBoardGetFileEncryptionChart();

            dashBoardWidgetDTO.DashBoardWidgetDetails.FileUploadChartLables  = "'" + string.Join("','", dashBoardWidgetDTO.FileEncryptionChartDetails.Select(x => x.FileUploadChartLables)) + "'";
            dashBoardWidgetDTO.DashBoardWidgetDetails.FileUploadChartData = string.Join(",", dashBoardWidgetDTO.FileEncryptionChartDetails.Select(x => x.FileUploadChartData));


            return dashBoardWidgetDTO;
        }



    }


}
