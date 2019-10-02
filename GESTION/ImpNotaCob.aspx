<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImpNotaCob.aspx.cs" Inherits="GESTION.NotaCobro.ImpNotaCob" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1078px;
        }
        .auto-style10 {
            height: 33px;
            text-align: justify;
        }
        .auto-style11 {
            height: 33px;
            text-align: center;
            font-size: x-large;
        }
        .auto-style14 {
            height: 124px;
            text-align: center;
        }
        .auto-style15 {
            font-size: x-large;
        }
        .auto-style17 {
            height: 124px;
            text-align: center;
            border-style: solid;
            border-width: 5px;
        }
        .auto-style18 {
            font-size: small;
        }
        .auto-style21 {
            border-style: solid;
            border-width: 3px;
            width: 135px;
            height: 32px;
            text-align: center;
            font-size: medium;
            background-color: #C0C0C0;
        }
        .nuevoEstilo1 {
            font-family: "Arial Black";
        }
        .auto-style24 {
            font-size: medium;
        }
        .auto-style25 {
            font-family: "Arial Black";
            font-size: x-large;
        }
        .auto-style30 {
            border-style: solid;
            border-width: 2px;
            height: 112px;
        }
        .auto-style32 {
            border-style: solid;
            border-width: 3px;
            height: 32px;
            text-align: center;
            font-size: x-small;
            background-color: #C0C0C0;
        }
        .auto-style43 {
            height: 37px;
        }
        .auto-style44 {
            height: 21px;
            border-style: solid;
            border-width: 2px;
            background-color: #C0C0C0;
        }
        .auto-style45 {
            border-style: solid;
            border-width: 2px;
            height: 65px;
        }
        .auto-style46 {
            font-size: x-small;
        }
        .auto-style47 {
            width: 134px;
            height: 47px;
        }
        .auto-style52 {
            border-style: solid;
            border-width: 2px;
            font-size: small;
            height: 23px;
        }
        .auto-style55 {
            width: 135px;
            height: 23px;
        }
        .auto-style63 {
            border-style: solid;
            border-width: 2px;
            width: 135px;
            height: 77px;
            padding-bottom: 0;
        }
        .auto-style66 {
            border-style: solid;
            border-width: 2px;
            width: 135px;
            height: 77px;
            text-align: right;
            padding-bottom: 0;
        }
        .auto-style67 {
            border-style: solid;
            border-width: 2px;
            font-size: small;
        }
        .auto-style68 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            height: 23px;
            font-size: medium;
            font-weight: bold;
        }
        .auto-style71 {
            width: 135px;
            height: 21px;
        }
        .auto-style73 {
            height: 40px;
        }
        .auto-style74 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            height: 21px;
            font-size: medium;
            font-weight: bold;
        }
        .auto-style75 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
        }
        .auto-style76 {
            height: 43px;
        }
        .auto-style77 {
            height: 44px;
        }
        .auto-style78 {
            width: 135px;
            height: 47px;
        }
        .auto-style80 {
            width: 135px;
            height: 40px;
        }
        .auto-style81 {
            height: 77px;
        }
        .auto-style82 {
            width: 135px;
            height: 60px;
            text-align: right;
            padding-bottom: 0;
        }
        .auto-style83 {
            width: 135px;
            height: 60px;
            padding-bottom: 0;
        }
        .auto-style84 {
            height: 60px;
        }
        .auto-style85 {
            font-size: medium;
        }
        .auto-style86 {
            border-style: solid;
            border-width: 3px;
            width: 135px;
            height: 32px;
            text-align: center;
            font-size: small;
            background-color: #C0C0C0;
        }
        .auto-style87 {
            border-style: solid;
            border-width: 2px;
            font-size: medium;
        }
        .auto-style88 {
            font-size: medium;
            font-weight: bold;
        }
        .auto-style91 {
            border-style: solid;
            border-width: 1px;
            height: 30px;
        }
        .auto-style92 {
            border-style: solid;
            border-width: 1px;
            width: 135px;
            height: 30px;
        }
        .auto-style94 {
            border-style: solid;
            border-width: 2px;
            height: 42px;
        }
        .auto-style95 {
            border-style: solid;
            border-width: 2px;
            height: 30px;
        }
        .auto-style96 {
            border-style: solid;
            border-width: 2px;
            height: 66px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style14" colspan="2" rowspan="2">
                    <asp:Image ID="Image1" runat="server" Height="134px" ImageUrl="#" Width="160px" />
                </td>
                <td class="auto-style11" colspan="4">
                    <strong>
                    <asp:Label ID="lblempresa" runat="server" Text="Label"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style17" colspan="2" rowspan="2"><strong><span class="nuevoEstilo1"><span class="auto-style24">R.U.T. 76.446.290-4</span><br class="auto-style24" />
                    <br class="auto-style24" />
                    </span></strong><span class="auto-style25"><strong>N</strong>OTA DE COBRO</span><strong><span class="nuevoEstilo1"><br class="auto-style24" />
                    <br class="auto-style24" />
                    <span class="auto-style24">Nº&nbsp;&nbsp; </span> </span>
                    <asp:Label ID="Label1" runat="server" Text="Label"><span class="auto-style15"></asp:Label>
                    <span class="auto-style24">
                    </span></span>
                    <asp:Label ID="lblncobro" runat="server" CssClass="auto-style24" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="4"><span class="auto-style18">Giro : Transporte maritimo y de cabotaje de carga , transporte regular por via aerea de carga, actividades conexas al transport n.c.p.,actividades de servicios personales n.c.o.</span><br class="auto-style18" />
                    <span class="auto-style18">Calle Madrid 1224, Santiago, Santiago-Chile</span><br class="auto-style18" />
                    <span class="auto-style18">Fono: (56-2) 7267900</span><br class="auto-style18" />
                    <span class="auto-style18">E-mail: cobranzas1@worldtransport.cl</span></td>
            </tr>
            <tr>
                <td class="auto-style76" colspan="8"></td>
            </tr>
            <tr>
                <td class="auto-style95" colspan="2">
                    <strong>Fecha de Emision :</strong><br />
                    <asp:Label ID="lblfechaemision" runat="server"></asp:Label>



                </td>
                <td class="auto-style95" colspan="2">
                    <strong>Fecha Vencimiento :</strong><br />
                    <asp:Label ID="lblfechavencimiento" runat="server"></asp:Label>



                </td>
                <td class="auto-style95" colspan="2">
                    <strong>Vendedor:</strong><br />
                    <asp:Label ID="lblvendedor" runat="server"></asp:Label>



                </td>
                <td class="auto-style30" colspan="2" rowspan="2">
                    <strong>Condiciones de pago :</strong><br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblcondpago" runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />



                </td>
            </tr>
            <tr>
                <td class="auto-style94" colspan="2">
                    <strong>Tipo Asociacion :</strong><br />
                    <asp:Label ID="Label21" runat="server"></asp:Label>



                </td>
                <td class="auto-style94" colspan="2">
                    <strong>Nº Operacion :</strong><br />
                    <asp:Label ID="lblnoperacion" runat="server"></asp:Label>



                </td>
                <td class="auto-style94" colspan="2">
                    <strong>Nro. Documento (Hbl-Crt-Awb):</strong><br />
                    <asp:Label ID="lbldocumento" runat="server"></asp:Label>



                </td>
            </tr>
            <tr>
                <td class="auto-style96" colspan="8"><span class="auto-style18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                    <span class="auto-style85"><strong>SEÑORES :&nbsp;&nbsp; </strong> </span>
                    <strong>
                    <asp:Label ID="lblseñores" runat="server" CssClass="auto-style85" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style85">GIRO:&nbsp; </span>
                    <asp:Label ID="lblgiro" runat="server" CssClass="auto-style85" Text="Label"></asp:Label>
                    &nbsp;<span class="auto-style85">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TELEFONO:&nbsp;
                    <asp:Label ID="lbltelefono" runat="server" CssClass="auto-style85" Text="Label"></asp:Label>
                    </span>
                    <br class="auto-style85" />
                    </strong>
                    <span class="auto-style85"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIRECCION&nbsp;:&nbsp;
                    <asp:Label ID="lbldirecion" runat="server" CssClass="auto-style85" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;COMUNA:&nbsp;
                    <asp:Label ID="lblcomuna" runat="server" CssClass="auto-style85" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CIUDAD:&nbsp;
                    <asp:Label ID="lblciudad" runat="server" CssClass="auto-style85" Text="Label"></asp:Label>
                    &nbsp;&nbsp; </strong> </span><strong><br class="auto-style85" />
                    </strong>
                    <span class="auto-style85"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R.U.T.:&nbsp;&nbsp;
                    <asp:Label ID="lblrut" runat="server" CssClass="auto-style85" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FECHA EMISION&nbsp;:&nbsp;
                    <asp:Label ID="lblfechaemi" runat="server" CssClass="auto-style85" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FECHA VENCIMIENTO&nbsp;
                    <asp:Label ID="fechavencimiento" runat="server" CssClass="auto-style85" Text="Label"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong> </span>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style77" colspan="8"></td>
            </tr>
            <tr>
                <td class="auto-style32" colspan="6"><strong class="auto-style18">DESCRIPCION</strong></td>
                <td class="auto-style21"><strong>Cantidad</strong></td>
                <td class="auto-style86"><strong>TOTAL</strong></td>
            </tr>
            <tr>
                <td class="auto-style91" colspan="6">
                 <p> <asp:Label ID="Descr1" runat="server"></asp:Label></p> 
              
                </td>
                <td class="auto-style92">
                 <p>   <asp:Label ID="cant1" runat="server"></asp:Label></p>  
                   
                </td>
                <td class="auto-style92">
                  <p> <asp:Label ID="Total1" runat="server"></asp:Label></p> 
                   
                  
                </td>
            </tr>
            <tr>
                <td class="auto-style91" colspan="6">
                    <asp:Label ID="Descr2" runat="server"></asp:Label>    
                </td>
                <td class="auto-style92">
                    <asp:Label ID="cant2" runat="server"></asp:Label> 
                </td>
                <td class="auto-style92">
                    <asp:Label ID="Total2" runat="server"></asp:Label> 
                </td>
            </tr>
            <tr>
                <td class="auto-style91" colspan="6">
                    <asp:Label ID="Descr3" runat="server"></asp:Label> 
                </td>
                <td class="auto-style92">
                    <asp:Label ID="cant3" runat="server"></asp:Label> 
                </td>
                <td class="auto-style92">
                    <asp:Label ID="Total3" runat="server"></asp:Label> 
                </td>
            </tr>
            <tr>
                <td class="auto-style91" colspan="6">
                    <asp:Label ID="Descr4" runat="server"></asp:Label> 
                </td>
                <td class="auto-style92">
                    <asp:Label ID="cant4" runat="server"></asp:Label> 
                </td>
                <td class="auto-style92">
                    <asp:Label ID="Total4" runat="server"></asp:Label> 
                </td>
            </tr>
            <tr>
                <td class="auto-style91" colspan="6">
                    <asp:Label ID="Descr5" runat="server"></asp:Label>  
                </td>
                <td class="auto-style92">
                    <asp:Label ID="cant5" runat="server"></asp:Label> 
                </td>
                <td class="auto-style92">
                    <asp:Label ID="Total5" runat="server"></asp:Label> 
                </td>
            </tr>
            <tr>
                <td class="auto-style91" colspan="6">
                    <asp:Label ID="Descr6" runat="server"></asp:Label> 
                </td>
                <td class="auto-style92">
                    <asp:Label ID="cant6" runat="server"></asp:Label> 
                </td>
                <td class="auto-style92">
                    <asp:Label ID="Total6" runat="server"></asp:Label> 
                </td>
            </tr>
            <tr>
                <td class="auto-style43" colspan="8"></td>
            </tr>
            <tr>
                <td class="auto-style44" colspan="8">&nbsp; <span class="auto-style24"><strong>OBSERVACIONES</strong></span><span class="auto-style46">&nbsp;</span></td>
            </tr>
            <tr>
                <td class="auto-style45" colspan="8">
                    <asp:Label ID="lblobservacion" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style47"></td>
                <td class="auto-style47"></td>
                <td class="auto-style47"></td>
                <td class="auto-style47"></td>
                <td class="auto-style78"></td>
                <td class="auto-style78"></td>
                <td class="auto-style78"></td>
                <td class="auto-style78"></td>
            </tr>
            <tr>
                <td class="auto-style52" colspan="6"><span class="auto-style18"><strong>&nbsp;&nbsp; SON&nbsp;:&nbsp;&nbsp; </strong></span><strong>
                    <asp:Label ID="lblson" runat="server" CssClass="auto-style18" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style52" colspan="2"><strong>&nbsp;SUBTOTAL :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblsubtotal" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style73" colspan="6"></td>
                <td class="auto-style80"></td>
                <td class="auto-style80"></td>
            </tr>
            <tr>
                <td class="auto-style81" colspan="6"></td>
                <td class="auto-style63"><span class="auto-style24"><strong>NETO :</strong></span><strong><br class="auto-style87" />
                    </strong>
                    <span class="auto-style24"><strong>19,00&nbsp; %IVA:</strong></span><strong><br class="auto-style87" />
                    </strong>
                    <span class="auto-style24"><strong>EXENTO:</strong></span><strong><br class="auto-style87" />
                    </strong>
                    <span class="auto-style24"><strong>TOTAL:</strong></span></td>
                <td class="auto-style66">
                    <asp:Label ID="lblNeto" runat="server" CssClass="auto-style18" Text="Label"></asp:Label>
                    <br class="auto-style67" />
                    <asp:Label ID="txtiva" runat="server" CssClass="auto-style18" Text="Label"></asp:Label>
                    <br class="auto-style67" />
                    <asp:Label ID="lblexento" runat="server" CssClass="auto-style18" Text="Label"></asp:Label>
                    <br class="auto-style67" />
                    <asp:Label ID="lbltotal" runat="server" CssClass="auto-style18" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style84" colspan="6"></td>
                <td class="auto-style83"></td>
                <td class="auto-style82"></td>
            </tr>
            <tr>
                <td class="auto-style68" colspan="3">FECHA DE RECEPCION:</td>
                <td class="auto-style68" colspan="2">&nbsp; RECINTO:&nbsp;</td>
                <td class="auto-style55">&nbsp;</td>
                <td class="auto-style55">&nbsp;</td>
                <td class="auto-style55">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style74" colspan="3"><span class="auto-style88">NOMBRE:</span><b><br class="auto-style75" />
                    </b>
                    <span class="auto-style88">RUT:</span></td>
                <td class="auto-style74" colspan="2">&nbsp;FIRMA:&nbsp;</td>
                <td class="auto-style71"></td>
                <td class="auto-style71"></td>
                <td class="auto-style71"></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
