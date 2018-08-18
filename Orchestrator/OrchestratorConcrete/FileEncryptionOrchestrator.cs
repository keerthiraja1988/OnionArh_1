using CrossCutting.Logging;
using DomainModel;
using DomainModel.FileEncryption;
using OrchestratorInterface;
using ServiceInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace OrchestratorConcrete
{
    [Log4Net]
   
    public class FileEncryptionOrchestrator : IFileEncryptionOrchestrator
    {
        private IFileEncryptionService _IFileEncryptionService;
        public FileEncryptionOrchestrator(IFileEncryptionService IFileEncryptionService)
        {
            this._IFileEncryptionService = IFileEncryptionService;
        }

        public string GetValueFromOnion()
        {
            return this._IFileEncryptionService.GetValueFromOnion();
            
        }
        public Tuple<List<FileEncryption>, DatabaseModel> GetFileEncryptionDetails()
        {

            return this._IFileEncryptionService.GetFileEncryptionDetails();
        }

        public FileEncryption GetEncryptedFileDetail(Int64 id)
        {
            return this._IFileEncryptionService.GetEncryptedFileDetail(id);
        }

        public DatabaseModel EncryptAndSaveFile(FileEncryption file, DatabaseModel databaseInfoModel)
        {
            return this._IFileEncryptionService.EncryptAndSaveFile(file, databaseInfoModel);
        }
    }
}
