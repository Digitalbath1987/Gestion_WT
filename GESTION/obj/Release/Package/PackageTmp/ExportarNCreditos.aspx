<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ExportarNCreditos.aspx.cs" Inherits="GESTION.Otros.ExportarNCreditos" %>
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
<div class="panel panel-primary">
<div class="panel-heading">
<h4> <strong> Exportar Registros de Nota de creditos y debitos</strong> </h4> </div>
<div class="panel-body">

     <div class="form-group">
     <div class="panel panel-default">
     <div class="panel-body">
     <button id="btnEXP" type="button" onserverclick="btnEXP_ServerClick"   class="testbutton" runat="server"><span class="glyphicon glyphicon-open-file"></span> Exportar Registros XLS</button>
     </div>
     </div>
     </div>
    
    <div class="form-group">
     <div class="panel panel-default">
     <div class="panel-heading"><strong>Registros</strong> </div>
     <div class="panel-body">

         
 <div style="overflow:scroll;">
  <div style="width:300px;">
        <asp:GridView ID="gvexcel" runat="server" AutoGenerateColumns="False" DataKeyNames="id_NC" DataSourceID="excel" CellPadding="4" ForeColor="#333333" GridLines="None" >
              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id_NC" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_NC" >
                <ItemStyle Font-Bold="True" Font-Size="Medium" />
                </asp:BoundField>
                <asp:BoundField DataField="tiponota" HeaderText="Tipo" SortExpression="tiponota" />
                <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                <asp:BoundField DataField="RazonSocial" HeaderText="Razon Social" SortExpression="RazonSocial" />
                <asp:BoundField DataField="RUT" HeaderText="RUT" SortExpression="RUT" />
                <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                <asp:BoundField DataField="Motivo" HeaderText="Motivo" SortExpression="Motivo" />
                <asp:BoundField DataField="Detalle" HeaderText="Detalle" SortExpression="Detalle" />
                <asp:BoundField DataField="NOperación" HeaderText="NOperación" SortExpression="NOperación" >
                <ItemStyle Font-Bold="True" Font-Size="Medium" />
                </asp:BoundField>
                <asp:BoundField DataField="TipoFactura" HeaderText="TipoFactura" SortExpression="TipoFactura" />
                <asp:BoundField DataField="MontoIVANC" HeaderText="MontoIVANC" SortExpression="MontoIVANC" />
                <asp:BoundField DataField="MontoNetoNC" HeaderText="MontoNetoNC" SortExpression="MontoNetoNC" />
                <asp:BoundField DataField="TotalFact" HeaderText="TotalFact" SortExpression="TotalFact" />
                <asp:BoundField DataField="MontoExentoFact" HeaderText="MontoExentoFact" SortExpression="MontoExentoFact" />
                <asp:BoundField DataField="MontoIVAFact" HeaderText="MontoIVAFact" SortExpression="MontoIVAFact" />
                <asp:BoundField DataField="MontoNetoFact" HeaderText="MontoNetoFact" SortExpression="MontoNetoFact" />
                <asp:BoundField DataField="FechaFactura" HeaderText="FechaFactura" SortExpression="FechaFactura" />
                <asp:BoundField DataField="NFactura" HeaderText="NFactura" SortExpression="NFactura" >
                <ItemStyle Font-Bold="True" Font-Size="Medium" />
                </asp:BoundField>
                <asp:BoundField DataField="MontoExentoNC" HeaderText="MontoExentoNC" SortExpression="MontoExentoNC" />
                <asp:BoundField DataField="TotalNC" HeaderText="TotalNC" SortExpression="TotalNC" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="NNC" HeaderText="NNC" SortExpression="NNC" />
                <asp:BoundField DataField="FechaRegistro" HeaderText="FechaRegistro" SortExpression="FechaRegistro" />
                <asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor" />
                <asp:BoundField DataField="NFReemplazante" HeaderText="NFReemplazante" SortExpression="NFReemplazante" />
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
        <asp:SqlDataSource ID="excel" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT NotaCreditos.id_NC, NotaCreditos.fecha, Empresas.RazonSocial, NotaCreditos.RUT, NotaCreditos.Cliente, NotaCreditos.Motivo, NotaCreditos.Detalle, NotaCreditos.NOperación,TipoFactura.TipoFactura, NotaCreditos.MontoIVANC, NotaCreditos.tiponota, NotaCreditos.MontoNetoNC, NotaCreditos.TotalFact, NotaCreditos.MontoExentoFact, NotaCreditos.MontoIVAFact, NotaCreditos.MontoNetoFact, NotaCreditos.FechaFactura, NotaCreditos.NFactura, NotaCreditos.MontoExentoNC, NotaCreditos.TotalNC,Usuarios.Usuario, NotaCreditos.NNC, NotaCreditos.FechaRegistro, NotaCreditos.Vendedor, NotaCreditos.NFReemplazante FROM NotaCreditos, Usuarios , Empresas , TipoFactura where Usuarios.id_Usuario = NotaCreditos.id_Usuario and NotaCreditos.Empresa = Empresas.id_Empresa and TipoFactura.id_TipoFactura = NotaCreditos.idTipoFactura  order BY id_NC DESC"></asp:SqlDataSource>
    </div>
    </div>
    </div>
    </div>
    </div>
</div>
</div>
</div>

</asp:Content>
