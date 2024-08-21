using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace QuizzVitaProyecto
{
    public partial class Registro : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                try
                {
                    string nombre = Request.Form["name"];
                    string apellidos = Request.Form["surname"];
                    int age = int.Parse(Request.Form["years"]);
                    string email = Request.Form["email-register"];
                    string password = Request.Form["password-register"];

                    using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                    {
                        connection.Open();
                        string sql = "INSERT INTO Users (Nombre, Apellidos, Age, Email, Password) VALUES (@Nombre, @Apellidos, @Age, @Email, @Password)";
                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@Nombre", nombre);
                            command.Parameters.AddWithValue("@Apellidos", apellidos);
                            command.Parameters.AddWithValue("@Age", age);
                            command.Parameters.AddWithValue("@Email", email);
                            command.Parameters.AddWithValue("@Password", password);
                            command.ExecuteNonQuery();
                        }
                    }
                    Response.ContentType = "application/json";
                    Response.Write("{\"status\":\"success\",\"message\":\"Registro exitoso\"}");
                }
                catch (Exception ex)
                {
                    Response.ContentType = "application/json";
                    Response.Write("{\"status\":\"error\",\"message\":\"" + ex.Message + "\"}");
                }
                Response.End();  // Asegúrate de terminar la respuesta después de escribirla
            }
        }
    }
}