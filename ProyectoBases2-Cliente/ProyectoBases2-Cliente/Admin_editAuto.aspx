<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_editAuto.aspx.cs" Inherits="ProyectoBases2_Cliente.Admin_editAuto"  Culture="es-CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Editar auto - Administrador</title>
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

    <form id="adminEditAuto" runat="server">
        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="1200px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px" HorizontalAlign="Center">
            <asp:Panel ID="PageHeader_L" runat="server"  Width="580px" Height="80px" HorizontalAlign="Left" Style="float:left">
                <br />
                <asp:Label ID="lbl_header" runat="server" align="left" CssClass="margin20" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Editar Auto"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_admMode" runat="server" Text="Cambiar a Facturador" Visible="False" Width="180px" OnClick="btn_admMode_Click" Font-Bold="True" ForeColor="Magenta" />
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
            <br />
            <asp:Label ID="lbl_autoID" runat="server" Height="35px" Text="ID Inventario:"></asp:Label>
            <asp:TextBox ID="txtBx_autoID" runat="server" CssClass="margin5" TextMode="Number"></asp:TextBox>
            <asp:Button ID="btn_findAuto" runat="server" CssClass="margin5" OnClick="btn_findAuto_Click" Text="Buscar auto" />
            <br />
            <br />
            <asp:Label ID="lbl_caracteristicas" runat="server" Text="Lista de Características:"></asp:Label>
            <br />
            <asp:TextBox ID="txtBx_caracteristicas" runat="server" CssClass="margin5" Height="200px" ReadOnly="True" TextMode="MultiLine" Width="475px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_toAgregar" runat="server" Font-Size="Medium" Height="50px" Text="Agregar Característica" Width="300px" OnClick="btn_toAgregar_Click" />
            <asp:Button ID="btn_toEditar" runat="server" Font-Size="Medium" Height="50px" Text="Editar Característica" Width="300px" Style="margin-left:125px; margin-right:125px" OnClick="btn_toEditar_Click"/>
            <asp:Button ID="btn_toBorrar" runat="server" Font-Size="Medium" Height="50px" Text="Borrar Característica" Width="300px" OnClick="btn_toBorrar_Click" />

            <br />

            <br />
            <asp:Panel ID="pnl_agregar" runat="server" Style="margin-left:2px; margin-right:2px" Visible="False">
                <asp:Label ID="lbl_agregarNombre" runat="server" Height="40px" Text="Nombre de Característica:"></asp:Label>
                <asp:TextBox ID="txtBx_agregarNombre" runat="server" CssClass="margin10" Width="200px"></asp:TextBox>
                <asp:Label ID="lbl_agregarValor" runat="server" Height="40px" Text="Valor de Característica:" Style="margin-left:30px"></asp:Label>
                <asp:TextBox ID="txtBx_agregarValor" runat="server" CssClass="margin10" Width="200px"></asp:TextBox>
                <asp:Button ID="btn_agregar" runat="server" Font-Size="Large" OnClick="btn_editar_Click" Style="margin-left:505px; margin-right:505px" Text="Agregar" Width="150px" />
                <br />
            </asp:Panel>
            <asp:Panel ID="pnl_editar" runat="server" Style="margin-left:2px; margin-right:2px" Visible="False">
                <asp:Label ID="lbl_editarNombre" runat="server" Height="40px" Text="Nombre de Característica:"></asp:Label>
                <asp:TextBox ID="txtBx_editarNombre" runat="server" CssClass="margin10" Width="200px"></asp:TextBox>
                <asp:Label ID="lbl_editarValor" runat="server" Height="40px" Style="margin-left:30px" Text="Valor nuevo de Característica:"></asp:Label>
                <asp:TextBox ID="txtBx_editarValor" runat="server" CssClass="margin10" Width="200px"></asp:TextBox>
                <asp:Button ID="btn_editar" runat="server" Font-Size="Large" OnClick="btn_editar_Click" Style="margin-left:505px; margin-right:505px" Text="Editar" Width="150px" />
                <br />
            </asp:Panel>
            <asp:Panel ID="pnl_borrar" runat="server" Style="margin-left:2px; margin-right:2px" Visible="False">
                <asp:Label ID="lbl_borrarNombre" runat="server" Height="40px" Text="Nombre de Característica:"></asp:Label>
                <asp:TextBox ID="txtBx_borrarNombre" runat="server" CssClass="margin10" Width="200px"></asp:TextBox>
                <asp:Button ID="btn_borrar" runat="server" Font-Size="Large" OnClick="btn_editar_Click" Style="margin-left:505px; margin-right:505px" Text="Borrar" Width="150px" />
                <br />
            </asp:Panel>

            <br />

            <asp:Button ID="btn_guardar" runat="server" Font-Size="Medium" Height="50px" Text="Guardar Cambios" Width="300px" Style="margin-left:430px; margin-right:430px" OnClick="btn_guardar_Click"/>

        </asp:Panel>
    </form>
</body>
</html>
