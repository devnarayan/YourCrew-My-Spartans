using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(YourCrew.Startup))]
namespace YourCrew
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
