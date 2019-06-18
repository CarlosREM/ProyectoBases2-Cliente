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
        .margin5 {
            margin: 5px;
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
                <hr style="border:0px;border-top:1px solid gray;width:1000px;" />
            </asp:Panel>

            <asp:Panel ID="pnl_adminActions" runat="server" CssClass="margin20" Visible="False">
                <asp:Label ID="lbl_admin" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" ForeColor="#CC00CC" Text="Acciones de administrador:"></asp:Label>
                <br />
                <asp:Button ID="btn_addAuto" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Registrar automóvil" OnClick="btn_addAuto_Click" />
                <asp:Button ID="btn_editAuto" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Editar automóvil" OnClick="btn_editAuto_Click" />
                <br />
                <asp:Label ID="lbl_autoInfo" runat="server" Font-Overline="False" Font-Size="Large" Font-Underline="True" ForeColor="#CC00CC" Height="40px" Text="Interés:"></asp:Label>
                <asp:GridView ID="gv_interes" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#CC00CC" />
                </asp:GridView>
                <asp:Label ID="lbl_addInteres" runat="server" Height="40px" Text="Agregar Interés (ID | Nuevo valor %):" Width="260px"></asp:Label>
                <asp:TextBox ID="txtBx_idNewInteres" runat="server" CssClass="margin10" TextMode="Number" Width="70px"></asp:TextBox>
                <asp:TextBox ID="txtBx_valNewInteres" runat="server" CssClass="margin10" TextMode="Number" Width="70px"></asp:TextBox>
                <asp:Button ID="btn_addInteres" runat="server" CssClass="margin10" Font-Bold="True" ForeColor="Magenta" Text="Agregar" Width="100px" OnClick="btn_addInteres_Click" />
                <br />
                <asp:Label ID="lbl_editInteres" runat="server" Height="40px" Text="Editar Interés (ID | Nuevo valor %):" Width="260px"></asp:Label>
                <asp:TextBox ID="txtBx_idEditInteres" runat="server" CssClass="margin10" TextMode="Number" Width="70px"></asp:TextBox>
                <asp:TextBox ID="txtBx_valEditInteres" runat="server" CssClass="margin10" TextMode="Number" Width="70px"></asp:TextBox>
                <asp:Button ID="btn_editInteres" runat="server" CssClass="margin10" Font-Bold="True" ForeColor="Magenta" Text="Editar" Width="100px" OnClick="btn_editInteres_Click" />
                <hr style="border:0px;border-top:1px solid gray;width:1000px;" />
                <br />
            </asp:Panel>
            <br />
            <asp:Label ID="lbl_consultas" runat="server" CssClass="margin20" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" Text="Consultas:"></asp:Label>
            <br />
            <asp:Button ID="btn_consultInv" runat="server" CssClass="margin20" Text="Inventario de sucursal" Width="200px" OnClick="btn_consultInv_Click" />
            <asp:Panel ID="pnl_consultInv" runat="server" Visible="False" Style="padding-left:20px; padding-right:20px">
                <asp:GridView ID="gv_inventario" runat="server" BackColor="#CCFFCC" BorderColor="#009900" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#009900" />
                </asp:GridView>
            </asp:Panel>
            <br />
            <asp:Button ID="btn_consultInvGlobal" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Inventario (global)" Width="200px" OnClick="btn_consultInvGlobal_Click" Visible="False" />
            <asp:Panel ID="pnl_consultInvGlobal" runat="server" Style="padding-left:20px; padding-right:20px" Visible="False">
                <asp:GridView ID="gv_inventarioGlobal" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#CC00CC" />
                </asp:GridView>
                </asp:Panel>
            <br />
            <asp:Button ID="btn_consultVentas" runat="server" CssClass="margin20" Text="Ventas de sucursal" Width="200px" OnClick="btn_consultVentas_Click" />
            <asp:Panel ID="pnl_consultVentas" runat="server" Style="padding-left:20px; padding-right:20px" Visible="False">
                <asp:GridView ID="gv_ventas" runat="server" BackColor="#CCFFCC" BorderColor="#009900" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#009900" />
                </asp:GridView>

            </asp:Panel>
            <br />
            <asp:Button ID="btn_consultVentasGlobal" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Ventas (global)" Width="200px" OnClick="btn_consultVentasGlobal_Click" Visible="False" />
            <asp:Panel ID="pnl_consultVentasGlobal" runat="server" Style="padding-left:20px; padding-right:20px" Visible="False">
                <asp:GridView ID="gv_ventasGlobal" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#CC00CC" />
                </asp:GridView>
            </asp:Panel>
            <br />
            <asp:Button ID="btn_consultVentasXTodo" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" OnClick="btn_consultVentasXTodo_Click" Text="Ventas (especial)" Visible="False" Width="200px" />
            <asp:Panel ID="pnl_consultVentasXTodo" runat="server" Style="padding-left:20px; padding-right:20px" Visible="False">
                <asp:Label ID="lbl_VxT_FechaIni" runat="server" Height="35px" Text="Fecha Inicial:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_VxT_FI_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_VxT_FI_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_VxT_FI_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lbl_VxT_FechaFin" runat="server" Height="35px" Text="Fecha Final:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_VxT_FF_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_VxT_FF_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_VxT_FF_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Button ID="btn_VxT_fechas" runat="server" CssClass="margin5" OnClick="btn_VxT_fechas_Click" Text="Filtrar" Width="100px" />
                <br />
                <asp:GridView ID="gv_ventasXtodo" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#CC00CC" />
                </asp:GridView>
                </asp:Panel>
            <br />
            <asp:Button ID="btn_consultVTP" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Ventas x Tipo de Pago (global)" Width="300px" OnClick="btn_consultVTP_Click" Visible="False" />
            <asp:Panel ID="pnl_consultVTP" runat="server" Style="padding-left:20px; padding-right:20px" Visible="False">
                <asp:Label ID="lbl_VTP_FechaIni" runat="server" Height="35px" Text="Fecha Inicial:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_VTP_FI_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_VTP_FI_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_VTP_FI_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lbl_VTP_FechaFin" runat="server" Height="35px" Text="Fecha Final:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_VTP_FF_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_VTP_FF_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_VTP_FF_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Button ID="btn_VTP_fechas" runat="server" CssClass="margin5" OnClick="btn_VTP_fechas_Click" Text="Filtrar" Width="100px" />
                <br />
                <asp:GridView ID="gv_VTP" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#CC00CC" />
                </asp:GridView>
                </asp:Panel>
            <br />
            <asp:Button ID="btn_consultAutosMas" runat="server" CssClass="margin20" Text="Autos más vendidos" Width="200px" OnClick="btn_consultAutosMas_Click" Font-Bold="True" ForeColor="Magenta" Visible="False" />
            <asp:Panel ID="pnl_consultAutosMas" runat="server" Style="padding-left:20px; padding-right:20px" Visible="False">
                <asp:Label ID="lbl_Mas_FechaIni" runat="server" Height="35px" Text="Fecha Inicial:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_Mas_FI_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_Mas_FI_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_Mas_FI_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lbl_Mas_FechaFin" runat="server" Height="35px" Text="Fecha Final:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_Mas_FF_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_Mas_FF_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_Mas_FF_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Button ID="btn_Mas_fechas" runat="server" CssClass="margin5" OnClick="btn_Mas_fechas_Click" Text="Filtrar" Width="100px" />
                <br />
                <asp:GridView ID="gv_autosMas" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#CC00CC" />
                </asp:GridView>
                </asp:Panel>
            <br />
            <asp:Button ID="btn_consultAutosMasGlobal" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Autos más vendidos (global)" Width="300px" OnClick="btn_consultAutosMasGlobal_Click" Visible="False" />
            <asp:Panel ID="pnl_consultAutosMasGlobal" runat="server" Style="padding-left:20px; padding-right:20px" Visible="False">
                <asp:Label ID="lbl_MasG_FechaIni" runat="server" Height="35px" Text="Fecha Inicial:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_MasG_FI_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_MasG_FI_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_MasG_FI_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lbl_MasG_FechaFin" runat="server" Height="35px" Text="Fecha Final:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_MasG_FF_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_MasG_FF_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_MasG_FF_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Button ID="btn_MasG_fechas" runat="server" CssClass="margin5" OnClick="btn_MasG_fechas_Click" Text="Filtrar" Width="100px" />
                <br />
                <asp:GridView ID="gv_autosMasGlobal" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#CC00CC" />
                </asp:GridView>
                </asp:Panel>
            <br />
            <asp:Button ID="btn_consultAutosMenos" runat="server" CssClass="margin20" Text="Autos menos vendidos" Width="200px" OnClick="btn_consultAutosMenos_Click" Font-Bold="True" ForeColor="Magenta" Visible="False" />
            <asp:Panel ID="pnl_consultAutosMenos" runat="server" Style="padding-left:20px; padding-right:20px" Visible="False">
                <asp:Label ID="lbl_Menos_FechaIni" runat="server" Height="35px" Text="Fecha Inicial:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_Menos_FI_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_Menos_FI_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_Menos_FI_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lbl_Menos_FechaFin" runat="server" Height="35px" Text="Fecha Final:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_Menos_FF_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_Menos_FF_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_Menos_FF_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Button ID="btn_Menos_fechas" runat="server" CssClass="margin5" OnClick="btn_Menos_fechas_Click" Text="Filtrar" Width="100px" />
                <br />
                <asp:GridView ID="gv_autosMenos" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#CC00CC" />
                </asp:GridView>
                </asp:Panel>
            <br />
            <asp:Button ID="btn_consultAutosMenosGlobal" runat="server" CssClass="margin20" Font-Bold="True" ForeColor="Magenta" Text="Autos menos vendidos (global)" Width="300px" OnClick="btn_consultAutosMenosGlobal_Click" Visible="False" />
            <asp:Panel ID="pnl_consultAutosMenosGlobal" runat="server" Style="padding-left:20px; padding-right:20px" Visible="False">
                <asp:Label ID="lbl_MenosG_FechaIni" runat="server" Height="35px" Text="Fecha Inicial:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_MenosG_FI_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_MenosG_FI_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_MenosG_FI_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lbl_MenosG_FechaFin" runat="server" Height="35px" Text="Fecha Final:" Width="120px"></asp:Label>
                <asp:DropDownList ID="cmBx_MenosG_FF_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px">
                    <asp:ListItem>-Dia-</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_MenosG_FF_mes" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="65px">
                    <asp:ListItem Value="00">-Mes-</asp:ListItem>
                    <asp:ListItem Value="01">Ene</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Abr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Ago</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dic</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="cmBx_MenosG_FF_anho" runat="server" AutoPostBack="True" CssClass="margin5" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Style="padding:3px" Width="70px">
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Button ID="btn_MenosG_fechas" runat="server" CssClass="margin5" OnClick="btn_MenosG_fechas_Click" Text="Filtrar" Width="100px" />
                <br />
                <asp:GridView ID="gv_autosMenosGlobal" runat="server" BackColor="#FFCCFF" BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="3px">
                    <HeaderStyle BackColor="#CC00CC" />
                </asp:GridView>
                </asp:Panel>

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
