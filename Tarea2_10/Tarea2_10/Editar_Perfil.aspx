<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Editar_Perfil.aspx.cs" Inherits="Tarea2_10.Editar_Perfil" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            font-size: medium;
        }
        .style2
        {
            width: 235px;
        }
        .style3
        {
            width: 210px;
        }
        .style5
        {
            font-style: normal;
        }
        .style6
        {
            width: 235px;
            font-style: normal;
        }
    </style>
</head>
<body style="font-size: x-small; font-style: italic">
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2" style="font-weight: 700">
                    <span class="style5">Edita tu perfil:</td>
                <td class="style3">
                    &nbsp;</td>
                <td style="text-align: right">
                    <asp:HyperLink ID="Salir" runat="server" BorderColor="#3366FF" 
                        ForeColor="#3366FF" NavigateUrl="~/IngresoSistema.aspx">Salir</asp:HyperLink>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <span class="style5">ID:</td>
                <td class="style3">
                    <asp:Label ID="LabelID" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    </span></td>
            </tr>
            <tr>
                <td class="style2">
                    <span class="style5">Nombre de usuario:</td>
                <td class="style3">
                    <asp:Label ID="LabelNombre" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    </span></td>
            </tr>
            <tr>
                <td class="style6">
                    Fecha de nacimiento (aaaa-mm-dd):</td>
                <td class="style3">
                    <asp:TextBox ID="TextBoxFecha" runat="server" Width="200px" 
                        ontextchanged="Button1_Click"></asp:TextBox>
                </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBoxFecha" ErrorMessage="Ingrese fecha de nacimiento." 
                        ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBoxFecha" ErrorMessage="Fecha inválida." 
                        ForeColor="#CC0000" ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Avatar URL:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBoxAvatar" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    *Nueva contraseña:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBoxNPass" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBoxNPass" ErrorMessage="Campo obligatorio." 
                        ForeColor="#CC0000"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style6">
                    *Confirmar nueva contraseña:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBoxRNPass" runat="server" Width="200px" 
                        TextMode="Password"></asp:TextBox>
                </td>
                <td class="style5">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBoxNPass" ControlToValidate="TextBoxRNPass" 
                        ErrorMessage="Contraseñas deben coincidir." ForeColor="#CC0000"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" Text="Guardar cambios" Width="200px" 
                        onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
    <p style="font-size: small">
        * Si no desea modificar su contraseña confirme estos campos con su contraseña 
        actual.</p>
</body>
</html>
