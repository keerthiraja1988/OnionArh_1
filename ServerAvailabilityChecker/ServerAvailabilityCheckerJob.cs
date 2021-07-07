using DomainModel.ServerStatus;
using Insight.Database;
using Quartz;
using ServerAvailabilityChecker.Repository;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;

namespace ServerAvailabilityChecker
{
    public class ServerAvailabilityCheckerJob : IJob
    {
        public ServerAvailabilityCheckerJob()
        {

        }

        public void Execute(IJobExecutionContext context)
        {

            Debug.WriteLine("Service Checker Started");
            try
            {
                List<ServerDetailModel> serverList = new List<ServerDetailModel>();
                List<ServerDetailModel> serverJobStatus = new List<ServerDetailModel>();
                DbConnection c = new SqlConnection("Data Source=.;Initial Catalog=FileEncryption;Integrated Security=True");
                ISharedRepository i = c.As<ISharedRepository>();

                serverList = i.GetServerDetails();

                Int64 jobId = i.StartServerStatusJob();

                Console.WriteLine($"Server Status Checking started for {serverList.Count} Servers");

                Parallel.ForEach(serverList, address =>
                {
                    try
                    {
                        Ping myPing = new Ping();
                        PingReply reply = myPing.Send(address.ServerIPAddress, 5000);
                        if (reply != null)
                        {
                            Console.WriteLine("Status :  " + reply.Status + " \n Time : " + reply.RoundtripTime.ToString() + " \n Address : " + reply.Address);
                        }
                        address.ServerStatus = reply.Status.ToString();
                        address.JobId = jobId;
                        address.CreatedOn = DateTime.Now;
                        address.UpdatedOn = DateTime.Now;

                        lock (serverJobStatus)
                        {
                            serverJobStatus.Add(address);
                        }

                        if (reply != null && reply.Status == IPStatus.Success)
                        {

                        }
                    }

                    catch (Exception)
                    {

                    }
                }

               );

                Console.WriteLine($"Server Status Checking Completed");
                i.SaveStartServerStatusJob(serverJobStatus);
            }

            catch (Exception e)
            {
                Console.WriteLine("\nUriFormatException is thrown.Message is {0}", e.Message);

                Console.WriteLine("\nThe format of the myProxy address you entered is invalid");

                Console.WriteLine("\nPress any key to continue.........");

                Console.Read();
            }
        }
    }
}
