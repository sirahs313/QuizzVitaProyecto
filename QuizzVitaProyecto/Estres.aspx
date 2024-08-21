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

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Barra Superior -->
      <div class="top-bar">
          <img src="/imagenes/hogar.png" alt="Home" />
          <img src="/imagenes/menu.png" alt="Menu" />
      </div>

      <!-- Contenido Principal -->
      <div class="container">
          <img src="/imagenes/quizz1.png" alt="Logo" class="logo" />
            <h1>Quizz de Estrés</h1>
            <p>Lea cada oración y después decida qué respuesta representa mejor su situación. No hay respuestas correctas o incorrectas. Este Quizz está diseñado como un prediagnóstico para corroborar sus resultados consulte con un especialista.</p>

            <div class="question">
                <label>1. En las últimas dos semanas, ¿con qué frecuencia te has sentido abrumado(a) por tus responsabilidades y tareas diarias?</label>
                <div>
                    <input type="radio" id="opcion1" name="respuesta1" value="Nunca" />
                    <label for="opcion1">Nunca</label>
                </div>
                <div>
                    <input type="radio" id="opcion2" name="respuesta1" value="Varios días" />
                    <label for="opcion2">Varios días</label>
                </div>
                <div>
                    <input type="radio" id="opcion3" name="respuesta1" value="Más de la mitad de los días" />
                    <label for="opcion3">Más de la mitad de los días</label>
                </div>
                <div>
                    <input type="radio" id="opcion4" name="respuesta1" value="Casi todos los días" />
                    <label for="opcion4">Casi todos los días</label>
                </div>
            </div>

            <!-- Puedes agregar más preguntas aquí -->

            <button type="submit">Enviar respuestas</button>
        </div>
    </form>
</body>
</html>
