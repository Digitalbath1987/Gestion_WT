<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImprimirNC.aspx.cs" Inherits="GESTION.Otros.ImprimirNC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 99%;
            height: 859px;
        }
        .auto-style2 {
            text-align: center;
            font-size: medium;
            height: 9px;
        }
        .auto-style3 {
            font-size: medium;
            text-decoration: underline;
            font-weight: normal;
        }
        .auto-style10 {
            text-decoration: underline;
            text-align: center;
            height: 16px;
            font-size: medium;
        }
        .auto-style15 {
            text-decoration: underline;
        }
        .auto-style16 {
            width: 240px;
            text-decoration: underline;
            text-align: center;
            height: 10px;
            font-size: medium;
        }
        .auto-style17 {
            height: 19px;
        }
        .auto-style20 {
            width: 240px;
            height: 19px;
            font-size: medium;
        }
        .auto-style24 {
            height: 21px;
            width: 240px;
            font-size: medium;
        }
        .auto-style25 {
            width: 240px;
            text-decoration: underline;
            text-align: center;
            height: 16px;
            font-size: medium;
        }
        .auto-style27 {
            height: 17px;
            width: 240px;
            text-align: center;
            font-size: medium;
        }
        .auto-style30 {
            height: 17px;
            text-align: center;
            font-size: medium;
        }
        .auto-style32 {
            height: 9px;
            width: 240px;
            text-align: center;
            font-size: medium;
        }
        .auto-style34 {
            height: 19px;
            text-decoration: underline;
            font-size: medium;
        }
        .auto-style39 {
            height: 10px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
        }
        .auto-style40 {
            height: 9px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
        }
        .auto-style41 {
            height: 8px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
        }
        .auto-style42 {
            width: 240px;
            height: 9px;
            font-size: medium;
        }
        .auto-style43 {
            width: 240px;
            height: 10px;
        }
        .auto-style44 {
            height: 11px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
        }
        .auto-style45 {
            height: 16px;
        }
        .auto-style46 {
            height: 9px;
        }
        .auto-style50 {
            height: 17px;
            font-size: medium;
        }
        .auto-style51 {
            height: 10px;
            font-size: medium;
        }
        .auto-style52 {
            height: 10px;
            text-align: center;
            font-size: medium;
        }
        .auto-style53 {
            width: 240px;
            height: 13px;
            font-size: medium;
            text-align: center;
        }
        .auto-style54 {
            height: 13px;
        }
        .auto-style55 {
            width: 240px;
            height: 16px;
        }
        .auto-style56 {
            height: 16px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
        }
        .auto-style57 {
            height: 26px;
            text-decoration: underline;
            font-size: medium;
        }
        .auto-style59 {
            height: 10px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
        }
        .auto-style60 {
            font-size: small;
        }
        .auto-style61 {
            width: 240px;
            height: 10px;
            font-size: medium;
        }
        .auto-style62 {
            height: 11px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
        }
        .auto-style63 {
            height: 9px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
        }
        .auto-style64 {
            font-size: medium;
        }
        .auto-style65 {
            height: 13px;
            font-size: medium;
        }
        .auto-style66 {
            height: 21px;
            font-size: medium;
        }
        .auto-style67 {
            height: 19px;
            font-size: medium;
        }
        .auto-style68 {
            height: 8px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
        }
        .auto-style69 {
            font-size: large;
        }
        .auto-style70 {
            height: 21px;
            font-size: medium;
            text-align: center;
        }
    </style>
</head>
<body  style="width: 748px; height: 862px" >
    
    <form id="form1" runat="server">
        
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="6">
                    <span class="auto-style64">
                <asp:Image ID="wti" runat="server" Height="93px" ImageUrl="/Gestion2/Imagenes/LOGO-WT-BLUE.png" Width="116px" Visible="False" />
                    <asp:Image ID="tr3s" runat="server" Height="103px" ImageUrl="/Gestion2/Imagenes/logo-2.png" Visible="False" Width="100px" />
                    </span>
                    <asp:Image ID="courier" runat="server" Height="61px" ImageUrl="/Gestion2/Imagenes/Courier.png" Visible="False" Width="211px" CssClass="auto-style64" />
                    <h6 class="auto-style3">
                        
                        <strong>SOLICITUD :
                        <asp:Label ID="tiponota" runat="server" Text="Nota de Credito"></asp:Label>
&nbsp;</strong></h6>
                </td>
            </tr>
            <tr>
                <td class="auto-style59" colspan="2"><span class="auto-style60">N° de solicitud :&nbsp;</span><span class="auto-style64">&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblnsolicitud" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style39" colspan="4"><span class="auto-style60">Fecha de Solicitud :&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblfechasolicitud" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style59" colspan="3"><span class="auto-style60">Empresa :</span><span class="auto-style64">&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblempresa" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style59" colspan="3"><span class="auto-style60">Factura Reemplazante (</span><strong><span class="auto-style60">Nueva</span></strong>) :<strong>&nbsp;<asp:Label ID="lblfreemplazante" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style63" colspan="4"><span class="auto-style60">Nombre Cliente :&nbsp;</span><span class="auto-style64">&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblcliente" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style40" colspan="2"><span class="auto-style60">Rut del Cliente :&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblrut" runat="server" Text="lblrut" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style59" colspan="2"><span class="auto-style60">Motivo :&nbsp;&nbsp;</span><span class="auto-style64"> 
                    </span><strong> 
                    <asp:Label ID="lblmotivo" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style39" colspan="4"><span class="auto-style60">Detalle Motivo :&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lbldetallemotivo" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style57" colspan="6">Documento De Referencia </td>
            </tr>
            <tr>
                <td class="auto-style59" colspan="2"><span class="auto-style64">Operacion :&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lbloperacion" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style39" colspan="4"><span class="auto-style60">Factura N ° (<strong>Antigua</strong>):&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblnfactura" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style68" colspan="2"><span class="auto-style64">Fecha Factura :&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblfechafactura" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style41" colspan="4"><span class="auto-style60">Tipo Factura :&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lbltipofactura" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style59">Montos Factura :</td>
                <td class="auto-style59" colspan="4">Neto $</td>
                <td class="auto-style39"><span class="auto-style60">&nbsp;&nbsp;&nbsp;
                    </span><strong>
                    <asp:Label ID="lblfneto" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong><span class="auto-style60">&nbsp;</span></td>
            </tr>
            <tr>
                <td class="auto-style42">&nbsp;</td>
                <td class="auto-style63" colspan="4">IVA&nbsp; $</td>
                <td class="auto-style40"><span class="auto-style60">&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblfiva" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style59" colspan="4">Exento $</td>
                <td class="auto-style39"><span class="auto-style60">&nbsp;&nbsp; &nbsp;</span><strong><asp:Label ID="lblfexenta" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style59" colspan="4">Total</td>
                <td class="auto-style39"><span class="auto-style60">&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblftotal" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style34" colspan="6">Montos Nota De Credito :</td>
            </tr>
            <tr>
                <td class="auto-style62">Montos :</td>
                <td class="auto-style62" colspan="4">Neto $</td>
                <td class="auto-style44"><span class="auto-style60">&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblncneto" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style59" colspan="4">IVA $ </td>
                <td class="auto-style39"><span class="auto-style60">&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblnciva" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style59" colspan="4">Exento $</td>
                <td class="auto-style39"><span class="auto-style60">&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblncexento" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style59" colspan="4">Total $</td>
                <td class="auto-style39"><span class="auto-style60">&nbsp;&nbsp;&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblnctotal" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style67" colspan="4">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style25">_________________</td>
                <td class="auto-style45" colspan="4"></td>
                <td class="auto-style10">__________________</td>
            </tr>
            <tr>
                <td class="auto-style32">Operaciones</td>
                <td class="auto-style46" colspan="4">__________________</td>
                <td class="auto-style2">Ventas</td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style70" colspan="4">Cobranzas</td>
                <td class="auto-style66">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16">__________________</td>
                <td class="auto-style51" colspan="4">&nbsp;</td>
                <td class="auto-style52"><span class="auto-style64">&nbsp;</span><span class="auto-style15"><br class="auto-style64" />
                    <span class="auto-style64">________________</span></span></td>
            </tr>
            <tr>
                <td class="auto-style27">Vendedor: <strong>
                    <asp:Label ID="lblvendedor" runat="server" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style50" colspan="4">&nbsp;</td>
                <td class="auto-style30">Gerencia General</td>
            </tr>
            <tr>
                <td class="auto-style53">&nbsp;</td>
                <td class="auto-style65" colspan="4">&nbsp;</td>
                <td class="auto-style54">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style59">Contabilidad</td>
                <td class="auto-style59" colspan="5">Fecha de Recepcion :</td>
            </tr>
            <tr>
                <td class="auto-style55"><span class="auto-style64">De : </span> <em><strong>
                    <asp:Label ID="lblusuario" runat="server" Text="Label" CssClass="auto-style64"></asp:Label>
                    </strong></em></td>
                <td class="auto-style56" colspan="5">Fecha Emision N/C :</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
