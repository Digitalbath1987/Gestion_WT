<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="pagos_agentes_Listado.aspx.cs" Inherits="GESTION.pagos_agentes_Listado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 
            <div class="container">
                <div class="col-sm-12">
                    <div class="table-responsive-sm">
                        <table class="table">
                            <asp:GridView ID="gvFacturas" runat="server" AutoGenerateColumns="False" DataKeyNames="id_factura" DataSourceID="Registros" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvFacturas_SelectedIndexChanged" Height="100%" HorizontalAlign="Center" Width="100%">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                <Columns>
                                    <asp:BoundField DataField="id_factura" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="id_factura">
                                        <ItemStyle Font-Bold="True" Font-Size="Large" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="empresa" HeaderText="Empresa" SortExpression="empresa"></asp:BoundField>
                                    <asp:BoundField DataField="agente" HeaderText="Agente" SortExpression="agente"></asp:BoundField>
                                    <asp:BoundField DataField="ninvoice" HeaderText="N° invoice" SortExpression="ninvoice"></asp:BoundField>
                                    <asp:BoundField DataField="moneda" HeaderText="Moneda" SortExpression="moneda"></asp:BoundField>
                                    <asp:BoundField DataField="Monto" HeaderText="Monto" ReadOnly="True" SortExpression="Monto">
                                        <ItemStyle Font-Bold="True" Font-Size="Large" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado"></asp:BoundField>
                                    <asp:CommandField ButtonType="Image" HeaderText="Detalle" ShowSelectButton="True" SelectImageUrl="~/Imagenes/btnbpeq.jpg" />
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
                            <asp:SqlDataSource ID="Registros" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="ListarFacturas2" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </table>
                    </div>
                </div>
            </div>




  


 
   






</asp:Content>
