<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mensaje_privado.aspx.cs" Inherits="Tarea2_10.Mensaje_privado" %>

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
            width: 112px;
        }
        .style3
        {
            width: 115px;
        }
        .style4
        {
            width: 115px;
            height: 23px;
        }
        .style5
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                Enviado por:</td>
            <td>
&nbsp;<asp:Label ID="LabelNombre" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Asunto:</td>
            <td>
                <asp:Label ID="LabelAsunto" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Mensaje:</td>
            <td>
                <asp:TextBox ID="TextBoxMensaje" runat="server" Height="200px" ReadOnly="True" 
                    TextMode="MultiLine" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Fecha de envío:</td>
            <td>
                <asp:Label ID="LabelFecha" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <br />
                <br />
                <asp:Button ID="ButtonResponder" runat="server" onclick="ButtonResponder_Click" 
                    Text="Responder" Width="200px" />
            </td>
        </tr>
    </table>
    <div>
    
    </div>
    <asp:Panel ID="Panel1" runat="server" Height="262px" Visible="False">
        <table class="style1">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBoxEM" runat="server" Height="200px" TextMode="MultiLine" 
                        Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                </td>
                <td class="style5">
                    <asp:Button ID="ButtonEnviar" runat="server" Text="Enviar" Width="200px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
