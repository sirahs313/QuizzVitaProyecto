using Microsoft.AspNet.Identity;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizzVitaProyecto
{
    public partial class SiteMaster : MasterPage
    {
        // Código existente...

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack && Request.Form["email"] != null)
            {
                btnLogin_Click(sender, e);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = Request.Form["email"];
            string password = Request.Form["password"];

            if (AuthenticateUser(email, password))
            {
                FormsAuthentication.SetAuthCookie(email, false);
                Response.Redirect("~/Principal/Home.aspx");
               
            }
            else
            {
                Response.Write("<script>alert('Correo electrónico o contraseña incorrectos');</script>");
            }
        }

        private bool AuthenticateUser(string email, string password)
        {
            // Hash de la contraseña ingresada
            string hashedPassword = HashPassword(password);

            // Conectar a la base de datos
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                connection.Open();

                // Define la consulta SQL con parámetros
                string sql = "SELECT COUNT(1) FROM [dbo].[Users] WHERE [email] = @Email AND [Password] = @Password";

                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    // Usa parámetros para evitar inyección SQL
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    int count = (int)command.ExecuteScalar();

                    // Si se encuentra un registro, las credenciales son correctas
                    return count == 1;
                }
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
