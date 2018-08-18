using Quartz;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;

namespace ServerStatusChecker
{
    public class ServerCheckerServiceJob : IJob
    {
        public void Execute(IJobExecutionContext context)

        {

            Debug.WriteLine("Service Checker Started");
        }      

    }

    public class ServerCheckerServiceJob1 : IJob
    {
        public void Execute(IJobExecutionContext context)

        {

            Debug.WriteLine("Service Checker Started");
        }

    }
}
