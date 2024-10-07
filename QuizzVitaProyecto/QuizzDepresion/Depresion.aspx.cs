using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace QuizzVitaProyecto.QuizzDepresion
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Crear una lista de preguntas y opciones
                List<Question> questions = new List<Question>
                {
                    new Question
                    {
                        QuestionText = "Pregunta 1: ¿Con qué frecuencia te sientes triste o vacío?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    },
                    new Question
                    {
                        QuestionText = "Pregunta 2: ¿Con qué frecuencia has perdido interés en actividades que solías disfrutar?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    },
                    new Question
                    {
                        QuestionText = "Pregunta 3: ¿Te sientes cansado o con poca energía la mayor parte del tiempo?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    },
                    new Question
                    {
                        QuestionText = "Pregunta 4: ¿Tienes problemas para dormir o duermes demasiado?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    },
                    new Question
                    {
                        QuestionText = "Pregunta 5: ¿Con qué frecuencia te sientes mal contigo mismo o que has fallado?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    },
                    new Question
                    {
                        QuestionText = "Pregunta 6: ¿Tienes problemas para concentrarte en actividades diarias, como leer o ver televisión?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    },
                    new Question
                    {
                        QuestionText = "Pregunta 7: ¿Con qué frecuencia te has sentido lento o inquieto, como si no pudieras estar quieto?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    },
                    new Question
                    {
                        QuestionText = "Pregunta 8: ¿Te has sentido sin esperanza acerca del futuro?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    },
                    new Question
                    {
                        QuestionText = "Pregunta 9: ¿Has tenido pensamientos de hacerte daño o que estarías mejor muerto?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    },
                    new Question
                    {
                        QuestionText = "Pregunta 10: ¿Con qué frecuencia sientes que no tienes valor o utilidad?",
                        Options = new string[] {"Nunca", "Rara vez", "A menudo", "Siempre"},
                        OptionScores = new int[] {0, 1, 2, 3}
                    }
                };

                // Enlazar el Repeater con la lista de preguntas
                QuestionsRepeater.DataSource = questions;
                QuestionsRepeater.DataBind();
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            int totalScore = 0;

            for (int questionIndex = 0; questionIndex < QuestionsRepeater.Items.Count; questionIndex++)
            {
                var item = QuestionsRepeater.Items[questionIndex];

                var option1 = (RadioButton)item.FindControl("Option1");
                var option2 = (RadioButton)item.FindControl("Option2");
                var option3 = (RadioButton)item.FindControl("Option3");
                var option4 = (RadioButton)item.FindControl("Option4");

                // Verificar cuál opción está seleccionada y sumar el puntaje correspondiente
                if (option1.Checked)
                {
                    totalScore += GetOptionScore(questionIndex, 0); // Puntaje de la opción 1
                }
                else if (option2.Checked)
                {
                    totalScore += GetOptionScore(questionIndex, 1); // Puntaje de la opción 2
                }
                else if (option3.Checked)
                {
                    totalScore += GetOptionScore(questionIndex, 2); // Puntaje de la opción 3
                }
                else if (option4.Checked)
                {
                    totalScore += GetOptionScore(questionIndex, 3); // Puntaje de la opción 4
                }
            }

            // Mostrar el resultado basado en la puntuación obtenida
            int maxScore = QuestionsRepeater.Items.Count * 3; // Suponiendo que 3 es el puntaje máximo por pregunta
            if (totalScore > maxScore / 2)
            {
                Response.Write("<script>alert('Acude a un médico, podrías tener depresión');</script>");
            }
            else
            {
                Response.Write("<script>alert('Tu puntuación no indica depresión');</script>");
            }
        }

        // Método para obtener el puntaje de una opción
        private int GetOptionScore(int questionIndex, int optionIndex)
        {
            // Aquí debes definir los puntajes que correspondan a cada opción
            int[][] optionScores = new int[][]
            {
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 1
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 2
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 3
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 4
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 5
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 6
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 7
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 8
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 9
                new int[] {0, 1, 2, 3}, // Puntajes de la pregunta 10
            };

            return optionScores[questionIndex][optionIndex];
        }
    }

    public class Question
    {
        public string QuestionText { get; set; }
        public string[] Options { get; set; }
        public int[] OptionScores { get; set; } // Arreglo de puntajes por opción
    }
}
