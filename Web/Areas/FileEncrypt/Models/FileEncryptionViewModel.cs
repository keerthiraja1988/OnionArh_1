using AutoMapperFramework;
using DomainModel.FileEncryption;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Areas.FileEncrypt.Models
{
    public class FileEncryptionViewModel : IMapFrom<FileEncryption>, IMapTo<FileEncryption>
    {
        public Int64 ID { get; set; }
        public string EncryptionId { get; set; }
        public string FileName { get; set; }
        public string FileDescription { get; set; }
        public string Path { get; set; }
        public DateTime CreatedOn { get; set; }
        public Int64 CreatedBy { get; set; }

        public DateTime ModifiedOn { get; set; }
        public Int64 ModifiedBy { get; set; }

    }
}