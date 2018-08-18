using Autofac;
using Autofac.Extras.Quartz;
using Autofac.Integration.SignalR;
using Hangfire;
using Microsoft.AspNet.SignalR;
using Microsoft.Owin;
using Microsoft.Owin.Cors;
using Owin;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Reflection;
using System.Web;
using Web.Hub;
using Web.Scheduler;

[assembly: OwinStartup(typeof(Web.Startup))]
namespace Web
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            var builder = new ContainerBuilder();

            // STANDARD SIGNALR SETUP:

            // Get your HubConfiguration. In OWIN, you'll create one
            // rather than using GlobalHost.
            var config = new HubConfiguration();

            // Register your SignalR hubs.
            builder.RegisterHubs(Assembly.GetExecutingAssembly());

            // Register our Data dependencies
            builder.RegisterModule(new DependencyInjecionResolver.OrchestratorDIContainer());
            builder.RegisterModule(new DependencyInjecionResolver.ServiceDIContainer());

            // Set the dependency resolver to be Autofac.
            var container = builder.Build();
            config.Resolver = new AutofacDependencyResolver(container);

            // OWIN SIGNALR SETUP:

            // Register the Autofac middleware FIRST, then the standard SignalR middleware.
            app.UseAutofacMiddleware(container);
            // app.MapSignalR("/signalr", config);

            GlobalHost.DependencyResolver = new AutofacDependencyResolver(container);
            IHubContext hubContext = GlobalHost.ConnectionManager.GetHubContext<DashBoardHub>();

            // A custom HubConfiguration is now unnecessary, since MapSignalR will
            // use the resolver from GlobalHost by default.
          
            //app.MapSignalR();

            // Branch the pipeline here for requests that start with "/signalr"
            app.Map("/signalr", map =>
            {
                // Setup the CORS middleware to run before SignalR.
                // By default this will allow all origins. You can 
                // configure the set of origins and/or http verbs by
                // providing a cors options with a different policy.
                map.UseCors(CorsOptions.AllowAll);
                var hubConfiguration = new HubConfiguration
                {
                    // You can enable JSONP by uncommenting line below.
                    // JSONP requests are insecure but some older browsers (and some
                    // versions of IE) require JSONP to work cross domain
                    // EnableJSONP = true
                };
                // Run the SignalR pipeline. We're not using MapSignalR
                // since this branch already runs under the "/signalr"
                // path.

                hubConfiguration.EnableDetailedErrors = true;
                map.RunSignalR(hubConfiguration);
            });


            //GlobalConfiguration.Configuration
            //   .UseSqlServerStorage("SQLConnection");

            //BackgroundJob.Enqueue(() => Console.WriteLine("Fire-and-forget!"));

            //RecurringJob.AddOrUpdate(() => Console.Write("Recurring"), "*/1 * * * *");

            //BackgroundJob.Enqueue<DashBoardTask>(x => x.Execute());
            //RecurringJob.AddOrUpdate<DashBoardTask>(x => x.Execute(), "*/1 * * * *");

            //app.UseHangfireDashboard();
            //app.UseHangfireServer();
        }
    }
}