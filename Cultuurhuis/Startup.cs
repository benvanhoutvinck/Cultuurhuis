using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Cultuurhuis.Startup))]
namespace Cultuurhuis
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
