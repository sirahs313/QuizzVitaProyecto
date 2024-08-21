<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="QuizzVitaProyecto.QuizzDepresion.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Quizz de Ansiedad</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .navbar {
            background-color: #5ba19b;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar img {
            width: 30px;
            height: 30px;
        }
        .container {
            width: 60%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h1 {
            text-align: center;
            color: #5BA19B;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group div {
            margin: 10px 0;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #5BA19B;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #4d8c83;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Barra de Navegación -->
        <div class="navbar">
            <asp:ImageButton ID="HomeButton" runat="server" ImageUrl="/QuizzDepresion/imagenes/casainicio.png" PostBackUrl="~/Home.aspx" Style="width: 30px; height: 30px;" />
            <asp:ImageButton ID="ProfileButton" runat="server" ImageUrl="/QuizzDepresion/imagenes/perdil.png" PostBackUrl="~/Profile.aspx" Style="width: 30px; height: 30px;" />
            <asp:ImageButton ID="MenuButton" runat="server" ImageUrl="/QuizzDepresion/imagenes/opcionesin.png" PostBackUrl="~/Menu.aspx" Style="width: 30px; height: 30px;" />
        </div>

        <!-- Contenido Principal -->
        <div class="container">
            <h1>Quizz de Ansiedad</h1>
            <p>Lea cada oración y después decida qué respuesta representa mejor su situación. No hay respuestas correctas o incorrectas. Este Quizz está diseñado como un predíagnóstico para corroborar sus resultados, consulte con un especialista.</p>

            <!-- Preguntas -->
            <asp:Repeater ID="QuestionsRepeater" runat="server">
    <ItemTemplate>
        <div class="form-group">
            <asp:Label ID="QuestionLabel" runat="server" Text='<%# Eval("QuestionText") %>' CssClass="form-group"></asp:Label>
            <div>
                <asp:RadioButton ID="Option1" runat="server" GroupName='<%# "Group" + Container.ItemIndex %>' Text='<%# Eval("Options[0]") %>' />
                <asp:RadioButton ID="Option2" runat="server" GroupName='<%# "Group" + Container.ItemIndex %>' Text='<%# Eval("Options[1]") %>' />
                <asp:RadioButton ID="Option3" runat="server" GroupName='<%# "Group" + Container.ItemIndex %>' Text='<%# Eval("Options[2]") %>' />
                <asp:RadioButton ID="Option4" runat="server" GroupName='<%# "Group" + Container.ItemIndex %>' Text='<%# Eval("Options[3]") %>' />
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

            <asp:Button ID="SubmitButton" runat="server" Text="Enviar respuestas" OnClick="SubmitButton_Click" CssClass="btn" />
        </div>
    </form>
</body>
</html>
