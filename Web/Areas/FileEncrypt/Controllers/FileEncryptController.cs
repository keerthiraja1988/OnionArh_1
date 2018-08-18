using AutoMapper;
using CrossCutting.Logging;
using DomainModel;
using DomainModel.FileEncryption;
using OrchestratorInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Web.Areas.FileEncrypt.Models;
using Web.Authentication;
using Web.Controllers;
using Web.Filters;

namespace Web.Areas.FileEncrypt.Controllers
{
    [Log4Net]

    public class FileEncryptController : BaseController
    {
        private IFileEncryptionOrchestrator _fileEncryptionOrchestrator;
        public FileEncryptController(IFileEncryptionOrchestrator FileEncryptionOrchestrator)
        {
            this._fileEncryptionOrchestrator = FileEncryptionOrchestrator;
        }

        [Route("Index")]
        [AsyncTimeout(1000)]   // 1000 milisecond    
      
        [CustomAuthorize(Roles = "FileEncrypt")]
        public async Task<ActionResult> Index()
        {
          



            // throw new Exception();
            List<FileEncryption> fileEncryptionDetails = new List<FileEncryption>();
            List<FileEncryptionViewModel> fileEncryptionDetailsViewModel = new List<FileEncryptionViewModel>();


            var taskTupleFileEncryptionDetails = Task.Run(() => this._fileEncryptionOrchestrator.GetFileEncryptionDetails());
            var tupleFileEncryptionDetails = await taskTupleFileEncryptionDetails;

            //fileEncryptionDetails = await tupleFileEncryptionDetails;
            //var tupleFileEncryptionDetails = this._fileEncryptionOrchestrator.GetFileEncryptionDetails();

            if (tupleFileEncryptionDetails.Item2.ReturnError == 0)
            {
                Mapper.Map(tupleFileEncryptionDetails.Item1, fileEncryptionDetailsViewModel);

                return View("Index", fileEncryptionDetailsViewModel);
            }
            else
            {
                ViewBag.ErrorMessage = "Error ID : " + tupleFileEncryptionDetails.Item2.ReturnGuid.ToString() + " " + tupleFileEncryptionDetails.Item2.ReturnErrorMessage;
                return View("Error");
            }

        }

        [Route("GetFileToClient")]
        public ActionResult GetFileToClient(Int64 id)
        {
            #region Get File and Details From Database
            FileEncryption file = new FileEncryption();
            file = this._fileEncryptionOrchestrator.GetEncryptedFileDetail(id);
            #endregion
            //Return the file to Client
            return File(@"H:\Carrier\EncryptFilePath\Temp\" + file.ID, System.Net.Mime.MediaTypeNames.Application.Octet, file.FileName);
        }

        [HttpPost]
        [Route("FileUpload")]
        [ValidateAntiForgeryToken]
        public ActionResult FileUpload(HttpPostedFileBase postedFile)
        {
            FileEncryption file = new FileEncryption();
            file.File = postedFile;
            file.CreatedBy = GetUserId().Value;
            string path = System.Web.Configuration.WebConfigurationManager.AppSettings["encryptedFileSavePath"].ToString();

            DatabaseModel databaseInfoModel = new DatabaseModel();
            databaseInfoModel.UserId = this.GetUserId().Value;

            var returned = this._fileEncryptionOrchestrator.EncryptAndSaveFile(file, databaseInfoModel);
            return RedirectToAction("Index");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            return View("Error");

        }
    }
}