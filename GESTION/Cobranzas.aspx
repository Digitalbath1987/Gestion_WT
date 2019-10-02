<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Cobranzas.aspx.cs" Inherits="GESTION.Cheques.Cobranzas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    
     <script>
     function MostrarModalJS() {
    window.location.href = '#modalHtml';
}</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
    <div class="panel panel-primary">
    <div class="panel-heading"><h5><strong>Cobranzas</strong></h5></div>
    <div class="panel-body">

        <table class="table">
         
        <tbody>
            <tr>
                <td>

                     <div class="form-group">
                     <div class="panel panel-default">
                     <div class="panel-heading"><h4><strong>Filtros</strong></h4></div>
                     <div class="panel-body">

                         <table class="table">
                        <tbody>
                         <tr>
                             <td>Empresa</td>
                             <td><asp:DropDownList ID="ddempresa" runat="server" Width="300px"   class="form-control" DataTextField="RazonSocial" DataValueField="RazonSocial">
                      <asp:ListItem Selected="True" Value="0">Todos</asp:ListItem>
                      <asp:ListItem Value="1">World Transport Int. Ltda</asp:ListItem>
                      <asp:ListItem Value="2">Tres Vias Ltda </asp:ListItem>
                      <asp:ListItem Value="3">World Transport Courier ltda</asp:ListItem>
                      </asp:DropDownList></td>
                        </tr>
                         <tr>
                             <td>Estado</td>
                             <td><asp:DropDownList ID="DDLESTADO"    class="form-control" runat="server" Width="300px">
                      <asp:ListItem Value="0" Selected="True">TODOS</asp:ListItem>
                      <asp:ListItem Value="11">PENDIENTE</asp:ListItem>
                      <asp:ListItem Value="22">PAGADO</asp:ListItem>
                      </asp:DropDownList></td>
                        </tr>
                            <tr>
                             <td colspan="2"><button id="btngrabartodo" runat="server" class="testbutton" type="button" onserverclick="btnFiltrar_Click" >
                     <span class="glyphicon glyphicon-save-file"></span>Filtrar</button></td>
                        </tr>

                        </tbody>
                        </table>



                     </div>
                     </div>
                     </div>


                </td>
            </tr>

             <tr>
                <td> <div id="regok" class="alert alert-success" runat="server" visible="false">¡Registro Realizado Correctamente!</div>
         <div id="regnook" runat="server" visible="false" class="alert alert-danger">¡Error En El Registro , Favor Revisar los Datos...!</div></td>
            </tr>

            <tr>
                <td>


                    <div class="form-group">
                     <div class="panel panel-default">
                     <div class="panel-heading"><h4><strong>Registros</strong></h4></div>
                     <div class="panel-body">


                    <asp:GridView ID="gvNdCobro" runat="server" AutoGenerateColumns="False"  ShowFooter="True"  DataKeyNames="NdeCobro" CellPadding="4" DataSourceID="NotadeCobro" ForeColor="#333333" EmptyDataText="Sin Registros" ShowHeaderWhenEmpty="True" GridLines="None" HorizontalAlign="Center"  OnSelectedIndexChanged="gvNdCobro_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True"  headerText="Seleccionar"  ControlStyle-CssClass="btn default btn-xs purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-eye-open'></i>">
                            <ControlStyle   CssClass="btn default btn-xs purple"></ControlStyle>
                            </asp:CommandField>
                            <asp:CheckBoxField DataField="Pagado" HeaderText="Pagado" SortExpression="Pagado" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="NdeCobro" HeaderText="NdeCobro" SortExpression="NdeCobro" >
                                <ItemStyle Font-Bold="True"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa" />
                            <asp:BoundField DataField="Rut" HeaderText="Rut" SortExpression="Rut" />
                            <asp:BoundField DataField="Señores" HeaderText="Señores" SortExpression="Señores" />
                            <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
                            <asp:BoundField DataField="Comuna" HeaderText="Comuna" SortExpression="Comuna" />
                            <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                            <asp:BoundField DataField="Giro" HeaderText="Giro" SortExpression="Giro" />
                            <asp:BoundField DataField="Fecha_Emision" HeaderText="Fecha Emision" SortExpression="Fecha_Emision" />
                            <asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor" />
                            <asp:BoundField DataField="precio" HeaderText="Valor" SortExpression="precio" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="NotadeCobro" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand=""></asp:SqlDataSource>

 </div>
                     </div>
                     </div>
                </td>
            </tr>



        </tbody>
        </table>




    </div>
    </div>
    </div>








    <div id="modalHtml" class="modalDialog">
           <div class="textheader">
           <a href="#cerrar" title="Cerrar" class="close">X</a>
           <div><strong>Nota de Cobro nº 
               <asp:Label ID="lblNdecobro" runat="server"  Text="Label"></asp:Label>
             <asp:LinkButton ID="LinkButton1" ToolTip="Click aqui para ver mas Detalles" runat="server" onserverclick="clickndecobro_Click" PostBackUrl="/Gestion2/Cheques/VerDetalleNcobro.aspx">Ver</asp:LinkButton>
               &nbsp; Empresa :
               <asp:Label ID="lblempresa" runat="server" Text="Label"></asp:Label>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </strong> </div> 
           <br />
           <div class="scrolling-table-container">
                    <div class="table-responsive">  
                                 
               <table class="table table-sm">
                   <tr>
                       <td colspan="2" class="textheader"><strong>
               <asp:Label ID="lblEstado" runat="server" CssClass="auto-style68" Text="Label"></asp:Label>
              </strong> </td>
                   </tr>
                   <tr>
                       <td class="auto-style69"><strong>Rut :</strong></td>
                       <td class="auto-style71">
                           <strong>&nbsp;&nbsp;
                           <asp:TextBox ID="txtrut" runat="server" ToolTip="Rut de la Empresa" Enabled="False"></asp:TextBox>
                           </strong>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style70"><strong>Señores :</strong></td>
                       <td class="auto-style65">
                           <strong>&nbsp;&nbsp;
                           <asp:TextBox ID="txtsr" runat="server" ToolTip="Razon Social de la Empresa" Enabled="False"></asp:TextBox>
                           </strong>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style69"><strong>Giro :</strong></td>
                       <td class="auto-style71">
                           <strong>&nbsp;&nbsp;
                           <asp:TextBox ID="txtgiro" runat="server" ToolTip="Giro de la Empresa" Enabled="False"></asp:TextBox>
                           </strong>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style69"><strong>Ciudad :</strong></td>
                       <td class="auto-style71">
                           <strong>&nbsp;&nbsp;
                           <asp:TextBox ID="txtciudad" runat="server" ToolTip="Ciudad" Enabled="False"></asp:TextBox>
                           </strong>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style69"><strong>Comuna :</strong></td>
                       <td class="auto-style71">
                           <strong>&nbsp;&nbsp;
                           <asp:TextBox ID="txtcomuna" runat="server" ToolTip="Comuna" Enabled="False"></asp:TextBox>
                           </strong>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style69"><strong>Telefono :</strong></td>
                       <td class="auto-style71">
                           <strong>&nbsp;&nbsp;
                           <asp:TextBox ID="txttelefono" runat="server" ToolTip="Telefono" Enabled="False"></asp:TextBox>
                           </strong>
                       </td>
                   </tr>
                   <tr>
                       <td class="auto-style69"><strong>Fecha de Emision :</strong></td>
                       <td class="auto-style71"><strong>&nbsp;&nbsp;
                           <asp:TextBox ID="txtfemision" runat="server" ToolTip="Fecha de Emision" Enabled="False"></asp:TextBox>
                           </strong></td>
                   </tr>
                   <tr>
                       <td class="auto-style69"><strong>Fecha de Pago :</strong></td>
                       <td class="auto-style71"><strong>&nbsp;&nbsp;
                           <asp:TextBox ID="txtfechpago" runat="server" ToolTip="Fecha de Pago" Enabled="False"></asp:TextBox>
                           </strong></td>
                   </tr>
                   <tr>
                       <td class="auto-style69"><strong>Valor :</strong></td>
                       <td class="auto-style71">
                           &nbsp; &nbsp;<asp:TextBox ID="txtValor" runat="server" ToolTip="Total de la Factura" Enabled="False"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="2">
                           
                        Usuario Pago :   <asp:Label ID="lblUsuariopago" runat="server" Text="Label"></asp:Label>    &nbsp; &nbsp;
                        Fecha Pago :    <asp:Label ID="lblfechapago" runat="server" Text="Label"></asp:Label>
                       
                       </td>
                   </tr>
                   <tr>
                       <td colspan="2">
                          
                           <button id="btnpagado" data-toggle="tooltip"  onserverclick="btngrabartodo_Click"  data-placement="top" title="Actualizar Como Pagado" runat="server" class="testbutton"  type="button">
                               <span class="glyphicon glyphicon-floppy-saved"></span>&nbsp;Pagado</button>

                       </td>
                   </tr>
               </table>

 </div>



                  
           </div>
           </div>
           </div>










</asp:Content>
