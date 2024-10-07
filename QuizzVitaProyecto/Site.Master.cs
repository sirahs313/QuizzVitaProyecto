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
using WebGrease.Activities;

namespace QuizzVitaProyecto
{
    public partial class SiteMaster : MasterPage
    {
        // Código existente...

        protected void Page_Load(object sender, EventArgs e)
        {
            
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
        // Método para obtener el nombre del usuario basado en su correo electrónico
        private string ObtenerNombreUsuario(string email)
        {
            string nombreUsuario = string.Empty;

            // Define tu cadena de conexión a la base de datos
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            // Define la consulta SQL
            string query = "SELECT Nombre FROM Users WHERE Email = @Email";

            // Usar ADO.NET para hacer la consulta a la base de datos
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        con.Open();
                        object result = cmd.ExecuteScalar(); // Obtener el resultado de la consulta

                        if (result != null)
                        {
                            nombreUsuario = result.ToString(); // Almacenar el nombre del usuario
                        }
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        Console.WriteLine("Error al obtener el nombre del usuario: " + ex.Message);
                    }
                }
            }

            return nombreUsuario;
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
