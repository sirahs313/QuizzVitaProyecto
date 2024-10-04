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
           
        }
        protected void SubmitQuiz(object sender, EventArgs e)
        {
            int totalScore = 0;
            totalScore += Convert.ToInt32(Request.Form["q1"]);
            totalScore += Convert.ToInt32(Request.Form["q2"]);
            totalScore += Convert.ToInt32(Request.Form["q3"]);
            totalScore += Convert.ToInt32(Request.Form["q4"]);
            totalScore += Convert.ToInt32(Request.Form["q5"]);
            totalScore += Convert.ToInt32(Request.Form["q6"]);
            totalScore += Convert.ToInt32(Request.Form["q7"]);
            totalScore += Convert.ToInt32(Request.Form["q8"]);
            totalScore += Convert.ToInt32(Request.Form["q9"]);
            totalScore += Convert.ToInt32(Request.Form["q10"]);

            string diagnosis = "";
            if (totalScore <= 10) // Ajusta estos valores según la cantidad de preguntas
            {
                diagnosis = "Ansiedad Baja";
            }
            else if (totalScore <= 20)
            {
                diagnosis = "Ansiedad Moderada";
            }
            else
            {
                diagnosis = "Ansiedad Severa";
            }

            // Redirigir a la página de resultados con el diagnóstico
            Response.Redirect($"ResAns.aspx?diagnosis={diagnosis}&score={totalScore}");
        }
    }
}