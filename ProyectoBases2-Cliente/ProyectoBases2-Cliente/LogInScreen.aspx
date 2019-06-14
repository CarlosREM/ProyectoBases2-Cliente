<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInScreen.aspx.cs" Inherits="ProyectoBases2_Cliente.LogInScreen" Culture="es-CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inicio de Sesion</title>
    <style>
        .margin10 {
            margin: 10px;
        }
        .margin5_c {
            margin: 5px;
            text-align: center;
            text-anchor: middle;
        }
    </style>
</head>

<body style="height: 496px; width: 508px;">
    
    <form id="LoginScreen" runat="server">
        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="500px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px">
            <br />
            <asp:Label ID="lbl_header" runat="server" Text="Inicio de Sesión" CssClass="margin10" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="PageBody" runat="server" Height="400px" Width="500px" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="4px">
            <br />
            <asp:Label ID="lbl_userType" runat="server" Text="Tipo de Usuario" CssClass="margin10" Font-Size="Large"></asp:Label>
            <br />
            <asp:DropDownList ID="cmBx_userType" runat="server" CssClass="margin10" Height="20px" Width="200px">
                <asp:ListItem>Empleado</asp:ListItem>
                <asp:ListItem>Cliente</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lbl_username" runat="server" Text="Nombre de Usuario" CssClass="margin10"></asp:Label>
            <br />
            <asp:TextBox ID="txtBx_username" runat="server" CssClass="margin10" Height="25px" Width="200px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lbl_password" runat="server" Text="Contraseña" CssClass="margin10"></asp:Label>
            <br />
            <asp:TextBox ID="txtBx_password" runat="server" CssClass="margin10" Height="25px" TextMode="Password" Width="200px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_login" runat="server" Text="Iniciar sesión" CssClass="margin10" Font-Size="Medium" Height="40px" OnClick="btn_login_Click" Width="160px" />
            <asp:Label ID="lbl_credError" runat="server"  Font-Size="Medium" ForeColor="Red" Text="lbl_credError" Width="200px" Visible="False"></asp:Label>
        </asp:Panel>
    </form>
    
</body>
</html>
