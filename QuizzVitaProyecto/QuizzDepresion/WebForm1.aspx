<%@ Page Title="Quizz de Depresión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="QuizzVitaProyecto.QuizzDepresion.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        
    </style>

    <div class="container" style="padding-top:5%; margin-bottom:5%; ">
        <div id="Encabezado" class="row justify-content-center">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12 d-flex justify-content-center">
                <asp:Image ID="Logo" runat="server" ImageUrl="/Principal/img/logo.png" style="width:70px"/>
            </div>
            <div class="col-lg-4 col-xl-4 col-md-3 col-sm-2 col-2"></div>
            <div class="col-lg-4 col-xl-4 col-md-6 col-sm-8 col-8 d-flex justify-content-center" style="margin-top:3%; padding-bottom:1%; border-bottom: 2px solid #A4ECD2;">
                <h2>Quizz de Depresión</h2>
            </div>
            <div class="col-lg-4 col-xl-4 col-md-3 col-sm-2 col-2"></div>
            <div id="advertencia" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 d-flex justify-content-center" style="margin-top:3%; text-align:center;">
                <p>Lea cada oración y después decida que respuesta representa mejor su situación. No hay respuestas correctas o incorrectas. <br /><i>Este Quizz esta diseñado como un prediagnóstico para corroborar sus resultados consulte con un especialista.</i></p>
            </div>
        </div>
        <div class="row" style="margin-top:4%; ">
            <div class="col-lg-1 col-xl-1 col-md-1 col-sm-1 col-1"></div>
            <!-- Contenido Principal -->
            <div class="col-lg-10 col-xl-10 col-md-10 col-sm-10 col-10" style="background-color: rgba(239, 237, 237, 0.25); padding-top: 4%; padding-left: 7%; padding-right: 7%; padding-bottom: 4%">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Repeater ID="QuestionsRepeater" runat="server" OnItemCommand="QuestionsRepeater_ItemCommand">
                        <ItemTemplate>
                            <div class="form-group" style="margin-bottom: 20px;">
                                <asp:Label ID="QuestionLabel" runat="server" Text='<%# Eval("QuestionText") %>' CssClass="form-group"></asp:Label>
                                <div style="padding-left:9%">
                                    <asp:RadioButton ID="Option1" runat="server" GroupName='<%# "Group" + Container.ItemIndex %>' Text='<%# Eval("Options[0]") %>' />
                                    <asp:RadioButton ID="Option2" runat="server" GroupName='<%# "Group" + Container.ItemIndex %>' Text='<%# Eval("Options[1]") %>' />
                                    <asp:RadioButton ID="Option3" runat="server" GroupName='<%# "Group" + Container.ItemIndex %>' Text='<%# Eval("Options[2]") %>' />
                                    <asp:RadioButton ID="Option4" runat="server" GroupName='<%# "Group" + Container.ItemIndex %>' Text='<%# Eval("Options[3]") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Button ID="SubmitButton" runat="server" Text="Enviar respuestas" OnClick="SubmitButton_Click" CssClass="btn" />
                </asp:Panel>
            </div>
            <div class="col-lg-1 col-xl-1 col-md-1 col-sm-1 col-1"></div>
        </div>
    </div>

    

    <script>
        // Función para abrir el menú lateral
        function openMenu() {
            document.getElementById("sideMenu").style.width = "250px";
        }

        // Función para cerrar el menú lateral
        function closeMenu() {
            document.getElementById("sideMenu").style.width = "0";
        }

        // Agregar evento al botón de cierre del menú
        document.getElementById("closeMenu").onclick = closeMenu;
    </script>
</asp:Content>
