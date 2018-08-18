using log4net;
using log4net.Core;
using log4net.Repository.Hierarchy;
using PostSharp.Aspects;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Xml.Serialization;
using System.Dynamic;
using System.Threading.Tasks;
using CrossCutting.Caching;

namespace CrossCutting.Logging
{
    [Serializable]
    public class Log4NetAttribute : OnMethodBoundaryAspect
    {
        //static readonly ILog log = LogManager.GetLogger(typeof(System.Reflection.MethodBase));
        // static readonly ILog log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        //private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        //private static readonly ILog logDomainConcrete = LogManager.GetLogger("DomainConcrete");
        //private static readonly ILog logFileEncryption = LogManager.GetLogger("FileEncryption");
        //private static ILogger logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType).Logger;

        static readonly string IsLogDebugTrue = GlobalCachingProvider.Instance.GetItem("LOGDEBUG") as string;
        static readonly string IsLogInfoTrue = GlobalCachingProvider.Instance.GetItem("LOGINFO") as string;

        static readonly string IsLOGServiceDEBUG = GlobalCachingProvider.Instance.GetItem("LOGServiceDEBUG") as string;
        static readonly string IsLOGServiceINFO = GlobalCachingProvider.Instance.GetItem("LOGServiceINFO") as string;
        static readonly string IsLOGOrchestratorDEBUG = GlobalCachingProvider.Instance.GetItem("LOGOrchestratorDEBUG") as string;
        static readonly string IsLOGOrchestratorINFO = GlobalCachingProvider.Instance.GetItem("LOGOrchestratorINFO") as string;
        static readonly string IsLOGWebAppDEBUG = GlobalCachingProvider.Instance.GetItem("LOGWebAppDEBUG") as string;
        static readonly string IsLOGWebAppINFO = GlobalCachingProvider.Instance.GetItem("LOGWebAppINFO") as string;

        public override void OnEntry(MethodExecutionArgs args)
        {
            ILog log = LogManager.GetLogger(args.Method.DeclaringType.UnderlyingSystemType);

            if (IsLOGOrchestratorDEBUG == "TRUE" && log.Logger.Name.Contains("OrchestratorConcrete"))
            {
                log.DebugFormat("Entering {0}.{1}.", args.Method.DeclaringType.Name, args.Method.Name);
                log.Debug(DisplayObjectInfo(args));
            }
            else if (IsLOGServiceDEBUG == "TRUE" && log.Logger.Name.Contains("ServiceConcrete"))
            {

                log.DebugFormat("Entering {0}.{1}.", args.Method.DeclaringType.Name, args.Method.Name);
                log.Debug(DisplayObjectInfo(args));
            }
            else if (IsLOGWebAppDEBUG == "TRUE" && log.Logger.Name.Contains("Web"))
            {

                log.DebugFormat("Entering {0}.{1}.", args.Method.DeclaringType.Name, args.Method.Name);
                log.Debug(DisplayObjectInfo(args));
            }
            //if (IsLogDebugTrue == "TRUE")
            //{
            //    log.DebugFormat("Entering {0}.{1}.", args.Method.DeclaringType.Name, args.Method.Name);
            //    log.Debug(DisplayObjectInfo(args));
            //}

        }

        public override void OnExit(MethodExecutionArgs args)
        {
            ILog log = LogManager.GetLogger(args.Method.DeclaringType.UnderlyingSystemType);

            if (IsLOGOrchestratorINFO == "TRUE" && log.Logger.Name.Contains("OrchestratorConcrete"))
            {
                string serializedData = string.Empty;
                try
                {
                    XmlSerializer serializer = new XmlSerializer(args.ReturnValue.GetType());
                    using (StringWriter sw = new StringWriter())
                    {
                        serializer.Serialize(sw, (args.ReturnValue));
                        serializedData = sw.ToString();
                    }

                    log.InfoFormat("{0}.{1}. Return value {2}", args.Method.DeclaringType.Name, args.Method.Name, serializedData);
                }

                catch (Exception ex)
                {
                    log.InfoFormat("{0}.{1}. Return value {2}", args.Method.DeclaringType.Name, args.Method.Name, DisplayObjectInfo(args));

                }
            }

            else if (IsLOGServiceINFO == "TRUE" && log.Logger.Name.Contains("ServiceConcrete"))
            {
                string serializedData = string.Empty;
                try
                {
                    XmlSerializer serializer = new XmlSerializer(args.ReturnValue.GetType());
                    using (StringWriter sw = new StringWriter())
                    {
                        serializer.Serialize(sw, (args.ReturnValue));
                        serializedData = sw.ToString();
                    }

                    log.InfoFormat("{0}.{1}. Return value {2}", args.Method.DeclaringType.Name, args.Method.Name, serializedData);
                }

                catch (Exception ex)
                {
                    log.InfoFormat("{0}.{1}. Return value {2}", args.Method.DeclaringType.Name, args.Method.Name, DisplayObjectInfo(args));

                }
            }
            else if (IsLOGWebAppINFO == "TRUE" && log.Logger.Name.Contains("WebApp"))
            {
                string serializedData = string.Empty;
                try
                {
                    XmlSerializer serializer = new XmlSerializer(args.ReturnValue.GetType());
                    using (StringWriter sw = new StringWriter())
                    {
                        serializer.Serialize(sw, (args.ReturnValue));
                        serializedData = sw.ToString();
                    }

                    log.InfoFormat("{0}.{1}. Return value {2}", args.Method.DeclaringType.Name, args.Method.Name, serializedData);
                }

                catch (Exception ex)
                {
                    log.InfoFormat("{0}.{1}. Return value {2}", args.Method.DeclaringType.Name, args.Method.Name, DisplayObjectInfo(args));

                }
            }


            if (IsLOGOrchestratorDEBUG == "TRUE" && log.Logger.Name.Contains("OrchestratorConcrete"))
            {
                log.DebugFormat("Leaving {0}.{1}. Return value {2}", args.Method.DeclaringType.Name, args.Method.Name, args.ReturnValue);


            }

            else if (IsLOGServiceDEBUG == "TRUE" && log.Logger.Name.Contains("ServiceConcrete"))
            {

                log.DebugFormat("Leaving {0}.{1}. Return value {2}", args.Method.DeclaringType.Name, args.Method.Name, args.ReturnValue);

            }
            else if (IsLOGWebAppDEBUG == "TRUE" && log.Logger.Name.Contains("Web"))
            {

                log.DebugFormat("Leaving {0}.{1}. Return value {2}", args.Method.DeclaringType.Name, args.Method.Name, args.ReturnValue);

            }

        }

        public override void OnException(MethodExecutionArgs args)
        {
            ILog log = LogManager.GetLogger(args.Method.DeclaringType.UnderlyingSystemType);
            log.ErrorFormat("Exception {0} in {1}", args.Exception, args.Method);

            // args.FlowBehavior = FlowBehavior.Continue;
        }
        static string DisplayObjectInfo(MethodExecutionArgs args)
        {
            StringBuilder sb = new StringBuilder();
            Type type = args.Arguments.GetType();
            sb.Append("Method " + args.Method.Name);
            sb.Append("\r\nArguments:");
            FieldInfo[] fi = type.GetFields();

            if (fi.Length > 0)
            {
                foreach (FieldInfo f in fi)
                {
                    sb.Append("\r\n " + f + " = " + f.GetValue(args.Arguments));
                }
            }
            else
                sb.Append("\r\n None");

            return sb.ToString();
        }
    }
}