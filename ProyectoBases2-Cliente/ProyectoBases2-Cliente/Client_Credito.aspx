<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Client_Credito.aspx.cs" Inherits="ProyectoBases2_Cliente.Client_Credito" Culture="es-CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pago de Crédito - Cliente</title>
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
        .margin5 {
            margin: 5px;
        }
    </style>
</head>

<body style="width: 1208px;">

    <form id="clientCredito" runat="server">
        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="1200px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px">
            <asp:Panel ID="PageHeader_L" runat="server"  Width="580px" Height="80px" HorizontalAlign="Left" Style="float:left">
                <br />
                <asp:Label ID="lbl_header" runat="server" align="left" CssClass="margin20" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Pago de Crédito"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="PageHeader_R" runat="server" Width="620px" Height="80px" HorizontalAlign="Right" Style="float:left">
                <asp:Label ID="lbl_user" runat="server" align="right" CssClass="margin10_c" Height="51px" Text="Conectado como: " Width="180px"></asp:Label>
                <asp:Button ID="btn_logout" runat="server" CssClass="margin20" Height="40px" OnClick="btn_logout_Click" Text="Cerrar sesion" Width="120px" />
            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="PageBody" runat="server" Width="1160px" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="4px" Style="padding:20px">
            <asp:Button ID="btn_atras" runat="server" Text="&lt; Atrás" OnClick="btn_atras_Click" />

            <br />
            <br />
            <asp:Label ID="lbl_credito" runat="server" Height="35px" Text="Crédito ID: " Width="100px"></asp:Label>
            <asp:TextBox ID="txtBx_credito" runat="server" CssClass="margin5"></asp:TextBox>

            <br />
            <br />
            <asp:Label ID="lbl_infoPago" runat="server" Font-Overline="False" Font-Size="Large" Font-Underline="True" Height="40px" Text="Información de Pago:"></asp:Label>
            <br />
            <asp:Label ID="lbl_metodoPago" runat="server" Height="35px" Text="Método de Pago:"></asp:Label>
            <asp:DropDownList ID="cmBx_metodoPago" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_metodoPago_SelectedIndexChanged" Width="120px">
                <asp:ListItem>-Tipo-</asp:ListItem>
                <asp:ListItem Value="2">Tarjeta</asp:ListItem>
                <asp:ListItem Value="1">Efectivo</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="lbl_numTarjeta" runat="server" Height="35px" Text="Núm. Tarjeta:" Visible="False"></asp:Label>
            <asp:TextBox ID="txtBx_numTarjeta" runat="server" CssClass="margin5" TextMode="Number" Visible="False" Width="250px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl_codSeg" runat="server" Height="35px" Text="Código de Seguridad:" Visible="False"></asp:Label>
            <asp:TextBox ID="txtBx_codSeg" runat="server" CssClass="margin5" MaxLength="4" Visible="False" Width="50px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl_fechaVenc" runat="server" Height="35px" Text="Fecha venc. (mm/yy):" Visible="False"></asp:Label>
            <asp:TextBox ID="txtBx_fechaVenc" runat="server" CssClass="margin5" MaxLength="5" Visible="False" Width="70px"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_montoPago" runat="server" Height="35px" Text="Monto a pagar:"></asp:Label>
            <asp:TextBox ID="txtBx_montoPago" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_procesar" runat="server" Font-Bold="True" Font-Size="Medium" Height="50px" OnClick="btn_procesar_Click" Text="PROCESAR PAGO" Width="375px" />

        </asp:Panel>

    </form>
</body>
</html>
