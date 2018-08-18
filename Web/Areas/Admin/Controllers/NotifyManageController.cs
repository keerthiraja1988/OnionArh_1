using Autofac;
using OrchestratorInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Controllers;
using Web.Hub;

namespace Web.Areas.Admin.Controllers
{
    public class NotifyManageController : BaseController
    {

        private ICacheOrchestrator _IManagementOrchestrator;
        public NotifyManageController(ICacheOrchestrator IManagementOrchestrator)
        {
            this._IManagementOrchestrator = IManagementOrchestrator;
        }

        // GET: Management/NotifyManage
        public ActionResult Index()
        {
            return View("Index");
        }

        [HttpPost]
        public void SendNotification(NotifModels obj)
        {
            //NotificationHub objNotifHub = new NotificationHub(ILifetimeScope lifetimeScope);

            //Notification objNotif = new Notification();
            //objNotif.SentTo = obj.UserID;
        

            //objNotifHub.SendNotification(obj.UserID, obj.Message, "success", 1);

        }

        public void DisplayedNotification(NotifModels obj)
        {

            //NotificationHub objNotifHub = new NotificationHub(ILifetimeScope lifetimeScope);

            //Notification objNotif = new Notification();
            //objNotif.SentTo = obj.UserID;
            //DomainModel.Notification not = new DomainModel.Notification();

            //Mapper.Map(obj, not);

            //obj.UserID = GetUserId();

            //objNotifHub.RemoveUserNotification(obj.NotificationId, obj.UserID);

        }
    }
}