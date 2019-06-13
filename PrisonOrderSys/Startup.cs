using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PrisonOrderSys.Startup))]
namespace PrisonOrderSys
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
