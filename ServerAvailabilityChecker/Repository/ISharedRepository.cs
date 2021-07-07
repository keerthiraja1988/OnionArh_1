using DomainModel.ServerStatus;
using Insight.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServerAvailabilityChecker.Repository
{
   public interface ISharedRepository
    {
        [Sql("SELECT * FROM [dbo].[ServerList]")]
        List<ServerDetailModel> GetServerDetails();

        [Sql("P_StartServerStatusJob")]
        Int64 StartServerStatusJob();

        [Sql("P_SaveStartServerStatusJob")]
        void SaveStartServerStatusJob(List<ServerDetailModel> t_ServerStatusUpdates);
    }
}
