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
        .style3
        {
            width: 198px;
        }
        .style7
        {
            width: 200px;
            text-align: center;
        }
        .style8
        {
            width: 50px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size: large; font-weight: 700">
    
        <table class="style1">
            <tr>
                <td>
    
        Mi bandeja de entrada:</td>
                <td style="text-align: right">
                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#0066FF" 
                        NavigateUrl="~/IngresoSistema.aspx" 
                        style="font-size: medium; text-align: right">Salir</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
    <table class="style1">
        <tr>
            <td class="style2">
                Mensajes recibidos:
                <asp:Label ID="LabelN_mensajes" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style3">
                Mensajes sin leer:
                <asp:Label ID="LabelMensajes_SL" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Button ID="ButtonRedactar" runat="server" onclick="ButtonRedactar_Click" 
                    Text="Redactar Mensaje" Width="151px" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSourceBandeja_Entrada" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RegistroConnectionString %>" 
        SelectCommand="SELECT * FROM [Buzon_Entrada]"></asp:SqlDataSource>
    <asp:Panel ID="PanelMensaje" runat="server" Visible="False">
        <asp:Label ID="LabelPara" runat="server" Text="Para: " Width="70px"></asp:Label>
        <asp:TextBox ID="TextBoxPara" runat="server" Width="330px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBoxPara" ErrorMessage="Ingrese un destinatario." 
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="LabelAsunto" runat="server" Text="Asunto: " Width="70px"></asp:Label>
        <asp:TextBox ID="TextBoxAsunto" runat="server" MaxLength="30" Width="330px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBoxAsunto" ErrorMessage="Campo obligatorio." 
            ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <asp:TextBox ID="TextBoxMensaje" runat="server" Height="169px" 
            TextMode="MultiLine" Width="400px"></asp:TextBox>
        <br />
        <asp:Button ID="ButtonEnviar" runat="server" Text="Enviar" Width="120px" />
    </asp:Panel>
    <table class="style1">
        <tr>
            <td class="style7">
                Remitente:</td>
            <td class="style7">
                Asunto:</td>
            <td class="style7">
                Fecha de envío:</td>
            <td class="style8" style="text-align: center">
                Leído:</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                <asp:ListBox ID="ListBoxRemitente" runat="server" Width="200px"></asp:ListBox>
            </td>
            <td class="style7">
                <asp:ListBox ID="ListBoxAsunto" runat="server" Width="200px"></asp:ListBox>
            </td>
            <td class="style7">
                <asp:ListBox ID="ListBoxFecha" runat="server" Width="200px"></asp:ListBox>
            </td>
            <td class="style8">
                <asp:ListBox ID="ListBoxLeido" runat="server" Width="50px"></asp:ListBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                Remitente:</td>
            <td class="style7">
                Asunto:</td>
            <td class="style7">
                Fecha de envío:</td>
            <td class="style8">
                Leído:</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
