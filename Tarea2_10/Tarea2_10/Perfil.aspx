<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Tarea2_10.Perfil" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 64%;
            height: 296px;
            border: 1px solid #000000;
            background-color: #CCCCCC;
        }
        .style2
        {
            width: 258px;
            text-align: center;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 418px;
        }
        .style5
        {
            width: 192px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style3">
        <tr>
            <td class="style4" style="font-weight: 700; font-size: x-large">
                Perfil de usuario:</td>
            <td style="text-align: right">
                <asp:HyperLink ID="HyperLinkSalir" runat="server" BorderColor="#0066FF" 
                    ForeColor="#0066FF" NavigateUrl="~/IngresoSistema.aspx" 
                    style="font-weight: 700">Salir</asp:HyperLink>
            </td>
        </tr>
    </table>
    <br />
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Image ID="ImageAvatar" runat="server" Height="124px" Width="93px" />
            </td>
            <td class="style5">
                -Nombre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LabelNombre" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                -Fecha de nacimiento:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LabelEdad" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                -Sexo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Label ID="LabelSexo" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                -Número de comentarios:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LabelNComentarios" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                -Fecha de registro:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LabelFechaReg" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                -Tipo de usuario:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LabelTipoUser" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:HyperLink ID="HyperLinkBandejaEntrada" runat="server" 
                    BorderColor="#0066FF" ForeColor="#0066FF" style="font-weight: 700">HyperLink</asp:HyperLink>
            </td>
            <td class="style5" style="text-align: center">
                <asp:Button ID="ButtonEditarPerfil" runat="server" Text="Editar perfil" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
