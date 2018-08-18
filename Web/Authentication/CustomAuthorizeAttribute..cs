using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Web.Authentication
{
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        protected virtual CustomPrincipal CurrentUser1
        {
            get { return HttpContext.Current.User as CustomPrincipal; }
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var CurrentUser = HttpContext.Current.User as CustomPrincipal;

            if (CurrentUser != null && CurrentUser.SessionExpiration < DateTime.Now)
            {
                HttpContext.Current.User = null;
                return false;
            }
            else if (CurrentUser != null && !CurrentUser.IsInRole(Roles))
            {
                return false;
            }
            else if (CurrentUser == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            var CurrentUser = HttpContext.Current.User as CustomPrincipal;

            RedirectToRouteResult routeData = null;

            if (CurrentUser == null)
            {
                routeData = new RedirectToRouteResult
                    (new System.Web.Routing.RouteValueDictionary
                    (new
                    {
                        area = "UserAccount",
                        controller = "UserAccount",
                        action = "LogOut",
                    }
                    ));
            }
            else
            {
                routeData = new RedirectToRouteResult
                (new System.Web.Routing.RouteValueDictionary
                 (new
                 {
                     area = "UserAccount",
                     controller = "UserAccount",
                     action = "AccessDenied"
                 }
                 ));
            }


            filterContext.Result = routeData;
        }

    }
}