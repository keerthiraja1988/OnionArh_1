using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Topshelf;

namespace ServerAvailabilityChecker
{
    class Program
    {
        static void Main(string[] args)
        {
            Debug.WriteLine("TopShelf Service Started");

            // construct a scheduler factory
            ISchedulerFactory schedFact = new StdSchedulerFactory();
            // get a scheduler
            IScheduler sched = schedFact.GetScheduler();
            sched.Start();

            IJobDetail job = JobBuilder.Create<ServerAvailabilityCheckerJob>()
                .WithIdentity("myJob1", "group12")
                .Build();

            ITrigger trigger = TriggerBuilder.Create()
                .WithDailyTimeIntervalSchedule
                (s =>
                    s.WithIntervalInMinutes(2).OnEveryDay()

                )
                .Build();
            sched.ScheduleJob(job, trigger);

            ConfigureService.Configure();
        }

        internal static class ConfigureService
        {
            internal static void Configure()
            {
                HostFactory.Run(configure =>
                {
                    configure.Service<Scheduler>(service =>
                    {

                        service.ConstructUsing(s => new Scheduler());
                        service.WhenStarted(s => s.Start());
                        service.WhenStopped(s => s.Stop());

                    });

                    //Setup Account that window service use to run. 
                    configure.RunAsLocalSystem();
                    configure.SetServiceName("ServerStatusChecker");
                    configure.SetDisplayName("ServerStatusChecker");
                    configure.SetDescription("Check Server Status Service");
                });
            }
        }
    }


}
