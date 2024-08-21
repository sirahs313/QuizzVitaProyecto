using System;
using System.Web.UI;

namespace QuizzVitaProyecto.QuizzDepresion
{
    public partial class WebForm1 : Page
    {
        private const int TotalQuestions = 10; // Número total de preguntas
        private const int PointsPerOption = 1; // Puntos por cada opción seleccionada

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializar las preguntas y opciones aquí
                var questions = new[]
                {
                    new Question { QuestionText = "¿Te sientes triste, vacío(a) o desesperanzado(a) la mayor parte del tiempo?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } },
                    new Question { QuestionText = "¿Has perdido interés en actividades que solías disfrutar?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } },
                    new Question { QuestionText = "¿Tienes dificultades para dormir, ya sea durmiendo demasiado o teniendo insomnio?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } },
                    new Question { QuestionText = "¿Te sientes fatigado(a) o sin energía, incluso después de descansar?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } },
                    new Question { QuestionText = "¿Has notado cambios en tu apetito o en tu peso, como comer mucho más o mucho menos de lo habitual?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } },
                    new Question { QuestionText = "¿Te sientes irritable o más enojado(a) de lo que solías estar?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } },
                    new Question { QuestionText = "¿Tienes problemas para concentrarte o tomar decisiones?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } },
                    new Question { QuestionText = "¿Has tenido pensamientos de autolesionarte o de suicidio?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } },
                    new Question { QuestionText = "¿Te sientes inútil o tienes una autoimagen negativa?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } },
                    new Question { QuestionText = "¿Has notado que tus relaciones interpersonales se están viendo afectadas debido a cómo te sientes?", Options = new[] { "Nunca", "Pocas veces", "A menudo", "Siempre" } }
                };

                // Asignar la lista de preguntas al Repeater
                QuestionsRepeater.DataSource = questions;
                QuestionsRepeater.DataBind();
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            int totalScore = 0;
            int totalQuestions = 10; // Número total de preguntas

            foreach (var control in form1.Controls)
            {
                if (control is System.Web.UI.HtmlControls.HtmlInputRadioButton radioButton && radioButton.Checked)
                {
                    totalScore += PointsPerOption;
                }
            }

            // Calcular la puntuación total posible
            int maxScore = totalQuestions * PointsPerOption;

            // Mostrar mensaje basado en la puntuación obtenida
            if (totalScore > maxScore / 2) // Más de la mitad de la puntuación total
            {
                Response.Write("<script>alert('Acude a un médico, podrías tener depresión');</script>");
            }
            else
            {
                Response.Write("<script>alert('Tu puntuación no indica depresión');</script>");
            }
        }
    }

    // Clase Question para almacenar preguntas y opciones
    public class Question
    {
        public string QuestionText { get; set; }
        public string[] Options { get; set; }
    }
}
