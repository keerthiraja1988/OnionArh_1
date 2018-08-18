using Autofac;
using CrossCutting.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Web.Hub
{
    [Log4Net]
    public class DashBoardHub : Microsoft.AspNet.SignalR.Hub
    {

        private readonly ILifetimeScope _hubLifetimeScope;

        public DashBoardHub(ILifetimeScope lifetimeScope)
        {
            // Create a lifetime scope for the hub.
            _hubLifetimeScope = lifetimeScope.BeginLifetimeScope();

            // Resolve dependencies from the hub lifetime scope.
         
        }


        public override Task OnConnected()
        {


            string userName = Context.User.Identity.Name;
            string connectionId = Context.ConnectionId;

            //Clients.All.Testt("3000", "2000");


            return base.OnConnected();


        }

        public void testt()
        {

            Clients.All.Test("3000", "2000");

        }

        public void Send(string message)
        {
            // You can use your dependency field here!
          

            Clients.All.addMessage(message);
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
    }
}