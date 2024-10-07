<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="QAnsiedad.aspx.cs" Inherits="QuizzVitaProyecto.QuizzAnsiedad.QAnsiedad" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Quizz de Ansiedad</title>
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
        .blurred {
            filter: blur(5px);
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
    <h1>Quizzes</h1>
    <a href="/QuizzDepresion/WebForm1.aspx">Depresión</a>
    <a href="/QuizzAnsiedad/QAnsiedad.aspx">Ansiedad</a>
    <a href="/QuizzEstres/Estres.aspx">Estrés</a>
    <a href="/Informacionapoyo.aspx">Informacion de apoyo</a>
</div>
      </div>

      <!-- Contenido Principal -->
      <div class="container" id="contentContainer">
          <img src="/Principal/img/logo.png" alt="Logo" class="logo" />
            <h1 style="margin-top:3%; padding-bottom:1%; border-bottom: 2px solid #A4ECD2;">Quizz de Ansiedad</h1>
            <p>Lea cada oración y después decida qué respuesta representa mejor su situación. No hay respuestas correctas o incorrectas. Este Quizz está diseñado como un prediagnóstico para corroborar sus resultados consulte con un especialista.</p>


           <div class="question">
                <label>¿Te sientes nervioso(a), ansioso(a) o al borde de perder el control la mayoría de los días?</label>
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
         <label>2. ¿Te resulta difícil controlar tus preocupaciones o detener el flujo constante de pensamientos ansiosos?</label>
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

    <div class="container" style="padding-top:5%; margin-bottom:5%; ">
        <div id="Encabezado" class="row justify-content-center">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12 d-flex justify-content-center">
                <asp:Image ID="Logo" runat="server" ImageUrl="/Principal/img/logo.png" style="width:70px"/>
            </div>
            <div class="col-lg-4 col-xl-4 col-md-3 col-sm-2 col-2"></div>
            <div class="col-lg-4 col-xl-4 col-md-6 col-sm-8 col-8 d-flex justify-content-center" style="margin-top:3%; padding-bottom:1%; border-bottom: 2px solid #A4ECD2;">
                <h2>Quizz de Ansiedad</h2>
            </div>
            <div class="col-lg-4 col-xl-4 col-md-3 col-sm-2 col-2"></div>
            <div id="advertencia" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 d-flex justify-content-center" style="margin-top:3%; text-align:center;">
                <p>Lea cada oración y después decida que respuesta representa mejor su situación. No hay respuestas correctas o incorrectas. <br /><i>Este Quizz esta diseñado como un prediagnóstico para corroborar sus resultados consulte con un especialista.</i></p>
            </div>
        </div>
        <div class="row" style="margin-top:4%; ">
            <div class="col-lg-1 col-xl-1 col-md-1 col-sm-1 col-1"></div>
            <div class="col-lg-10 col-xl-10 col-md-10 col-sm-10 col-10" style="background-color: rgba(202, 253, 235, 0.25); padding-top:4%; padding-left:7%; padding-right:7%;padding-bottom:4% ">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Repeater ID="rptQuestions" runat="server">
                        <ItemTemplate>
                            <div class="question" style="margin-bottom: 20px;">
                                <p><%# Container.ItemIndex + 1 %>. <%# Eval("QuestionText") %></p>
                                <div style="padding-left:9%">
                                    <asp:RadioButtonList ID="rblOptions" runat="server" RepeatDirection="Vertical" CssClass="custom-radio-list">
                                        <asp:ListItem Value="0">Nunca</asp:ListItem>
                                        <asp:ListItem Value="1">Raramente</asp:ListItem>
                                        <asp:ListItem Value="2">A veces</asp:ListItem>
                                        <asp:ListItem Value="3">A menudo</asp:ListItem>
                                        <asp:ListItem Value="4">Siempre</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="row justify-content-center" style="margin-top:5%; ">
                        <div class="col-lg-4 text-center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Enviar Respuestas" OnClick="btnSubmit_Click" Height="40px" Font-Size="15px" BackColor="#A4ECD2" BorderStyle="None" />
                        </div>
                    </div>
                </asp:Panel>

                <asp:Label ID="lblResult" runat="server" Text="" Visible="False" />
            </div>
            <div class="col-lg-1 col-xl-1 col-md-1 col-sm-1 col-1"></div>
        </div>
    </div>
</asp:Content>
