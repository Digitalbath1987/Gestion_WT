<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarNC.aspx.cs" Inherits="GESTION.Otros.ModificarNC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Modificar Nota De Credito</title>
    <style type="text/css">
        .auto-style1 {
            width: 412px;
            height: 337px;
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
         
        .auto-style14 {
            height: 26px;
            text-align: center;
        }
                 
        .auto-style18 {
            font-weight: bold;
            font-size: small;
        }
         
         .auto-style24 {
            width: 207px;
            height: 20px;
        }
        .auto-style25 {
            width: 223px;
            height: 20px;
        }
        .auto-style26 {
            width: 207px;
            height: 18px;
        }
        .auto-style27 {
            width: 223px;
            height: 18px;
        }
        .auto-style28 {
            width: 207px;
            height: 21px;
        }
        .auto-style29 {
            width: 223px;
            height: 21px;
        }
        .auto-style30 {
            width: 207px;
            height: 19px;
        }
        .auto-style31 {
            width: 223px;
            height: 19px;
        }
        .auto-style32 {
            height: 19px;
            text-align: center;
        }
        .auto-style33 {
            height: 20px;
            text-align: center;
        }
         
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <table class="auto-style1">
            <tr>
                <td colspan="2" class="auto-style8">Modificar/Eliminar N.C.</td>
            </tr>
            <tr>
                <td class="auto-style24"><strong>ID</strong></td>
                <td class="auto-style25">
                    <strong>
                    <asp:TextBox ID="txtid" runat="server" Height="17px" Width="120px" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="- Nº de Factura es Requerida" ControlToValidate="txtid" ValidationGroup="buscar">*</asp:RequiredFieldValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="- Nº de Factura es Requerida" ControlToValidate="txtid" ValidationGroup="actualizar">*</asp:RequiredFieldValidator><asp:Button ID="btnbuscar" runat="server" Height="23px" Text="Buscar" Width="60px" CssClass="auto-style18" OnClick="btnbuscar_Click1" ValidationGroup="buscar" />
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Fecha solicitud</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtFechaSolicitud" runat="server" Height="17px" Width="200px" Enabled="False" TextMode="DateTime"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Empresa</td>
                <td class="auto-style25">
                    <asp:DropDownList ID="txtempresa" runat="server" DataSourceID="empresa" DataTextField="RazonSocial" DataValueField="id_Empresa" Height="17px" Width="200px" Enabled="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="empresa" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [id_Empresa], [RazonSocial] FROM [Empresas]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style26">Cliente</td>
                <td class="auto-style27">
                    <asp:TextBox ID="txtcliente" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Rut</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtrut" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Motivo</td>
                <td class="auto-style25">
                    <asp:DropDownList ID="txtmotivo" runat="server" Height="17px" Width="200px" Enabled="False">
                        <asp:ListItem>Anulacion</asp:ListItem>
                                <asp:ListItem>Cambio Razon Social</asp:ListItem>
                                <asp:ListItem>Error de Impresion</asp:ListItem>
                                <asp:ListItem>Error de Sistemas</asp:ListItem>
                                <asp:ListItem>Error de Cobros</asp:ListItem>
                                <asp:ListItem>Error de Fechas</asp:ListItem>
                                <asp:ListItem>Error de Datos</asp:ListItem>
                                <asp:ListItem>Cambio de Informacion</asp:ListItem>
                                <asp:ListItem>Factura Duplicada</asp:ListItem>
                                <asp:ListItem>Otros</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Detalle</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtdetalle" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">N Operacion</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtnope" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">N Factura</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtnfact" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Fecha Factura</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtfechafact" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Tipo Factura</td>
                <td class="auto-style25">
                    <asp:DropDownList ID="txttipo" runat="server" DataSourceID="tipofactura" DataTextField="TipoFactura" DataValueField="id_TipoFactura" Height="17px" Width="200px" Enabled="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="tipofactura" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [TipoFactura]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">Monto Factura Neto</td>
                <td class="auto-style29">
                    <asp:TextBox ID="txtfacneto" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Monto Factura IVA</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtfaciva" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Monto Factura Exento</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtfactexent" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style30">Monto Total Factura</td>
                <td class="auto-style31">
                    <asp:TextBox ID="txttotalfact" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Monto Nota CreditoNeto</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtncneto" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Monto Nota CreditoIVA</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtnciva" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Monto Nota Credito Exento</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtncexento" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">Monto Total Nota Credito</td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtnctotal" runat="server" Height="17px" Width="200px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style32" colspan="2">
                    <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style33" colspan="2">
                    <asp:Button ID="btnmodificar" runat="server" OnClick="btnmodificar_Click" Text="Modificar" />
                    <asp:Button ID="btnguardar" runat="server" Text="Guardar" OnClick="btnguardar_Click" />
                    <asp:Button ID="btneliminar" runat="server" Text="Eliminar" OnClick="btneliminar_Click" ValidationGroup="actualizar" />
                    </td>
            </tr>
            <tr>
                <td class="auto-style14" colspan="2">
                    &nbsp;</td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
