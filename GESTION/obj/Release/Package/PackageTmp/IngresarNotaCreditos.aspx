<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="IngresarNotaCreditos.aspx.cs" Inherits="GESTION.Otros.IngresarNotaCreditos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    
                
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


.btn {
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

.btn:hover {
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

.btnAmarillo {
  background: #0fb800;
  background-image: -webkit-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -moz-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -ms-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -o-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: linear-gradient(to bottom, #f7ff00, #f7ff00);
  -webkit-border-radius: 10px;
  border-radius: 10px;
  border: 2px solid #f7ff00;
  font-family: Arial;
  color: #000000;
  font-size: 14px;
padding: 10px 25px;
 text-shadow: 1px 1px 0px #f7ff00;
  box-shadow: 1px 1px 1px #f7ff00;
}

.btnAmarillo:hover {
  background: #f7ff00;
  background-image: -webkit-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -moz-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -ms-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -o-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: linear-gradient(to bottom, #f7ff00, #f7ff00);
  text-decoration: none;
}


.scrolling-table-container {
  height: 378px;
  overflow-y: scroll;
  overflow-x: hidden;
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

    </style>
    <script type="text/javascript">
     function formatoRut(texto, inputText) {
     objRut = document.getElementById(inputText);
     var rut_aux = "";
     for (i = 0; i < texto.length; i++)
     if (texto.charAt(i) != ' ' && texto.charAt(i) != '.' && texto.charAt(i) != '-')
     rut_aux = rut_aux + texto.charAt(i);
     largo = rut_aux.length;
     if (largo == 0) return false;
     if (largo < 2) return false;
     for (i = 0; i < largo; i++) {
     var letra = rut_aux.charAt(i);
     if (!letra.match(/^([0-9]|[kK])$/)) return false;
     }
     var rut_inv = "";
     for (i = (largo - 1), j = 0; i >= 0; i-- , j++) rut_inv = rut_inv + rut_aux.charAt(i);
     var dtexto = "";
     dtexto = dtexto + rut_inv.charAt(0);
     dtexto = dtexto + '-';
     cnt = 0;
     for (i = 1, j = 2; i < largo; i++ , j++) {
     if (cnt == 3) {
     dtexto = dtexto + '.';
     j++;
     dtexto = dtexto + rut_inv.charAt(i);
     cnt = 1;
     } else {
     dtexto = dtexto + rut_inv.charAt(i);
     cnt++;
     }
     }
     rut_inv = "";
     for (i = (dtexto.length - 1), j = 0; i >= 0; i-- , j++) rut_inv = rut_inv + dtexto.charAt(i);
     objRut.value = rut_inv.toUpperCase()
     }


     
     function MostrarModalJS() {
                window.location.href = '#modalHtml';
     }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container">
<div class="panel panel-primary">
<div class="panel-heading">
<h4> <strong> Solicitud Nota Credito / Debito</strong> </h4> </div>
<div class="panel-body">


     <div class="form-group">
     <div class="panel panel-default">
     <div class="panel-heading"><strong>Datos De la Factura</strong></div>
     <div class="panel-body">



<table class="table">
<tbody>
<tr>
<td>  
   <div class="form-group">
   <label for="ejemplo_email_1">Tipo de Solicitud</label>
   <i class="glyphicon glyphicon-cog"></i>
   <asp:DropDownList ID="ddltiponota" class="form-control" runat="server">
   <asp:ListItem>Nota de Credito</asp:ListItem>
   <asp:ListItem>Nota de Debito</asp:ListItem>
   </asp:DropDownList>

</div>
</td>
<td>
   <div class="form-group">
   <label for="ejemplo_email_1">Nombre Vendedor</label>
   <i class="glyphicon glyphicon-user"></i>
   <asp:DropDownList ID="txtNombreVendedor" runat="server" DataSourceID="Vendedores" class="form-control" DataTextField="Nombre" DataValueField="Nombre"></asp:DropDownList>
   <asp:SqlDataSource runat="server" ID="Vendedores" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT [Nombre], [id_Vendedor] FROM [Vendedores] with(nolock) ORDER BY [Nombre]"></asp:SqlDataSource>
   </div>
</td>
<td>
  <div class="form-group">
  <label for="ejemplo_email_1">Empresa</label>
  <i class="glyphicon glyphicon-lock"></i>
  <asp:DropDownList ID="ddlEmpresa" runat="server" class="form-control" DataSourceID="Empresas" DataTextField="RazonSocial" DataValueField="id_Empresa">
  </asp:DropDownList>
  <asp:SqlDataSource ID="Empresas" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [RazonSocial], [id_Empresa] FROM [Empresas] with(nolock)"></asp:SqlDataSource>
  </div>
</td>
<td>
  <div class="form-group">
  <label for="ejemplo_email_1">Fecha de Factura</label>
  <i class="glyphicon glyphicon-calendar"></i> <asp:TextBox type="date" class="form-control" id="txtFechaFactura"  runat="server"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe Ingresar Fecha Factura!!!!" ControlToValidate="txtFechaFactura" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
  </div>
</td>
</tr>
<tr>
<td>
  <div class="form-group">
  <label for="ejemplo_email_1">Cliente</label>
  <i class="glyphicon glyphicon-user"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Cliente" id="txtCliente"></asp:TextBox> 
  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe Ingresar Cliente!!!!" ControlToValidate="txtCliente" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
  </div>
</td>
<td>
  <div class="form-group">
  <label for="ejemplo_email_1">Rut</label>
  <i class="glyphicon glyphicon-credit-card"></i><asp:TextBox runat="server" onblur="javascript:formatoRut(this.value,this.id)" class="form-control" placeholder="Ingresar Rut Cliente" id="txtRut"></asp:TextBox> 
  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe Ingresar Rut!!!!" ControlToValidate="txtRut" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
  </div>    
</td>
<td>
  <div class="form-group">
  <label for="ejemplo_email_1">Nº Operacion</label>
  <i class="glyphicon glyphicon-folder-open"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar N Operacion" id="txtNOperacion"></asp:TextBox> 
  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Debe Ingresar N° Operacion!!!!" ControlToValidate="txtNOperacion" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
  </div>
</td>
<td>
  <div class="form-group">
  <label for="ejemplo_email_1">Nº Factura</label>
  <i class="glyphicon glyphicon-file"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar N° Factura" id="txtNFactura"></asp:TextBox> 
  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Debe Ingresar Factura!!!!" ControlToValidate="txtNFactura" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
  </div>
</td>
</tr>
    <tr>
<td>

   <div class="form-group">
   <label for="ejemplo_email_1">Motivo</label>
   <i class="glyphicon glyphicon-listr"></i>
    <asp:DropDownList ID="ddlmotivo" runat="server"  class="form-control"  >
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
   
   </div>

</td>
<td>

  <div class="form-group">
  <label for="ejemplo_email_1">Detalle Motivo</label>
  <i class="glyphicon glyphicon-comment"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Detalle" id="txtDetallemotivo"></asp:TextBox> 
  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Especificar detalle!!!!" ControlToValidate="txtDetallemotivo" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
  </div>

</td>
<td>
     <div class="form-group">
  <label for="ejemplo_email_1">Tipo Factura</label>
  <i class="glyphicon glyphicon-cog"></i><asp:DropDownList ID="ddlTipoFact" runat="server" class="form-control" DataSourceID="tipofactura" DataTextField="TipoFactura" DataValueField="id_TipoFactura"  AutoPostBack="True"  OnTextChanged="ddlTipoFact_TextChanged" >
  <asp:ListItem>Afecta</asp:ListItem>
  <asp:ListItem>Exenta</asp:ListItem>
  </asp:DropDownList>     
  <asp:SqlDataSource ID="tipofactura" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [id_TipoFactura], [TipoFactura] FROM  [TipoFactura] with(nolock)"></asp:SqlDataSource>
  </div>
  

</td>
<td> 
  
    <div class="form-group">
  <label for="ejemplo_email_1">Factura Reemplazante(Nueva)</label>
  <i class="glyphicon glyphicon-duplicate"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Fact Reemplazante!!!" id="txtnfacReemplazante"></asp:TextBox> 
  </div>
</td>
</tr>
</tbody>
</table>


</div>
</div>
</div>



     <div class="form-group">
     <div class="panel panel-default">
     <div class="panel-heading"><strong>Montos de la Nota de Credito / Debito </strong> </div>
     <div class="panel-body">

         <table class="table">
         <thead>
         <tr>
         <th>
        
         </th>
             <th>
         Monto de Factura
         </th>
         <th>
        
         </th>
             <th>
           Monto de Nota de Credito
         </th>
         </tr>
         </thead>
<tbody>
     <tr>
         <td>
               <div class="form-group">
               <label for="ejemplo_email_1">Monto Factura Neto :</label><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="  *" ControlToValidate="txtMontoNetoFact" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
               </div>
         </td>
         <td>
               <asp:TextBox runat="server" class="form-control" TextMode="Number"  placeholder="Ingresar Monto de la Factura!!" id="txtMontoNetoFact" AutoPostBack="true" OnTextChanged="txtMontoNetoFact_TextChanged"></asp:TextBox> 
         </td>
         <td>
             <div class="form-group">
  <label for="ejemplo_email_1">Monto Nota Credito Neto :</label><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="   *" ControlToValidate="txtMontoNetoNC" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
   </div>
         </td>
         <td>
          <asp:TextBox runat="server" class="form-control" placeholder="Ingresar Monto Nota C.!"  TextMode="Number"  AutoPostBack="true" id="txtMontoNetoNC" OnTextChanged="txtMontoNetoNC_TextChanged"></asp:TextBox> 
         </td>

     </tr>
    <tr>
        <td>
                <div class="form-group">
                <label for="ejemplo_email_1">Monto Factura  IVA :</label>
                </div>
        </td>
         <td>
                <asp:TextBox runat="server" class="form-control" Enabled="false" Text="0" id="txtMontoIVAFact"></asp:TextBox> 
        </td>
         <td>
           <div class="form-group">
  <label for="ejemplo_email_1">Monto Nota Credito IVA :</label>
   
  </div>
        </td>
         <td>
            <asp:TextBox runat="server" class="form-control"  Enabled="false"  Text="0" id="txtMontoIVANC"></asp:TextBox>
        </td>
      </tr>
    <tr>
        <td>
             <div class="form-group">
             <label for="ejemplo_email_1">Monto Factura  Exento :</label>
             </div>
        </td>
        <td>
             <asp:TextBox runat="server" class="form-control" Enabled="false"   Text="0" id="txtMontoExentoFact"></asp:TextBox> 
        </td>
        <td>
             <div class="form-group">
             <label for="ejemplo_email_1">Monto Nota Credito Exento :</label>
             </div>
        </td>
        <td>
          <asp:TextBox runat="server" class="form-control"  Enabled="false"  Text="0"  id="txtMontoExentoNC"></asp:TextBox> 
        </td>
    </tr>
     <tr>
        <td>
             <div class="form-group">
             <label for="ejemplo_email_1">	Monto Total Factura :</label>
             </div>
        </td>
           <td>
             <asp:TextBox runat="server" class="form-control"  Enabled="false"  Text="0" id="txtTotalFact"></asp:TextBox> 
        </td>
           <td>
            <div class="form-group">
            <label for="ejemplo_email_1">Monto Total Nota Credito :</label>
            </div>
        </td>
           <td>
            <asp:TextBox runat="server" class="form-control"  Enabled="false"  Text="0" id="txtTotalNC"></asp:TextBox> 
        </td>
     </tr>


      </tbody>
      </table>

     </div>
     </div>
     </div>

    
    <div id="Alertaok" runat="server" class="alert alert-success" visible="false"><i class="glyphicon glyphicon-thumbs-up"></i> &nbsp;&nbsp; ¡Registro Realizado Correctamente!</div>
    <div id="SinNC" runat="server" class="alert alert-danger" visible="false"><i class="glyphicon glyphicon-thumbs-down"></i>&nbsp;&nbsp;¡No Existe Nota de Cobro Registrada!,Favor Contactar a Contabilidad...</div>
    <div id="sinper" runat="server" class="alert alert-danger" visible="false"><i class="glyphicon glyphicon-thumbs-down"></i>&nbsp;&nbsp;¡No Posee Permisos!,Favor Contactar a Administrador...</div>
    <div id="NOOK" runat="server" class="alert alert-danger" visible="false"><i class="glyphicon glyphicon-thumbs-down"></i>&nbsp;&nbsp;¡Error en el Registro!,Favor Revisar los Datos o Contactar a Administrador...</div>
 <footer>

            <button id="btnRegistrar" type="button" class="btnVerde" runat="server"   validationgroup="registrar" onserverclick="btnRegistrar_ServerClick">
                <span class="glyphicon glyphicon-floppy-disk"></span>     Grabar       </button>

&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
                     <button id="btnRegistros" type="button"  onclick="MostrarModalJS(); return false;"   class="btnAmarillo" runat="server"  >
                <span class="glyphicon glyphicon-eye-open"></span> Registros     </button>

                 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
                     <button id="btnModReg" type="button"  onserverclick="btnModReg_ServerClick"     class="btn" runat="server">
                <span class="glyphicon glyphicon-pencil"></span> Modificar </button>
                 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
                     <button id="btnCargarNC" type="button" onserverclick="btnCargarNC_ServerClick"   class="testbutton" runat="server">
                <span class="glyphicon glyphicon-open-file"></span> Cargar NC</button>
         </footer>
</div>
</div>
</div>
<div id="modalHtml" class="modalDialog">
<div>
 <a href="#cerrar" title="Cerrar" class="close">X</a>


    
    <div class="row">
    <div class="col-xs-12">
    <div class="panel panel-default">
    <div class="panel-heading"><strong>Registros de Nota Credito / Debito  </strong> 
    <div class="panel-body">
    <div class="scrolling-table-container">
   <asp:GridView ID="gvnotacreditos" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_NC" DataSourceID="ListarNotaCredito" GridLines="None" PageSize="10000" CssClass="auto-style46"  ForeColor="#333333"  OnRowCommand="gvnotacreditos_RowCommand">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="id_NC" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_NC" />
                                    <asp:BoundField DataField="tiponota" HeaderText="Tipo Nota" SortExpression="tiponota" />
                                    <asp:BoundField DataField="NFactura" HeaderText="N Factura" SortExpression="NFactura" ><ItemStyle Font-Bold="True" /></asp:BoundField>
                                    <asp:BoundField DataField="RazonSocial" HeaderText="Empresa" SortExpression="RazonSocial" />
                                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                                    <asp:BoundField DataField="TotalFact" HeaderText="Total Fact" SortExpression="TotalFact" />
                                    <asp:BoundField DataField="TotalNC" HeaderText="Total NC" SortExpression="TotalNC" />
                                    <asp:BoundField DataField="NNC" HeaderText="Num NC" SortExpression="NNC" />
                                    <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                                    <asp:TemplateField HeaderText="imp. Solicitud" ItemStyle-HorizontalAlign="Center" >
                                    <ItemTemplate>
                                    <asp:LinkButton  ID="Imprimir" CommandName="Imprimir" ToolTip="Imprimir Nota de C/D " CommandArgument='<%# Bind("id_NC") %>' runat="server" >
                                    <span aria-hidden="true" class="glyphicon glyphicon-print"></span>
                                    </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Height="12px"></ItemStyle>                                
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Descargar NC" ItemStyle-HorizontalAlign="Center" >
                                    <ItemTemplate>
                                    <asp:LinkButton  ID="NotaCD" CommandName="NotaCD" ToolTip="Descargar Nota de C/D asociada" CommandArgument='<%# Bind("id_NC") %>' runat="server" >
                                    <span aria-hidden="true" class="glyphicon glyphicon-save-file"></span>
                                    </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Height="12px"></ItemStyle>                                
                                    </asp:TemplateField>
                                    </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
        <asp:SqlDataSource ID="ListarNotaCredito" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT NotaCreditos.id_NC,NotaCreditos.fecha,Empresas.RazonSocial,NotaCreditos.Cliente,NotaCreditos.NOperación,NotaCreditos.NFactura,NotaCreditos.FechaFactura,TipoFactura.TipoFactura,NotaCreditos.TotalFact,NotaCreditos.TotalNC,Usuarios.Usuario,NotaCreditos.FechaRegistro,NotaCreditos.NNC,NotaCreditos.NFReemplazante,NotaCreditos.tiponota  FROM NotaCreditos , Empresas , Usuarios , TipoFactura  where NotaCreditos.Empresa = Empresas.id_Empresa and Usuarios.id_Usuario = NotaCreditos.id_Usuario and TipoFactura.id_TipoFactura = NotaCreditos.idTipoFactura order by id_NC Desc"></asp:SqlDataSource>
     </div>   
     </div>
   </div>
 </div>
</div>
</div> 
</div>  
</div>



    
</asp:Content>
