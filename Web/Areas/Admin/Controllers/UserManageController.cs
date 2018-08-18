using AutoMapper;
using CrossCutting.Caching;
using CrossCutting.Logging;
using DomainModel;
using OrchestratorInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Areas.Admin.Models;
using Web.Controllers;
using Web.Filters;
using Web.Models;

namespace Web.Areas.Admin.Controllers
{
    [Log4Net]


    public class UserManageController : BaseController
    {


        private IUserManageOrchestrator _IUserManageOrchestrator;

        private IUserAccountOrchestrator _UserAccountOrchestrator;

        public UserManageController(IUserManageOrchestrator IUserManageOrchestrator, IUserAccountOrchestrator IUserAccountOrchestrator)
        {
            this._IUserManageOrchestrator = IUserManageOrchestrator;
            this._UserAccountOrchestrator = IUserAccountOrchestrator;

        }

        // GET: Admin/UserManage
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetAllUserAccountDetails()
        {
            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            var searchValue = Request.Form.GetValues("search[value]").FirstOrDefault();

            List<UserAccountModel> userAccounts = new List<UserAccountModel>();

            userAccounts = this._IUserManageOrchestrator.GetAllUserAccountDetails();

            List<UserAccountViewModel> userAccountsViewModel = new List<UserAccountViewModel>();

            Mapper.Map(userAccounts, userAccountsViewModel);

            var jsonData = new
            {
                rows = userAccountsViewModel
            };

            var response = new { data = userAccountsViewModel, recordsFiltered = 10000, recordsTotal = 10000 };
            return Json(response, JsonRequestBehavior.AllowGet);

            // return Json(jsonData, JsonRequestBehavior.AllowGet);
            //return applicationCurrentCacheViewModel.ToArray();
            // return Json(new { draw = draw, recordsFiltered = applicationCurrentCacheViewModel.Count, recordsTotal = applicationCurrentCacheViewModel.Count, data = applicationCurrentCacheViewModel });
        }

        [HttpPost]
        public string GetAllUserAccountDetailsForEdit(Int64 userId)
        {
            List<UserAccountModel> userAccounts = new List<UserAccountModel>();

            List<UserAccountViewModel> userAccountsViewModel = new List<UserAccountViewModel>();
            List<UserRoleViewModel> userRolesViewModel = new List<UserRoleViewModel>();

            UserAccountViewModel userAccountViewModel = new UserAccountViewModel();

            userAccounts = this._IUserManageOrchestrator.GetAllUserAccountDetails();

            var rolesCache = GlobalCachingProvider.Instance.GetAllUserRoles();
            List<DisplayRolesViewModel> roles = new List<DisplayRolesViewModel>();


            DatabaseModel databaseInfoModel = new DatabaseModel();
            databaseInfoModel.UserId = this.GetUserId().Value;

            List<UserRoleModel> userRoles = new List<UserRoleModel>();

            userRoles = this._UserAccountOrchestrator.GetUserRoleDetailsForUserId(userId, databaseInfoModel);



            rolesCache.ForEach(x =>
            {
                UserRoleViewModel displayRoles = new UserRoleViewModel();
                displayRoles.RoleName = x.RoleName;
                displayRoles.RoleId = Convert.ToInt32( x.RoleId);

                displayRoles.RoleActive = false;
                if (userRoles.Select(r => r.RoleName).Any(a => a == x.RoleName))
                {
                    displayRoles.RoleActive = true;

                }

                userRolesViewModel.Add(displayRoles);
            }
             );

            //Mapper.Map(userRoles, userRolesViewModel);



            Mapper.Map(userAccounts, userAccountsViewModel);

            userAccountViewModel = userAccountsViewModel.Where(x => x.UserId == userId).FirstOrDefault();

            userAccountViewModel.Roles = userRolesViewModel.OrderByDescending(x => x.Role).ToList();



            //string ret = RenderPartialToString("~/Areas/Management/Views/CacheManage/_GetAppCacheValueForEdit", applicationCacheViewModel);
            string ret = RenderPartialToString("_UserAccountEditModal", userAccountViewModel, ControllerContext);


            return ret;
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public string SaveUserDetails(UserAccountViewModel userAccountViewModel)
        {
            UserAccountModel userAccountModel = new UserAccountModel();
            DatabaseModel databaseModel = new DatabaseModel();

            Mapper.Map(userAccountViewModel, userAccountModel);

            userAccountModel.IsActive = true;
            userAccountModel.RequestUserId = userAccountViewModel.UserId;

//            userAccountModel.UserId = this.GetUserId().Value;
            databaseModel.UserId = this.GetUserId().Value;

            databaseModel = this._IUserManageOrchestrator.UpdateUserDetailsForUserId(userAccountModel, databaseModel);


            return databaseModel.ReturnError.ToString();
        }
    }
}