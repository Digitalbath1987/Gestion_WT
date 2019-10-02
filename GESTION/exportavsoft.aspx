<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="exportavsoft.aspx.cs" Inherits="GESTION.PagoFacturas.exportavsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="text-center">
<h2>Exportar Excel Formato A&VSoft </h2>
   </div>

        <br />
    <br />

        <div class="container text-center">
            <asp:ImageButton ID="Ibtnexport" runat="server" ImageUrl="/Gestion2/Imagenes/exportar.jpg" OnClick="Ibtnexport_Click" />

    </div>
    <br />
    <br />

      <div class="container">
          <div class="col-sm-12">
          <asp:GridView ID="gvexportav" runat="server" Height="100%" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id_factura" DataSourceID="exportav" ForeColor="Black" GridLines="Vertical">
              <AlternatingRowStyle BackColor="#CCCCCC" />
              <Columns>
                  <asp:BoundField DataField="id_factura" HeaderText="ID" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="id_factura" />
                  <asp:BoundField DataField="empresa" HeaderText="Empresa" SortExpression="empresa" />           
                  <asp:BoundField DataField="Monto" HeaderText="Monto" ReadOnly="True" SortExpression="Monto" />  
                  <asp:BoundField DataField="agente" HeaderText="Agente" SortExpression="agente" />
                  <asp:BoundField DataField="RUT" HeaderText="RUT" SortExpression="RUT" />
                  <asp:BoundField DataField="ninvoice" HeaderText="Nº Invoice" SortExpression="ninvoice" />
                  <asp:BoundField DataField="FINVOICE" HeaderText="Fecha Invoice" SortExpression="FINVOICE" />
                  <asp:BoundField DataField="fechapago" HeaderText="Fecha Pago" SortExpression="fechapago" />
                  <asp:BoundField DataField="moneda" HeaderText="Moneda" SortExpression="moneda" />
                  <asp:BoundField DataField="tc" HeaderText="Tasa Cambio" SortExpression="tc" />
                  <asp:BoundField DataField="fechaingreso" HeaderText="Fecha Ingreso" SortExpression="fechaingreso" />
                  <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                  
              </Columns>
              <FooterStyle BackColor="#CCCCCC" />
              <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#808080" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#383838" />
          </asp:GridView>
          <asp:SqlDataSource ID="exportav" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT DISTINCT TOP 1000  Facturas2.id_factura,Facturas2.empresa,Agentes2.RUT ,Facturas2.agente,Facturas2.ninvoice,Facturas2.FINVOICE,Facturas2.nnc,Facturas2.moneda,Facturas2.tc, (select SUM(Operaciones.monto) from  Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto,Facturas2.condicion,Facturas2.usuario,Facturas2.fechaingreso,Facturas2.estado,Facturas2.fechapago FROM Facturas2,Agentes2 where Agentes2.Nombre = Facturas2.agente order By id_factura Desc"></asp:SqlDataSource>
      </div>
      </div>

</asp:Content>
