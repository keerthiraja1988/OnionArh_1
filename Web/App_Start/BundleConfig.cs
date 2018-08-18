using System.Web;
using System.Web.Optimization;

namespace Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"
                     , "~/Scripts/AopJS.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/jqueryCustom").Include(
                   
             "~/Scripts/Custom/Js*"
            , "~/Scripts/Custom/*.js"
            )

            );

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/JqueryUI/css").Include(
            "~/JqueryUI/jquery-ui.min.css"
          , "~/JqueryUI/jquery-ui.theme.min.css"
           , "~/JqueryUI/jquery-ui.structure.min.css"
         , "~/Content/jquery.jqGrid/ui.jqgrid.css"
           )
            );

            bundles.Add(new ScriptBundle("~/JqueryUI/Scripts").Include(
                      "~/JqueryUI/jquery-ui.min.js"
                      )
                      );

            BundleTable.EnableOptimizations = true;

        }
    }
}
