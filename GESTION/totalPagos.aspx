<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="totalPagos.aspx.cs" Inherits="GESTION.PagoFacturas.totalPagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
       .auto-style8 {
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


      .auto-style12 {
       height: 78px;
       text-align: center;
      }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="text-center">
    <h3>Registro Total de Pagos</h3>

</div>            


       <div class="container">
             <div class="col-sm-12 text-center" >
                <asp:ImageButton ID="btnexportar" runat="server" Height="153px" ImageUrl="/Gestion2/Imagenes/exportar.jpg" OnClick="btnexportar_Click" Width="213px" />
       </div>
           </div>

            <div class="container">
             <div class="col-sm-12" >
            <asp:GridView ID="gvpagos" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_Pago" DataSourceID="PagosTotal" ForeColor="#333333" GridLines="None" Height="100%" style="text-align: center" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Id_Pago" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id_Pago" />
                        <asp:BoundField DataField="User_Pago" HeaderText="Usuario" SortExpression="User_Pago" />
                        <asp:BoundField DataField="Fecha_Pago" HeaderText="Fecha Registro Pago" SortExpression="Fecha_Pago" />
                        <asp:BoundField DataField="Banco" HeaderText="Banco" SortExpression="Banco" />
                        <asp:BoundField DataField="moneda" HeaderText="moneda" SortExpression="moneda" />
                        <asp:BoundField DataField="Monto_Pago" HeaderText="Monto Pago" SortExpression="Monto_Pago" />
                        <asp:BoundField DataField="Detalle_Pago" HeaderText="Detalle Pago" SortExpression="Detalle_Pago" />
                        <asp:BoundField DataField="NInvoice" HeaderText="Nº Invoice" SortExpression="NInvoice" />
                        <asp:BoundField DataField="operaciones" HeaderText="Nº Operaciones" ReadOnly="True" SortExpression="operaciones" />
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
                <asp:SqlDataSource ID="PagosTotal" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT top 1000 Pagos_Facturas.Id_Pago,Pagos_Facturas.User_Pago,Pagos_Facturas.Fecha_Pago,Pagos_Facturas.Banco,Facturas2.moneda,Pagos_Facturas.Monto_Pago,Pagos_Facturas.Detalle_Pago,Pagos_Facturas.NInvoice , stuff((select ', '+ Operaciones.numop from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice for XML path('')),1,1,'') operaciones FROM Pagos_Facturas , Facturas2 where Pagos_Facturas.NInvoice = Facturas2.ninvoice"></asp:SqlDataSource>
          


             </div> 

            </div>
    


</asp:Content>
