<%@ Page Title="QuizzVita" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="QuizzVitaProyecto.Principal.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>

        @media (max-width: 768px) {
            .EllipseContainer {
                display: none;
            }
        }

        @font-face {
            font-family: 'CoffeeSpark';
            src: url('Fuentes/Coffee Spark.ttf'); 
        }

        @font-face {
            font-family: 'Sarlotte';
            src: url('Fuentes/Sarlotte.otf');
        }
    </style>

    <asp:Panel ID="Panel1" runat="server">
        <div class="DesktopPrincipal" style="width: 100%; min-height: 100vh; position: relative; background: white; padding-bottom: 60px;">

            <div class="Quizzvita" style="width: 400px; height: 105px; left: 80px; top: 100px; position: absolute; text-align: left; color: black; font-size: 70px; font-family: CoffeeSpark; font-weight: 800;">
                QuizzVita
            </div>

            <img class="SinTexto1" style="width: 200px; height: 200px; left: 135px; top: 250px; position: absolute;" src="img/logo.png" />

            <div class="EllipseContainer" style="position: absolute; left: 500px; top: 70px; transform: translateX(0);">
                <div class="Ellipse3" style="width: 500px; height: 500px; position: absolute; background: rgba(164, 236, 210, 0.72); border-radius: 9999px; z-index: 1;"></div>
                <div class="Ellipse2" style="width: 500px; height: 500px; position: absolute; background: rgba(255, 255, 255, 0.72); left: 53px; top: 0px; border-radius: 9999px; z-index: 2;"></div>
                <div class="Ellipse1" style="width: 500px; height: 500px; position: absolute; background: #EFEDED; left: 110px; top: 0px; border-radius: 9999px; z-index: 3;"></div>
                <div class="TextoDentroDeLosCirculos" style="width: 400px; height: 400px; position: absolute; left: 160px; top: 80px; z-index: 4; text-align: center; color: black; font-size: 28px; font-family: Sarlotte; font-weight: 400; line-height: 1.5; padding: 20px;">
                    Descubre tu bienestar emocional a través de nuestros maravillosos quizzes interactivos. Nos preocupamos por tu salud mental y queremos ayudarte a identificar y enfrentar cualquier desafío.
               
                </div>
            </div>

        </div>

    </asp:Panel>
</asp:Content>
