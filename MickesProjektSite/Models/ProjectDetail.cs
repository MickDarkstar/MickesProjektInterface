//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MickesProjektSite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProjectDetail
    {
        public int ProjectDetailsID { get; set; }
        public int ProjectID { get; set; }
        public int PersonID { get; set; }
        public string Todo { get; set; }
    
        public virtual Person Person { get; set; }
        public virtual Project Project { get; set; }
    }
}
