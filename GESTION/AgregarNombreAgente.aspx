<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarNombreAgente.aspx.cs" Inherits="GESTION.PagoFacturas.AgregarNombreAgente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 411px;
            height: 182px;
        }
                                                  
                   .auto-style8 {
            padding: 1px 4px;
        text-align: center;
            font-size: x-large;
        height: 26px;
        text-transform: uppercase;
        color: #FFFFFF;
        background-color: #000099;
        border-right-style: solid;
        border-right-width: 1px;
    }
         
        .auto-style12 {
            width: 126px;
            height: 26px;
        }
        .auto-style13 {
            width: 223px;
            height: 26px;
        }
         
        .auto-style14 {
            text-align: center;
            height: 26px;
        }
        .auto-style15 {
            font-weight: bold;
        }
        .auto-style17 {
            text-align: center;
            height: 28px;
        }
         
    </style>
</head>
<body style="height: 184px; width: 414px">
    <form id="form1" runat="server">
    <div>
     <table class="auto-style1">
            <tr>
                <td colspan="2" class="auto-style8"><strong>Agregar Agente</strong></td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>Nombre Agente</strong></td>
                <td class="auto-style13">
                    <strong>
                    <asp:TextBox ID="txtNombre" runat="server" Height="25px" Width="200px"></asp:TextBox>
                    </strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="RequiredFieldValidator" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style14" colspan="2"><strong>
                    <asp:Button ID="btnIngresar" runat="server" CssClass="auto-style15" Height="25px" OnClick="btnIngresar_Click" Text="Ingresar" ValidationGroup="ingresar" Width="200px" />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style17" colspan="2">
                    <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
