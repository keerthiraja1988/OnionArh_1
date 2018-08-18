using CrossCutting.Logging;
using OrchestratorInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Filters;

namespace Web.Controllers
{
    [Log4Net]
   
    public class HomeController : Controller
    {
        private IFileEncryptionOrchestrator _IFileEncryptionOrchestrator;
        public HomeController(IFileEncryptionOrchestrator IFileEncryptionOrchestrator)
        {

            this._IFileEncryptionOrchestrator = IFileEncryptionOrchestrator;
        }
      
        public ActionResult Index()
        {
<<<<<<< HEAD
          //  throw new Exception(); hfhwdhfwoehfo wefweeeeeeeeeeeeeeeeeeeeeeee jjiiiii
=======
          //  throw new Exception(); hfhwdhfwoehfo wefweeeeeeeeeeeeeeeeeeeeeeee dsdgsdgdf
>>>>>>> 7cf25b898c45b89c36e06457096e53025ecdb11f

            var v = this._IFileEncryptionOrchestrator.GetValueFromOnion();
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
