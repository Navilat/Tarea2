<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil_Otro.aspx.cs" Inherits="Tarea2_10.Perfil_Otro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 194px;
            text-align: center;
        }
        .style3
        {
            height: 194px;
            width: 167px;
        }
        .style4
        {
            width: 167px;
        }
        .style5
        {
            height: 194px;
            width: 337px;
        }
        .style6
        {
            width: 337px;
        }
        .style7
        {
            width: 159px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Image ID="ImageAvatar" runat="server" Height="136px" Width="133px" />
                </td>
                <td class="style3">
                    <strong style="text-align: center">ID:<br />
                    Nombre:<br />
                    Sexo:<br />
                    Fecha de nacimiento:<br />
                    Fecha de registro:<br />
                    Tipo de Usuario:<br />
                    Número de comentarios:</strong></td>
                <td class="style5">
                    <strong>
                    <asp:Label ID="LabelID" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="LabelNombre" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="LabelSexo" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="LabelFechaNacimiento" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="LabelFechaRegistro" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="LabelTipoUsuario" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="LabelNComentarios" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Button ID="ButtonEditarUsuario" runat="server" 
                        onclick="ButtonEditarUsuario_Click" Text="Editar Usuario" Width="122px" />
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <asp:Panel ID="PanelCambios" runat="server" Height="190px" Visible="False">
        <table class="style1">
            <tr>
                <td class="style7">
                    <asp:Label ID="Label7" runat="server" Text="Fecha de nacimiento:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFecha" runat="server" Width="200px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBoxFecha" ErrorMessage="Fecha inválida." 
                        ForeColor="#CC0000" ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    Avatar (url):</td>
                <td>
                    <asp:TextBox ID="TextBoxAvatar" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBoxAvatar" ErrorMessage="Campo obligatorio." 
                        ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:Label ID="Label8" runat="server" Text="Nueva contraseña:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBoxPass" ErrorMessage="Ingrese nueva contraseña." 
                        ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:Label ID="Label9" runat="server" Text="Confirmar contraseña:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxRPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBoxPass" ControlToValidate="TextBoxRPass" 
                        ErrorMessage="Contraseñas deben coincidir." ForeColor="#CC0000"></asp:CompareValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:Label ID="Label10" runat="server" Text="Tipo de usuario:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListTipo" runat="server" Width="150px">
                        <asp:ListItem>Usuario común</asp:ListItem>
                        <asp:ListItem>Moderador</asp:ListItem>
                        <asp:ListItem>Administrador</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="ButtonGuardarCambios" runat="server" onclick="Button1_Click" 
                        Text="Guardar cambios" Width="150px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
