<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Exportar_Guias.aspx.cs" Inherits="GESTION.Control_Operaciones.Exportar_Guias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div class="container">
<div class="panel panel-primary">
     <div class="panel-heading"><h5><strong>Exportar Registros Guias Aereas</strong> </h5> </div>
         <div class="panel-body">
             
             <table class="table">
             <tbody>
                 <tr>
                 <td>
                 <button id="btnexportxls"  type="button" class="btn btn-primary" runat="server" onserverclick="btnexportxls_ServerClick"><span class="glyphicon glyphicon-save-file"></span> Exportar Excel</button>
                 </td>
                 </tr>
                 <tr>
                 <td>
                 </td>
                   <asp:GridView ID="gvRegistros" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" style="font-size: x-small;" DataSourceID="Registros" CellPadding="4" ForeColor="#333333" GridLines="None" Height="100%" Width="100%">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
<asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado">
<ItemStyle Font-Bold="True" />
</asp:BoundField>
<asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa"></asp:BoundField>
<asp:BoundField DataField="Fecha_Ingreso" HeaderText="Registro" SortExpression="Fecha_Ingreso"></asp:BoundField>

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

                 </tr>





             </tbody>
             </table>


          </div>  
    </div> 
</div> 






</asp:Content>
