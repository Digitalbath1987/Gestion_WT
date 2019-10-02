<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Exportar_Excel_NCobro.aspx.cs" Inherits="GESTION.Cheques.Exportar_Excel_NCobro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <style type="text/css">
                 
        .auto-style10 {
            width: 298px
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

   .scrolling-table-container {
    height: 378px;
    overflow-y: scroll;
    overflow-x: hidden;
}




 .DataGridFixedHeader
{
position: relative;
top: expression(this.offsetParent.scrollTop-3); /*this works fine with IE only, but FireFox seems to be ignoring this*/
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Exportar Registros de Nota de Crobros</strong></h4></div>
<div class="panel-body">

<div class="row">
<div class="col-xs-12">
<div class="panel panel-default">
<div class="panel-body">
    
     <button id="btnexportexcel" data-toggle="tooltip"  onserverclick="btnexportexcel_Click"  data-placement="top" title="Exportar Registros Formato Excel" runat="server" class="btnVerde"  type="button">
                  <span class="glyphicon glyphicon-save-file"></span>&nbsp;Exportar Excel</button>
  
</div>
</div>
</div>
</div>
             
    
<div class="row">
<div class="col-xs-12">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Registros</strong></h4>
<div class="panel-body">
<div class="scrolling-table-container">
    
    
<asp:GridView ID="gvexportexcel" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="100%" HorizontalAlign="Center" Width="100%" AutoGenerateColumns="False" DataSourceID="export_excel">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="Pagado" HeaderText="Pagado" SortExpression="Pagado" />
<asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa" />
<asp:BoundField DataField="Rut" HeaderText="Rut" SortExpression="Rut" />
<asp:BoundField DataField="Señores" HeaderText="Razon Social" SortExpression="Señores" />
<asp:BoundField DataField="Comuna" HeaderText="Comuna" SortExpression="Comuna" />
<asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
<asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
<asp:BoundField DataField="Giro" HeaderText="Giro" SortExpression="Giro" />
<asp:BoundField DataField="Fecha_Emision" HeaderText="Fecha Emision" SortExpression="Fecha_Emision" />
<asp:BoundField DataField="Fecha_Vencimiento" HeaderText="Fecha Vencimiento" SortExpression="Fecha_Vencimiento" />
<asp:BoundField DataField="NdeCobro" HeaderText="Nº de Nota Cobro" SortExpression="NdeCobro" />
<asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor" />
<asp:BoundField DataField="precio" HeaderText="Valor Factura" ReadOnly="True" SortExpression="precio" />
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
<asp:SqlDataSource ID="export_excel" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut,NotadeCobro.Fecha_Vencimiento, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  ORDER BY NdeCobro DESC"></asp:SqlDataSource>
           

</div>           
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
    
     
    
    
    
</asp:Content>
