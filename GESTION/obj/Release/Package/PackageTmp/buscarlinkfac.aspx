<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="buscarlinkfac.aspx.cs" Inherits="GESTION.PagoFacturas.buscarlinkfac" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Buscar</title>
     <style type="text/css">
        .auto-style1 {
            width: 98%;
             height: 50%;
         }
                                                  
                   .auto-style8 {
            padding: 1px 4px;
        text-align: center;
            font-size: x-large;
        height: 30%;
        text-transform: uppercase;
        color: #FFFFFF;
        background-color: #000099;
        border-right-style: solid;
        border-right-width: 1px;
    }
         
        .auto-style14 {
            height: 30px;
            text-align: center;
        }
         .auto-style27 {
             font-weight: bold;
         }
         
         .auto-style30 {
             height: 20px;
             text-align: center;
         }
         .auto-style31 {
             width: 144px;
             height: 17px;
             text-align: right;
         }
         .auto-style32 {
             width: 223px;
             height: 17px;
         }
                  
         .auto-style35 {
             width: 144px;
             height: 73px;
             text-align: right;
             font-size: large;
         }
         .auto-style36 {
             width: 223px;
             height: 73px;
             text-align: center;
         }
         .auto-style37 {
             font-size: x-large;
         }
         
         .auto-style38 {
             width: 144px;
             height: 169px;
             text-align: right;
         }
         .auto-style39 {
             width: 223px;
             height: 169px;
         }
         .auto-style40 {
             width: 144px;
             height: 50px;
             text-align: right;
         }
         .auto-style41 {
             width: 223px;
             height: 50px;
         }
         .auto-style42 {
             width: 144px;
             height: 99px;
             text-align: right;
         }
         .auto-style43 {
             width: 223px;
             height: 99px;
         }
         
    </style>
</head>
<body style="width: 48%; height: 50%; margin-bottom: 15px;">
    <form id="form1" runat="server">
    <div >
      <table class="auto-style1">
            <tr>
                <td colspan="2" class="auto-style8"><strong>Buscar fACTURAS</strong></td>
            </tr>
            <tr>
                <td class="auto-style35"><strong>ID :</strong></td>
                <td class="auto-style36">
                    <strong>
                    <asp:Label ID="lblid" runat="server" CssClass="auto-style37" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </strong>
                    <asp:ImageButton ID="btnEliminar" runat="server" Height="24px" ImageUrl="~/Imagenes/eliminar.png" OnClick="btnEliminar_Click" Width="32px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>N° Invoice</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:TextBox ID="txtNInvoice2" runat="server" Height="100%" Width="90%" Enabled="False" OnTextChanged="txtNInvoice2_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNInvoice2" ErrorMessage="- Nº Cheque es Requerido" ValidationGroup="actualizar">*</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNInvoice2" ErrorMessage="- Nº de Cheque es Requerido" ValidationGroup="buscar">*</asp:RequiredFieldValidator>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Fecha Recepcion F.</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:TextBox ID="txtFRecepcion2" runat="server" Height="100%" TextMode="Date" Width="90%" Enabled="False"></asp:TextBox>
                    </strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFRecepcion2" ErrorMessage="RequiredFieldValidator" ValidationGroup="actualizar">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Fecha Emision F. </strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:TextBox ID="txtFEmision2" runat="server" Height="100%" TextMode="Date" Width="90%" Enabled="False" OnTextChanged="txtFEmision2_TextChanged"></asp:TextBox>
                    </strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFEmision2" ErrorMessage="RequiredFieldValidator" ValidationGroup="actualizar">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Customer/Envia</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:DropDownList ID="ddlcustomers2" runat="server" DataSourceID="customers" DataTextField="Nombre" DataValueField="id_Customer" Height="100%" Width="90%" Enabled="False">
                    </asp:DropDownList>
                    </strong>
                    <asp:SqlDataSource ID="customers" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [id_Customer], [Nombre] FROM [Customers]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Nombre Agente</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:DropDownList ID="ddlNombreagente2" runat="server" DataSourceID="agentes" DataTextField="Nombre" DataValueField="id_Agente" Height="100%" Width="90%" Enabled="False">
                    </asp:DropDownList>
                    </strong>
                    <asp:SqlDataSource ID="agentes" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Agentes]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style40"><strong>N° Operacion</strong></td>
                <td class="auto-style41">
                    <strong>
                    <asp:TextBox ID="txtNOperacion2" runat="server" Height="100%" Width="90%" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style38"><strong>Empresa</strong></td>
                <td class="auto-style39">
                    <asp:DropDownList ID="ddlEmpresa2" runat="server" DataSourceID="Empresa" DataTextField="RazonSocial" DataValueField="id_Empresa" Enabled="False" Height="100%" Width="90%">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [id_Empresa], [RazonSocial] FROM [Empresas]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style42"><strong>Moneda</strong></td>
                <td class="auto-style43">
                    <asp:DropDownList ID="ddlMoneda2" runat="server" DataSourceID="Moneda" DataTextField="Detalle" DataValueField="id_Moneda" Enabled="False" Height="100%" Width="90%">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Moneda" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Moneda]"></asp:SqlDataSource>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Tipo Cambio</strong></td>
                <td class="auto-style32">
                    <asp:TextBox ID="txttipocambio" runat="server" AutoPostBack="True" Height="100%" OnTextChanged="txttipocambio_TextChanged" Width="90%" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Importe</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:TextBox ID="txtImporte2" runat="server" Height="100%" Width="90%" Enabled="False" AutoPostBack="True" OnTextChanged="txtImporte2_TextChanged"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Pesos $</strong></td>
                <td class="auto-style32">
                    <asp:TextBox ID="txtpesos" runat="server" Height="100%" OnTextChanged="txtPesos_TextChanged" Width="90%" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Estado</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:DropDownList ID="ddlestadof2" runat="server" CssClass="auto-style27" Height="100%" Width="90%" Enabled="False">
                        <asp:ListItem>Pendiente</asp:ListItem>
                        <asp:ListItem>Pagado</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Condicion/pago</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:TextBox ID="txtCondicion2" runat="server" Height="100%" Width="90%" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Comentario</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:TextBox ID="txtComentario2" runat="server" Height="100%" Width="90%" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Detalle</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:TextBox ID="txtDetalle2" runat="server" Height="100%" Width="90%" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style31"><strong>Fecha Pago</strong></td>
                <td class="auto-style32">
                    <strong>
                    <asp:TextBox ID="txtFechaPago2" runat="server" Height="100%" TextMode="Date" Width="90%" Enabled="False"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style14" colspan="2">
                    <strong>
                    <asp:Button ID="btnModificar2" runat="server" CssClass="auto-style27" Enabled="False" Height="20px" OnClick="btnModificar_Click" Text="Modificar" Width="200px" />
                    <asp:Button ID="btnActualizar" runat="server" OnClick="btnActualizar_Click1" Text="Grabar" Width="200px" ValidationGroup="actualizar" CssClass="auto-style27" Height="20px" Visible="False" />
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style30" colspan="2">
                    <asp:Label ID="lblmensaje2" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style30" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
