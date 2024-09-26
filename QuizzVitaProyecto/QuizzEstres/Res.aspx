<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Res.aspx.cs" Inherits="QuizzVitaProyecto.QuizzEstres.Res" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Resultados del Quizz de Estrés</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
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

        h1 {
            font-family: 'Rokkitt', serif;
            font-size: 2rem;
            color: #4b0082;
            margin-bottom: 20px;
        }

        .result-box {
            background-color: #e0f2f1;
            padding: 20px;
            border-radius: 10px;
            border: 2px solid #4b0082;
            margin-bottom: 20px;
        }

        .result-box p {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .result-box h2 {
            font-size: 1.8rem;
            color: #4b0082;
            margin: 10px 0;
        }

        .buttons {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .buttons button {
            background-color: #4b0082;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .buttons button:hover {
            background-color: #6a0dad;
        }

        p {
            font-size: 1rem;
            margin-top: 20px;
            color: #333;
        }

        footer {
            background-color: #f0f0f0;
            padding: 10px;
            text-align: center;
            font-size: 0.9rem;
            color: #666;
            margin-top: 20px;
        }

        .progress-bar {
            background-color: #c8e6c9;
            height: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
            width: 100%;  /* Asegura que la barra tenga un ancho máximo del 100% del contenedor */
        }

        .progress {
            height: 100%;
            background-color: #4caf50;
            border-radius: 10px;
            text-align: right;
            padding-right: 10px;
            color: white;
            font-weight: bold;
            transition: width 0.5s ease-in-out; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="top-bar">
            <img src="/imagenes/hogar.png" alt="Home" />
            <img src="/imagenes/menu.png" alt="Menu" />
        </div>

        <div class="container">
            <h1>¡Aquí están tus resultados!</h1>
            <div class="result-box">
                <p>Tu diagnóstico actual es:</p>
                <h2 style="color: #4b0082;"><%= Request.QueryString["diagnosis"] %></h2>
                
                <!-- Barra de progreso -->
                <div class="progress-bar">
                    <div class="progress" style="width:<%= (Convert.ToInt32(Request.QueryString["score"]) * 100 / 30) %>%;">
                        <%= Request.QueryString["score"] %>/30
                    </div>
                </div>
                
                <!-- Botones para más acciones -->
                <div class="buttons">
                    <button type="button">Acerca de tus resultados</button>
                    <button type="button">Consejos para manejar el estrés</button>
                    <button type="button">Tus respuestas</button>
                    <button type="button">Realizar otro quizz</button>
                </div>
            </div>

            
        </div>
    </form>
</body>
</html>

