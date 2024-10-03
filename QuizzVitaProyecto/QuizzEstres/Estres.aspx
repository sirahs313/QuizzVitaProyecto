<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estres.aspx.cs" Inherits="QuizzVitaProyecto.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Quizz de Estrés</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        .top-bar {
            background-color: #a6dfd0;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .top-bar img {
            width: 30px;
            height: 30px;
        }

        .container {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        .logo {
            width: 80px;
            height: auto;
            margin: 20px auto;
        }

        h1 {
            font-family: 'Rokkitt', serif;
            font-size: 2rem;
            color: #4b0082;
            margin-bottom: 20px;
        }

        p {
            font-size: 1rem;
            margin-bottom: 20px;
        }

        .question {
            text-align: left;
            margin: 20px 0;
        }

        button {
            background-color: #4b0082;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #6a0dad;
        }
.side-menu {
    height: 100%; 
    width: 0;
    position: fixed;
    z-index: 1; 
    top: 0;
    right: 0; 
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s; 
    padding-top: 60px; 
}

.side-menu a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.side-menu a:hover {
    color: #f1f1f1;
}

.side-menu .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Barra Superior -->
      <div class="top-bar">
          <img src="/Principal/img/inicio.png" alt="Home" />
          <img src="/Principal/img/menu.png" alt="Menu" id="menuButton" />

<!-- Menú lateral -->
<div id="sideMenu" class="side-menu">
    <a href="javascript:void(0)" class="closebtn" id="closeMenu">&times;</a>
    <a href="/QuizzDepresion/WebForm1.aspx">Depresión</a>
    <a href="/QuizzAnsiedad/QAnsiedad.aspx">Ansiedad</a>
    <a href="/QuizzEstres/Estres.aspx">Estrés</a>
    <a href="/Informacionapoyo.aspx">Informacion de apoyo</a>
</div>
      </div>

      <!-- Contenido Principal -->
      <div class="container">
          <img src="/Principal/img/logo.png" alt="Logo" class="logo" />
            <h1 style="margin-top:3%; padding-bottom:1%; border-bottom: 2px solid #A4ECD2;">Quizz de Estrés</h1>
            <p>Lea cada oración y después decida qué respuesta representa mejor su situación. No hay respuestas correctas o incorrectas. Este Quizz está diseñado como un prediagnóstico para corroborar sus resultados consulte con un especialista.</p>

           <div class="question">
                <label>1. En las últimas dos semanas, ¿con qué frecuencia te has sentido abrumado(a) por tus responsabilidades y tareas diarias?</label>
                <div>
                    <input type="radio" id="q1_op1" name="q1" value="0" />
                    <label for="q1_op1">Nunca</label>
                </div>
                <div>
                    <input type="radio" id="q1_op2" name="q1" value="1" />
                    <label for="q1_op2">Varios días</label>
                </div>
                <div>
                    <input type="radio" id="q1_op3" name="q1" value="2" />
                    <label for="q1_op3">Más de la mitad de los días</label>
                </div>
                <div>
                    <input type="radio" id="q1_op4" name="q1" value="3" />
                    <label for="q1_op4">Casi todos los días</label>
                </div>
            </div>

              <div class="question">
         <label>2. ¿Con qué frecuencia has sentido que no tienes control sobre las cosas importantes en tu vida?</label>
         <div>
             <input type="radio" id="q2_op1" name="q2" value="0" />
             <label for="q2_op1">Nunca</label>
         </div>
         <div>
             <input type="radio" id="q2_op2" name="q2" value="1" />
             <label for="q2_op2">Rara vez</label>
         </div>
         <div>
             <input type="radio" id="q2_op3" name="q2" value="2" />
             <label for="q2_op3">Algunas veces </label>
         </div>
         <div>
             <input type="radio" id="q2_op4" name="q2" value="3" />
             <label for="q2_op4">Muy frecuentemente</label>
         </div>
     </div>

         <div class="question">
             <label>3. ¿Con qué frecuencia has experimentado problemas para dormir debido a preocupaciones?</label>
             <div>
                 <input type="radio" id="q3_op1" name="q3" value="0" />
                 <label for="q3_op1">Nunca</label>
             </div>
             <div>
                 <input type="radio" id="q3_op2" name="q3" value="1" />
                 <label for="q3_op2">Rara vez</label>
             </div>
             <div>
                 <input type="radio" id="q3_op3" name="q3" value="2" />
                 <label for="q3_op3">Frecuentemente</label>
             </div>
             <div>
                 <input type="radio" id="q3_op4" name="q3" value="3" />
                 <label for="q3_op4">Muy frecuentemente</label>
             </div>
         </div>

         <div class="question">
             <label>4. ¿Con qué frecuencia has sentido dificultad para relajarte?</label>
             <div>
                 <input type="radio" id="q4_op1" name="q4" value="0" />
                 <label for="q4_op1">Nunca</label>
             </div>
             <div>
                 <input type="radio" id="q4_op2" name="q4" value="1" />
                 <label for="q4_op2">Rara vez</label>
             </div>
             <div>
                 <input type="radio" id="q4_op3" name="q4" value="2" />
                 <label for="q4_op3">Algunas veces</label>
             </div>
             <div>
                 <input type="radio" id="q4_op4" name="q4" value="3" />
                 <label for="q4_op4">Muy frecuentemente</label>
             </div>
         </div>

          
         <div class="question">
             <label>5. ¿Con qué frecuencia has tenido problemas para concentrarte debido al estrés?</label>
             <div>
                 <input type="radio" id="q5_op1" name="q5" value="0" />
                 <label for="q5_op1">Nunca</label>
             </div>
             <div>
                 <input type="radio" id="q5_op2" name="q5" value="1" />
                 <label for="q5_op2">Rara vez</label>
             </div>
             <div>
                 <input type="radio" id="q5_op3" name="q5" value="2" />
                 <label for="q5_op3">Algunas veces</label>
             </div>
             <div>
                 <input type="radio" id="q5_op4" name="q5" value="3" />
                 <label for="q5_op4">Muy frecuentemente</label>
             </div>
         </div>
                    
         <div class="question">
             <label>6. ¿Cuán seguido te has sentido nervioso(a) o ansioso(a) sin razón aparente?</label>
             <div>
                 <input type="radio" id="q6_op1" name="q6" value="0" />
                 <label for="q6_op1">Nunca</label>
             </div>
             <div>
                 <input type="radio" id="q6_op2" name="q6" value="1" />
                 <label for="q6_op2">Rara vez</label>
             </div>
             <div>
                 <input type="radio" id="q6_op3" name="q6" value="2" />
                 <label for="q6_op3">Algunas veces</label>
             </div>
             <div>
                 <input type="radio" id="q6_op4" name="q6" value="3" />
                 <label for="q6_op4">Muy frecuentemente</label>
             </div>
         </div>
                           
         <div class="question">
             <label>7. ¿Con qué frecuencia te has sentido agotado(a) incluso después de descansar?</label>
             <div>
                 <input type="radio" id="q7_op1" name="q7" value="0" />
                 <label for="q7_op1">Nunca</label>
             </div>
             <div>
                 <input type="radio" id="q7_op2" name="q7" value="1" />
                 <label for="q7_op2">Rara vez</label>
             </div>
             <div>
                 <input type="radio" id="q7_op3" name="q7" value="2" />
                 <label for="q7_op3">Algunas veces</label>
             </div>
             <div>
                 <input type="radio" id="q7_op4" name="q7" value="3" />
                 <label for="q7_op4">Muy frecuentemente</label>
             </div>
         </div>
                                   
         <div class="question">
             <label>8. ¿Cuán seguido te has sentido irritado(a) o molesto(a) sin razón aparente?</label>
             <div>
                 <input type="radio" id="q8_op1" name="q8" value="0" />
                 <label for="q8_op1">Nunca</label>
             </div>
             <div>
                 <input type="radio" id="q8_op2" name="q8" value="1" />
                 <label for="q8_op2">Rara vez</label>
             </div>
             <div>
                 <input type="radio" id="q8_op3" name="q8" value="2" />
                 <label for="q8_op3">Algunas veces</label>
             </div>
             <div>
                 <input type="radio" id="q8_op4" name="q8" value="3" />
                 <label for="q8_op4">Muy frecuentemente</label>
             </div>
         </div>
                                              
         <div class="question">
             <label>9. ¿Con qué frecuencia has sentido que las cosas te están sobrepasando?</label>
             <div>
                 <input type="radio" id="q9_op1" name="q9" value="0" />
                 <label for="q9_op1">Nunca</label>
             </div>
             <div>
                 <input type="radio" id="q9_op2" name="q9" value="1" />
                 <label for="q9_op2">Rara vez</label>
             </div>
             <div>
                 <input type="radio" id="q9_op3" name="q9" value="2" />
                 <label for="q9_op3">Algunas veces</label>
             </div>
             <div>
                 <input type="radio" id="q9_op4" name="q9" value="3" />
                 <label for="q9_op4">Muy frecuentemente</label>
             </div>
         </div>
                                         
         <div class="question">
             <label>10. ¿Con qué frecuencia has experimentado síntomas físicos como dolores de cabeza, dolor de estómago, o tensión muscular debido al estrés?</label>
             <div>
                 <input type="radio" id="q10_op1" name="q10" value="0" />
                 <label for="q10_op1">Nunca</label>
             </div>
             <div>
                 <input type="radio" id="q10_op2" name="q10" value="1" />
                 <label for="q10_op2">Rara vez</label>
             </div>
             <div>
                 <input type="radio" id="q10_op3" name="q10" value="2" />
                 <label for="q10_op3">Algunas veces</label>
             </div>
             <div>
                 <input type="radio" id="q10_op4" name="q10" value="3" />
                 <label for="q10_op4">Muy frecuentemente</label>
             </div>
         </div>
            <button type="submit" runat="server" onserverclick="SubmitQuiz">Enviar respuestas</button>
        </div>
    </form>
    <script>

document.getElementById("menuButton").onclick = function() {
    document.getElementById("sideMenu").style.width = "250px"; 
}


document.getElementById("closeMenu").onclick = function() {
    document.getElementById("sideMenu").style.width = "0"; 
}
</script>
</body>
</html>
