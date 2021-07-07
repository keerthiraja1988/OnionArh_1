using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Topshelf;

namespace ServerStatusChecker
{
    class Program

    {

        static void Main(string[] args)

        {

            ConfigureService.Configure();

        }

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
