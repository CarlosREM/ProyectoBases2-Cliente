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

<body style="width: 1208px;">

    <form id="consultorMain" runat="server">
        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="1200px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px" HorizontalAlign="Center">
            <asp:Panel ID="PageHeader_L" runat="server"  Width="580px" Height="80px" HorizontalAlign="Left" Style="float:left">
                <br />
                <asp:Label ID="lbl_header" runat="server" align="left" CssClass="margin20" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Consultor"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_admMode" runat="server" Text="Cambiar a Facturador" Visible="False" Width="180px" OnClick="btn_admMode_Click" Font-Bold="True" ForeColor="Magenta" />
            </asp:Panel>
            <asp:Panel ID="PageHeader_R" runat="server" Width="620px" Height="80px" HorizontalAlign="Right" Style="float:left">
                <asp:Label ID="lbl_user" runat="server" align="right" CssClass="margin10_c" Height="51px" Text="Conectado como: " Width="180px"></asp:Label>
                <asp:Button ID="btn_logout" runat="server" CssClass="margin20" Height="40px" OnClick="btn_logout_Click" Text="Cerrar sesion" Width="120px" />
            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="PageBody" runat="server" Width="1200px" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="4px">

            <asp:Panel ID="pnl_sucursal" runat="server" Visible="False" Style="margin:20px">
                <asp:Label ID="lbl_sucursal" runat="server" Height="40px" Text="Sucursal seleccionada" ForeColor="Magenta"></asp:Label>
                <asp:DropDownList ID="cmBx_sucursal" runat="server" Width="200px" CssClass="margin10" ForeColor="Magenta">
                    <asp:ListItem>-Sucursal-</asp:ListItem>
                <asp:ListItem>default</asp:ListItem>
                <asp:ListItem Value="test">test1</asp:ListItem>
                <asp:ListItem>test2</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btn_sucursal" runat="server" CssClass="margin10" OnClick="btn_sucursal_Click" Text="Actualizar" Font-Bold="True" ForeColor="Magenta" />
            </asp:Panel>

            <asp:Button ID="btn_addAuto" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Registrar automóvil" />
            <asp:Button ID="btn_editAuto" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Editar automóvil" />
            <asp:Button ID="btn_addAuto1" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Registrar automóvil" />
            <br />
            <br />

            <br />
            <br />

            <asp:Panel ID="pnl_infoSucursal" runat="server" BackColor="Black">
                <br />
                <asp:Label ID="lbl_infoSucursal" runat="server" Text="Información de Sucursal" CssClass="margin20" ForeColor="White" Font-Size="Large" Font-Underline="true" />
                <br />
                <br />
                <asp:Label ID="lbl_distance" runat="server" CssClass="margin20" ForeColor="White" Text="Distancia de Sucursal: "></asp:Label>
                <br />
                <br />
                <asp:Label ID="lbl_horarios" runat="server" CssClass="margin20" ForeColor="White" Text="Horarios de Sucursal:"></asp:Label>
                <asp:GridView ID="gv_horarios" runat="server" BackColor="#66CCFF" BorderColor="#003399" BorderWidth="3px" CssClass="margin20">
                </asp:GridView>
                <br />
                <asp:Label ID="lbl_empleados" runat="server" CssClass="margin20" ForeColor="White" Text="Empleados de Sucursal:"></asp:Label>
                <br />
                <asp:GridView ID="gv_empleados" runat="server" BackColor="#66CCFF" BorderColor="#003399" BorderWidth="3px" CssClass="margin20">
                </asp:GridView>
                <br />
            </asp:Panel>

        </asp:Panel>
        
    </form>

</body>
</html>
