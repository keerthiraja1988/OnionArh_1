using Autofac;
using Autofac.Integration.Mvc;
using AutoMapper;
using AutoMapperFramework;
using CrossCutting.Caching;
using Newtonsoft.Json;
using OrchestratorInterface;
using Quartz;
using Quartz.Impl;
using Quartz.Spi;
using System;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using Web.Authentication;
using Web.Models;
using Web.Scheduler;

namespace Web
{
    public partial class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {

            WebDependancyRegister();
            SchedulerDependancyRegister();
            RegisterAutoMapperMaps();

            GlobalCachingProvider.Instance.AddItems();
            GlobalCachingProvider.Instance.GetAllUsersAccountsToCache();
            GlobalCachingProvider.Instance.AddUserRolesCache();
            //GlobalCachingProvider.Instance.RefreshDashBoardWidgetDetails();


            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_PostAuthenticateRequest(Object sender, EventArgs e)
        {
            HttpCookie authCookie = Request.Cookies["Cookie1"];
            if (authCookie != null)
            {
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);

                var serializeModel = JsonConvert.DeserializeObject<UserAccountViewModel>(authTicket.UserData);

                Web.Authentication.CustomPrincipal principal = new Web.Authentication.CustomPrincipal(authTicket.Name);

                principal.UserId = serializeModel.UserId;
                principal.UserName = serializeModel.UserName;
                principal.FirstName = serializeModel.FirstName;
                principal.LastName = serializeModel.LastName;
                principal.Roles = serializeModel.Roles.Select(x => x.Role).ToArray<string>();
                principal.SessionExpiration = authTicket.Expiration;

                HttpContext.Current.User = principal;
            }

        }

        protected void Application_Error(object sender_, EventArgs e_)
        {
            Exception exception = Server.GetLastError();
            if (exception is CryptographicException)
            {
                HttpCookie authCookie = Request.Cookies["Cookie1"];
                if (authCookie != null)
                {

                }

                FormsAuthentication.SignOut();
            }
            else
            {
                Server.ClearError();
                Response.Clear();
                Response.Redirect(String.Format("~/Base/ErrorPage/?message={0}", exception.Message));
            }

        }

        protected void Application_PreSendRequestHeaders()
        {
            Response.Headers.Remove("Server");           //Remove Server Header  
            Response.Headers.Remove("X-AspNet-Version"); //Remove X-AspNet-Version Header
            Response.Headers.Remove("X-AspNetMvc-Version"); //Remove X-AspNet-Version Header
        }

        protected void Application_BeginRequest()
        {
            var cookie = this.Request.Cookies.Get("Cookie1");
            if (cookie != null)
            {
                FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(cookie.Value);
                log4net.GlobalContext.Properties["user"] = authTicket.Name;
            }
            else
            {
                log4net.GlobalContext.Properties["user"] = "";
            }

            log4net.GlobalContext.Properties["requestid"] = JSNLog.JavascriptLogging.RequestId();
            log4net.GlobalContext.Properties["userhostaddress"] = Request.UserHostName;
            log4net.GlobalContext.Properties["requesturl"] = Request.Url;
            if (Regex.IsMatch(Request.UserAgent, @"Edge\/\d+"))
            {
                log4net.GlobalContext.Properties["browseragent"] = "Edge";
            }
            else
            {
                log4net.GlobalContext.Properties["browseragent"] = Request.Browser.Browser;
            }

            log4net.Config.XmlConfigurator.Configure();
        }
    }

    public partial class MvcApplication
    {
        public static void RegisterAutoMapperMaps()
        {
            var mapLoader = new MapLoader(Mapper.Configuration);

            mapLoader.LoadMappings(Assembly
                .GetExecutingAssembly()
                .GetExportedTypes());
        }

        public void SchedulerDependancyRegister()
        {
            var builder = new ContainerBuilder();

            builder.RegisterAssemblyModules(Assembly.GetExecutingAssembly());

            builder.RegisterModule(new DependencyInjecionResolver.OrchestratorDIContainer());
            builder.RegisterModule(new DependencyInjecionResolver.ServiceDIContainer());

            // Schedule
            builder.Register(x => new StdSchedulerFactory().GetScheduler()).As<IScheduler>();

            // Schedule jobs
            builder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly()).Where(x => typeof(IJob).IsAssignableFrom(x));

            var container = builder.Build();

            //Schedule
            IScheduler sched = container.Resolve<IScheduler>();
            sched.JobFactory = new AutofacJobFactory(container);
            sched.Start();

            JobDetailImpl jobDetail = new JobDetailImpl("1Job", null, typeof(DashBoardJob));

            ITrigger trigger = TriggerBuilder.Create()
                .WithIdentity("1JobTrigger")
                .WithSimpleSchedule(x => x
                    .RepeatForever()
                    .WithIntervalInSeconds(10)
                )
                .StartNow()
                .Build();


            sched.ScheduleJob(jobDetail, trigger);
        }

        public void WebDependancyRegister()
        {
            var builder = new ContainerBuilder();


            builder.RegisterAssemblyModules(Assembly.GetExecutingAssembly());

            // Register dependencies in controllers
            builder.RegisterControllers(typeof(MvcApplication).Assembly);

            // Register dependencies in filter attributes
            builder.RegisterFilterProvider();

            // Register dependencies in custom views
            builder.RegisterSource(new ViewRegistrationSource());

            builder.RegisterModule(new DependencyInjecionResolver.OrchestratorDIContainer());
            builder.RegisterModule(new DependencyInjecionResolver.ServiceDIContainer());

            var container = builder.Build();
            container.ActivateGlimpse();
            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }

        public class AutofacJobFactory : IJobFactory
        {
            private readonly IContainer _container;
            public AutofacJobFactory(IContainer container)
            {
                _container = container;
            }

            public IJob NewJob(TriggerFiredBundle bundle, IScheduler scheduler)
            {
                return (IJob)_container.Resolve(bundle.JobDetail.JobType);
            }

            public void ReturnJob(IJob job)
            {
            }
        }
    }
}
