<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoSistema.aspx.cs" Inherits="Tarea2_10.IngresoSistema" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pagina de inicio</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 162px;
        }
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 34px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td align="center" class="style2">
                    <asp:Button ID="Button1" runat="server" Text="Iniciar Sesión" />
                </td>
            </tr>
            <tr>
                <td align="center" class="style3">
                    <asp:Button ID="Button2" runat="server" Text="Registrarse" />
                </td>
            </tr>
            <tr>
                <td align="center" style="text-align: left">
                    &lt;&lt;Lista de categorías públicas: &gt;&gt;<br />
                    *Categoría 1 - Total del temas - Total de mensajes - Último tema comentado.</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
