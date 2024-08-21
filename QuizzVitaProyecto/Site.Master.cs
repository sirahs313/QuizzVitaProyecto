using Microsoft.AspNet.Identity;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizzVitaProyecto
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Error de validación del token Anti-XSRF.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifica si la solicitud es del formulario de registro
            if (IsPostBack && Request.Form["name"] != null)
            {
                btnRegister_Click(sender, e);
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Principal/Home.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtén los datos del formulario
                string nombre = Request.Form["name"];
                string apellidos = Request.Form["surname"];
                int edad;
                if (!int.TryParse(Request.Form["years"], out edad))
                {
                    Response.Write("<script>alert('Edad no válida');</script>");
                    return;
                }
                string email = Request.Form["email-register"];
                string password = Request.Form["password-register"];

                if (string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(apellidos) || string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
                {
                    Response.Write("<script>alert('Todos los campos son obligatorios');</script>");
                    return;
                }

                string hashedPassword = HashPassword(password);

                // Conectar a la base de datos
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    connection.Open();

                    // Define la consulta SQL con parámetros
                    string sql = "INSERT INTO [dbo].[Users] " +
                                 "([Nombre], [Apellidos], [email], [Age], [Password], [CreatedAt]) " +
                                 "VALUES (@Nombre, @Apellidos, @Email, @Age, @Password, @CreatedAt)";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        // Usa parámetros para evitar inyección SQL
                        command.Parameters.AddWithValue("@Nombre", nombre);
                        command.Parameters.AddWithValue("@Apellidos", apellidos);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Age", edad);
                        command.Parameters.AddWithValue("@Password", hashedPassword);
                        command.Parameters.AddWithValue("@CreatedAt", DateTime.Now);

                        command.ExecuteNonQuery();
                    }
                }

                // Mensaje de éxito
                Response.Write("<script>alert('Registro exitoso');</script>");
            }
            catch (Exception ex)
            {
                // Manejo de excepciones
                // Considera usar un sistema de logging aquí en lugar de mostrar el error en la página
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        private string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                var builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
