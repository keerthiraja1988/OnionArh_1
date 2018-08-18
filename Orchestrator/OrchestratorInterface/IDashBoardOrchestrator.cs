using DomainModel;
using DomainModel.Admin;
using DomainModel.DashBoard;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrchestratorInterface
{
    public interface IDashBoardOrchestrator
    {
        DashBoardWidgetDTO GetDashBoardWidgetDetails();

    }
}
