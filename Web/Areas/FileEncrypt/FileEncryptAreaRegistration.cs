using System.Web.Mvc;

namespace Web.Areas.FileEncrypt
{
    public class FileEncryptAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "FileEncrypt";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "FileEncrypt_default",
                "FileEncrypt/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}