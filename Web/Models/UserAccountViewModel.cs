using AutoMapperFramework;
using DomainModel;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;

namespace Web.Models
{
    public class UserAccountViewModel :  IMapFrom<UserAccountModel>, IMapTo<UserAccountModel>
    {
        public Int64 UserId { get; set; }
        [Required]
        [Display(Name = "User Name")]
        public string UserName { get; set; }


        [Display(Name = "Remember Me")]
        public bool RememberMe { get; set; }

        //[Required(ErrorMessage = "First Name required")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        // [Required(ErrorMessage = "Last Name required")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        // [Required(ErrorMessage = "Email required")]
        // [DataType(DataType.EmailAddress)]
        [Display(Name = "Email")]
        public string Email { get; set; }

        public List<UserRoleViewModel> Roles { get; set; }


       // [Required(ErrorMessage = "Password required")]
        //[DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

       // [Required(ErrorMessage = "Confirm Password required")]
        //[DataType(DataType.Password)]
        [Display(Name = "Confirm Password")]
        [Compare("Password", ErrorMessage = "Error : Confirm password does not match with password")]
        public string ConfirmPassword { get; set; }


        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }

        public string LoginStatus { get; set; }

        public bool IsActive { get; set; }
        public DateTime CreatedOn { get; set; }
        public Int64 CreatedBy { get; set; }

        public DateTime ModifiedOn { get; set; }
        public Int64 ModifiedBy { get; set; }
    }

    public class UserRoleViewModel : IMapFrom<UserRoleModel>, IMapTo<UserRoleModel>
    {
        public string Role { get; set; }

        public int UserId { get; set; }

        public string RoleName { get; set; }

        public int RoleId { get; set; }

        public bool RoleActive { get; set; }

    }

    public class LoginViewModel : IMapFrom<UserAccountModel>, IMapTo<UserAccountModel>
    {
        [Required]
        [Display(Name = "User Name")]
        public string UserName { get; set; }

        [Required]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember Me")]
        public bool RememberMe { get; set; }
    }

    public class CustomPrincipal : IPrincipal
    {
        #region Identity Properties

        public Int64 UserId { get; set; }
        public string UserName { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }

        public DateTime SessionExpiration { get; set; }

        public string[] Roles { get; set; }
        #endregion

        public IIdentity Identity
        {
            get; private set;
        }

        public bool IsInRole(string role)
        {
            if (Roles.Any(r => role.Contains(r)))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public CustomPrincipal(string username)
        {
            Identity = new GenericIdentity(username);
        }
    }
}