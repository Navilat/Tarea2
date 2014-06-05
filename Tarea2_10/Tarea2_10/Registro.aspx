<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Tarea2_10.Registro" %>

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
            width: 305px;
            text-align: right;
        }
        .style3
        {
            text-align: left;
            height: 29px;
        }
        .style4
        {
            width: 305px;
            text-align: right;
            height: 29px;
        }
        .style5
        {
            width: 205px;
        }
        .style6
        {
            text-align: left;
            height: 29px;
            width: 205px;
        }
        .style8
        {
            width: 205px;
            height: 45px;
        }
        .style9
        {
            height: 45px;
        }
        .style10
        {
            width: 305px;
            text-align: right;
            height: 45px;
        }
        #Reset1
        {
            width: 84px;
        }
        .style11
        {
            font-size: x-large;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-weight: 700" class="style11">
    
        Registro de nuevo usuario:<br />
        <br />
    </div>
    <table class="style1">
        <tr>
            <td class="style2">
                Nombre:</td>
            <td class="style5">
                <asp:TextBox ID="TextBoxNombre" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxNombre" ErrorMessage="Campo obligatorio." 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Contraseña:</td>
            <td class="style5">
                <asp:TextBox ID="TextBoxContra" runat="server" TextMode="Password" 
                    Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBoxContra" ErrorMessage="Campo obligatorio." 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Repetir contraseña:</td>
            <td class="style5">
                <asp:TextBox ID="TextBoxRContra" runat="server" TextMode="Password" 
                    Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBoxRContra" ErrorMessage="Debe confirmar contraseña." 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBoxContra" ControlToValidate="TextBoxRContra" 
                    ErrorMessage="Contraseñas deben ser iguales." ForeColor="#CC0000"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Fecha de nacimiento (aaaa-mm-dd):</td>
            <td class="style5">
                <asp:TextBox ID="TextBoxFecha" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBoxFecha" ErrorMessage="Campo obligatorio." 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            &nbsp;<br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBoxFecha" ErrorMessage="Fecha inválida." 
                    ForeColor="#CC0000" ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Sexo:</td>
            <td class="style6">
                <asp:DropDownList ID="DropDownListSexo" runat="server" Width="200px">
                    <asp:ListItem>Seleccione una opción...</asp:ListItem>
                    <asp:ListItem>Hombre</asp:ListItem>
                    <asp:ListItem>Mujer</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="DropDownListSexo" ErrorMessage="Debe seleccionar una opción." 
                    ForeColor="#CC0000" InitialValue="Seleccione una opción..."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Avatar URL:</td>
            <td class="style5">
                <asp:TextBox ID="TextBoxAvatar" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBoxAvatar" ErrorMessage="Campo obligatorio." 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style10">
            </td>
            <td class="style8">
                <asp:Button ID="ButtonFinalizar" runat="server" onclick="ButtonFinalizar_Click" 
                    Text="Finalizar" Width="90px" />
            </td>
            <td class="style9">
                <input id="Reset1" type="reset" value="Reset" /> (Limpiar campos)</td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RegistroConnectionString %>" 
        SelectCommand="SELECT * FROM [Usuario]"></asp:SqlDataSource>
    <asp:Button ID="ButtonVolver" runat="server" onclick="ButtonVolver_Click" 
        Text="Volver" Width="191px" />
    </form>
</body>
</html>
