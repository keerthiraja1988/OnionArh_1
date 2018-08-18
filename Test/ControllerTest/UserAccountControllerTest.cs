using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web;
using Moq;
using System.Web.Mvc;
using System.Web.Routing;
using Web.Areas.UserAccount.Controllers;
using OrchestratorInterface;
using DomainModel;
using Web.Models;
using CrossCutting.Caching;
using AutoMapperFramework;
using AutoMapper;
using System.Reflection;

namespace ControllerTest
{
    [TestClass]
    public class UserAccountControllerTest
    {

        [AssemblyInitialize()]
        public static void AssemblyInit(TestContext context)
        {
            //GlobalCachingProvider.Instance.AddItems();


        }

        [TestMethod]
        public void TestMethod1()
        {
           
            

            var mock = new Mock<IUserAccountOrchestrator>();
          
            UserAccountController _UserAccountController = new UserAccountController(mock.Object);
            var result = _UserAccountController.Login("");


        }
    }
}
