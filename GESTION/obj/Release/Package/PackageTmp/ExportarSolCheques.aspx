<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ExportarSolCheques.aspx.cs" Inherits="GESTION.Cheques.ExportarSolCheques" %>
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
<div class="panel-heading"><h4><strong>Exportar Registros de Solicitudes de Cheques y Transferencias</strong></h4></div>
<div class="panel-body">

<div class="row">
<div class="col-xs-12">
<div class="panel panel-default">
<div class="panel-body">
    
<button id="btnExportxls" type="button"  class="btnVerde" runat="server" onserverclick="btnExportxls_ServerClick"  ><span class="glyphicon glyphicon-save-file" ></span>Exportar .XLS</button>
       

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


    <asp:GridView ID="gvsolcheques" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="GVDescargar" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
            <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo"></asp:BoundField>
            <asp:BoundField DataField="Ncorrelativo" HeaderText="Nº" SortExpression="Ncorrelativo">
                <ItemStyle Font-Bold="True"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa"></asp:BoundField>
            <asp:BoundField DataField="Nombre_Solicitante" HeaderText="Solicitante" SortExpression="Nombre_Solicitante"></asp:BoundField>
            <asp:BoundField DataField="Rut_Receptor" HeaderText="Rut" SortExpression="Rut_Receptor"></asp:BoundField>
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion"></asp:BoundField>
            <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda"></asp:BoundField>
            <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto"></asp:BoundField>
            <asp:BoundField DataField="Carpeta" HeaderText="Carpeta" SortExpression="Carpeta"></asp:BoundField>
            <asp:BoundField DataField="Operacion" HeaderText="Operacion" SortExpression="Operacion"></asp:BoundField>
            <asp:BoundField DataField="Embarque" HeaderText="Embarque" SortExpression="Embarque"></asp:BoundField>
            <asp:BoundField DataField="Nota_Cobro" HeaderText="Nota de cobro" SortExpression="Nota_Cobro"></asp:BoundField>
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario"></asp:BoundField>
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado"></asp:BoundField>
            <asp:BoundField DataField="Fecha_Registro" HeaderText="Registro" SortExpression="Fecha_Registro"></asp:BoundField>

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
    </asp:GridView>


    <asp:SqlDataSource runat="server" ID="GVDescargar" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [Sol_Cheques] ORDER BY [Ncorrelativo] DESC"></asp:SqlDataSource>
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
