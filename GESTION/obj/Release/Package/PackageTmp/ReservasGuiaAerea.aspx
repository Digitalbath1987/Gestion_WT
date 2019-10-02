<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ReservasGuiaAerea.aspx.cs" Inherits="GESTION.Control_Operaciones.Guias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.7.2.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.js"></script>




    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtawbaf").mask("999-9999999");

        });
    </script>


<style type="text/css"> 
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

.modalDialog2
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
 .modalDialog2:target
 {
 opacity: 1;
 pointer-events: auto;
 }
 
 .modalDialog2 > div
 {
 width: 30%;
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
  .modalDialog3
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
 .modalDialog3:target
 {
 opacity: 1;
 pointer-events: auto;
 }

 .modalDialog3 > div
 {
 width: 50%;
 height: 70%;
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
</style>
<script>

function MostrarModalJS() {
window.location.href = '#modalHtml';
}

function MostrarModalJS2() {
window.location.href = '#modalHtml2';
}


</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading">
<h5> <strong>GUIAS</strong> </h5> </div>
<div class="panel-body">
<table class="table">
<thead>
<tr>
<th colspan="3">
</th>  
</tr>
</thead>
<tbody>
<tr>  
<td>
<div class="form-group">
<label for="ejemplo_email_1">AWB AF</label>
<i class="glyphicon glyphicon-duplicate"></i>
<div class="input-group">
<span class="input-group-btn">
<asp:TextBox id="txtawbaf" ClientIDMode="Static"  placeholder="AWB AF"  class="form-control" runat="server"></asp:TextBox>
<button id="Busqueda" type="button" validationgroup="Buscar" class="btn btn-secondary" runat="server"  >
<span class="glyphicon glyphicon-search"></span></button>
</span>
</div>
<asp:RequiredFieldValidator ID="rfvndocumento" runat="server" ErrorMessage="Debe Ingresar AWB AF!!!!" ControlToValidate="txtawbaf" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="ingresarreg" />
<asp:RequiredFieldValidator ID="rfvndocbus" runat="server" ErrorMessage="Debe Ingresar AWB AF!!!!" ControlToValidate="txtawbaf" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="Buscar" />
</div>
</td>
<td>
<div class="form-group">
<label for="ejemplo_email_1">Empresa</label>
<i class="glyphicon glyphicon-briefcase"></i>
<asp:DropDownList ID="DdlEmpresa" class="form-control" runat="server">
<asp:ListItem Selected="True">World Transport Courier ltda</asp:ListItem>
<asp:ListItem>World Transport Int. Ltda</asp:ListItem>
<asp:ListItem Value="Tres Vias Ltda ">Tres Vias Ltda </asp:ListItem>
</asp:DropDownList>
</div>
</td>
<td>
<div class="form-group">
<label for="ejemplo_email_1">Fecha de Reserva</label>
<i class="glyphicon glyphicon-calendar"></i> <asp:TextBox type="date" class="form-control" id="txtfreserva"  runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvFechEmi" runat="server" ErrorMessage="Debe Ingresar Fecha Reserva!!!!" ControlToValidate="txtfreserva" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="ingresarreg" />
</div>
</td>
</tr>
<tr>
<td>
<div class="form-group">
<label for="ejemplo_email_1">Destino</label>
<i class="glyphicon glyphicon-globe"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Destino" id="txtdestino"></asp:TextBox> 
<asp:RequiredFieldValidator ID="rfvValor" runat="server" ErrorMessage="Debe Ingresar Destino!!!!" ControlToValidate="txtdestino" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="ingresarreg" />
</div>

</td>
<td>
<div class="form-group">
<label for="ejemplo_email_1">Aerolinea</label>
<i class="glyphicon glyphicon-plane"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Aerolinea" id="txtAerolinea"></asp:TextBox> 
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe Ingresar Aerolinea!!!!" ControlToValidate="txtAerolinea" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="ingresarreg" />
</div>

</td>
<td>
<div class="form-group">
<label for="ejemplo_email_1">Operacion</label>
<i class="glyphicon glyphicon-folder-open"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Operacion" id="txtOperacion"></asp:TextBox> 
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe Ingresar Operacion!!!!" ControlToValidate="txtOperacion" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="ingresarreg" />
</div>

</td>
</tr>
<tr>
<td>
<div class="form-group">
<label for="ejemplo_email_1">Cliente</label>
<i class="glyphicon glyphicon-user"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Cliente" id="txtCliente"></asp:TextBox> 
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Debe Ingresar Cliente!!!!" ControlToValidate="txtCliente" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="ingresarreg" />
</div>
</td>
<td>
<div class="form-group">
<label for="ejemplo_email_1">Factura / Venta</label>
<i class="glyphicon glyphicon-file"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Fac/Vent" id="txtfacventa"></asp:TextBox> 
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Debe Ingresar Fac/Vent!!!!" ControlToValidate="txtfacventa" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="ingresarreg" />
</div>
</td>
<td>
<div class="form-group">
<label for="ejemplo_email_1">Monto</label>
<i class="glyphicon glyphicon-piggy-bank"></i>
<div class="row">

    <div class="col-lg-9">
    <div class="input-group">
      <div class="input-group-btn">
        <button id="money" runat="server" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <asp:Label ID="lblmoney" runat="server" Text="USD"></asp:Label><span class="caret"></span></button>
          <ul class="dropdown-menu" runat="server" id="ddlmoney">
          <li><a id="USD" runat="server"  onserverclick="ModMoneyUSD_Click">USD</a></li>
          <li><a id="CLP" runat="server" onserverclick="ModMoneyCLP_Click">CLP</a></li>
          <li><a id="EUR" runat="server" onserverclick="ModMoneyEUR_Click">EUR</a></li>
         </ul>

      </div>
<asp:TextBox  runat="server" class="form-control" placeholder="Ingresar Monto" id="txtmonto"></asp:TextBox> 
</div>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe Ingresar Monto!!!!" ControlToValidate="txtmonto" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="ingresarreg" />
</div>
</div>
</div>
</td>
</tr>
<tr>
<td>

<div class="form-group">
<label for="ejemplo_email_1">Costo</label>
<i class="glyphicon glyphicon-piggy-bank"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Costo" id="txtCosto"></asp:TextBox> 
<asp:RequiredFieldValidator ID="rfvcosto" runat="server" ErrorMessage="Debe Ingresar Costo!!!!" ControlToValidate="txtCosto" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="ingresarreg" />
</div>


</td>
<td></td>
<td></td>
</tr>


</tbody>
</table>
</div>
<div class="panel-footer">
<div>
<div id="ok" runat="server" visible="false" class="alert alert-success">Registro Realizado Correctamente!!!!!!!</div>
<div id="nook" runat="server" visible="false"  class="alert alert-danger">Error en el Registro!!!</div>
<div id="eliok" runat="server" visible="false" class="alert alert-success">Registro Eliminado Correctamente!!!!!!!</div>
<div id="elinook" runat="server" visible="false"  class="alert alert-danger">No posee Permisos , Contacte al Administrador!!!</div>
<div id="Pagar" runat="server" visible="false" class="alert alert-success">Registro se Actualizo Como Pagado Correctamente!!!!!!!</div>
  <div id="existe" runat="server" visible="false"  class="alert alert-danger">Registro ya existente , favor verificar los datos!!!</div>
<button id="btnRegistrar" type="button" class="testbutton" runat="server" validationgroup="ingresarreg"  onserverclick="BtnRegistrar_Click"><span class="glyphicon glyphicon-floppy-disk"></span> Registrar</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id="btnverreg" type="button" class="testbutton" runat="server"  onclick="MostrarModalJS(); return false;" ><span class="glyphicon glyphicon-eye-open"></span>Actualizar Registros</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id="btndescargar" type="button" class="testbutton" runat="server" onclick="MostrarModalJS2(); return false;"  ><span class="glyphicon glyphicon-save-file"></span>Descargar Registros</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id="BtnMod" type="button" class="testbutton" visible="false" onserverclick="BtnMod_ServerClick" runat="server" ><span class="glyphicon glyphicon-floppy-saved"></span>Guardar Cambios</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id="BtnCancelMod" type="button" class="testbutton" visible="false" runat="server" onserverclick="BtnCancelMod_ServerClick"  ><span class="glyphicon glyphicon-remove-sign"></span>Cancelar</button>

</div>
</div>
</div>
</div>

<div id="modalHtml" class="modalDialog">
<div>
 <a href="#cerrar" title="Cerrar" class="close">X</a>
    <div class="row">
    <div class="col-xs-12">
    <div class="panel panel-default">
    <div class="panel-heading"><strong>Reservas de Guias Aereas</strong> 
    <div class="panel-body">
    <div class="scrolling-table-container">
                 <asp:GridView ID="gvRegistros" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" style="font-size: x-small;" DataSourceID="Registros" CellPadding="4" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" OnRowCommand="gvregistros_RowCommand">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                       
                            <asp:TemplateField HeaderText="Mod" ItemStyle-HorizontalAlign="Center" >
                         <ItemTemplate>
                         <asp:LinkButton Height="12px" ID="Modificar" CommandName="Modificar" ToolTip="Modificar Registro" CommandArgument='<%# Bind("ID") %>' runat="server" >
                         <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                         </asp:LinkButton>
                         </ItemTemplate>
                         <ItemStyle Height="12px"></ItemStyle>                                
                         </asp:TemplateField>

                         <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID">
                         <ItemStyle Font-Bold="True" Font-Size="Large" />
                         </asp:BoundField>

                     


                         <asp:BoundField DataField="AWBAF" HeaderText="AWBAF" SortExpression="AWBAF"></asp:BoundField>
                         <asp:BoundField DataField="Fecha_Reserva" HeaderText="Reserva" SortExpression="Fecha_Reserva"></asp:BoundField>
                         <asp:BoundField DataField="Destino" HeaderText="Destino" SortExpression="Destino"></asp:BoundField>
                         <asp:BoundField DataField="Operador" HeaderText="Operador" SortExpression="Operador"></asp:BoundField>
                         <asp:BoundField DataField="Aerolinea" HeaderText="Aerolinea" SortExpression="Aerolinea"></asp:BoundField>
                         <asp:BoundField DataField="Operacion" HeaderText="Op" SortExpression="Operacion"></asp:BoundField>
                         <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente"></asp:BoundField>
                         <asp:BoundField DataField="Fact_Venta" HeaderText="Venta" SortExpression="Fact_Venta"></asp:BoundField>
                         <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda"></asp:BoundField>
                         <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto"></asp:BoundField>
                          <asp:BoundField DataField="Costo" HeaderText="Costo" SortExpression="Costo"></asp:BoundField>
                         <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado">
                         <ItemStyle Font-Bold="True" />
                         </asp:BoundField>
                         <asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa"></asp:BoundField>
                         <asp:BoundField DataField="Fecha_Ingreso" HeaderText="Registro" SortExpression="Fecha_Ingreso"></asp:BoundField>
                         <asp:TemplateField HeaderText="Pagar" ItemStyle-HorizontalAlign="Center" >
                         <ItemTemplate>
                         <asp:LinkButton  ID="Pagar" CommandName="Pagar" ToolTip="Registrar Pago" CommandArgument='<%# Bind("ID") %>' runat="server" >
                         <span aria-hidden="true" class="glyphicon glyphicon-usd"></span>
                         </asp:LinkButton>
                         </ItemTemplate>
                         <ItemStyle Height="12px"></ItemStyle>                                
                         </asp:TemplateField>

                         

                         <asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center" >
                         <ItemTemplate>
                         <asp:LinkButton Height="12px" ID="Eliminar" CommandName="Eliminar" ToolTip="Eliminar Registro" CommandArgument='<%# Bind("ID") %>' runat="server" >
                         <span aria-hidden="true" class="glyphicon glyphicon-remove-circle"></span>
                         </asp:LinkButton>
                         </ItemTemplate>
                         <ItemStyle Height="12px"></ItemStyle>                                
                         </asp:TemplateField>
                     </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                   </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Registros" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT ID,AWBAF,Fecha_Reserva,Destino,Operador,Aerolinea,Operacion,Cliente,Fact_Venta,Moneda,Monto,Estado,CASE When Empresa = 'World Transport Int. Ltda' THEN 'WTI' when  Empresa = 'World Transport Courier ltda' THEN 'WTC' when  Empresa = 'Tres Vias Ltda' THEN 'TR3SV' end as Empresa  ,Fecha_Ingreso,Costo FROM Guia ORDER BY ID DESC"></asp:SqlDataSource>
             </div>           
       </div>
 </div>
 </div>
</div>
</div> 
</div>  
</div>



<div id="modalHtml2" class="modalDialog">
<div>
 <a href="#cerrar" title="Cerrar" class="close">X</a>
    <div class="row">
    <div class="col-xs-12">
    <div class="panel panel-default">
    <div class="panel-heading"><strong>Reservas de Guias Aereas Descagar Registros :</strong>
     <div class="btn-group">
    <button type="button" class="btn btn-default" runat="server" id="btnExportar" onserverclick="btnExportar_ServerClick" >
    <span class="glyphicon glyphicon-save-file"></span>
    </button>
    </div>   

    <div class="panel-body">
    <div class="scrolling-table-container">
        <asp:GridView ID="gvDescarga" runat="server" AutoGenerateColumns="False" GridLines="None" DataSourceID="Registros" Height="100%" Width="100%"  CellPadding="4" ForeColor="#333333">

            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID">
                    <ItemStyle Font-Bold="True" Font-Size="Large" />
                </asp:BoundField>
                <asp:BoundField DataField="AWBAF" HeaderText="AWBAF" SortExpression="AWBAF"></asp:BoundField>
                <asp:BoundField DataField="Fecha_Reserva" HeaderText="Reserva" SortExpression="Fecha_Reserva"></asp:BoundField>
                <asp:BoundField DataField="Destino" HeaderText="Destino" SortExpression="Destino"></asp:BoundField>
                <asp:BoundField DataField="Operador" HeaderText="Operador" SortExpression="Operador"></asp:BoundField>
                <asp:BoundField DataField="Aerolinea" HeaderText="Aerolinea" SortExpression="Aerolinea"></asp:BoundField>
                <asp:BoundField DataField="Operacion" HeaderText="Op" SortExpression="Operacion"></asp:BoundField>
                <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente"></asp:BoundField>
                <asp:BoundField DataField="Fact_Venta" HeaderText="Venta" SortExpression="Fact_Venta"></asp:BoundField>
                <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda"></asp:BoundField>
                <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto"></asp:BoundField>
                <asp:BoundField DataField="Costo" HeaderText="Costo" SortExpression="Costo"></asp:BoundField>

                <asp:TemplateField HeaderText="Estate" >
                    <ItemTemplate>
                   
                        <div id="color" runat="server">
                        
                        <strong> <asp:Label ID="Estate"  runat="server" Text='<%#Eval("Estado") %>'></asp:Label></strong> 

                            </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa"></asp:BoundField>
                <asp:BoundField DataField="Fecha_Ingreso" HeaderText="Registro" SortExpression="Fecha_Ingreso"></asp:BoundField>

            </Columns>
            <EditRowStyle BackColor="#999999"></EditRowStyle>

            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

            <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
            <EditRowStyle  />
           


        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [Guia] ORDER BY [ID] DESC"></asp:SqlDataSource>
             </div>           
       </div>
 </div>
 </div>
</div>
</div> 
</div>  
</div>


  

</asp:Content>
