using CrossCutting.Caching;
using CrossCutting.Database;
using CrossCutting.Logging;
using DomainModel;
using DomainModel.FileEncryption;
using Insight.Database;
using Repository;
using ServiceInterface;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ServiceConcrete
{
    [Log4Net]

    public class FileEncryptionService : IFileEncryptionService
    {
        IFileEncryptionRepository i;
        public FileEncryptionService()
        {
            AbstractDatabase database;
            database = new SqlServerDatabase();

            i = database.Connection.As<IFileEncryptionRepository>();
        }

        public string GetValueFromOnion()
        {
            try
            {
                List<FileEncryption> f = new List<FileEncryption>();
                DatabaseModel databaseReturnInfoModel = new DatabaseModel();
                // Boolean canDebug = Convert.ToBoolean((GlobalCachingProvider.Instance.GetItem("LOGdbOperation") as string).ToLower());
                Boolean canDebug = true;

                int returnError;
                Guid returnGuid;
                string returnErrorMessage;

                f = this.i.GetEncryptedFileDetails(canDebug, out returnError, out returnErrorMessage, out returnGuid, 3600);

                databaseReturnInfoModel.ReturnError = returnError;
                databaseReturnInfoModel.ReturnErrorMessage = returnErrorMessage;
                databaseReturnInfoModel.ReturnGuid = returnGuid;



                return "Onion";
            }
            catch (Exception ex)
            {

                throw;
            }

        
        }

        public Tuple<List<FileEncryption>, DatabaseModel> GetFileEncryptionDetails()
        {
            List<FileEncryption> f = new List<FileEncryption>();
            DatabaseModel databaseReturnInfoModel = new DatabaseModel();
            // Boolean canDebug = Convert.ToBoolean((GlobalCachingProvider.Instance.GetItem("LOGdbOperation") as string).ToLower());
            Boolean canDebug = true;

            int returnError;
            Guid returnGuid;
            string returnErrorMessage;

            f = this.i.GetEncryptedFileDetails(canDebug, out returnError, out returnErrorMessage, out returnGuid, 3600);

            databaseReturnInfoModel.ReturnError = returnError;
            databaseReturnInfoModel.ReturnErrorMessage = returnErrorMessage;
            databaseReturnInfoModel.ReturnGuid = returnGuid;

            return Tuple.Create(f, databaseReturnInfoModel);
        }

        public FileEncryption GetEncryptedFileDetail(Int64 id)
        {
            #region Get File Details From Database
            FileEncryption file = new FileEncryption();
            file = this.i.GetEncryptedFileDetail(id);
            #endregion

            string password = file.EncryptionId; // Your Key Here

            #region Get the file from Path and Decrypt
            FileStream fsCrypt = new FileStream(file.Path + file.ID, FileMode.Open);
            DESCryptoServiceProvider cryptic = new DESCryptoServiceProvider();
            cryptic.Key = ASCIIEncoding.ASCII.GetBytes(password);
            cryptic.IV = ASCIIEncoding.ASCII.GetBytes(password);
            CryptoStream cs = new CryptoStream(fsCrypt,
                cryptic.CreateDecryptor(),
                CryptoStreamMode.Read);
            var stream = new MemoryStream();

            FileStream fsOut = new FileStream(@"G:\Carrier\EncryptFilePath\Temp\" + file.ID, FileMode.Create);
            int data;

            while ((data = cs.ReadByte()) != -1)
                fsOut.WriteByte((byte)data);
            fsOut.Close();
            cs.Close();
            fsCrypt.Close();

            #endregion

            return file;
        }

        public DatabaseModel EncryptAndSaveFile(FileEncryption file, DatabaseModel databaseInfoModel)
        {
            int returnError;
            Guid returnGuid;
            string returnErrorMessage;
            Boolean canDebug = Convert.ToBoolean((GlobalCachingProvider.Instance.GetItem("LOGdbOperation") as string).ToLower());


            #region Random Number and Key Generation
            var chars = "ABCD345EFGHI6hJghijkKL3456MNOPQRSTUVWXYZabcdefghijklmMNOPQRSTnopqrstuvwxyz01234D345E56789";
            var stringChars = new char[8];
            var random = new Random();
            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }
            var EncryptionKey = new String(stringChars);
            DESCryptoServiceProvider cryptic = new DESCryptoServiceProvider();
            cryptic.Key = ASCIIEncoding.ASCII.GetBytes(EncryptionKey);
            //cryptic.IV = ASCIIEncoding.ASCII.GetBytes("123456");
            cryptic.IV = ASCIIEncoding.ASCII.GetBytes(EncryptionKey);
            #endregion

            #region Save Encryption Details To Database
            Int64 fileid = 0;
            FileEncryption files = new FileEncryption
            {
                EncryptionId = EncryptionKey,
                FileName = file.File.FileName,
                FileDescription = "Encrypted with DES Data Encryption Standard algorithm",
                Path = file.Path,
                CreatedOn = DateTime.Now,
               
            };

            fileid = this.i.SaveFileEncryptionDetails(files, databaseInfoModel.UserId, canDebug, out returnError, out returnErrorMessage, out returnGuid, 3000);

            databaseInfoModel.ReturnError = returnError;
            databaseInfoModel.ReturnErrorMessage = returnErrorMessage;
            databaseInfoModel.ReturnGuid = returnGuid;

            #endregion

            #region Encrypt and Save the File
            string cryptFile = file.Path + fileid.ToString();
            FileStream fsCrypt = new FileStream(cryptFile, FileMode.Create);
            CryptoStream cs = new CryptoStream(fsCrypt,
                cryptic.CreateEncryptor(),
                CryptoStreamMode.Write);
            int data;
            while ((data = file.File.InputStream.ReadByte()) != -1)
                cs.WriteByte((byte)data);
            cs.Close();
            fsCrypt.Close();
            #endregion

            return databaseInfoModel;
        }
    }
}
