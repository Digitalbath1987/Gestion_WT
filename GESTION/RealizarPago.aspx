<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="RealizarPago.aspx.cs" Inherits="GESTION.PagoFacturas.RealizarPago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
          .auto-style11 {
            width: 100%;
            height: 389px;
        }
        .auto-style63 {
            height: 29px;
            width: 137px;
            text-align: center;
        }
        .auto-style68 {
            text-align: center;
            height: 30px;
        }
        .auto-style69 {
            text-align: center;
            font-size: x-large;
            height: 26px;
            text-transform: uppercase;
            color: #FFFFFF;
            border-right-style: solid;
            border-right-width: 1px;
            padding: 1px 4px;
            background-color: #000099;
        }
        .auto-style82 {
            height: 30px;
            width: 137px;
            text-align: center;
        }
        .auto-style83 {
            border-style: solid;
            border-width: 2px;
            height: 30px;
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style84 {
            height: 30px;
            width: 137px;
        }
        .auto-style85 {
            height: 54px;
            width: 137px;
            text-align: center;
        }
        .auto-style86 {
            text-align: center;
            height: 54px;
        }
        .auto-style87 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td class="auto-style69" colspan="8"><strong>Registrar Pago</strong></td>
        </tr>
        <tr>
            <td class="auto-style63">&nbsp;</td>
            <td class="auto-style63">&nbsp;</td>
            <td class="auto-style63">&nbsp;</td>
            <td class="auto-style63">&nbsp;</td>
            <td class="auto-style63">&nbsp;</td>
            <td class="auto-style63">&nbsp;</td>
            <td class="auto-style63">&nbsp;</td>
            <td class="auto-style63">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style82"></td>
            <td class="auto-style82"></td>
            <td colspan="2" class="auto-style83"><strong>ID Invoice</strong></td>
            <td colspan="2" class="auto-style83">
                <strong>
                <asp:Label ID="lblID" runat="server" Text="Label"></asp:Label>
                </strong>
            </td>
            <td class="auto-style82"></td>
            <td class="auto-style82"></td>
        </tr>
        <tr>
            <td class="auto-style82"></td>
            <td class="auto-style84"></td>
            <td class="auto-style83" colspan="2"><strong>Nº Invoice </strong> </td>
            <td class="auto-style83" colspan="2">
                <strong>
                <asp:Label ID="lblninvoice" runat="server" Text="Label"></asp:Label>
                </strong>
            </td>
            <td class="auto-style84">
                <asp:Label ID="lblrepetido" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style84"></td>
        </tr>
        <tr>
            <td class="auto-style82"></td>
            <td class="auto-style84"></td>
            <td class="auto-style83" colspan="2"><strong>Empresa</strong></td>
            <td class="auto-style83" colspan="2">
                <strong>
                <asp:Label ID="lblempresa" runat="server" Text="Label"></asp:Label>
                </strong>
            </td>
            <td class="auto-style84"></td>
            <td class="auto-style84"></td>
        </tr>
        <tr>
            <td class="auto-style82"></td>
            <td class="auto-style82"></td>
            <td colspan="2" class="auto-style83"><strong>Agente</strong></td>
            <td colspan="2" class="auto-style83">
                <strong>
                <asp:Label ID="lblagente" runat="server" Text="Label"></asp:Label>
                </strong>
            </td>
            <td class="auto-style82"></td>
            <td class="auto-style82"></td>
        </tr>
        <tr>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
            <td colspan="2" class="auto-style83"><strong>Total Deuda OP&nbsp; </strong></td>
            <td colspan="2" class="auto-style83">
                <strong>
                <asp:Label ID="lbltotal" runat="server" Text="Label"></asp:Label>
                </strong>&nbsp;
            </td>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
            <td colspan="2" class="auto-style83"><strong>Valor N/C</strong></td>
            <td colspan="2" class="auto-style83">
                <strong>
                <asp:Label ID="VNotaCred" runat="server" Text="Label"></asp:Label>
                </strong>
            </td>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style82"></td>
            <td class="auto-style82"></td>
            <td colspan="2" class="auto-style83"><strong>Total de la deuda </strong></td>
            <td colspan="2" class="auto-style83">
                <strong>
                <asp:Label ID="lbltotdeuda" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:Label ID="money" runat="server" Text="Label"></asp:Label>
                </strong>
            </td>
            <td class="auto-style82"></td>
            <td class="auto-style82"></td>
        </tr>
        <tr>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
            <td colspan="2" class="auto-style83"><strong>T.Cambio&nbsp;&nbsp;
                <asp:Label ID="lblFecha" runat="server" Text="Label"></asp:Label>
                </strong></td>
            <td colspan="2" class="auto-style83">
                <strong>
                <asp:Label ID="lblTCambio" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp; </strong>
            </td>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style82"></td>
            <td class="auto-style82"></td>
            <td colspan="2" class="auto-style83"><strong>Valor en Pesos </strong></td>
            <td colspan="2" class="auto-style83">
                <strong>
                <asp:Label ID="lblpesos" runat="server" Text="Label"></asp:Label>
&nbsp;CLP</strong></td>
            <td class="auto-style82"></td>
            <td class="auto-style82"></td>
        </tr>
        <tr>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
            <td colspan="2" class="auto-style83"><strong>Banco</strong></td>
            <td colspan="2" class="auto-style83">
                <asp:DropDownList ID="ddlbanco" runat="server" DataSourceID="Banco" DataTextField="Detalle" DataValueField="Detalle" Height="90%" Width="90%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Banco" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Bancos]"></asp:SqlDataSource>
            </td>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
            <td colspan="2" class="auto-style83"><strong>Detalle</strong></td>
            <td colspan="2" class="auto-style83">
                <asp:TextBox ID="txtdetallep" runat="server" Height="90%" Width="90%"></asp:TextBox>
            </td>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
            <td colspan="2" class="auto-style83"><strong>Monto Pagado</strong></td>
            <td colspan="2" class="auto-style83">
                <strong>
                <asp:Label ID="lblmontpag" runat="server" Text="Label"></asp:Label>
                </strong>
            </td>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style82"></td>
            <td class="auto-style84"></td>
            <td class="auto-style83" colspan="2"><strong>Saldo Pendiente</strong></td>
            <td class="auto-style83" colspan="2">
                <strong>
                <asp:Label ID="lblsaldpend" runat="server" Text="Label"></asp:Label>
                </strong>
            </td>
            <td class="auto-style84"></td>
            <td class="auto-style84"></td>
        </tr>
        <tr>
            <td class="auto-style82"></td>
            <td class="auto-style84"></td>
            <td class="auto-style83" colspan="2"><strong>Monto a Pagar</strong></td>
            <td class="auto-style83" colspan="2">
                <asp:TextBox ID="txtmontpaga" runat="server" Height="90%" Width="90%"></asp:TextBox>
            </td>
            <td class="auto-style84"></td>
            <td class="auto-style84"></td>
        </tr>
        <tr>
            <td class="auto-style85"></td>
            <td class="auto-style85">&nbsp;</td>
            <td class="auto-style86" colspan="4"><strong>
                <asp:Label ID="lblmensaje" runat="server" CssClass="auto-style87" Text="Label" Visible="False"></asp:Label>
                </strong></td>
            <td class="auto-style85"></td>
            <td class="auto-style85"></td>
        </tr>
        <tr>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">
                <asp:ImageButton ID="btnVolver" runat="server" Height="65px" ImageAlign="Bottom" ImageUrl="/Gestion2/Imagenes/btnVolver.png" OnClick="btnVolver_Click" Width="66px" />
            </td>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style68" colspan="2">
                <asp:ImageButton ID="btnPagar" runat="server" Height="110px" ImageUrl="/Gestion2/Imagenes/pagar.jpg" OnClick="btnPagar_Click" Width="167px" />
            </td>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
            <td class="auto-style82">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style84">&nbsp;</td>
            <td class="auto-style84">&nbsp;</td>
            <td class="auto-style84">&nbsp;</td>
            <td class="auto-style84">&nbsp;</td>
            <td class="auto-style84">&nbsp;</td>
            <td class="auto-style84">&nbsp;</td>
            <td class="auto-style84">&nbsp;</td>
            <td class="auto-style84">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
