using System;
using System.Threading.Tasks;
using Quartz;
using OrchestratorInterface;
using Autofac;
using DomainModel.DashBoard;
using CrossCutting.Caching;
using AutoMapper;
using Microsoft.AspNet.SignalR;
using Web.Hub;
using static Web.Hub.NotificationHub;
using DomainModel.Admin;
using System.Linq;
using Web.Areas.DashBoard.Models;

namespace Web.Scheduler
{
    public class DashBoardJob : IJob
    {
        private readonly ILifetimeScope _hubLifetimeScope;
        private IDashBoardOrchestrator _IDashBoardOrchestrator;
        public DashBoardJob(ILifetimeScope lifetimeScope)
        {
            // Create a lifetime scope for the hub.
            _hubLifetimeScope = lifetimeScope.BeginLifetimeScope("AutofacWebRequest");

            // Resolve dependencies from the hub lifetime scope.
            this._IDashBoardOrchestrator = _hubLifetimeScope.Resolve<IDashBoardOrchestrator>();
        }
        public void Execute(IJobExecutionContext context)
        {

            DashBoardViewModelDTO dashBoardViewModelDTO = new DashBoardViewModelDTO();
            DashBoardWidgetDTO dashBoardWidgetDTO = new DashBoardWidgetDTO();

            DashBoardWidgetViewModel dashBoardWidgetViewModel = new DashBoardWidgetViewModel();
            DashBoardWidget dashBoardWidget = new DashBoardWidget();

            dashBoardWidgetDTO = this._IDashBoardOrchestrator.GetDashBoardWidgetDetails();

            Mapper.Map(dashBoardWidgetDTO, dashBoardViewModelDTO);

            dashBoardViewModelDTO.DashBoardWidgetDetails.TotalNoUsers = GlobalCachingProvider.Instance.GetAllUsersAccountsFromCache().Count;
            dashBoardViewModelDTO.DashBoardWidgetDetails.TotalNoActiveUsers = ActiveConnections.ActiveUsers.Where(x => x != "").ToList().Distinct().ToList().Count;
            dashBoardViewModelDTO.DashBoardWidgetDetails.TotalNoActiveSessions = ActiveConnections.ActiveSessions.Count;

            dashBoardViewModelDTO.DashBoardWidgetDetails.ApplicationCachesTotal = GlobalCachingProvider.Instance.GetItem("TotalCaches") as string;
            dashBoardViewModelDTO.DashBoardWidgetDetails.ApplicationCachesLastUpdated = GlobalCachingProvider.Instance.GetItem("LastCachedOn") as string;

            //dashBoardViewModelDTO.DashBoardWidgetViewModel = dashBoardWidgetViewModel;

            var context1 = GlobalHost.ConnectionManager.GetHubContext<DashBoardHub>();



            context1.Clients.All.broadCastDashBoardWidget(dashBoardViewModelDTO.DashBoardWidgetDetails.TotalFileEncrypted,
                                                        dashBoardViewModelDTO.DashBoardWidgetDetails.FileEncryptedToday,
                                                           dashBoardViewModelDTO.DashBoardWidgetDetails.TotalNoUsers,
                                                            dashBoardViewModelDTO.DashBoardWidgetDetails.TotalNoActiveUsers,
                                                            dashBoardViewModelDTO.DashBoardWidgetDetails.TotalNoActiveSessions,
                                                            dashBoardViewModelDTO.DashBoardWidgetDetails.FileUploadChartLables,
                                                            dashBoardViewModelDTO.DashBoardWidgetDetails.FileUploadChartData
                                                            , dashBoardViewModelDTO.DashBoardWidgetDetails.ApplicationCachesTotal,
                                                            dashBoardViewModelDTO.DashBoardWidgetDetails.ApplicationCachesLastUpdated
                                                            );

        }
    }


}