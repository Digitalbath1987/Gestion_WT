<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Registroscompletos.aspx.cs" Inherits="GESTION.PagoFacturas.Registroscompletos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
        .auto-style16 {
            width: 453px;
        }
        .auto-style19 {
            width: 452px;
            text-align: center;
        }
               .auto-style13 {
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <div class="text-center">
       <h3>Filtro Total de Registros</h3>
    </div>
        


    <div class=" container">
        <div class="col-sm-12 text-center">
                <asp:ImageButton ID="btnexportar" runat="server" Height="153px" ImageUrl="/Gestion2/Imagenes/exportar.jpg" Width="213px" OnClick="btnexportar_Click" />
            </div>
</div>




    <div class=" container">
        <div class="col-sm-12">
              <asp:GridView ID="gvtotalregistros" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_factura" DataSourceID="TotalRegistros" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" style="font-size: x-small; text-align: center">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id_factura" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_factura" />
                        <asp:BoundField DataField="empresa" HeaderText="Empresa" SortExpression="empresa" />
                        <asp:BoundField DataField="agente" HeaderText="Agente" SortExpression="agente" />
                        <asp:BoundField DataField="ninvoice" HeaderText="Nº Invoice" SortExpression="ninvoice" />
                        <asp:BoundField DataField="FINVOICE" HeaderText="Fecha Invoice" SortExpression="FINVOICE" />
                        <asp:BoundField DataField="operaciones" HeaderText="Operacion/File" ReadOnly="True" SortExpression="operaciones" />
                        <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                        <asp:BoundField DataField="fechapago" HeaderText="Fecha Pago " SortExpression="fechapago" />
                        <asp:BoundField DataField="moneda" HeaderText="Moneda" SortExpression="moneda" />
                        <asp:BoundField DataField="tc" HeaderText="Tasa Cambio" SortExpression="tc" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto" ReadOnly="True" SortExpression="Monto" />
                        <asp:BoundField DataField="nnc" HeaderText="Nº NC" SortExpression="nnc" />
                        <asp:BoundField DataField="vnc" HeaderText="Valor NC" SortExpression="vnc" />
                        <asp:BoundField DataField="fnc" HeaderText="Fecha NC" SortExpression="fnc" />
                        <asp:BoundField DataField="condicion" HeaderText="Condicion" SortExpression="condicion" />
                        <asp:BoundField DataField="observ" HeaderText="Observacion" SortExpression="observ" />
                        <asp:BoundField DataField="detalle" HeaderText="Detalle" SortExpression="detalle" />
                        <asp:BoundField DataField="usuario" HeaderText="User Registro" SortExpression="usuario" />
                        <asp:BoundField DataField="fechaingreso" HeaderText="Fecha Registro" SortExpression="fechaingreso" />
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
                <asp:SqlDataSource ID="TotalRegistros" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT DISTINCT top 1000 Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from  Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago  , stuff((select ', '+ Operaciones.numop from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice for XML path('')),1,1,'') operaciones from Facturas2 with(nolock)  order by  id_factura"></asp:SqlDataSource>
   

        </div>


    </div>
              
</asp:Content>
