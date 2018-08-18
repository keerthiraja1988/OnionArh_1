using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ServiceInterface
{
    public interface ISercurityService
    {
        string Encrypt(string encryptString);

        string Decrypt(string cipherText);

        UserAccountModel GenerateHashAndSaltForPassword(UserAccountModel userAccountModel);

        bool ValidateUserLoginAndCredential(UserAccountModel userAccountModel);
    }
}
