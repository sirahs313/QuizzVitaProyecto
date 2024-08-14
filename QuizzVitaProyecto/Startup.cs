using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QuizzVitaProyecto.Startup))]
namespace QuizzVitaProyecto
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
