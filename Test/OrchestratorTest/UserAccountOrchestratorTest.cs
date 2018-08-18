using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Autofac.Extras.Moq;
using ServiceInterface;
using DomainModel;
using Moq;
using OrchestratorConcrete;
using CrossCutting.Caching;

namespace OrchestratorTest
{
    [TestClass]
    public class UserAccountOrchestratorTest
    {

        [AssemblyInitialize()]
        public static void AssemblyInit(TestContext context)
        {
            //GlobalCachingProvider.Instance.AddItems();

        }

        [TestMethod]
        public void O_CanAddNewUser()
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
                var moqService = new Mock<IUserAccountService>();
                var moqService1 = new Mock<ISercurityService>();

                moqService.Setup(x => x.AddNewUser(It.IsAny<UserAccountModel>(), It.IsAny<DatabaseModel>()))
                            .Returns((UserAccountModel userAccountModel, DatabaseModel databaseModel) => { return databaseModel; });

                //// Act
                var _UserAccountOrchestrator = new UserAccountOrchestrator(moqService.Object, moqService1.Object);

                var actual = _UserAccountOrchestrator.AddNewUser(new UserAccountModel(), new DatabaseModel());

                //// Assert - assert on the mock
                moqService.VerifyAll();
            }
        }
    }
}
