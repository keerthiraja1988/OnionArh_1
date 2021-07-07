using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;

namespace ServerStatusChecker
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

            IJobDetail job = JobBuilder.Create<ServerCheckerServiceJob1>()               
                .Build();            

            ITrigger trigger = TriggerBuilder.Create()
                .StartNow()
               
                .WithDailyTimeIntervalSchedule
                (s =>
                    s.WithIntervalInMinutes(2).OnEveryDay()

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
