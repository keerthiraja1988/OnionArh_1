using Topshelf;
using System.IO;
using Quartz;
using Quartz.Impl;
using Microsoft.AspNet.SignalR;
using System;
using Microsoft.Owin.Hosting;
using Autofac;
using System.Reflection;
using Autofac.Extras.Quartz;
using OrchestratorInterface;
using Quartz.Spi;

namespace WindowService
{

   

    class Program
    {
        static void Main(string[] args)
        {



            // This will *ONLY* bind to localhost, if you want to bind to all addresses
            // use http://*:8080 to bind to all addresses. 
            // See http://msdn.microsoft.com/en-us/library/system.net.httplistener.aspx 
            // for more information.
          // string url = "http://localhost:8085";
            // string url = "http://192.168.151.87:18274/";

            var option = new StartOptions();
            //option.Urls.Add("http://localhost:18275");
            // You can either get dynamic ip OR set in app.config
            // But for demo purpose i have set it static
            option.Urls.Add("http://192.168.43.33:18276");
           // SignalR = WebApp.Start(option);

            WebApp.Start(option);




            IHubContext hubContext = GlobalHost.ConnectionManager.GetHubContext<MyHub>();
            hubContext.Clients.All.addMessage("server", "ServerMessage");
            Console.WriteLine("Server Sending addMessage\n");
            ConfigureService.Configure();
            //using (WebApp.Start(url))
            //{

            //    Console.WriteLine("Server running on {0}", url);
            //    while (true)
            //    {
            //        string key = Console.ReadLine();
            //        if (key.ToUpper() == "W")
            //        {
            //            IHubContext hubContext = GlobalHost.ConnectionManager.GetHubContext<MyHub>();
            //            hubContext.Clients.All.addMessage("server", "ServerMessage");
            //            Console.WriteLine("Server Sending addMessage\n");
            //        }
            //        if (key.ToUpper() == "E")
            //        {
            //            IHubContext hubContext = GlobalHost.ConnectionManager.GetHubContext<MyHub>();
            //            hubContext.Clients.All.heartbeat();
            //            Console.WriteLine("Server Sending heartbeat\n");
            //        }
            //        if (key.ToUpper() == "R")
            //        {
            //            IHubContext hubContext = GlobalHost.ConnectionManager.GetHubContext<MyHub>();

            //            var vv = new HelloModel { Age = 37, Molly = "pushed direct from Server " };

            //            hubContext.Clients.All.sendHelloObject(vv);
            //            Console.WriteLine("Server Sending sendHelloObject\n");
            //        }
            //        if (key.ToUpper() == "C")
            //        {
            //            break;
            //        }


            //    }

            //    Console.ReadLine();
            //}

        }

        internal static class ConfigureService
        {
            internal static void Configure()
            {
                HostFactory.Run(configure =>
                {
                    configure.Service<MyService>(service =>
                    {
                        service.ConstructUsing(s => new MyService());
                        service.WhenStarted(s => s.Start());
                        service.WhenStopped(s => s.Stop());
                    });
                    //Setup Account that window service use to run.  
                    configure.RunAsLocalSystem();
                    configure.SetServiceName("MyWindowServiceWithTopshelf4");
                    configure.SetDisplayName("MyWindowServiceWithTopshelf4");
                    configure.SetDescription("My .Net windows service with Topshelf");
                });
            }
        }
    }

    public class MyService
    {
        private FileSystemWatcher _watcher;
        public static string aa;
        public bool Start()
        {

            IHubContext hubContext = GlobalHost.ConnectionManager.GetHubContext<MyHub>();
            hubContext.Clients.All.addMessage("Server", "Scheduler BroadCasting");
            Console.WriteLine("Server Sending addMessage\n");

            var builder = new ContainerBuilder();
            builder.RegisterAssemblyModules(Assembly.GetExecutingAssembly());
            // Register our Data dependencies
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

            JobDetailImpl jobDetail = new JobDetailImpl("1Job", null, typeof(IDGJob));

            ITrigger trigger = TriggerBuilder.Create()
                .WithIdentity("1JobTrigger")
                .WithSimpleSchedule(x => x
                    .RepeatForever()
                    .WithIntervalInSeconds(10)
                )
                .StartNow()
                .Build();


            sched.ScheduleJob(jobDetail, trigger);



            //sched.ScheduleJob(job1, trigger1);

            _watcher = new FileSystemWatcher(@"f:\temp\", "*.*");

            _watcher.Created += FileCreated;

            _watcher.IncludeSubdirectories = false;

            _watcher.EnableRaisingEvents = true;

            return true;
        }

        private void FileCreated(object sender, FileSystemEventArgs e)
        {
            MyService.aa = "FIle Created  " + e.FullPath + DateTime.Now.ToString();

            // IHubContext hubContext = GlobalHost.ConnectionManager.GetHubContext<MyHub>();
            //  hubContext.Clients.All.addMessage("Server", "FIle Created  " + e.FullPath + DateTime.Now.ToString());
            //  Console.WriteLine("Server Sending FIle Process\n");
        }
        public bool Stop()
        {
            _watcher.Dispose();

            return true;
        }
    }


    public class IDGJob : IJob
    {

        private readonly ILifetimeScope _hubLifetimeScope;
        private IFileEncryptionOrchestrator _IFileEncryptionOrchestrator;

        public IDGJob(ILifetimeScope lifetimeScope)
        {
            // Create a lifetime scope for the hub.
            _hubLifetimeScope = lifetimeScope.BeginLifetimeScope("AutofacWebRequest");

            // Resolve dependencies from the hub lifetime scope.
            this._IFileEncryptionOrchestrator = _hubLifetimeScope.Resolve<IFileEncryptionOrchestrator>();
        }

        public void Execute(IJobExecutionContext context)

        {
           // var v = this._IFileEncryptionOrchestrator.GetValueFromOnion();
            IHubContext hubContext = GlobalHost.ConnectionManager.GetHubContext<MyHub>();
            //   hubContext.Clients.All.addMessage("Server", "Scheduler BroadCasting "+ DateTime.Now.ToString());

            hubContext.Clients.All.addMessage("Server", "ggjhgfjhgjhgf");

            Console.WriteLine("Server Sending addMessage\n");

            //Sample code that denotes the job to be performed

        }


    }
    public class IDGJob1 : IJob
    {

        public void Execute(IJobExecutionContext context)

        {
            IHubContext hubContext = GlobalHost.ConnectionManager.GetHubContext<MyHub>();
            hubContext.Clients.All.addMessage("Server", "Scheduler BroadCasting " + DateTime.Now.ToString());
            Console.WriteLine("Server Sending addMessage\n");

            //Sample code that denotes the job to be performed

        }

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
