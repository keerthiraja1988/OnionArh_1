using AutoMapper;
using CrossCutting.Caching;
using CrossCutting.Logging;
using DomainModel;
using Newtonsoft.Json;
using OrchestratorInterface;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Web.Filters;
using Web.Models;

namespace Web.Areas.UserAccount.Controllers
{
    [Log4Net]
  

    public class UserAccountController : Controller
    {

        private IUserAccountOrchestrator _IUserAccountOrchestrator;
        public UserAccountController(IUserAccountOrchestrator IUserAccountOrchestrator)
        {
            this._IUserAccountOrchestrator = IUserAccountOrchestrator;
        }



        // GET: Admin/UserAccount
        public ActionResult Index()
        {
            var v = this._IUserAccountOrchestrator.GetAllUserAccountDetails();
           
            return View();
        }

        [HttpGet]
      //  [UserAuditFilter]
        public ActionResult Login(string ReturnUrl = "")
        {
            if (User.Identity.IsAuthenticated)
            {
                return LogOut();
            }
            ViewBag.ReturnUrl = ReturnUrl;
            return View();
        }

       // [UserAuditFilter]
        public ActionResult LogOut()
        {
            HttpCookie cookie = new HttpCookie("Cookie1", "");
            cookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie);

            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "UserAccount", "Admin");
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(UserAccountViewModel registrationView)
        {
            UserAccountModel userAccountModel = new UserAccountModel();

            bool statusRegistration = false;
            string messageRegistration = string.Empty;

            if (ModelState.IsValid)
            {
                Mapper.Map(registrationView, userAccountModel);

                DatabaseModel databaseInfoModel = new DatabaseModel();
                databaseInfoModel.UserName = "Register User" + userAccountModel.UserName;

                databaseInfoModel = this._IUserAccountOrchestrator.AddNewUser(userAccountModel, databaseInfoModel);
                GlobalCachingProvider.Instance.RemoveUserCacheItems();
                GlobalCachingProvider.Instance.GetAllUsersAccountsToCache();

                messageRegistration = "Your account has been created successfully. ^_^";
                statusRegistration = true;
            }
            else
            {
                messageRegistration = "Something Wrong!";
            }
            ViewBag.Message = messageRegistration;
            ViewBag.Status = statusRegistration;

            return View(registrationView);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        [UserAuditFilter]
        public ActionResult Login(LoginViewModel loginView, string ReturnUrl = "")
        {
            byte[] dataPassword = Convert.FromBase64String(loginView.Password);
            loginView.Password = Encoding.UTF8.GetString(dataPassword);

            if (ModelState.IsValid)
            {

                UserAccountModel userAccountModel = new UserAccountModel();
                Mapper.Map(loginView, userAccountModel);

                DatabaseModel databaseInfoModel = new DatabaseModel();
                databaseInfoModel.UserName = "Login User" + loginView.UserName;
                bool isValidUser;
                isValidUser = this._IUserAccountOrchestrator.ValidateUserLoginAndCredential(userAccountModel);

                // isValidUser = Membership.ValidateUser(loginView.UserName, loginView.Password);
                // if ()
                if (isValidUser)
                {
                    // var user = (CustomMembershipUser)Membership.GetUser(loginView.UserName, false);

                    var user = GlobalCachingProvider.Instance.GetUserAccount(userAccountModel.UserName);
                    if (user != null)
                    {
                        List<UserRoleViewModel> roles = new List<UserRoleViewModel>();

                        user.Roles.ForEach(x =>
                        {
                            UserRoleViewModel userRoleViewModel = new UserRoleViewModel();
                            userRoleViewModel.Role = x;
                            roles.Add(userRoleViewModel);
                        });

                        UserAccountViewModel userModel = new UserAccountViewModel()
                        {
                            UserId = user.UserId,
                            UserName = user.UserName,
                            FirstName = user.FirstName,
                            LastName = user.LastName,
                            Roles = roles
                        };

                        string userData = JsonConvert.SerializeObject(userModel);
                        FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket
                            (
                            1, loginView.UserName, DateTime.Now, DateTime.Now.AddMinutes(15), false, userData
                            );

                        string enTicket = FormsAuthentication.Encrypt(authTicket);
                        HttpCookie faCookie = new HttpCookie("Cookie1", enTicket);
                        faCookie.Expires = DateTime.Now.AddMinutes(15);

                        faCookie.HttpOnly = true;
                        //faCookie.Secure = true;

                        // faCookie.Secure = true;
                        Response.Cookies.Add(faCookie);
                    }

                    if (Url.IsLocalUrl(ReturnUrl))
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home", new { area = "" });
                        // return RedirectToAction("Index", "FileEncrypt", new { area = "FileEncrypt" });

                    }
                }
                else
                {
                    ModelState.AddModelError("", "Something Wrong : Username or Password invalid ^_^ ");
                    return View(loginView);
                }
            }
            else
            {
                return View(loginView);
            }
        }

        public ActionResult AccessDenied()
        {
            return View();
        }
    }
}