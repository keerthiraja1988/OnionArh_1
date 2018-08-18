using DomainModel.FileEncryption;
using Insight.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public interface IFileEncryptionRepository
    {

        [Sql("SaveFileEncryptionDetails")]
        Int64 SaveFileEncryptionDetails(FileEncryption fileEncryptionDetail,Int64 UserId, Boolean canDebug, out int returnError, out string returnErrorMessage, out Guid returnGuid, int? commandTimeout);

        [Sql("GetEncryptedFileDetails")]
        List<FileEncryption> GetEncryptedFileDetails(Boolean canDebug, out int returnError, out string returnErrorMessage, out Guid returnGuid, int? commandTimeout);

        [Sql("GetEncryptedFileDetail")]
        FileEncryption GetEncryptedFileDetail(Int64 id);
    }
}
