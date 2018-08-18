using DomainModel;
using DomainModel.Admin;
using DomainModel.DashBoard;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ServiceInterface
{
    public interface IDashBoardService
    {
        DashBoardWidget GetDashBoardWidgetDetails();

        List<DashBoardWidget> GetDashBoardGetFileEncryptionChart();

    }
}
