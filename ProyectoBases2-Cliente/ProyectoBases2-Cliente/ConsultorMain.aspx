<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultorMain.aspx.cs" Inherits="ProyectoBases2_Cliente.ConsultorMain"  Culture="es-CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu Principal - Consultor</title>
    <style>
        .margin20 {
            margin: 20px;
        }
        .margin10 {
            margin: 10px;
        }
        .margin10_c {
            margin: 10px;
            text-align: center;
            text-anchor: middle;
        }
    </style>
</head>

<body style="height: 496px; width: 1208px;">

    <form id="consultorMain" runat="server">
        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="1200px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px" HorizontalAlign="Center">
            <asp:Panel ID="PageHeader_L" runat="server"  Width="580px" Height="80px" HorizontalAlign="Left" Style="float:left">
                <br />
                <asp:Label ID="lbl_header" runat="server" align="left" CssClass="margin20" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Consultor"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_admMode" runat="server" Text="Cambiar a Facturador" Visible="False" Width="180px" OnClick="btn_admMode_Click" />
            </asp:Panel>
            <asp:Panel ID="PageHeader_R" runat="server" Width="620px" Height="80px" HorizontalAlign="Right" Style="float:left">
                <asp:Label ID="lbl_user" runat="server" align="right" CssClass="margin10_c" Height="51px" Text="Conectado como: " Width="180px"></asp:Label>
                <asp:Button ID="btn_logout" runat="server" CssClass="margin20" Height="40px" OnClick="btn_logout_Click" Text="Cerrar sesion" Width="120px" />
            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="PageBody" runat="server" Width="1200px" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="4px">

        </asp:Panel>
        
    </form>

</body>
</html>
