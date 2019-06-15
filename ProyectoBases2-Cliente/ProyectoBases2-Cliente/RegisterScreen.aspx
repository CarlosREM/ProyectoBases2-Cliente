<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterScreen.aspx.cs" Inherits="ProyectoBases2_Cliente.RegisterScreen" Culture="es-CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro de Clientes</title>
    <style>
        .margin10 {
            margin: 10px;
        }
        .margin10_r {
            margin: 10px;
            text-align: right;
            text-anchor: middle;
        }
        .margin5 {
            margin: 5px;
        }
        .margin5_r {
            margin: 5px;
            text-align: right;
            text-anchor: middle;
        }
    </style>
</head>

<body style="height: 696px; width: 608px;">
    
    <form id="registerScreen" runat="server">
        <asp:Panel ID="PageHeader" runat="server" Height="80px" Width="600px" BackColor="#339966" BorderColor="#006600" BorderStyle="Ridge" BorderWidth="4px">
            <br />
            <asp:Label ID="lbl_header" runat="server" Text="Registro de Usuario" CssClass="margin10" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="PageBody" runat="server" Height="600px" Width="600px" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="4px" HorizontalAlign="Left" Font-Size="Large">
            <br />
            <asp:Label ID="lbl_userType" runat="server" Text="Introduzca sus datos en el campo que corresponda." CssClass="margin10_r" Font-Size="Large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lbl_nombre" runat="server" CssClass="margin5_r" Height="40px" Text="Nombre y Apellido:" Width="150px" Font-Size="Medium"></asp:Label>
            <asp:TextBox ID="txtBx_nombre" runat="server" CssClass="margin5" Height="25px" Width="130px"></asp:TextBox>
            <asp:TextBox ID="txtBx_apellido" runat="server" CssClass="margin5" Height="25px" Width="130px"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_cedula" runat="server" CssClass="margin5_r" Height="40px" Text="Cédula:" Font-Size="Medium" Width="150px"></asp:Label>
            <asp:TextBox ID="txtBx_cedula" runat="server" CssClass="margin5" Height="25px" Width="280px" ToolTip="Solo numeros"></asp:TextBox>
            <asp:CompareValidator ID="compVal_cedula" runat="server" ControlToValidate="txtBx_cedula" CssClass="margin5" ErrorMessage="#!" Font-Bold="True" ForeColor="Red" Height="40px" Operator="DataTypeCheck" Type="Integer" Width="20px"></asp:CompareValidator>
            <br />
            <asp:Label ID="lbl_fechaNac" runat="server" CssClass="margin5_r" Height="40px" Text="Fecha de nacimiento:" Font-Size="Medium" Width="150px"></asp:Label>
            <asp:DropDownList ID="cmBx_dia" runat="server" CssClass="margin5" Style="padding:3px" Width="65px" >
                <asp:ListItem>-Dia-</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="cmBx_mes" runat="server" CssClass="margin5" Style="padding:3px"  OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" Width="65px" AutoPostBack="True" >
                <asp:ListItem Value="0">-Mes-</asp:ListItem>
                <asp:ListItem Value="1">Ene</asp:ListItem>
                <asp:ListItem Value="2">Feb</asp:ListItem>
                <asp:ListItem Value="3">Mar</asp:ListItem>
                <asp:ListItem Value="4">Abr</asp:ListItem>
                <asp:ListItem Value="5">May</asp:ListItem>
                <asp:ListItem Value="6">Jun</asp:ListItem>
                <asp:ListItem Value="7">Jul</asp:ListItem>
                <asp:ListItem Value="8">Ago</asp:ListItem>
                <asp:ListItem Value="9">Sep</asp:ListItem>
                <asp:ListItem Value="10">Oct</asp:ListItem>
                <asp:ListItem Value="11">Nov</asp:ListItem>
                <asp:ListItem Value="12">Dic</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="cmBx_anho" runat="server" CssClass="margin5" Style="padding:3px" Width="70px" OnSelectedIndexChanged="cmBx_mes_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <asp:Label runat="server" CssClass="margin5_r" Font-Size="Medium" Height="40px" Text="Correo:" Width="150px" ID="lbl_correo"></asp:Label>
            <asp:TextBox ID="txtBx_correo" runat="server" CssClass="margin5" Height="25px" Width="280px"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_telefono" runat="server" CssClass="margin5_r" Font-Size="Medium" Height="40px" Text="Núm. Teléfono:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtBx_telefono" runat="server" CssClass="margin5" Height="25px" Width="280px"></asp:TextBox>
            <asp:CompareValidator ID="compVal_cedula0" runat="server" ControlToValidate="txtBx_telefono" CssClass="margin5" ErrorMessage="#!" Font-Bold="True" ForeColor="Red" Height="40px" Operator="DataTypeCheck" Type="Integer" Width="20px"></asp:CompareValidator>
            <br />
            <br />
            <asp:Label ID="lbl_username" runat="server" CssClass="margin5_r" Font-Size="Medium" Height="40px" Text="Usuario:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtBx_username" runat="server" CssClass="margin5" Height="25px" Width="280px"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_password" runat="server" CssClass="margin5_r" Font-Size="Medium" Height="40px" Text="Contraseña:" Width="150px"></asp:Label>
            <asp:TextBox ID="txtBx_password" runat="server" CssClass="margin5" Height="25px" Width="280px"></asp:TextBox>
            <br />
            <asp:CheckBox ID="chkBx_password" runat="server" Font-Size="Small" Text="Ver contraseña" Style="margin-left:160px" AutoPostBack="True"/>
            <br />
            <br />
            &nbsp;<asp:Button ID="btn_atras" runat="server" CssClass="margin10" Font-Size="Small" Height="40px" Text="&lt; Atrás" Width="100px" OnClick="btn_atras_Click" />
            <asp:Button ID="btn_register" runat="server" CssClass="margin10" Font-Size="Small" Height="40px" OnClick="btn_register_Click" Text="Registrarse" Width="160px" />
        </asp:Panel>
    </form>
    
</body>
</html>
