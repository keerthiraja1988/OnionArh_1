using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel.Admin
{
   public class ApplicationCache
    {
        public string Key { get; set; }
        public string Value { get; set; }
        public string Title { get; set; }

        public DateTime CreatedOn { get; set; }
        public Int64 CreatedBy { get; set; }

        public DateTime ModifiedOn { get; set; }
        public Int64 ModifiedBy { get; set; }

        public DateTime CachedOn { get; set; }

    }
}
