<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoSistema.aspx.cs" Inherits="Tarea2_10.IngresoSistema" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pagina de inicio</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 59px;
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
                    <asp:Button ID="Button1" runat="server" Text="Iniciar Sesión" 
                        onclick="Button1_Click" Width="180px" />
                </td>
            </tr>
            <tr>
                <td align="center" class="style3">
                    <asp:Button ID="Button2" runat="server" Text="Registrarse" 
                        onclick="Button2_Click" Width="180px" />
                </td>
            </tr>
            <tr>
                <td align="center" style="text-align: left">
                    &lt;&lt;Lista de categorías públicas: &gt;&gt;<br />
                    *Categoría 
                    - Descripción - Total del temas - Total de mensajes - Último tema comentado.</td>
            </tr>
        </table>
    
    </div>
    <asp:ListBox ID="ListBox1" runat="server" EnableTheming="True" Width="176px">
    </asp:ListBox>
    <asp:ListBox ID="ListBox2" runat="server" EnableTheming="True" Width="423px">
    </asp:ListBox>
    <asp:ListBox ID="ListBox3" runat="server" EnableTheming="True" Width="39px">
    </asp:ListBox>
    <asp:ListBox ID="ListBox4" runat="server" EnableTheming="True" Width="36px">
    </asp:ListBox>
    <asp:ListBox ID="ListBox5" runat="server" Width="177px"></asp:ListBox>
    <p>
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Ir" 
            Width="70px" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    
        <table class="style1">
            <tr>
                <td align="center" style="text-align: left">
                    &lt;&lt;Lista de 
                    temas públicos: &gt;&gt;<br />
                    *Tema 
                    - Autor - Descripción - Total de comentarios</td>
            </tr>
        </table>
    
    <asp:ListBox ID="lbTemas_1" runat="server" Visible="False" Width="180px">
    </asp:ListBox>
    <asp:ListBox ID="lbTemas_2" runat="server" Visible="False" Width="135px">
    </asp:ListBox>
    <asp:ListBox ID="lbTemas_3" runat="server" Visible="False" Width="490px">
    </asp:ListBox>
    <asp:ListBox ID="lbTemas_4" runat="server" Visible="False" Width="44px">
    </asp:ListBox>
    <asp:Button ID="Boton_EliminarTema" runat="server" Text="Eliminar Tema" 
        Visible="False" />
    </form>
    
        </body>
</html>
