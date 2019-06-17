<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Client_Historial.aspx.cs" Inherits="ProyectoBases2_Cliente.Client_Historial" Culture="es-CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Historial de Compras - Cliente</title>
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

<body style="width: 1208px;">

    <form id="clientHistorial" runat="server">
        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="1200px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px">
            <asp:Panel ID="PageHeader_L" runat="server"  Width="580px" Height="80px" HorizontalAlign="Left" Style="float:left">
                <br />
                <asp:Label ID="lbl_header" runat="server" align="left" CssClass="margin20" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Historial de Ventas"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="PageHeader_R" runat="server" Width="620px" Height="80px" HorizontalAlign="Right" Style="float:left">
                <asp:Label ID="lbl_user" runat="server" align="right" CssClass="margin10_c" Height="51px" Text="Conectado como: " Width="180px"></asp:Label>
                <asp:Button ID="btn_logout" runat="server" CssClass="margin20" Height="40px" OnClick="btn_logout_Click" Text="Cerrar sesion" Width="120px" />
            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="PageBody" runat="server" Width="1160px" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="4px" Style="padding:20px">
            <asp:Button ID="btn_atras" runat="server" Text="&lt; Atrás" OnClick="btn_atras_Click" />
            <asp:Panel ID="pnl_historial" runat="server" Width="580px" Style="float:left" HorizontalAlign="Center">
                
                <asp:Label ID="lbl_historial" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" Text="Historial de Compras"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="gv_historial" runat="server" BackColor="#B5E7FF">
                    <HeaderStyle BackColor="#0099FF" />
                </asp:GridView>
                <br />
                <br />
                
            </asp:Panel>
            <asp:Panel ID="pnl_creditos" runat="server" Width="580px" Style="float:left" HorizontalAlign="Center">
                <asp:Label ID="lbl_bienvenido0" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" Text="Créditos Pendientes"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="gv_creditos" runat="server" BackColor="#FFFFCC">
                    <HeaderStyle BackColor="#FFCC66" />
                </asp:GridView>
                <br />
                <br />
                <br />
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
