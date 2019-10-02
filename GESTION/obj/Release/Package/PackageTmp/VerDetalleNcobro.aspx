<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="VerDetalleNcobro.aspx.cs" Inherits="GESTION.Cheques.VerDetalleNcobro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 100%;
            height: 557px;
        }
        .auto-style32 {
            height: 47px;
            text-align: center;
            z-index: -1;
            background-color: #999999;
        }
        .auto-style35 {
            height: 47px;
            text-align: left;
            background-color: #FFFFFF;
            width: 368px;
        }
                 .titulo{
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



                 .btnRojo {
  background: #ff0000;
  background-image: -webkit-linear-gradient(top, #ff0000, #e81717);
  background-image: -moz-linear-gradient(top, #ff0000, #e81717);
  background-image: -ms-linear-gradient(top, #ff0000, #e81717);
  background-image: -o-linear-gradient(top, #ff0000, #e81717);
  background-image: linear-gradient(to bottom, #ff0000, #e81717);
  -webkit-border-radius: 10px;
  border-radius: 10px;
  border: 2px solid #ff0000;
  font-family: Arial;
  color: #000000;
  font-size: 14px;
padding: 10px 25px;
 text-shadow: 1px 1px 0px #ff0000;
  box-shadow: 1px 1px 1px #ff0000;
}

.btnRojo:hover {
  background: #ff0000;
  background-image: -webkit-linear-gradient(top, #ff0000, #f02222);
  background-image: -moz-linear-gradient(top, #ff0000, #f02222);
  background-image: -ms-linear-gradient(top, #ff0000, #f02222);
  background-image: -o-linear-gradient(top, #ff0000, #f02222);
  background-image: linear-gradient(to bottom, #ff0000, #f02222);
  text-decoration: none;
}


                 .btnVerde {
  background: #0fb800;
  background-image: -webkit-linear-gradient(top, #00991f, #0fb800);
  background-image: -moz-linear-gradient(top, #00991f, #0fb800);
  background-image: -ms-linear-gradient(top, #00991f, #0fb800);
  background-image: -o-linear-gradient(top, #00991f, #0fb800);
  background-image: linear-gradient(to bottom, #00991f, #0fb800);
  -webkit-border-radius: 10px;
  border-radius: 10px;
  border: 2px solid #0fb800;
  font-family: Arial;
  color: #000000;
  font-size: 14px;
padding: 10px 25px;
 text-shadow: 1px 1px 0px #0fb800;
  box-shadow: 1px 1px 1px #0fb800;
}

.btnVerde:hover {
  background: #0fb800;
  background-image: -webkit-linear-gradient(top, #00991f, #0fb800);
  background-image: -moz-linear-gradient(top, #00991f, #0fb800);
  background-image: -ms-linear-gradient(top, #00991f, #0fb800);
  background-image: -o-linear-gradient(top, #00991f, #0fb800);
  background-image: linear-gradient(to bottom, #00991f, #0fb800);
  text-decoration: none;
}




        .auto-style76 {
            height: 47px;
            text-align: center;
            z-index: 1;
            background-color: #999999;
        }
        .auto-style77 {
            height: 47px;
            text-align: center;
            background-color: #FFFFFF;
            width: 372px;
        }
        .auto-style78 {
            height: 47px;
            background-color: #FFFFFF;
            width: 368px;
        }
        .auto-style79 {
            height: 47px;
            text-align: center;
            width: 190px;
        }
        .auto-style80 {
            height: 47px;
            text-align: center;
            width: 235px;
        }
        .auto-style81 {
            height: 47px;
            text-align: center;
        }
        .auto-style82 {
            height: 47px;
        }
        .auto-style83 {
            height: 48px;
            text-align: center;
            background-color: #FFFFFF;
            }
        .auto-style84 {
            height: 48px;
            background-color: #FFFFFF;
            width: 368px;
            font-size: x-small;
        }
        .auto-style85 {
            height: 48px;
        }
           .testbutton {
  font-family: arial;
  color: #14396A !important;
  font-size: 14px;
  text-shadow: 1px 1px 0px #7CACDE;
  box-shadow: 1px 1px 1px #BEE2F9;
  padding: 10px 25px;
  -moz-border-radius: 10px;
  -webkit-border-radius: 10px;
  border-radius: 10px;
  border: 2px solid #3866A3;
  background: #63B8EE;
  background: linear-gradient(top,  #63B8EE,  #468CCF);
  background: -ms-linear-gradient(top,  #63B8EE,  #468CCF);
  background: -webkit-gradient(linear, left top, left bottom, from(#63B8EE), to(#468CCF));
  background: -moz-linear-gradient(top,  #63B8EE,  #468CCF);
}
.testbutton:hover {
  color: #14396A !important;
  background: #468CCF;
  background: linear-gradient(top,  #468CCF,  #63B8EE);
  background: -ms-linear-gradient(top,  #468CCF,  #63B8EE);
  background: -webkit-gradient(linear, left top, left bottom, from(#468CCF), to(#63B8EE));
  background: -moz-linear-gradient(top,  #468CCF,  #63B8EE);
}



.modalDialog
 {
 position: fixed;
 top: 0;
 right: 0;
 bottom: 0;
 left: 0;
 background: rgba(180,180,180,0.8);
 z-index: 99999;
 opacity: 0;
 -webkit-transition: opacity 600ms ease-in;
 -moz-transition: opacity 600ms ease-in;
 transition: opacity 600ms ease-in;
 pointer-events: none;
 }
 .modalDialog:target
 {
 opacity: 1;
 pointer-events: auto;
 }
 
 .modalDialog > div
 {
 width: 90%;
 position: relative;
 margin: 10% auto;
 padding: 5px 20px 13px 20px;
 border-radius: 10px;
 background: #fff;
 background: -moz-linear-gradient(#fff, #999);
 background: -webkit-linear-gradient(#fff, #999);
 background: #fff;
    top: 0px;
    left: -21px;
}
 
 .close
 {
 background: #606061;
 color: #FFFFFF;
 line-height: 25px;
 position: absolute;
 right: -12px;
 text-align: center;
 top: -10px;
 width: 24px;
 text-decoration: none;
 font-weight: bold;
 -webkit-border-radius: 12px;
 -moz-border-radius: 12px;
 border-radius: 12px;
 -moz-box-shadow: 1px 1px 3px #000;
 -webkit-box-shadow: 1px 1px 3px #000;
 box-shadow: 1px 1px 3px #000;
 }
 
 .close:hover
 {
 background: #00d9ff;
 }

 .DataGridFixedHeader
{
position: relative;
top: expression(this.offsetParent.scrollTop-3); /*this works fine with IE only, but FireFox seems to be ignoring this*/
}


    .scrolling-table-container {
    height: 378px;
    overflow-y: scroll;
    overflow-x: hidden;
}


    </style>
     <script>function MostrarModalJS() {
    window.location.href = '#modalHtml';
}</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style8">
        <tr>
            <td class="titulo" colspan="8"><strong>Solicitud de Cheque / Transferencia&nbsp;&nbsp; Nº
                <asp:Label ID="lblid" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp; 
                Beneficiario :<asp:Label ID="lblbeneficiario" runat="server" Text="Label"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style76" colspan="2">
                <strong aria-multiselectable="False">Solicitud de cheque /&nbsp; Transferencia&nbsp;

            </strong>
   
            </td>
            <td class="auto-style32" colspan="6"><strong>Nota de Cobro Asociada</strong></td>
        </tr>
        <tr>
            <td class="auto-style77">
                <div class="textheader">
                    <strong>Tipo Solicitud</strong> &nbsp;<br />
                </div>
            </td>
            <td class="auto-style78">
                <asp:DropDownList ID="ddltipo" runat="server" Height="90%" Width="90%" Enabled="False">
                    <asp:ListItem Selected="True">CHEQUE</asp:ListItem>
                    <asp:ListItem>TRANSFERENCIA</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style79">
                    <strong>Rut</strong></td>
            <td class="auto-style80" colspan="2">
                <asp:TextBox ID="txtrutnc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style81" colspan="2"><strong>Señores</strong></td>
            <td class="auto-style79">
                <asp:TextBox ID="txtseñnc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style77">
                <div class="textheader">
                    <strong>Empresa</strong> &nbsp;<br />
                </div>
            </td>
            <td class="auto-style78">
                <asp:DropDownList ID="ddlempresa" runat="server" DataSourceID="Empesa" DataTextField="RazonSocial" DataValueField="RazonSocial" Height="90%" Width="90%" Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Empesa" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Empresas]"></asp:SqlDataSource>
            </td>
            <td class="auto-style79"><strong>Ciudad</strong></td>
            <td class="auto-style80" colspan="2">
                <asp:TextBox ID="txtciudadnc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style81" colspan="2"><strong>Comuna</strong></td>
            <td class="auto-style79">
                <asp:TextBox ID="txtcomnc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style77">
                <div class="textheader">
                    <strong>Nombre Solicitante</strong> &nbsp;</div>
            </td>
            <td class="auto-style78">
                <asp:TextBox ID="txtnomsol" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style79"><strong>Direccion</strong></td>
            <td class="auto-style80" colspan="2">
                <asp:TextBox ID="txtdireccionnc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style81" colspan="2"><strong>Telefono</strong></td>
            <td class="auto-style79">
                <asp:TextBox ID="txttelefononc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style77">
                <div class="textheader">
                    <strong>Rut del receptor del Documento</strong> &nbsp;
                    <br />
                </div>
            </td>
            <td class="auto-style78">
                <asp:TextBox ID="txtrut" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style79"><strong>Giro</strong></td>
            <td class="auto-style80" colspan="2">
                <asp:TextBox ID="txtgironc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style81" colspan="2"><strong>Fecha Emision</strong></td>
            <td class="auto-style79">
                <asp:TextBox ID="txtfeminc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style77">
                <div class="textheader">
                    <strong>Descripcion (Factura, Orden de compra o Cotizacion)</strong>&nbsp;<br />
                </div>
            </td>
            <td class="auto-style78">
                <asp:TextBox ID="txtDescripcion" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style79"><strong>N de cobro</strong></td>
            <td class="auto-style80" colspan="2">
                <asp:TextBox ID="txtncobronc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style81" colspan="2"><strong>Fecha Vencimiento</strong></td>
            <td class="auto-style79">
                <asp:TextBox ID="txtfvencnc" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style77">
                <div class="textheader">
                    <strong>Moneda</strong> 
                </div>
            </td>
            <td class="auto-style35">
                &nbsp;<asp:DropDownList ID="ddlmoneda" runat="server" Height="90%" Width="90%" Enabled="False">
                    <asp:ListItem Selected="True">CLP</asp:ListItem>
                    <asp:ListItem>USD</asp:ListItem>
                    <asp:ListItem>EUR</asp:ListItem>
                </asp:DropDownList>
                <br /> 
            </td>
            <td class="auto-style82" colspan="2">
                <asp:TextBox ID="txtdesc1" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style82" colspan="2">
                <asp:TextBox ID="txtcant1" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style82" colspan="2">
                <asp:TextBox ID="txtprecio1" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style83">
                <div class="textheader">
                    <strong>Monto del documento solicitado</strong> 
                    <br />
                </div>
            </td>
            <td class="auto-style84">
                <asp:TextBox ID="txtmonto" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtdesc2" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtcant2" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtprecio2" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style83"> <div class="textheader">
               <strong>Numero de Carpeta</strong>
               &nbsp;<br/>
               </div></td>
            <td class="auto-style84">
                <asp:TextBox ID="txtcarpeta" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtdesc3" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtcant3" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtprecio3" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style83"><strong>Numero de Operacion</strong></td>
            <td class="auto-style84">
                <asp:TextBox ID="txtoperacion" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtdesc4" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtcant4" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtprecio4" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style83"><strong>Numero del Embarque/Referencia</strong></td>
            <td class="auto-style84">
                <asp:TextBox ID="txtEmbarque" runat="server" Height="90%" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtdesc5" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtcant5" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtprecio5" runat="server" Width="90%" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style83"><strong>Vendedor</strong></td>
            <td class="auto-style85">
                <asp:DropDownList ID="ddlvendedor" Width="90%" Enabled="False" runat="server" DataSourceID="Vendedor" DataTextField="Nombre" DataValueField="Nombre"></asp:DropDownList><asp:SqlDataSource runat="server" ID="Vendedor" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [Vendedores] ORDER BY [Nombre]"></asp:SqlDataSource>
            </td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtdesc6" runat="server" Width="90%" Enabled="False"></asp:TextBox></td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtcant6" runat="server" Width="90%" Enabled="False"></asp:TextBox></td>
            <td class="auto-style85" colspan="2">
                <asp:TextBox ID="txtprecio6" runat="server"  Width="90%" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style83" colspan="8">
                  <div id="Alertaok" runat="server" class="alert alert-success" visible="false"><i class="glyphicon glyphicon-thumbs-up"></i> &nbsp;&nbsp; ¡Registro Realizado Correctamente!</div>
                  <div id="Alertanook" runat="server" class="alert alert-danger" visible="false"><i class="glyphicon glyphicon-thumbs-down"></i>&nbsp;&nbsp;¡No posee Permisos , Favor Contactar al Administrador...!</div>
                <br />
                
            <button id="btnimprsol" type="button"  class="testbutton" runat="server"  onserverclick="btnimprsol_Click" >
            <span class="glyphicon glyphicon-print"></span>Imprimir Solicitud</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   




            <button id="btnmprNCobro" type="button"  class="testbutton" runat="server"  onserverclick="btnmprNCobro_Click" >
            <span class="glyphicon glyphicon-print"></span>Imprimir Nota de cobro</button>




            &nbsp;

                
         <button id="Ver" type="button" class="btnVerde" runat="server" onclick="MostrarModalJS(); return false;" >
                <span class="glyphicon glyphicon-eye-open"></span> Registros
                 </button>


                 &nbsp;

                
         <button id="btnEliminar" type="button" class="btnRojo" runat="server"  onserverclick="btnEliminar_ServerClick" >
                <span class="glyphicon glyphicon-remove-circle"></span> Eliminar
                 </button>



            </td>
        </tr>
        </table>



<div id="modalHtml" class="modalDialog">
<div class="textheader">
<a href="#cerrar" title="Cerrar" class="close">X</a>
 <div class="titulo"><strong> Registros</strong></div> 
          <br />
         
       <div class="scrolling-table-container">


             <div class="auto-style85">


             <asp:GridView ID="gvregistros" runat="server" AutoGenerateColumns="False"  DataKeyNames="Ncorrelativo" DataSourceID="Registros" CellPadding="4" ForeColor="#333333" GridLines="None" Height="90%" Width="100%" ShowFooter="True" CssClass="auto-style84" HorizontalAlign="Left" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvFacturas_SelectedIndexChanged"  >
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                 <Columns>
                     <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                     <asp:BoundField DataField="Ncorrelativo" HeaderText="Nº Solicitud" SortExpression="Ncorrelativo" />
                     <asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa" />
                     <asp:BoundField DataField="Nombre_Solicitante" HeaderText="Nombre" SortExpression="Nombre_Solicitante" />
                     <asp:BoundField DataField="Beneficiario" HeaderText="Beneficiario" SortExpression="Beneficiario" />
                     <asp:BoundField DataField="Rut_Receptor" HeaderText="Rut" SortExpression="Rut_Receptor" />
                     <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                     <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda" />
                     <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto"></asp:BoundField>
                     <asp:BoundField DataField="Carpeta" HeaderText="Carpeta" SortExpression="Carpeta" />
                     <asp:BoundField DataField="Operacion" HeaderText="Operacion" SortExpression="Operacion" />
                     <asp:BoundField DataField="Embarque" HeaderText="Embarque" SortExpression="Embarque"></asp:BoundField>
                     <asp:BoundField DataField="Usuario" Visible="false" HeaderText="Usuario" SortExpression="Usuario" />
                     <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                     <asp:BoundField DataField="Fecha_Registro" Visible="false" HeaderText="Fecha_Registro" SortExpression="Fecha_Registro" />
                     <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                     <asp:CheckBoxField DataField="Nota_Cobro" HeaderText="Nota Cobro" SortExpression="Nota_Cobro" />
                     <asp:CommandField ShowSelectButton="True" headerText="Selec"   ControlStyle-CssClass="btn default btn-xs purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-eye-open'></i>">
                     
<ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
                     </asp:CommandField>


                     
                 </Columns>
                 <EditRowStyle BackColor="#999999" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                 <PagerSettings Mode="NextPreviousFirstLast" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" />
                 <SortedAscendingCellStyle BackColor="#E9E7E2" HorizontalAlign="Center" />
                 <SortedAscendingHeaderStyle BackColor="#506C8C" HorizontalAlign="Center" />
                 <SortedDescendingCellStyle BackColor="#FFFDF8" HorizontalAlign="Center" />
                 <SortedDescendingHeaderStyle BackColor="#6F8DAE" HorizontalAlign="Center" />
             </asp:GridView>

             </div>

             <asp:SqlDataSource ID="Registros" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Sol_Cheques] ORDER BY [Ncorrelativo] DESC"></asp:SqlDataSource>

       </div>
 </div>
 </div>







</asp:Content>
