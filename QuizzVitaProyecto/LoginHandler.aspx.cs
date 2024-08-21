using System;
using System.Data.SqlClient;
using System.Web;

namespace QuizzVitaProyecto
{
    public partial class LoginHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string email = Request.Form["email"];
                string password = Request.Form["password"];

                if (AuthenticateUser(email, password))
                {
                    Response.Clear();
                    Response.Write("Inicio de sesión exitoso");
                    Response.End();
                }
                else
                {
                    Response.Clear();
                    Response.Write("Correo electrónico o contraseña incorrectos");
                    Response.End();
                }
            }
        }

        private bool AuthenticateUser(string email, string password)
        {
            string connectionString = "Data Source=ERICKSUA\\SQL; Initial Catalog=UserDB; User ID=sa; Password=313420; Encrypt=False";
            string query = "SELECT COUNT(1) FROM Users WHERE email = @Email AND Password = @Password";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                int userCount = (int)cmd.ExecuteScalar();
                return userCount > 0;
            }
        }
    }
}
