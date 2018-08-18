using Autofac;
using AutoMapper;
using CrossCutting.Caching;
using DomainModel.Admin;
using DomainModel.DashBoard;
using Microsoft.AspNet.SignalR;
using OrchestratorInterface;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Activities;
using System.Threading.Tasks;
using System.Web;
using Web.Filters;

namespace Web.Hub
{
    public class NotificationHub : Microsoft.AspNet.SignalR.Hub
    {
        public class ActiveSessions
        {
            public string ConnectionId { get; set; }
            public string IpAddress { get; set; }
            public DateTime ConnectedOn { get; set; }

        }


        private static readonly ConcurrentDictionary<string, UserHubModels> Users =
new ConcurrentDictionary<string, UserHubModels>(StringComparer.InvariantCultureIgnoreCase);

        public static class ActiveConnections
        {
            public static List<string> ActiveUsers = new List<string>();
            public static List<string> ActiveSessions = new List<string>();
            public static List<ActiveSessions> ActiveSessionsList = new List<ActiveSessions>();
        }


        private readonly ILifetimeScope _hubLifetimeScope;
        private IAuditOrchestrator _IAuditOrchestrator;

        public NotificationHub(ILifetimeScope lifetimeScope)
        {
            // Create a lifetime scope for the hub.
            _hubLifetimeScope = lifetimeScope.BeginLifetimeScope("AutofacWebRequest");

            // Resolve dependencies from the hub lifetime scope.
            this._IAuditOrchestrator = _hubLifetimeScope.Resolve<IAuditOrchestrator>();
        }

        protected override void Dispose(bool disposing)
        {
            // Dipose the hub lifetime scope when the hub is disposed.
            if (disposing && _hubLifetimeScope != null)
            {
                _hubLifetimeScope.Dispose();
            }
            base.Dispose(disposing);
        }

        public void NotifyAll(string title, string message, string alertType)
        {
            Clients.All.displayNotification(title, message, alertType);
        }

        public void SendNotification(string title, string message, string alertType, Int64 notificationId)
        {

            UserHubModels receiver;
            if (Users.TryGetValue(title, out receiver))
            {
                var context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                var cid = receiver.ConnectionIds.ToList();
                if (cid != null && cid.Count > 0)
                {
                    cid.ForEach(x =>
                    {
                        context.Clients.Client(x).broadcaastNotif(title, message, alertType, notificationId);
                    });
                }

            }
        }

        //Logged Use Call  
        public void GetNotification()
        {
            try
            {
                string loggedUser = Context.User.Identity.Name;

                //Get TotalNotification  
                string totalNotif = LoadNotifData(loggedUser);

                //Send To  
                UserHubModels receiver;
                if (Users.TryGetValue(loggedUser, out receiver))
                {
                    var cid = receiver.ConnectionIds.FirstOrDefault();
                    var context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                    context.Clients.Client(cid).broadcaastNotif(totalNotif);
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        //Specific User Call  
        public void SendNotification(string SentTo)
        {
            try
            {
                //Get TotalNotification  
                string totalNotif = LoadNotifData(SentTo);

                //Send To  
                UserHubModels receiver;
                if (Users.TryGetValue(SentTo, out receiver))
                {
                    var cid = receiver.ConnectionIds.FirstOrDefault();
                    var context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                    context.Clients.Client(cid).broadcaastNotif(totalNotif);
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }


        //Specific User Call  
        public void RemoveUserNotification(Int64 notificationId, string userId)
        {


            UserHubModels receiver;
            //if (Users.TryGetValue(userId, out receiver))
            //{
            //    var context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
            //    var cid = receiver.ConnectionIds.ToList();
            //    if (cid != null && cid.Count > 0)
            //    {
            //        cid.ForEach(x =>
            //        {
            //            context.Clients.Client(x).broadcaastNotif(userId, "", "", notificationId);
            //        });
            //    }

            //}

            if (Users.TryGetValue(userId, out receiver))
            {
                var context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                var cid = receiver.ConnectionIds.ToList();
                if (cid != null && cid.Count > 0)
                {
                    cid.ForEach(x =>
                    {
                        context.Clients.Client(x).removeUserNotification(notificationId);
                    });
                }

            }
        }

        private string LoadNotifData(string userId)
        {
            int total = 0;
            //var query = (from t in context.Notifications
            //             where t.SentTo == userId
            //             select t)
            //            .ToList();
            //  total = query.Count;
            total = 5;

            return total.ToString();
        }

        public override Task OnConnected()
        {
            var serverVars = Context.Request.GetHttpContext().Request.ServerVariables;
            var IpAddress = serverVars["REMOTE_ADDR"];

            string userName = Context.User.Identity.Name;
            string connectionId = Context.ConnectionId;

            var user = Users.GetOrAdd(userName, _ => new UserHubModels
            {
                UserName = userName,
                ConnectionIds = new HashSet<string>()
            });

            lock (user.ConnectionIds)
            {
                user.ConnectionIds.Add(connectionId);
                if (user.ConnectionIds.Count == 1)
                {
                    Clients.Others.userConnected(userName);
                }
            }

            ActiveConnections.ActiveUsers.Add(userName);
            ActiveConnections.ActiveSessions.Add(Context.ConnectionId);
            ActiveConnections.ActiveSessionsList.Add(new ActiveSessions
            {
                ConnectionId = Context.ConnectionId
                , IpAddress = IpAddress
                , ConnectedOn = DateTime.Now
            });

            AuditModel objaudit = new AuditModel();
            var currentBrowserUrl = Context.QueryString["currentBrowserUrl"];
            if (userName != null && userName != "")
            {
                objaudit.UserId = Convert.ToInt64(userName) ;

            }

            objaudit.SessionID = Context.ConnectionId;

            objaudit.IPAddress = IpAddress;

            objaudit.PageAccessed = currentBrowserUrl;

            objaudit.ConnectedOn = DateTime.Now;

            this._IAuditOrchestrator.SaveMVCAuditTrail(objaudit);

            return base.OnConnected();
        }

        [UserAuditFilter]
        public override Task OnDisconnected(bool stopCalled)
        {



            string userName = Context.User.Identity.Name;
            string connectionId = Context.ConnectionId;

            UserHubModels user;
            Users.TryGetValue(userName, out user);

            if (user != null)
            {
                lock (user.ConnectionIds)
                {
                    user.ConnectionIds.RemoveWhere(cid => cid.Equals(connectionId));
                    if (!user.ConnectionIds.Any())
                    {
                        UserHubModels removedUser;
                        Users.TryRemove(userName, out removedUser);
                        Clients.Others.userDisconnected(userName);
                    }
                }
            }

            ActiveConnections.ActiveUsers.Remove(userName);
            ActiveConnections.ActiveSessions.Remove(Context.ConnectionId);


            AuditModel objaudit = new AuditModel();
            var currentBrowserUrl = Context.QueryString["currentBrowserUrl"];
            if (userName != null && userName != "")
            {
                objaudit.UserId = Convert.ToInt64(userName);

            }

            objaudit.SessionID = Context.ConnectionId;

            ActiveSessions activeSessions = new ActiveSessions();
            activeSessions = ActiveConnections.ActiveSessionsList.Where(x => x.ConnectionId == Context.ConnectionId).FirstOrDefault();

            if (activeSessions != null)
            {
                objaudit.ConnectedOn = activeSessions.ConnectedOn;
                objaudit.IPAddress = activeSessions.IpAddress;
            }

            objaudit.PageAccessed = currentBrowserUrl;

            objaudit.DisconnectedOn = DateTime.Now;

            this._IAuditOrchestrator.SaveMVCAuditTrail(objaudit);


            return base.OnDisconnected(stopCalled);
        }

    }


    public class DashBoardTask
    {

        public void Execute()
        {
            var context1 = GlobalHost.ConnectionManager.GetHubContext<DashBoardHub>();

            context1.Clients.All.Test("100");
        }
    }


    public class UserHubModels
    {
        public string UserName { get; set; }
        public HashSet<string> ConnectionIds { get; set; }
    }

    public class NotifModels
    {
        public Int64 NotificationId { get; set; }
        public string UserID { get; set; }
        public string Message { get; set; }

        public string Title { get; set; }


    }

    public partial class Notification
    {
        public int Id { get; set; }
        public Nullable<int> Type { get; set; }
        public string Details { get; set; }
        public string Title { get; set; }
        public string DetailsURL { get; set; }
        public string SentTo { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public Nullable<bool> IsRead { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<bool> IsReminder { get; set; }
        public string Code { get; set; }
        public string NotificationType { get; set; }
    }
}