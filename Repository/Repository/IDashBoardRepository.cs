using DomainModel.Admin;
using DomainModel.DashBoard;
using Insight.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public interface IDashBoardRepository
    {
        #region DashBoard

        [Sql("P_DashBoardWidgetDetails")]
        DashBoardWidget GetDashBoardWidgetDetails();

        [Sql("P_DashBoardGetFileEncryptionChart")]
        List<DashBoardWidget> GetDashBoardGetFileEncryptionChart();

        #endregion
    }
}
