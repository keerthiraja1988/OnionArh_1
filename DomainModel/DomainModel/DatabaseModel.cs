using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class DatabaseModel
    {
        public Int32 ReturnError { get; set; }
        public Guid ReturnGuid { get; set; }
        public string ReturnErrorMessage { get; set; }
        public Int64 UserId { get; set; }

        public string UserName { get; set; }

    }
}
