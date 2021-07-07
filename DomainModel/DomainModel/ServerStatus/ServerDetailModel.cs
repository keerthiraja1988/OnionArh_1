using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel.ServerStatus
{
    public class ServerDetailModel
    {
        public Int64 ServerId { get; set; }
        public Int64 Id { get; set; }
        public Int64 JobId { get; set; }

        public string ServerName { get; set; }
        public string ServerIPAddress { get; set; }
        public string Comments { get; set; }

        public string ServerStatus { get; set; }
        public int ServerStatusId { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime UpdatedOn { get; set; }


    }
}
