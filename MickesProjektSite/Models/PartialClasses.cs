using System;
using System.ComponentModel.DataAnnotations;

namespace MickesProjektSite.Models
{
    [MetadataType(typeof(PersonMetadata))]
    public partial class Person
    {
    }
    [MetadataType(typeof(ProjectMetadata))]
    public partial class Project
    {
    }
    [MetadataType(typeof(ProjectDetailMetadata))]
    public partial class ProjectDetails
    {
    }
}