using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Areas.Admin.Models
{
    public class DisplayRolesViewModel
    {
        public int RoleId { get; set; }
        public string RoleName { get; set; }

        public bool RoleActive { get; set; }
    }
}