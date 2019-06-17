<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientMain.aspx.cs" Inherits="ProyectoBases2_Cliente.ClientMain" Culture="es-CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu Principal - Cliente</title>
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

    <form id="clientMain" runat="server">
        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="1200px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px">
            <asp:Panel ID="PageHeader_L" runat="server"  Width="580px" Height="80px" HorizontalAlign="Left" Style="float:left">
                <br />
                <asp:Label ID="lbl_header" runat="server" align="left" CssClass="margin20" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="Menu Principal"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="PageHeader_R" runat="server" Width="620px" Height="80px" HorizontalAlign="Right" Style="float:left">
                <asp:Label ID="lbl_user" runat="server" align="right" CssClass="margin10_c" Height="51px" Text="Conectado como: " Width="180px"></asp:Label>
                <asp:Button ID="btn_logout" runat="server" CssClass="margin20" Height="40px" OnClick="btn_logout_Click" Text="Cerrar sesion" Width="120px" />
            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="PageBody" runat="server" Width="1200px" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="4px">
            <asp:Label ID="lbl_sucursal" runat="server" CssClass="margin10" Height="40px" Text="Sucursal seleccionada"></asp:Label>
            <asp:DropDownList ID="cmBx_sucursal" runat="server" CssClass="margin10" Width="200px">
                <asp:ListItem>default</asp:ListItem>
                <asp:ListItem Value="test">test1</asp:ListItem>
                <asp:ListItem>test2</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="btn_sucursal" runat="server" Text="Actualizar" CssClass="margin10" OnClick="btn_sucursal_Click" />

            <asp:Button ID="btn_historial" runat="server" Text="Ver historial de compras" style="margin-left:450px;" Width="200px" CssClass="margin10" OnClick="btn_historial_Click"/>
            <br />
            <br />

            <asp:Label ID="lbl_bienvenido" runat="server" CssClass="margin20" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" Text="Bienvenido, "></asp:Label>
            <br />

            <asp:Button ID="btn_usarFiltro" runat="server" CssClass="margin20" Text="Usar filtro" Width="100px" OnClick="btn_usarFiltro_Click" />
            <asp:Panel ID="pnl_filtro" runat="server" Style="margin-left:20px; margin-right:20px; padding:10px;" BackColor="#B3EAC8" BorderColor="#339966" BorderStyle="Dashed" Visible="False" BorderWidth="2px">
                
                <asp:RadioButton ID="rdBtn_marca" runat="server" Text="Marca" Checked="True" Height="30px" Width="100px" GroupName="filter" AutoPostBack="true"/>
                <asp:TextBox ID="txtBx_marca" runat="server"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:RadioButton ID="rdBtn_modelo" runat="server" Text="Modelo" Height="30px" Width="100px" GroupName="filter" AutoPostBack="true"/>
                <asp:TextBox ID="txtBx_modelo" runat="server" Enabled="False"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:RadioButton ID="rdBtn_anho" runat="server" Text="Año" Height="30px" Width="80px" GroupName="filter" AutoPostBack="true"/>
                <asp:TextBox ID="txtBx_anho" runat="server" Enabled="False"></asp:TextBox>
                <asp:CompareValidator ID="compVal_anho" runat="server" ControlToValidate="txtBx_anho" CssClass="margin10" ErrorMessage="#!" Font-Bold="True" ForeColor="Red" Height="30px" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <asp:RadioButton ID="rdBtn_tipo" runat="server" AutoPostBack="true" GroupName="filter" Height="30px" Text="Tipo" Width="80px" />
                <asp:TextBox ID="txtBx_tipo" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <br />
                <asp:RadioButton ID="rdBtn_precio" runat="server" AutoPostBack="true" GroupName="filter" Height="30px" Text="Precio base (min. | max.)" Width="280px" />
                <asp:TextBox ID="txtBx_precioMin" runat="server" Enabled="False"></asp:TextBox>
                &nbsp;<asp:CompareValidator ID="compVal_precioMin" runat="server" ControlToValidate="txtBx_precioMin" CssClass="margin10" ErrorMessage="#!" Font-Bold="True" ForeColor="Red" Height="30px" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <asp:TextBox ID="txtBx_precioMax" runat="server" Enabled="False"></asp:TextBox>
                &nbsp;<asp:CompareValidator ID="compVal_precioMax" runat="server" ControlToValidate="txtBx_precioMax" CssClass="margin10" ErrorMessage="#!" Font-Bold="True" ForeColor="Red" Height="30px" Operator="DataTypeCheck" Type="Integer" ValidateRequestMode="Enabled"></asp:CompareValidator>
                <br />
                <asp:RadioButton ID="rdBtn_caracteristica" runat="server" AutoPostBack="true" GroupName="filter" Height="30px" Text="Caracteristica (nombre | valor)" Width="280px" />
                <asp:TextBox ID="txtBx_caractName" runat="server" Enabled="False"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtBx_caractValue" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <asp:Button ID="btn_filtro" runat="server" CssClass="margin10" Text="Filtrar resultados" Width="200px" OnClick="btn_filtro_Click" />
            </asp:Panel>

            <br />
            <asp:Panel ID="pnl_carros" runat="server" Style="padding:10px" CssClass="margin20">
                holi aqui van los carros</asp:Panel>
            <br />

            <asp:Label ID="lbl_order" runat="server" Text="¿No ves algo que te interese?" CssClass="margin20"></asp:Label>


            <asp:HyperLink ID="hl_order" runat="server" NavigateUrl="~/OrderPage.aspx">Ordénalo</asp:HyperLink>


            <br />
            <asp:Label ID="lbl_orderTip" runat="server" CssClass="margin20" Font-Size="X-Small" ForeColor="Gray" Height="40px" Text="Asegúrate de revisar todas las sucursales antes de realizar un pedido." Style="text-anchor:middle"></asp:Label>


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
                <asp:GridView ID="gridHorarios" runat="server" BackColor="#66CCFF" BorderColor="#003399" BorderWidth="3px" CssClass="margin20">
                </asp:GridView>
                <br />
                <asp:Label ID="lbl_empleados" runat="server" CssClass="margin20" ForeColor="White" Text="Empleados de Sucursal:"></asp:Label>
                <br />
                <asp:GridView ID="gridEmpleados" runat="server" BackColor="#66CCFF" BorderColor="#003399" BorderWidth="3px" CssClass="margin20">
                </asp:GridView>
                <br />
            </asp:Panel>


        </asp:Panel>
        
    </form>

</body>
</html>
