﻿using System;
using System.Threading.Tasks;
using Microsoft.AspNet.SignalR;

namespace WindowService
{
    public class MyHub : Hub
    {
        public void AddMessage(string name, string message)
        {
            Console.WriteLine("Hub AddMessage {0} {1}\n", name, message);
            Clients.All.addMessage(name, message);
        }

        public void Heartbeat()
        {
            Console.WriteLine("Hub Heartbeat\n");
            Clients.All.heartbeat();
        }

        public void SendHelloObject(HelloModel hello)
        {
            Console.WriteLine("Hub hello {0} {1}\n", hello.Molly, hello.Age);
            Clients.All.sendHelloObject(hello);
        }

        public override Task OnConnected()
        {
            Console.WriteLine("Hub OnConnected {0}\n", Context.ConnectionId);
            return (base.OnConnected());
        }

        //public override Task OnDisconnected()
        //{
        //    Console.WriteLine("Hub OnDisconnected {0}\n", Context.ConnectionId);
        //    return (base.OnDisconnected());
        //}

        //public override Task OnReconnected()
        //{
        //    Console.WriteLine("Hub OnReconnected {0}\n", Context.ConnectionId);
        //    return (base.OnDisconnected());
        //}
    }
}