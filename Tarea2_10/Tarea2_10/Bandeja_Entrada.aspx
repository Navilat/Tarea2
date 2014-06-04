<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bandeja_Entrada.aspx.cs" Inherits="Tarea2_10.Bandeja_Entrada" %>

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
            width: 205px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: large; font-weight: 700">
    
        Mi bandeja de entrada:</div>
    <table class="style1">
        <tr>
            <td class="style2">
                Mensajes recibidos:
                <asp:Label ID="LabelN_mensajes" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                Mensajes sin leer:
                <asp:Label ID="LabelMensajes_SL" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSourceBandeja_Entrada" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RegistroConnectionString %>" 
        SelectCommand="SELECT * FROM [Buzon_Entrada]"></asp:SqlDataSource>
    </form>
</body>
</html>
