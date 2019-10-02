<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscarFacturas.aspx.cs" Inherits="GESTION.PagoFacturas.BuscarFacturas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <style type="text/css">
        .auto-style1 {
            width: 374px;
             height: 644px;
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
            width: 97px;
            height: 26px;
        }
        .auto-style13 {
            width: 223px;
            height: 26px;
        }
         
        .auto-style14 {
            height: 23px;
            text-align: center;
        }
        .auto-style15 {
            text-align: center;
        }
         
        .auto-style18 {
            font-weight: bold;
            font-size: small;
        }
         
         .auto-style19 {
             width: 97px;
             height: 27px;
         }
         .auto-style20 {
             width: 223px;
             height: 27px;
         }
         .auto-style21 {
             width: 97px;
             height: 25px;
         }
         .auto-style22 {
             width: 223px;
             height: 25px;
         }
         .auto-style23 {
             width: 97px;
             height: 38px;
         }
         .auto-style24 {
             width: 223px;
             height: 38px;
         }
         
         .auto-style25 {
             width: 97px;
             height: 23px;
         }
         .auto-style26 {
             width: 223px;
             height: 23px;
         }
         .auto-style27 {
             font-weight: bold;
         }
         
    </style>
</head>
<body style="width: 378px; height: 648px; margin-bottom: 11px">
    <form id="form1" runat="server">
    <div>
        <table class="auto-style1">
            <tr>
                <td colspan="2" class="auto-style8"><strong>Buscar fACTURAS</strong></td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>N° Invoice</strong></td>
                <td class="auto-style13">
                    <strong>
                    <asp:TextBox ID="txtNInvoice" runat="server" Height="25px" Width="119px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNInvoice" ErrorMessage="- Nº Cheque es Requerido" ValidationGroup="actualizar">*</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNInvoice" ErrorMessage="- Nº de Cheque es Requerido" ValidationGroup="buscar">*</asp:RequiredFieldValidator>
                    <asp:Button ID="btnbuscar" runat="server" Height="25px" Text="Buscar" Width="60px" CssClass="auto-style18" OnClick="btnbuscar_Click1" ValidationGroup="buscar" />
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>Fecha Recepcion F.</strong></td>
                <td class="auto-style13">
                    <strong>
                    <asp:TextBox ID="txtFRecepcion" runat="server" Height="20px" TextMode="Date" Width="200px" Enabled="False"></asp:TextBox>
                    </strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFRecepcion" ErrorMessage="RequiredFieldValidator" ValidationGroup="actualizar">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style19"><strong>Fecha Emision F. </strong></td>
                <td class="auto-style20">
                    <strong>
                    <asp:TextBox ID="txtFEmision" runat="server" Height="20px" TextMode="Date" Width="200px" Enabled="False"></asp:TextBox>
                    </strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFEmision" ErrorMessage="RequiredFieldValidator" ValidationGroup="actualizar">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>Customer/Envia</strong></td>
                <td class="auto-style13">
                    <strong>
                    <asp:DropDownList ID="ddlcustomers" runat="server" DataSourceID="customers" DataTextField="Nombre" DataValueField="id_Customer" Height="20px" Width="200px" Enabled="False" OnSelectedIndexChanged="ddlcustomers_SelectedIndexChanged">
                    </asp:DropDownList>
                    </strong>
                    <asp:SqlDataSource ID="customers" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [id_Customer], [Nombre] FROM [Customers]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>Nombre Agente</strong></td>
                <td class="auto-style13">
                    <strong>
                    <asp:DropDownList ID="ddlNombreagente" runat="server" DataSourceID="agentes" DataTextField="Nombre" DataValueField="id_Agente" Height="20px" Width="200px" Enabled="False">
                    </asp:DropDownList>
                    </strong>
                    <asp:SqlDataSource ID="agentes" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Agentes]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>N° Operacion</strong></td>
                <td class="auto-style13">
                    <strong>
                    <asp:TextBox ID="txtNOperacion" runat="server" Height="20px" Width="200px" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style23"><strong>Empresa</strong></td>
                <td class="auto-style24">
                    <strong>
                    <asp:DropDownList ID="ddlEmpresa" runat="server" DataSourceID="empresa" DataTextField="RazonSocial" DataValueField="id_Empresa" Height="20px" Width="200px" Enabled="False">
                    </asp:DropDownList>
                    </strong>
                    <asp:SqlDataSource ID="empresa" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [id_Empresa], [RazonSocial] FROM [Empresas]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style21"><strong>Moneda</strong></td>
                <td class="auto-style22">
                    <strong>
                    <asp:DropDownList ID="ddlMoneda" runat="server" DataSourceID="Moneda" DataTextField="Detalle" DataValueField="id_Moneda" Height="20px" Width="200px" Enabled="False">
                    </asp:DropDownList>
                    </strong>
                    <asp:SqlDataSource ID="Moneda" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Moneda]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style25"><strong>Importe</strong></td>
                <td class="auto-style26">
                    <strong>
                    <asp:TextBox ID="txtImporte" runat="server" Height="20px" Width="200px" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style25"><strong>Estado</strong></td>
                <td class="auto-style26">
                    <strong>
                    <asp:DropDownList ID="ddlestadof" runat="server" CssClass="auto-style27" Height="20px" Width="200px" Enabled="False">
                        <asp:ListItem>Pendiente</asp:ListItem>
                        <asp:ListItem>Pagado</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style21"><strong>Condicion/pago</strong></td>
                <td class="auto-style22">
                    <strong>
                    <asp:TextBox ID="txtCondicion" runat="server" Height="20px" Width="200px" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style21"><strong>Comentario</strong></td>
                <td class="auto-style22">
                    <strong>
                    <asp:TextBox ID="txtComentario" runat="server" Height="20px" Width="200px" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style21"><strong>Detalle</strong></td>
                <td class="auto-style22">
                    <strong>
                    <asp:TextBox ID="txtDetalle" runat="server" Height="20px" Width="200px" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style21"><strong>Fecha Pago</strong></td>
                <td class="auto-style22">
                    <strong>
                    <asp:TextBox ID="txtFechaPago" runat="server" Height="20px" TextMode="Date" Width="200px" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style14" colspan="2">
                    <strong>
                    <asp:Button ID="btnModificar" runat="server" CssClass="auto-style27" Enabled="False" Height="30px" OnClick="btnModificar_Click" Text="Modificar" Width="200px" />
                    <asp:Button ID="btnActualizar" runat="server" OnClick="btnActualizar_Click1" Text="Grabar" Width="200px" ValidationGroup="actualizar" CssClass="auto-style27" Height="30px" Visible="False" />
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style15" colspan="2">
                    <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
