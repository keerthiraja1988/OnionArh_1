using DomainModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using Web.Models;

namespace Web.Authentication
{
    public class CustomMembershipUser : MembershipUser
    {
        #region User Properties

        public Int64 UserId { get; set; }
        public string Username { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public ICollection<UserRoleViewModel> Roles { get; set; }

        #endregion

        public CustomMembershipUser(UserAccountViewModel user) : base("CustomMembership", user.UserName, user.UserId, user.Email, string.Empty, string.Empty, true, false, DateTime.Now, DateTime.Now, DateTime.Now, DateTime.Now, DateTime.Now)
        {
            UserId = user.UserId;
            Username = user.UserName;
            FirstName = user.FirstName;
            LastName = user.LastName;
           // Roles = user.Roles;
        }
    }
}