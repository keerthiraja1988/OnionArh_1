using Autofac;
using OrchestratorConcrete;
using OrchestratorInterface;
using ServiceConcrete;
using ServiceInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DependencyInjecionResolver
{
    public class OrchestratorDIContainer : Module
    {
                
        protected override void Load(ContainerBuilder builder)
        {
          
            builder.RegisterType<FileEncryptionOrchestrator>().As<IFileEncryptionOrchestrator>().InstancePerRequest();
            builder.RegisterType<UserAccountOrchestrator>().As<IUserAccountOrchestrator>().InstancePerRequest();

            builder.RegisterType<AdminOrchestrator>().As<ICacheOrchestrator>().InstancePerRequest();
            builder.RegisterType<AdminOrchestrator>().As<IUserManageOrchestrator>().InstancePerRequest();
            builder.RegisterType<AdminOrchestrator>().As<IAuditOrchestrator>().InstancePerRequest();

            builder.RegisterType<DashBoardOrchestrator>().As<IDashBoardOrchestrator>().InstancePerRequest();

            base.Load(builder);
        }
    }

    public class ServiceDIContainer : Module
    {

        protected override void Load(ContainerBuilder builder)
        {

            builder.RegisterType<FileEncryptionService>().As<IFileEncryptionService>().InstancePerRequest();
            builder.RegisterType<UserAccountService>().As<IUserAccountService>().InstancePerRequest();
            builder.RegisterType<SercurityService>().As<ISercurityService>().InstancePerRequest();
            builder.RegisterType<AdminService>().As<IAdminService>().InstancePerRequest();
            builder.RegisterType<DashBoardService>().As<IDashBoardService>().InstancePerRequest();

            base.Load(builder);
        }
    }
}
