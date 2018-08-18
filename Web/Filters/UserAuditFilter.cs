using DomainModel.Admin;
using OrchestratorInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Filters
{
    public class UserAuditFilter : ActionFilterAttribute
    {

        public IAuditOrchestrator _IAuditOrchestrator { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string actionName = filterContext.ActionDescriptor.ActionName;

            string controllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;

            var request = filterContext.HttpContext.Request;
            AuditModel objaudit = new AuditModel();
            var user = HttpContext.Current.User as Web.Authentication.CustomPrincipal;

            if (user == null)
            {
                objaudit.UserId = 0;

            }
            else
            {
                objaudit.UserId = user.UserId;
            }

            objaudit.UsersAuditID = 0;

            objaudit.SessionID = HttpContext.Current.Session.SessionID;

            objaudit.IPAddress = request.ServerVariables["HTTP_X_FORWARDED_FOR"] ?? request.UserHostAddress;

            objaudit.PageAccessed = request.RawUrl;

            objaudit.LoggedInAt = DateTime.Now;

            if (actionName == "LogOut")

            {

                objaudit.LoggedOutAt = DateTime.Now;

            }

            objaudit.LoginStatus = "A";

            objaudit.ControllerName = controllerName;

            objaudit.ActionName = actionName;

            _IAuditOrchestrator.SaveMVCAuditTrail(objaudit);

            base.OnActionExecuting(filterContext);

        }

    }
}