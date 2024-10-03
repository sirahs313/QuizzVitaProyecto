<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="QuizzVitaProyecto.QuizzDepresion.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Quizz de Depresion</title>
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
            background-color: #e6ffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .containerl {
            width: 60%;
            margin: auto;
            padding: 10px;
            border-radius: 8px;
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
     



        /* Estilos para el menú lateral */
.side-menu {
     height: 100%; /* Altura del menú */
    width: 0; /* Ancho inicial del menú, oculto */
    position: fixed; /* Fijo en la pantalla */
    z-index: 1; /* Colocar sobre otros elementos */
    top: 0;
    right: 0; /* Desplegar desde la derecha */
    background-color: #111; /* Color de fondo */
    overflow-x: hidden; /* Ocultar desbordamiento horizontal */
    transition: 0.5s; /* Transición suave */
    padding-top: 60px; /* Espacio superior */
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
        
        <!-- Barra de Navegación -->
        <div class="navbar">
            <asp:ImageButton ID="HomeButton" runat="server" ImageUrl="/Principal/img/inicio.png" PostBackUrl="~/Principal/Home.aspx" Style="width: 30px; height: 50px;" />
            <%--<asp:ImageButton ID="ProfileButton" runat="server" ImageUrl="/Principal/img/login.png" PostBackUrl="~/Profile.aspx" Style="width: 30px; height: 50px; float: left; margin-right: -850px;" />--%>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="/Principal/img/menu.png"
    PostBackUrl="~/Menu.aspx" Style="width: 30px; height: 50px;" 
    OnClientClick="openMenu(); return false;" />

        </div>
       <div class="top-bar">
    

    <!-- Menú lateral -->
    <div id="sideMenu" class="side-menu">
        <a href="javascript:void(0)" class="closebtn" id="closeMenu">&times;</a>
        <a href="/QuizzDepresion/WebForm1.aspx">Depresión</a>
        <a href="/QuizzAnsiedad/QAnsiedad.aspx">Ansiedad</a>
        <a href="/QuizzEstres/Estres.aspx">Estrés</a>
        <a href="/Informacionapoyo.aspx">Informacion de apoyo</a>
    </div>
</div>


        <div class="containerl">

            <asp:Image ID="Logo" runat="server" ImageUrl="/Principal/img/logo.png" style="width:70px; display:block; margin:0 auto;" />
            <h1>Quizz de Depresion</h1>
            <p>Lea cada oración y después decida qué respuesta representa mejor su situación. No hay respuestas correctas o incorrectas. Este Quizz está diseñado como un predíagnóstico para corroborar sus resultados, consulte con un especialista.</p>
        </div>

        <!-- Contenido Principal -->
        <div class="container">
            

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
   <script>
       // Función para abrir el menú lateral
       function openMenu() {
           document.getElementById("sideMenu").style.width = "250px"; // Abrir el menú con un ancho de 250px
       }

       // Función para cerrar el menú lateral
       function closeMenu() {
           document.getElementById("sideMenu").style.width = "0"; // Cerrar el menú
       }

       // Agregar evento al botón de cierre del menú
       document.getElementById("closeMenu").onclick = closeMenu;
</script>
</body>
</html>
