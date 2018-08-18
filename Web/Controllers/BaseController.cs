using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Web.Authentication;
using Web.Models;

namespace Web.Controllers
{
    public class BaseController : AsyncController
    {
        public BaseController()
        {

        }


        public string GetUserName()
        {
            var user = HttpContext.User as Web.Authentication.CustomPrincipal;


            if (user != null && user.UserName != null && user.UserName != string.Empty)
            {

                return user.UserName;
            }

            return "";
        }

        public Int64? GetUserId()
        {
            var user = HttpContext.User as Web.Authentication.CustomPrincipal;


            if (user != null)
            {

                return user.UserId;
            }
            return 0;
        }

        // GET: Base



        public static string RenderPartialToString(string viewName, object model, ControllerContext ControllerContext)
        {
            if (string.IsNullOrEmpty(viewName))
                viewName = ControllerContext.RouteData.GetRequiredString("action");
            ViewDataDictionary ViewData = new ViewDataDictionary();
            TempDataDictionary TempData = new TempDataDictionary();
            ViewData.Model = model;

            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                ViewContext viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);

                return sw.GetStringBuilder().ToString();
            }

        }

        [AllowAnonymous]
        public ActionResult ErrorPage(string message)
        {
            TempData["ErrorMessage"] = message;
            return RedirectToAction("Error");
        }

        [AllowAnonymous]
        public ActionResult Error()
        {
            ViewBag.ErrorMessage = Convert.ToString(TempData["ErrorMessage"]);

            return View("Error");
        }


        public int GetObjectSize(object TestObject)
        {
            BinaryFormatter bf = new BinaryFormatter();
            MemoryStream ms = new MemoryStream();
            byte[] Array;
            bf.Serialize(ms, TestObject);
            Array = ms.ToArray();
            return Array.Length;
        }

    }
}