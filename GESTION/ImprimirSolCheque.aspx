<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImprimirSolCheque.aspx.cs" Inherits="GESTION.Cheques.ImprimirSolCheque" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 741px;
            height: 859px;
        }
        .auto-style2 {
            text-align: center;
            font-size: medium;
            height: 4px;
        }
        .auto-style3 {
            font-size: medium;
            text-decoration: underline;
            font-weight: normal;
        }
        .auto-style15 {
            text-decoration: underline;
        }
        .auto-style27 {
            height: 17px;
            width: 184px;
            text-align: center;
            font-size: medium;
        }
        .auto-style30 {
            height: 17px;
            text-align: center;
            font-size: medium;
            width: 185px;
        }
        .auto-style39 {
            height: 10px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
        }
        .auto-style50 {
            height: 17px;
            font-size: medium;
        }
        .auto-style53 {
            width: 184px;
            height: 13px;
            font-size: medium;
            text-align: center;
        }
        .auto-style54 {
            height: 13px;
            width: 185px;
            text-align: center;
        }
        .auto-style55 {
            width: 184px;
            height: 16px;
        }
        .auto-style56 {
            height: 16px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
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
        .auto-style64 {
            font-size: medium;
        }
        .auto-style65 {
            height: 13px;
            font-size: medium;
        }
        .auto-style69 {
            font-size: large;
        }
        .auto-style75 {
            height: 10px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
            width: 184px;
        }
        .auto-style76 {
            height: 5px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
        }
    </style>
</head>
<body  style="width: 748px; height: 862px" >
    
    <form id="form1" runat="server">
        
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="4">
                    <span class="auto-style64">
                <asp:Image ID="wti" runat="server" Height="93px" ImageUrl="/Gestion2/Imagenes/LOGO-WT-BLUE.png" Width="116px" Visible="False" />
                    <asp:Image ID="tr3s" runat="server" Height="103px" ImageUrl="/Gestion2/Imagenes/logo-2.png" Visible="False" Width="100px" />
                    <asp:Image ID="courier" runat="server" Height="61px" ImageUrl="/Gestion2/Imagenes/Courier.png" Visible="False" Width="211px" CssClass="auto-style64" />
                    </span>
                    <h6 class="auto-style3">
                        
                        <strong>SOLICITUD : </strong>
                        <asp:Label ID="lbltipo" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                    &nbsp;
                        <asp:Label ID="lblempresa" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                    </h6>
                </td>
            </tr>
            <tr>
                <td class="auto-style75" colspan="2"><strong>N° de Solicitud :</strong><span class="auto-style60">&nbsp;</span><span class="auto-style64">&nbsp; 
                    </span><strong> 
                    <asp:Label ID="lblid" runat="server" Text="Label" CssClass="auto-style69"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style59" colspan="2"><strong>Rut del Receptor Documento :&nbsp;
                    <asp:Label ID="lblrut" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style59" colspan="2"><strong>Nombre Del Solicitante :&nbsp;
                    <asp:Label ID="lblnombre" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style59" colspan="2"><strong>Beneficiario:&nbsp; </strong>
                    <asp:Label ID="lblBeneficiario" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style75" colspan="2"><strong>Moneda :
                    <asp:Label ID="lblmoneda" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style39" colspan="2"><strong>Monto del Documento :
                    <asp:Label ID="lblmonto" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style75" colspan="2"><strong>Descripcion :
                    <asp:Label ID="lbldescripcion" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style39" colspan="2"><strong>Numero Cheque Reemplaza :
                    <asp:Label ID="lblnumchequ" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style75" colspan="2"><strong>Numero de carpeta :
                    <asp:Label ID="lblnumcarpe" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style39" colspan="2"><strong>Numero de Operacion :
                    <asp:Label ID="lblnumope" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style59" colspan="4"><strong>Numero de Embarque u otra Referencia :
                    <asp:Label ID="lblnumemb" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style76" colspan="4">
                    
                    
                    <div style="height: 36px">
                        <strong>Nota de Cobro Asociada :</strong>&nbsp;&nbsp; <strong>
                        <asp:Label ID="lblSI" runat="server" Enabled="False" Text="SI" Visible="False"></asp:Label>
&nbsp;
                        <asp:Label ID="lblNO" runat="server" Enabled="False" Text="NO" Visible="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="nota1" runat="server" Text="Nº Nota de Cobro :" Visible="False"></asp:Label>
                        </strong>
                    &nbsp;<strong><asp:Label ID="nota2" runat="server" Text="Label" Visible="False"></asp:Label>
                        </strong>
                    </div>
                    



                </td>
            </tr>
            <tr>
                <td class="auto-style27"><span class="auto-style15">
                    <span class="auto-style64">________________</span></span></td>
                <td class="auto-style50" colspan="2">&nbsp;</td>
                <td class="auto-style30"><span class="auto-style15">
                    <span class="auto-style64">________________</span></span></td>
            </tr>
            <tr>
                <td class="auto-style53"><strong>Solicitante</strong></td>
                <td class="auto-style65" colspan="2">&nbsp;</td>
                <td class="auto-style54"><strong>Gerencia General</strong></td>
            </tr>
            <tr>
                <td class="auto-style55"><span class="auto-style64"><strong>De : </strong> </span> <em><strong>
                    <asp:Label ID="lbluser" runat="server" Text="Label" CssClass="auto-style64"></asp:Label>
                    </strong></em></td>
                <td class="auto-style56" colspan="3"><strong>Fecha Solicitud Cheque:
                    <asp:Label ID="lblfecha" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
