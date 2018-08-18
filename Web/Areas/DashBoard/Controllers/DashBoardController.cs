using AutoMapper;
using CrossCutting.Caching;
using DomainModel.DashBoard;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Infrastructure;
using OrchestratorInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Areas.DashBoard.Models;
using Web.Filters;
using Web.Hub;
using static Web.Hub.NotificationHub;

namespace Web.Areas.DashBoard.Controllers
{


    public class DashBoardController : Controller
    {
        private IDashBoardOrchestrator _IDashBoardOrchestrator;
        public DashBoardController(IDashBoardOrchestrator IDashBoardOrchestrator)
        {
            this._IDashBoardOrchestrator = IDashBoardOrchestrator;
        }


        //private readonly IConnectionManager _connectionManager;
        //public DashBoardController(IConnectionManager iConnectionManager)
        //{
        //    _connectionManager = iConnectionManager;
        //}

        public ActionResult Index()
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

            ViewBag.FileUploadChartData = dashBoardViewModelDTO.DashBoardWidgetDetails.FileUploadChartData;
            //ViewBag.FileUploadChartLables = dashBoardViewModelDTO.DashBoardWidgetDetails.FileUploadChartLables;
            ViewBag.FileUploadChartLables = dashBoardViewModelDTO.DashBoardWidgetDetails.FileUploadChartLables;


            //var context1 = GlobalHost.ConnectionManager.GetHubContext<DashBoardHub>();

            //context1.Clients.All.broadCastDashBoardWidget(dashBoardWidgetViewModel.TotalFileEncrypted, dashBoardWidgetViewModel.FileEncryptedToday,
            //                                               dashBoardWidgetViewModel.TotalNoUsers, dashBoardWidgetViewModel.TotalNoActiveUsers
            //                                               , dashBoardWidgetViewModel.TotalNoActiveSessions
            //                                               , dashBoardWidgetViewModel.FileUplaodChartLables
            //                                               , dashBoardWidgetViewModel.FileUplaodChartData
            //                                           , dashBoardWidgetViewModel.ApplicationCachesTotal
            //                                           , dashBoardWidgetViewModel.ApplicationCachesLastUpdated
            //                                               );

            return View("~/Areas/DashBoard/Views/DashBoard/Index.cshtml", dashBoardViewModelDTO);
        }
    }
}