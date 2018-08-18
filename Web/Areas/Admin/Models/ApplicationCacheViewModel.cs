using AutoMapperFramework;
using DomainModel.Admin;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web.Areas.Admin.Models
{
    public class ApplicationCacheViewModel : IMapFrom<ApplicationCache>, IMapTo<ApplicationCache>
    {
        [Display(Name = "Cache Key")]
        public string Key { get; set; }

        [Required]
        public string Value { get; set; }
        public string Title { get; set; }
    }
}