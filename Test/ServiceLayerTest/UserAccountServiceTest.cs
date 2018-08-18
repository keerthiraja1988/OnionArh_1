using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Autofac.Extras.Moq;
using Repository;
using DomainModel;
using Moq;
using ServiceConcrete;
using System.Data.SqlClient;
using System.Data.Common;
using Insight.Database;
using CrossCutting.Caching;
using System.Collections.Generic;
using FizzWare.NBuilder;
using Autofac;
using Autofac.Core;
using ServiceInterface;
using TechTalk.SpecFlow;

namespace ServiceLayerTest
{
    [TestClass]
    [Binding]
    public class UserAccountServiceTest
    {


        Mock<IUserAccountRepository> moqUserAccountRepositor = new Mock<IUserAccountRepository>();

        protected IContainer container = null;
        private IUserAccountService _IUserAccountService;



        private static IContainer Container { get; set; }

        [AssemblyInitialize()]
        public static void AssemblyInit(TestContext context)
        {

            GlobalCachingProvider.Instance.AddItems();



        }

        public UserAccountServiceTest()
        {
            var builder = new ContainerBuilder();

            // Register our Data dependencies
            builder.RegisterModule(new DependencyInjecionResolver.OrchestratorDIContainer());
            builder.RegisterModule(new DependencyInjecionResolver.ServiceDIContainer());
            Container = builder.Build();
        }


        UserAccountModel userAccountModel = new UserAccountModel();
        DatabaseModel databaseInfoModel = new DatabaseModel();
        DatabaseModel databaseResultModel = new DatabaseModel();

        [Given(@"the User Account Data Model")]
        public void GivenTheUserAccountDataModel()
        {
            databaseInfoModel.UserName = "asasdd";
            databaseInfoModel.UserId = 50;
        }

        [Given(@"the Database Data Model")]
        public void GivenTheDatabaseDataModel()
        {
            userAccountModel = (UserAccountModel)Builder<UserAccountModel>
                                        .CreateNew()
                                        .With(w => w.UserId = Faker.Number.RandomNumber(10))
                                        .With(w => w.UserName = Faker.Name.FullName())
                                           .With(w => w.FirstName = Faker.Name.FirstName())
                                           .With(w => w.LastName = Faker.Name.LastName())
                                           .With(w => w.Email = Faker.User.Email())
                                           .With(w => w.Password = Faker.User.Password(10, 2))
                                           .With(w => w.PasswordHash = new Guid().ToString())
                                           .With(w => w.PasswordSalt = Faker.User.Password(3))


                                        .Build()
                                        ;

        }

        [When(@"I press add")]
        public void WhenIPressAdd()
        {

            //registering interface with class that implemented
            var builder = new ContainerBuilder();
            builder.RegisterType<UserAccountService>().As<IUserAccountService>();

            //Resolving inteface with autofac
            var container = builder.Build();
            var _iUserAccountService = container.Resolve<IUserAccountService>();

            databaseResultModel = _iUserAccountService.AddNewUser(userAccountModel, databaseInfoModel);

        }

        [Then(@"Add user to database and the result return value should be Zero")]
        public void ThenAddUserToDatabaseAndTheResultReturnValueShouldBeZero()
        {
            Assert.IsTrue(databaseResultModel.ReturnError == 0);
        }


        [TestMethod]
        public void S_AddNewUser()
        {
         
     

           
            //registering interface with class that implemented
            var builder = new ContainerBuilder();
            builder.RegisterType<UserAccountService>().As<IUserAccountService>();

            //Resolving inteface with autofac
            var container = builder.Build();
            var _iUserAccountService = container.Resolve<IUserAccountService>();

            var result = _iUserAccountService.AddNewUser(userAccountModel, databaseInfoModel);

            Assert.IsTrue(result.ReturnError == 0);

        }

        [TestMethod]
        public void S_GetAllUserAccountDetails()
        {
            //registering interface with class that implemented
            var builder = new ContainerBuilder();
            builder.RegisterType<UserAccountService>().As<IUserAccountService>();

            //Resolving inteface with autofac
            var container = builder.Build();
            var _iUserAccountService = container.Resolve<IUserAccountService>();

            var result = _iUserAccountService.GetAllUserAccountDetails();

            Assert.IsTrue(result.Count > 0);


        }

        [TestMethod]
        public void S_GetUserRoleDetailsForUserId()
        {


            //registering interface with class that implemented
            var builder = new ContainerBuilder();
            builder.RegisterType<UserAccountService>().As<IUserAccountService>();

            //Resolving inteface with autofac
            var container = builder.Build();
            var _iUserAccountService = container.Resolve<IUserAccountService>();

            var AllUserAccountDetail = _iUserAccountService.GetAllUserAccountDetails();


            Random rnd = new Random();
            int r = rnd.Next(AllUserAccountDetail.Count);

            var result = _iUserAccountService.GetUserRoleDetailsForUserId(
                                        AllUserAccountDetail[r].UserId
                                                , databaseInfoModel);

            Assert.IsTrue(result.Count > 0);
        }

        [TestMethod]
        public void S_ValidateUserLoginDetails()
        {


            //registering interface with class that implemented
            var builder = new ContainerBuilder();
            builder.RegisterType<UserAccountService>().As<IUserAccountService>();

            //Resolving inteface with autofac
            var container = builder.Build();
            var _iUserAccountService = container.Resolve<IUserAccountService>();

            var AllUserAccountDetail = _iUserAccountService.GetAllUserAccountDetails();


            Random rnd = new Random();
            int r = rnd.Next(AllUserAccountDetail.Count);

            var result = _iUserAccountService.ValidateUserLoginDetails(
                                        AllUserAccountDetail[r]
                                                );

            Assert.IsTrue(result.UserId > 0);
        }

        [TestMethod]
        public void S_CanGetAllUserAccountDetails()
        {

            var mockMailClient = new Moq.Mock<IUserAccountRepository>();

            List<UserAccountModel> r = new List<UserAccountModel>();
            mockMailClient.Setup(client => client.GetAllUserAccountDetails()).Returns(r);


            //// Act
            var _UserAccountService = new UserAccountService(mockMailClient.Object);

            var actual = _UserAccountService.GetAllUserAccountDetails();

            //// Assert - assert on the mock
            mockMailClient.VerifyAll();

            //List<UserAccountModel> r = new List<UserAccountModel>();
            //    moqUserAccountRepositor.Setup(x => x.GetAllUserAccountDetails())
            //                        .Returns(r);

            //    this._IUserAccountRepository = moqUserAccountRepositor.Object;

            //    //// Act
            //    var _UserAccountService = new UserAccountService();

            //    var actual = _UserAccountService.GetAllUserAccountDetails();

            //    //// Assert - assert on the mock
            //    moqUserAccountRepositor.Verify();

        }

        [TestMethod]
        public void S_CanAddNewUser()
        {
            using (var mock = AutoMock.GetLoose())
            {
                //// Arrange - configure the mock
                //mock.Mock<IUserAccountOrchestrator>().Setup(x => x.GetValueFromOnion()).Returns("expected value");
                //var sut = mock.Create<UserAccountController>();

                //// Act
                //var actual = sut.DoWork();

                //// Assert - assert on the mock
                //mock.Mock<IUserAccountOrchestrator>().Verify(x => x.GetValueFromOnion());
                //Assert.AreEqual("expected value", actual);



                //// Arrange - configure the mock
                var moqUserAccountRepositor = new Mock<IUserAccountRepository>();

                int returnError;
                Guid returnGuid;
                string returnErrorMessage;



                moqUserAccountRepositor.Setup(x => x.AddNewUser(It.IsAny<UserAccountModel>()
                                                                , It.IsAny<long>()
                                                                , It.IsAny<bool>()
                                                             , out returnError
                                                             , out returnErrorMessage
                                                             , out returnGuid
                                            ))
                            ;

                //// Act
                //var _UserAccountService = new UserAccountService();

                //  var actual = _UserAccountService.AddNewUser(new UserAccountModel(), new DatabaseModel());

                //// Assert - assert on the mock
                moqUserAccountRepositor.Verify();
            }
        }
    }
}
