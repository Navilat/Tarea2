<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoSistema.aspx.cs" Inherits="Tarea2_10.IngresoSistema" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td align="center">
                    <asp:Button ID="Button1" runat="server" Text="Iniciar Sesión" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="Button2" runat="server" Text="Registrarse" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
