using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizzVitaProyecto.QuizzAnsiedad
{
    public partial class QAnsiedad : System.Web.UI.Page
    {
        private class Question
        {
            public string QuestionText { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Definir las preguntas del cuestionario
                var questions = new List<Question>
                {
                    new Question { QuestionText = "¿Te sientes nervioso(a), ansioso(a) o al borde de perder el control la mayoría de los días?" },
                    new Question { QuestionText = "¿Te resulta difícil controlar tus preocupaciones o detener el flujo constante de pensamientos ansiosos?" },
                    new Question { QuestionText = "¿Experimentas sudoración, palpitaciones o temblores en situaciones normales o cotidianas?" },
                    new Question { QuestionText = "¿Te sientes fatigado(a) o cansado(a) fácilmente, incluso sin haber realizado actividades físicas intensas?" },
                    new Question { QuestionText = "¿Tienes dificultad para concentrarte o te cuesta tomar decisiones debido a la preocupación?" },
                    new Question { QuestionText = "¿Te encuentras evitando situaciones o lugares por miedo a sentir ansiedad o pánico?" },
                    new Question { QuestionText = "¿Experimentas tensión muscular, dolor de cabeza o malestar general sin una causa física evidente?" },
                    new Question { QuestionText = "¿Tienes dificultad para dormir, ya sea para conciliar el sueño, mantenerte dormido(a), o te despiertas temprano con pensamientos ansiosos?" },
                    new Question { QuestionText = "¿Te sientes irritable o molesto(a) con facilidad, incluso por cosas que normalmente no te afectarían?" },
                    new Question { QuestionText = "¿Sientes que algo terrible va a suceder, aunque no puedas identificar una amenaza concreta?" },
                    new Question { QuestionText = "¿Te cuesta relajarte o sientes que no puedes estar tranquilo(a) en situaciones en las que normalmente te sentirías bien?" },
                    new Question { QuestionText = "¿Has notado cambios en tu apetito, ya sea que comas más o menos debido a la preocupación o la ansiedad?" },
                    new Question { QuestionText = "¿Te encuentras hipervigilante o constantemente preocupado(a) por tu salud o la seguridad de tus seres queridos?" },
                    new Question { QuestionText = "¿Experimentas mareos, falta de aire o sensación de desmayo en situaciones que normalmente no te causarían estrés?" },
                    new Question { QuestionText = "¿Te sientes desconectado(a) de la realidad, como si las cosas a tu alrededor no fueran reales o como si estuvieras fuera de tu cuerpo?" }
                };

                rptQuestions.DataSource = questions;
                rptQuestions.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int totalScore = 0;

            foreach (RepeaterItem item in rptQuestions.Items)
            {
                var rblOptions = (RadioButtonList)item.FindControl("rblOptions");
                if (rblOptions != null && rblOptions.SelectedValue != "")
                {
                    totalScore += int.Parse(rblOptions.SelectedValue);
                }
            }

            string resultMessage = GetResultMessage(totalScore);
            lblResult.Text = "Tu puntuación es: " + totalScore + ". " + resultMessage;
            lblResult.Visible = true;
        }

        private string GetResultMessage(int score)
        {
            if (score <= 14)
            {
                return "Es poco probable que tengas ansiedad clínica.";
            }
            else if (score <= 29)
            {
                return "Podrías estar experimentando algunos síntomas de ansiedad leve.";
            }
            else if (score <= 44)
            {
                return "Podrías estar experimentando ansiedad moderada.";
            }
            else
            {
                return "Podrías estar experimentando ansiedad severa.";
            }
        }
    }
}