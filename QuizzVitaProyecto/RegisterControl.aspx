<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterControl.aspx.cs" Inherits="QuizzVitaProyecto.RegisterControl" %>

<form id="registerForm" runat="server">
    <asp:TextBox ID="txtName" runat="server" CssClass="input2" />
    <asp:TextBox ID="txtSurname" runat="server" CssClass="input2" />
    <asp:TextBox ID="txtYears" runat="server" CssClass="input2" />
    <asp:TextBox ID="txtEmail" runat="server" CssClass="input2" />
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input2" />
    <asp:Button ID="btnRegister" runat="server" Text="Registrarse" OnClick="btnRegister_Click" CssClass="btn-register2" />
</form>
