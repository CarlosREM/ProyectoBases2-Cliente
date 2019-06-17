<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Facturador_Credito.aspx.cs" Inherits="ProyectoBases2_Cliente.Facturador_Credito" Culture="es-CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu Principal - Facturador</title>
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
    <form id="facturadorCredito" runat="server">

        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="1200px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px" HorizontalAlign="Center">
            <asp:Panel ID="PageHeader_L" runat="server"  Width="580px" Height="80px" HorizontalAlign="Left" Style="float:left">
                <br />
                <asp:Label ID="lbl_header" runat="server" align="left" CssClass="margin20" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Facturador"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_admMode" runat="server" Text="Cambiar a Consultor" Visible="False" Width="180px" OnClick="btn_admMode_Click" Font-Bold="True" ForeColor="Magenta" />
            </asp:Panel>
            <asp:Panel ID="PageHeader_R" runat="server" Width="620px" Height="80px" HorizontalAlign="Right" Style="float:left">
                <asp:Label ID="lbl_user" runat="server" align="right" CssClass="margin10_c" Height="51px" Text="Conectado como: " Width="180px"></asp:Label>
                <asp:Button ID="btn_logout" runat="server" CssClass="margin20" Height="40px" OnClick="btn_logout_Click" Text="Cerrar sesion" Width="120px" />
            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="PageBody" runat="server" Width="1160px" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="4px" Style="padding:20px">
            <asp:Label ID="lbl_title" runat="server" Font-Bold="True" Font-Size="Larger" Font-Underline="True" Text="Pago de Crédito" Height="40px"></asp:Label>
            <asp:Button ID="btn_switchScreen" runat="server" Font-Size="Medium" Height="40px" Style="margin-left:750px;" Text="Procesar Venta" Width="220px" OnClick="btn_switchScreen_Click" />
            <br />
            <br />
            <asp:Label ID="lbl_clientInfo" runat="server" Font-Overline="False" Font-Size="Large" Font-Underline="True" Height="40px" Text="Información de Cliente:"></asp:Label>
            <br />
            <asp:Label ID="lbl_cedula" runat="server" Height="35px" Text="Cédula:" Width="75px"></asp:Label>
            <asp:TextBox ID="txtBx_cedula" runat="server" CssClass="margin5"></asp:TextBox>
            <asp:Button ID="btn_findClient" runat="server" CssClass="margin5" Text="Buscar cliente" OnClick="btn_findClient_Click" />
            <br />
            <asp:Label ID="lbl_nombre" runat="server" Height="35px" Text="Nombre:" Width="75px"></asp:Label>
            <asp:TextBox ID="txtBx_nombre" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="lbl_apellido" runat="server" Height="35px" Text="Apellido:"></asp:Label>
            <asp:TextBox ID="txtBx_apellido" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            <hr style="border:0px;border-top:1px solid gray;width:1000px;" />
            <br />
            <asp:Label ID="lbl_creditos" runat="server" Font-Overline="False" Font-Size="Large" Font-Underline="True" Height="40px" Text="Créditos Pendientes"></asp:Label>
            <asp:Panel ID="pnl_noCreditos" runat="server" HorizontalAlign="Center" Visible="False">
                <asp:Label ID="lbl_noCreditos" runat="server" Font-Italic="True" ForeColor="Gray" Text="- No se encontraron créditos para este usuario - "></asp:Label>
                
            </asp:Panel>

            <asp:Panel ID="pnl_creditos" runat="server" HorizontalAlign="Center" Visible="False">
                <asp:GridView ID="gv_creditos" runat="server" BackColor="#CCEEDD">
                    <HeaderStyle BackColor="#339966" BorderColor="Black" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>

            </asp:Panel>
            <br />
            <asp:Panel ID="pnl_pago" runat="server" Visible="False">
                <asp:Label ID="lbl_clientInfo0" runat="server" Font-Overline="False" Font-Size="Large" Font-Underline="True" Height="40px" Text="Información de Pago:"></asp:Label>
                <br />
                <asp:Label ID="lbl_metodoPago" runat="server" Height="35px" Text="Método de Pago:"></asp:Label>
                <asp:DropDownList ID="cmBx_metodoPago" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_metodoPago_SelectedIndexChanged" Width="120px">
                    <asp:ListItem>-Tipo-</asp:ListItem>
                    <asp:ListItem Value="2">Tarjeta</asp:ListItem>
                    <asp:ListItem Value="1">Efectivo</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="lbl_numTarjeta" runat="server" Height="35px" Text="Núm. Tarjeta:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtBx_numTarjeta" runat="server" CssClass="margin5" Visible="False" Width="250px"></asp:TextBox>
                <asp:Label ID="lbl_codSeg" runat="server" Height="35px" Text="Código de Seguridad:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtBx_codSeg" runat="server" CssClass="margin5" Visible="False"></asp:TextBox>
                <asp:Label ID="lbl_fechaVenc" runat="server" Height="35px" Text="Fecha venc.:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtBx_fechaVenc" runat="server" CssClass="margin5" Visible="False"></asp:TextBox>
                <br />
                <asp:Button ID="btn_cancel" runat="server" Height="70px" OnClientClick="return confirm('Desea limpiar la informacion?');" OnClick="btn_cancel_Click" Text="Cancelar pago" Width="150px" />
                <asp:Button ID="btn_procesar" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" Height="70px" OnClick="btn_procesar_Click" Style="margin-left:100px" Text="PROCESAR PAGO" Width="825px" />
                
            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
