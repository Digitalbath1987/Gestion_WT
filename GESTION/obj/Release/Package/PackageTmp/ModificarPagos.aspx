<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ModificarPagos.aspx.cs" Inherits="GESTION.PagoFacturas.ModificarPagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
        .auto-style14 {
            width: 140px;
        }
        .auto-style20 {
            width: 141px;
        }
            .auto-style21 {
            text-align: center;
            font-size: x-large;
            height: 25px;
            text-transform: uppercase;
            color: #FFFFFF;
            border-right-style: solid;
            border-right-width: 1px;
            padding: 1px 4px;
            background-color: #000099;
        }
        .auto-style24 {
            height: 30px;
            width: 140px;
        }
        .auto-style25 {
            height: 30px;
            width: 140px;
            background-color: #C0C0C0;
        }
        .auto-style26 {
            height: 30px;
            width: 141px;
        }
        .auto-style27 {
            font-weight: bold;
        }
        .auto-style28 {
            width: 140px;
            height: 99px;
        }
        .auto-style29 {
            height: 99px;
            text-align: center;
        }
        .auto-style30 {
            width: 141px;
            height: 99px;
        }
        .auto-style31 {
            width: 140px;
            height: 21px;
        }
        .auto-style32 {
            text-align: center;
            height: 21px;
        }
        .auto-style33 {
            width: 141px;
            height: 21px;
        }
        .auto-style34 {
            height: 30px;
            width: 140px;
            background-color: #C0C0C0;
            text-align: center;
        }
        .auto-style35 {
            height: 30px;
            background-color: #C0C0C0;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td class="auto-style21" colspan="8"><strong>Modificar registro ID :
                <asp:Label ID="lblid" runat="server" Text="Label"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style25"><strong>Nº Invoice</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txtinvoice" runat="server" Height="90%" Width="90%"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style25"><strong>Empresa</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:DropDownList ID="ddlempresa" runat="server" CssClass="auto-style27" Height="90%" Width="90%">
                    <asp:ListItem>World Transport Int. Ltda</asp:ListItem>
                    <asp:ListItem>Tr3s Vias Ltda</asp:ListItem>
                    <asp:ListItem>World Transport Courier Ltda</asp:ListItem>
                </asp:DropDownList>
                </strong>
            </td>
            <td class="auto-style25"><strong>Agente</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:DropDownList ID="ddlagente" runat="server" DataSourceID="Agente" DataTextField="Nombre" DataValueField="Nombre" CssClass="auto-style27" Height="90%" Width="90%">
                </asp:DropDownList>
                </strong>
                <asp:SqlDataSource ID="Agente" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Agentes2] ORDER BY [Nombre]"></asp:SqlDataSource>
            </td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style25"><strong>Fecha Invoice</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txtfechaInvoice" runat="server" Height="90%" Width="90%"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style25"><strong>Moneda</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:DropDownList ID="ddlmoneda" runat="server" DataSourceID="Moneda" DataTextField="Detalle" DataValueField="Detalle" CssClass="auto-style27" Height="90%" Width="90%">
                </asp:DropDownList>
                </strong>
                <asp:SqlDataSource ID="Moneda" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Moneda]"></asp:SqlDataSource>
            </td>
            <td class="auto-style25"><strong>T.Cambio</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txttc" runat="server" Height="90%" Width="80%"></asp:TextBox>
                </strong>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txttc" ErrorMessage="*" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="update"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttc" ErrorMessage="*" ValidationGroup="update"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style25"><strong>Estado</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:DropDownList ID="ddlestado" runat="server" CssClass="auto-style27" Height="90%" Width="90%">
                    <asp:ListItem Value="PENDIENTE">PENDIENTE</asp:ListItem>
                    <asp:ListItem Value="PAGADO">PAGADO</asp:ListItem>
                </asp:DropDownList>
                </strong>
            </td>
            <td class="auto-style25"><strong>Fecha Ingreso</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txtfechaIngreso" runat="server" Height="90%" Width="90%"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style25"><strong>Fecha de Pago</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txtfechapago" runat="server" Height="90%" Width="90%"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style25"><strong>Condicion</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:DropDownList ID="ddlcondicion" runat="server" CssClass="auto-style27" Height="90%" Width="90%">
                    <asp:ListItem>30 Dias</asp:ListItem>
                    <asp:ListItem>15 Dias</asp:ListItem>
                    <asp:ListItem>Pago Urgente</asp:ListItem>
                </asp:DropDownList>
                </strong>
            </td>
            <td class="auto-style25"><strong>Observacion</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txtobserv" runat="server" Height="90%" Width="90%"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style25"><strong>Detalle</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txtdetalle" runat="server" Height="90%" Width="90%"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style25"><strong>Nº NC</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txtnnc" runat="server" Height="90%" Width="90%"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style25"><strong>Valor N/C</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txtvalornc" runat="server" Height="90%" Width="80%"></asp:TextBox>
                </strong>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtvalornc" ErrorMessage="*" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="update"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtvalornc" ErrorMessage="*" ValidationGroup="update"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style25"><strong>Fecha N/C</strong></td>
            <td class="auto-style25">
                <strong>
                <asp:TextBox ID="txtfechanc" runat="server" Height="90%" Width="90%"></asp:TextBox>
                </strong>
            </td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style25"><strong>Modificar Archivo</strong></td>
            <td class="auto-style34">
                <asp:RadioButtonList ID="rbmod" runat="server" AutoPostBack="True" Height="17px" OnSelectedIndexChanged="rbmod_SelectedIndexChanged" RepeatDirection="Horizontal" Width="109px">
                    <asp:ListItem Selected="True">NO</asp:ListItem>
                    <asp:ListItem>SI</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style35" colspan="2">
                <asp:FileUpload ID="flupload" runat="server" Visible="False" />
            </td>
            <td class="auto-style25"></td>
            <td class="auto-style25">
            </td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style31"></td>
            <td class="auto-style31"></td>
            <td class="auto-style32" colspan="4"><strong>
                <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
                </strong></td>
            <td class="auto-style31"></td>
            <td class="auto-style33"></td>
        </tr>
        <tr>
            <td class="auto-style28"></td>
            <td class="auto-style28"></td>
            <td class="auto-style28"></td>
            <td class="auto-style29" colspan="2">
                <asp:ImageButton ID="btnmod" runat="server" Height="83%" ImageAlign="Bottom" ImageUrl="/Gestion2/Imagenes/guardar.jpg" OnClick="btnmod_Click" ValidationGroup="update" Width="35%" />
            </td>
            <td class="auto-style28"></td>
            <td class="auto-style28"></td>
            <td class="auto-style30"></td>
        </tr>
        <tr>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style14">&nbsp;</td>
            <td class="auto-style20">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
