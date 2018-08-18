using DomainModel;
using DomainModel.FileEncryption;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ServiceInterface
{
    public interface IFileEncryptionService
    {
        string GetValueFromOnion();

        Tuple<List<FileEncryption>, DatabaseModel> GetFileEncryptionDetails();

        DatabaseModel EncryptAndSaveFile(FileEncryption file, DatabaseModel databaseInfoModel);

        FileEncryption GetEncryptedFileDetail(Int64 id);

    }
}
