using System;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;

namespace QuizzVitaProyecto
{
    public class AccountHandler : IHttpHandler
    {
        public bool IsReusable
        {
            get { return false; }
        }

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            string email = context.Request.Form["email"];
            string password = context.Request.Form["password"];

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                context.Response.StatusCode = 400;
                context.Response.Write("{\"message\": \"Email and Password are required.\"}");
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password";

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();

                    if (count > 0)
                    {
                        context.Session["UserEmail"] = email;
                        context.Response.StatusCode = 200;
                        context.Response.Write("{\"message\": \"Login successful.\"}");
                    }
                    else
                    {
                        context.Response.StatusCode = 401;
                        context.Response.Write("{\"message\": \"Invalid email or password.\"}");
                    }
                }
            }
            catch (Exception ex)
            {
                context.Response.StatusCode = 500;
                context.Response.Write("{\"message\": \"An error occurred. Please try again later.\"}");
            }
        }
    }
}
