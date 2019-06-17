<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacturadorMain.aspx.cs" Inherits="ProyectoBases2_Cliente.FacturadorMain" Culture="es-CR" %>

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
    <form id="facturadorMain" runat="server">

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

            <asp:Panel ID="pnl_sucursal" runat="server" Visible="False">
                <asp:Label ID="lbl_sucursal" runat="server" Height="40px" Text="Sucursal seleccionada" ForeColor="Magenta"></asp:Label>
                <asp:DropDownList ID="cmBx_sucursal" runat="server" Width="200px" CssClass="margin10" ForeColor="Magenta">
                    <asp:ListItem>-Sucursal-</asp:ListItem>
                <asp:ListItem>default</asp:ListItem>
                <asp:ListItem Value="test">test1</asp:ListItem>
                <asp:ListItem>test2</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btn_sucursal" runat="server" CssClass="margin10" OnClick="btn_sucursal_Click" Text="Actualizar" Font-Bold="True" ForeColor="Magenta" />
            </asp:Panel>
            <asp:Label ID="lbl_title" runat="server" Font-Bold="True" Font-Size="Larger" Font-Underline="True" Text="Procesando compra" Height="40px"></asp:Label>
            <asp:Button ID="btn_switchScreen" runat="server" Text="Realizar pago Crédito" Style="margin-left:700px;" Font-Size="Medium" Height="40px" Width="220px" OnClick="btn_switchScreen_Click"/>
            <br />
            <asp:Label ID="lbl_clientInfo" runat="server" Font-Overline="False" Font-Size="Large" Font-Underline="True" Height="40px" Text="Información de Cliente:"></asp:Label>
            &nbsp;
            <br />
            <asp:Label ID="lbl_cedula" runat="server" Height="35px" Text="Cédula:" Width="75px"></asp:Label>
            <asp:TextBox ID="txtBx_cedula" runat="server" CssClass="margin5" TextMode="Number"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btn_findClient" runat="server" CssClass="margin5" Text="Buscar cliente" OnClick="btn_findClient_Click" />
            <br />
            <asp:Label ID="lbl_nombre" runat="server" Height="35px" Text="Nombre:" Width="75px"></asp:Label>
            <asp:TextBox ID="txtBx_nombre" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Label ID="lbl_apellido" runat="server" Height="35px" Text="Apellido:"></asp:Label>
            <asp:TextBox ID="txtBx_apellido" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_registerClient" runat="server" Font-Size="Small" Text="¿No encuentra los datos?"></asp:Label>
            <asp:HyperLink ID="hl_registerClient" runat="server" CssClass="margin10" Font-Size="Small" NavigateUrl="~/Facturador_Register.aspx">Registrar cliente</asp:HyperLink>
            <br />
            <hr style="border:0px;border-top:1px solid gray;width:1000px;" />
            <br />
            <asp:Label ID="lbl_autoInfo" runat="server" Font-Overline="False" Font-Size="Large" Font-Underline="True" Height="40px" Text="Información de Automóvil:"></asp:Label>
            <br />
            <asp:Label ID="lbl_autoID" runat="server" Height="35px" Text="ID Inventario:"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtBx_autoID" runat="server" CssClass="margin5" TextMode="Number"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Button ID="btn_findAuto" runat="server" CssClass="margin5" OnClick="btn_findAuto_Click" Text="Buscar auto" />
            <br />
            <asp:Label ID="lbl_marca" runat="server" Height="35px" Text="Marca:"></asp:Label>
            <asp:TextBox ID="txtBx_marca" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lbl_modelo" runat="server" Height="35px" Text="Modelo:"></asp:Label>
            <asp:TextBox ID="txtBx_modelo" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lbl_anho" runat="server" Height="35px" Text="Año:"></asp:Label>
            <asp:TextBox ID="txtBx_anho" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            &nbsp;&nbsp;<asp:Label ID="lbl_tipo" runat="server" Height="35px" Text="Tipo:"></asp:Label>
            <asp:TextBox ID="txtBx_tipo" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_caracteristicas" runat="server" Text="Lista de Características:"></asp:Label>
            <br />
            <asp:TextBox ID="txtBx_caracteristicas" runat="server" CssClass="margin5" Height="200px" ReadOnly="True" TextMode="MultiLine" Width="475px"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_precio" runat="server" Height="35px" Style="margin-left:500px" Text="Precio total:"></asp:Label>
            <asp:TextBox ID="txtBx_precio" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            <br />
            <hr style="border:0px;border-top:1px solid gray;width:1000px;" />
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_codSeg" runat="server" Height="35px" Text="Código de Seguridad:" Visible="False"></asp:Label>
            <asp:TextBox ID="txtBx_codSeg" runat="server" CssClass="margin5" MaxLength="4" Visible="False" Width="50px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl_fechaVenc" runat="server" Height="35px" Text="Fecha venc. (mm/yy):" Visible="False"></asp:Label>
            <asp:TextBox ID="txtBx_fechaVenc" runat="server" CssClass="margin5" Visible="False" MaxLength="5" Width="70px"></asp:TextBox>
            <br />
            <asp:CheckBox ID="chkBx_credito" runat="server" AutoPostBack="true" Height="35px" OnCheckedChanged="chkBx_credito_CheckedChanged" Text="Comprar a Crédito" />
            &nbsp;<asp:Label ID="lbl_interes" runat="server" Height="35px" Style="margin-left:100px" Text="Interés:" Visible="False"></asp:Label>
            <asp:DropDownList ID="cmBx_interes" runat="server" CssClass="margin5" Width="120px" Visible="False" AutoPostBack="True">
                <asp:ListItem Value="0">-Interes-</asp:ListItem>
                <asp:ListItem Value="1">1%</asp:ListItem>
                <asp:ListItem Value="2">2%</asp:ListItem>
                <asp:ListItem Value="3">3%</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="lbl_montoPago" runat="server" Height="35px" Text="Monto a pagar:"></asp:Label>
            <asp:TextBox ID="txtBx_montoPago" runat="server" CssClass="margin5" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_cancel" runat="server" Text="Cancelar compra" Height="70px" Width="150px" OnClientClick="return confirm('Desea limpiar la informacion?');" OnClick="btn_cancel_Click" />
            <asp:Button ID="btn_procesar" runat="server" Text="PROCESAR COMPRA" Style="margin-left:100px" Font-Bold="True" Font-Size="Large" Font-Underline="True" Height="70px" Width="825px" OnClick="btn_procesar_Click"/>

        </asp:Panel>
        
    </form>

</body>
</html>
