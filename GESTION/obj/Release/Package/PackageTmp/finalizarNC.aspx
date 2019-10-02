<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="finalizarNC.aspx.cs" Inherits="GESTION.Otros.finalizarNC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <style type="text/css">
               .auto-style8 {
            padding: 1px 4px;
        text-align: center;
            font-size: medium;
        height: 26px;
        text-transform: uppercase;
        color: #FFFFFF;
        background-color: #000099;
        border-right-style: solid;
        border-right-width: 1px;
    }
            .auto-style38 {
                width: 99%;
            }
            .auto-style42 {
                width: 661px;
                height: 16px;
            }
            .auto-style43 {
                width: 627px;
                height: 16px;
            }
            .auto-style46 {
                font-weight: bold;
            }
            .auto-style47 {
                text-align: center;
                height: 17px;
            }
        </style>
</head>
<body style="width: 397px; height: 135px">
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style38">
            <tr>
                <td class="auto-style8" colspan="2"><strong>Finalizar Solicitud Nota de Credito</strong></td>
            </tr>
            <tr>
                <td class="auto-style42">ID Solicitud Nota Credito</td>
                <td class="auto-style43">
                    <asp:TextBox ID="txtid" runat="server" TextMode="Number" Height="15px" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtid" ErrorMessage="*" ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style42">Numero Nota de Credito</td>
                <td class="auto-style43">
                    <asp:TextBox ID="txtnc" runat="server" TextMode="Number" Height="15px" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnc" ErrorMessage="*" ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style42">Cargar PDF</td>
                <td class="auto-style43">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*" ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style47" colspan="2"><strong>
                    <asp:Button ID="btnModificar" runat="server" CssClass="auto-style46" Text="Grabar" Width="128px" OnClick="btnModificar_Click" ValidationGroup="grabar" />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style47" colspan="2">
                    <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
