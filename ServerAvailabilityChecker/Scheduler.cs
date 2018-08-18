using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServerAvailabilityChecker
{
    public class Scheduler
    {
        public void Start()
        {
            Debug.WriteLine("TopShelf Service Started");

            // construct a scheduler factory
            ISchedulerFactory schedFact = new StdSchedulerFactory();
            // get a scheduler
            IScheduler sched = schedFact.GetScheduler();
            sched.Start();

            IJobDetail job = JobBuilder.Create<ServerAvailabilityCheckerJob>()
                .WithIdentity("myJob", "group1")
                .Build();

            ITrigger trigger = TriggerBuilder.Create()
                  .WithIdentity("trigger1", "group1")
                   .WithPriority(1)
                .StartNow()
                .WithDailyTimeIntervalSchedule
                (s =>
                    s.WithIntervalInSeconds(40).OnEveryDay()
                )
                .Build();

            sched.ScheduleJob(job, trigger);
        }

        public void Stop()
        {
            // write code here that runs when the Windows Service stops. 
        }
    }
}
