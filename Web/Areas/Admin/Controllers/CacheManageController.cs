using AutoMapper;
using CrossCutting.Caching;
using DomainModel;
using DomainModel.Admin;
using OrchestratorInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Areas.Admin.Models;
using Web.Controllers;
using Web.Filters;

namespace Web.Areas.Admin.Controllers
{

    public class CacheManageController : BaseController
    {

        private ICacheOrchestrator _ICacheOrchestrator;
        public CacheManageController(ICacheOrchestrator ICacheOrchestrator)
        {
            this._ICacheOrchestrator = ICacheOrchestrator;
        }

        // GET: Admin/CacheManageController
        public ActionResult Index()
        {
            //applicationCache = this._ICacheOrchestrator.GetAllApplicationCacheConfig();

            return View();
        }

        public JsonResult GetApplicationCurrentCache()
        {
            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            var searchValue = Request.Form.GetValues("search[value]").FirstOrDefault();

            List<ApplicationCache> applicationCache = new List<ApplicationCache>();
            List<ApplicationCacheViewModel> applicationCacheViewModel = new List<ApplicationCacheViewModel>();
            List<ApplicationCacheViewModel> applicationCurrentCacheViewModel = new List<ApplicationCacheViewModel>();

            applicationCache = this._ICacheOrchestrator.GetAllApplicationCacheConfig();

            if (applicationCache != null && applicationCache.Count > 0)
            {
                applicationCache.AsParallel().ForAll(i =>
                {
                    applicationCurrentCacheViewModel.Add(new ApplicationCacheViewModel
                    {
                        Key = i.Key
                        ,
                        Value = GlobalCachingProvider.Instance.GetItem(i.Key) as string
                    });
                });
            }

            Mapper.Map(applicationCache, applicationCacheViewModel);

            var jsonData = new
            {

                rows = applicationCacheViewModel
            };

            var response = new { data = applicationCurrentCacheViewModel, recordsFiltered = 10000, recordsTotal = 10000 };
            return Json(response, JsonRequestBehavior.AllowGet);

            // return Json(jsonData, JsonRequestBehavior.AllowGet);
            //return applicationCurrentCacheViewModel.ToArray();
            // return Json(new { draw = draw, recordsFiltered = applicationCurrentCacheViewModel.Count, recordsTotal = applicationCurrentCacheViewModel.Count, data = applicationCurrentCacheViewModel });
        }

        [HttpPost]
        public string GetApplicationCacheValueForEdit(string Key)
        {
            List<ApplicationCache> applicationCaches = new List<ApplicationCache>();
            ApplicationCache applicationCache = new ApplicationCache();
            // List<ApplicationCacheViewModel> applicationCacheViewModel = new List<ApplicationCacheViewModel>();

            ApplicationCacheViewModel applicationCacheViewModel = new ApplicationCacheViewModel();

            applicationCaches = this._ICacheOrchestrator.GetAllApplicationCacheConfig();

            applicationCache = applicationCaches.AsParallel().Where(x => x.Key.ToLower() == Key.ToLower()).FirstOrDefault();

            Mapper.Map(applicationCache, applicationCacheViewModel);

            //string ret = RenderPartialToString("~/Areas/Management/Views/CacheManage/_GetAppCacheValueForEdit", applicationCacheViewModel);
            string ret = RenderPartialToString("_GetAppCacheValueForEdit", applicationCacheViewModel, ControllerContext);


            return ret;
        }

        [HttpPost]
        public ActionResult UpdateApplicationCacheValue(ApplicationCacheViewModel applicationCacheViewModel)
        {
            ApplicationCache applicationCache = new ApplicationCache();
            Mapper.Map(applicationCacheViewModel, applicationCache);
            DatabaseModel databaseReturnInfoModel = new DatabaseModel();
            databaseReturnInfoModel.UserId = this.GetUserId().Value;
            databaseReturnInfoModel = this._ICacheOrchestrator.UpdateApplicationCacheValue(applicationCache, databaseReturnInfoModel);

            if (databaseReturnInfoModel.ReturnError == 0)
            {
                GlobalCachingProvider.Instance.RefreshApplicationCacheItems();

                return Content("UpdateApplicationCacheValueSuccess");


            }
            else
            {
                return Content("UpdateApplicationCacheValueFailed");
            }

        }
    }
}