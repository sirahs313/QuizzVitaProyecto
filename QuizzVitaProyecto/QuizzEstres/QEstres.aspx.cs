using QuizzVitaProyecto.QuizzDepresion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizzVitaProyecto.QuizzEstres
{
    public partial class QEstres : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var questions = new List<Question>
                {
                    new Question { QuestionText = "En las últimas dos semanas, ¿con qué frecuencia te has sentido abrumado(a) por tus responsabilidades?" },
                    new Question { QuestionText = "¿Te resulta difícil controlar tus emociones cuando enfrentas situaciones de presión?" },
                    new Question { QuestionText = "¿Experimentas problemas para dormir debido a preocupaciones o ansiedad?" },
                    new Question { QuestionText = "¿Te sientes agotado(a) con frecuencia, incluso después de haber descansado?" },
                    new Question { QuestionText = "¿Has notado cambios en tu apetito como resultado de sentir estrés?" },
                    new Question { QuestionText = "¿Te encuentras evitando ciertas tareas o actividades por temor al estrés?" },
                    new Question { QuestionText = "¿Sientes que te falta concentración en tu trabajo o estudios debido a preocupaciones?" },
                    new Question { QuestionText = "¿Experimentas dolores de cabeza, tensión muscular u otros síntomas físicos debido al estrés?" },
                    new Question { QuestionText = "¿Te sientes irritado(a) o de mal humor sin una razón aparente?" },
                    new Question { QuestionText = "¿Sientes que te cuesta relajarte, incluso en situaciones en las que deberías sentirte tranquilo(a)?" }
                };

                rptQuestions.DataSource = questions;
                rptQuestions.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int totalScore = 0;

            // Recorre todos los items del Repeater para sumar las puntuaciones
            foreach (RepeaterItem item in rptQuestions.Items)
            {
                var rblOptions = (RadioButtonList)item.FindControl("rblOptions");
                if (rblOptions != null && rblOptions.SelectedValue != "")
                {
                    totalScore += int.Parse(rblOptions.SelectedValue);
                }
            }

            string diagnosis = GetDiagnosis(totalScore);

            Response.Redirect($"Res.aspx?diagnosis={diagnosis}&score={totalScore}");
        }

        private string GetDiagnosis(int score)
        {
            if (score <= 14)
            {
                return "Estrés Bajo";
            }
            else if (score <= 29)
            {
                return "Estrés Leve";
            }
            else if (score <= 44)
            {
                return "Estrés Moderado";
            }
            else
            {
                return "Estrés Severo";
            }
        }
    }

}