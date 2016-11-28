using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MickesProjektSite.Models
{
    public class PersonMetadata
    {
        [StringLength(50)]
        [Display(Name = "Efternamn")]
        public string LastName;
        [StringLength(50)]
        [Display(Name = "Namn")]
        public string FirstName;
        [StringLength(22)]
        [Display(Name = "Telefon")]
        public string PhoneNr;
    }
    public class ProjectMetadata
    {
        [StringLength(50)]
        [Display(Name = "Projekt titel")]
        public string ProjectTitle;
    }
    public class ProjectDetailMetadata
    {
        [StringLength(50)]
        [Display(Name = "Att göra")]
        public string Todo;
    }
}