using System;
using System.Web.UI;

namespace QuizzVitaProyecto.QuizzDepresion
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Aquí puedes inicializar datos si es necesario, por ejemplo, cargar las preguntas dinámicamente.
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Aquí manejas la lógica al enviar las respuestas
            string selectedOption = "";

            if (Option1.Checked)
            {
                selectedOption = Option1.Text;
            }
            else if (Option2.Checked)
            {
                selectedOption = Option2.Text;
            }
            else if (Option3.Checked)
            {
                selectedOption = Option3.Text;
            }
            else if (Option4.Checked)
            {
                selectedOption = Option4.Text;
            }

            // Aquí puedes guardar la respuesta seleccionada en una base de datos, mostrar un mensaje, etc.
            // Por ejemplo:
            Response.Write("<script>alert('Seleccionaste: " + selectedOption + "');</script>");
        }
    }
}
