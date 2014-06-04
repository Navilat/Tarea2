<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagina_principal.aspx.cs" Inherits="Tarea2_10.Pagina_principal" %>

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
            width: 689px;
        }
        .style3
        {
            width: 99px;
            text-align: center;
        }
        .style4
        {
            width: 152px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:HyperLink ID="UserLink" runat="server" ForeColor="#0066FF" 
                        NavigateUrl="~/Perfil.aspx" style="text-align: center">HyperLink</asp:HyperLink>
                </td>
                <td class="style4">
                    <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#0066FF" 
                        NavigateUrl="~/Bandeja_Entrada.aspx">Bandeja de entrada</asp:HyperLink>
                </td>
                <td style="text-align: center">
                    <asp:HyperLink ID="HyperLink3" runat="server" ForeColor="#0066FF" 
                        NavigateUrl="~/IngresoSistema.aspx">Salir</asp:HyperLink>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
    <p>
                    &lt;&lt;Lista de categorías públicas: &gt;&gt;<br />
                    *Categoría 1 - Total del temas - Total de mensajes - Último tema comentado.</p>
</body>
</html>
