<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPage.aspx.cs" Inherits="ProyectoBases2_Cliente.OrderPage" Culture="es-CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ordenar automovil</title>
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

    <form id="orderPage" runat="server">
        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="1200px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px">
            <asp:Panel ID="PageHeader_L" runat="server"  Width="580px" Height="80px" HorizontalAlign="Left" Style="float:left">
                <br />
                <asp:Label ID="lbl_header" runat="server" align="left" CssClass="margin20" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Realizar pedido"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="PageHeader_R" runat="server" Width="620px" Height="80px" HorizontalAlign="Right" Style="float:left">
                <asp:Label ID="lbl_user" runat="server" align="right" CssClass="margin10_c" Height="51px" Text="Conectado como: " Width="180px"></asp:Label>
                <asp:Button ID="btn_logout" runat="server" CssClass="margin20" Height="40px" OnClick="btn_logout_Click" Text="Cerrar sesion" Width="120px" />
            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="PageBody" runat="server" Width="1160px" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="4px" Style="padding:20px">
            <asp:Button ID="btn_back" runat="server" Text="&lt; Volver a Menu" Width="150px" OnClick="btn_back_Click" />
            <br />

            <br />
            <asp:Label ID="Label1" runat="server" Font-Size="Larger" Font-Underline="True" Text="Información del pedido" />
            <br />
            <br />
            <asp:Label ID="lbl_marca" runat="server" CssClass="margin5" Height="35px" Text="Marca:" Width="100px" Style="text-align:right"/>
            <asp:TextBox ID="txtBx_marca" runat="server" CssClass="margin5"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_modelo" runat="server" CssClass="margin5" Height="35px" Text="Modelo:" Width="100px" Style="text-align:right"/>
            <asp:TextBox ID="txtBx_modelo" runat="server" CssClass="margin5"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_anho" runat="server" CssClass="margin5" Height="35px" Text="Año:" Width="100px" Style="text-align:right"/>
            <asp:TextBox ID="txtBx_anho" runat="server" CssClass="margin5"></asp:TextBox>
            <asp:CompareValidator ID="compVal_anho" runat="server" ErrorMessage="#!" ControlToValidate="txtBx_anho" Font-Bold="True" ForeColor="Red" Height="35px" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="margin10" Font-Size="Small" ForeColor="Gray" Height="50px" Text="El pedido se enviará a la última Sucursal seleccionada en el menú. Si desea cambiarla, retroceda y vuelva a llenar los espacios." Width="450px"></asp:Label>
            <br />
            <asp:Button ID="btn_order" runat="server" Font-Size="Medium" Text="Enviar pedido" Style="margin-left:115px" Height="40px" Width="170px" OnClick="btn_order_Click"/>
            <br />

        </asp:Panel>
    </form>
</body>
</html>
