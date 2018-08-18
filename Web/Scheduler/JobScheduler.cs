using Autofac;
using Autofac.Extras.Quartz;
using Quartz;
using Quartz.Impl;
using Quartz.Spi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Scheduler
{
    public class JobScheduler
    {
        private readonly IScheduler _scheduler;

        public JobScheduler(IScheduler scheduler)
        {
            _scheduler = scheduler;
        }

        public void Start()
        {
            

            IJobDetail job = JobBuilder.Create<DashBoardJob>().Build();
      
            _scheduler.Start();

            ITrigger trigger = TriggerBuilder.Create()
            .WithIdentity("trigger1", "group1")
            .WithSimpleSchedule(x => x
            .WithIntervalInSeconds(10)
            .RepeatForever()
            )
            .Build();


            _scheduler.ScheduleJob(job, trigger);
        }


    }
}