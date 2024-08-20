<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QAnsiedad.aspx.cs" Inherits="QuizzVitaProyecto.QuizzAnsiedad.QAnsiedad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .custom-radio-list {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

            .custom-radio-list .asp-ListItem {
                display: block;
                margin-bottom: 3%; /* Ajusta el espacio entre los items */
                margin-left: 20%;
            }

            .custom-radio-list input[type="radio"] {
                transform: scale(1.5); /* Aumenta el tamaño del radio button */
                margin-right: 10px; /* Espacio entre el radio button y el texto */
            }

            .custom-radio-list .option-label{
                margin-left: 20%; /* Ajusta el margen izquierdo para las opciones */
            }
    </style>

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

                    <div class="row justify-content-center" style="margin-top:5%; marg">
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
