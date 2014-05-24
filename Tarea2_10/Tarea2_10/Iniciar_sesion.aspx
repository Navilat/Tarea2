<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Iniciar_sesion.aspx.cs" Inherits="Tarea2_10.Iniciar_sesion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 50%;
            height: 175px;
            border: 1px solid #000000;
        }
        .style3
        {
            width: 374px;
            height: 47px;
            text-align: right;
        }
        .style13
        {
            height: 47px;
            width: 275px;
        }
        .style19
        {
            height: 48px;
            width: 374px;
        }
        .style20
        {
            width: 374px;
            height: 39px;
            text-align: right;
        }
        .style22
        {
            height: 39px;
            width: 275px;
        }
        .style23
        {
            height: 48px;
            width: 234px;
            text-align: center;
        }
        .style24
        {
            height: 48px;
            width: 275px;
        }
        .style25
        {
            height: 47px;
            width: 234px;
        }
        .style26
        {
            height: 39px;
            width: 234px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p style="font-size: x-large; font-weight: 700">
        Iniciar sesión:</p>
    <table class="style1">
        <tr>
            <td class="style3">
                Nombre de usuario:</td>
            <td class="style25">
                <asp:TextBox ID="TextBoxUN" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style13">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxUN" ErrorMessage="Ingrese nombre de usuario!" 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style20">
                Contraseña:</td>
            <td class="style26">
                <asp:TextBox ID="TextBoxPASS" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td class="style22">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBoxPASS" ErrorMessage="Ingrese contraseña!" 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style19">
            </td>
            <td class="style23">
                <asp:Button ID="ButtonIniciar_sesion" runat="server" 
                    onclick="ButtonIniciar_sesion_Click" style="text-align: center" 
                    Text="Iniciar sesión" Width="165px" />
            </td>
            <td class="style24">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
