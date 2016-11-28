using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MickesProjektSite.Startup))]
namespace MickesProjektSite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
