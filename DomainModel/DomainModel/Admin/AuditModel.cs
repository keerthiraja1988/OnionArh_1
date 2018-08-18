using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel.Admin
{
    public class AuditModel

    {

        public Int64 UsersAuditID { get; set; }

        public Int64 UserId { get; set; }

        public string SessionID { get; set; }

        public string IPAddress { get; set; }

        public string PageAccessed { get; set; }

        public Nullable<System.DateTime> LoggedInAt { get; set; }

        public Nullable<System.DateTime> LoggedOutAt { get; set; }

        public Nullable<System.DateTime> ConnectedOn { get; set; }

        public Nullable<System.DateTime> DisconnectedOn { get; set; }

        public string LoginStatus { get; set; }

        public string ControllerName { get; set; }

        public string ActionName { get; set; }

    }
}
