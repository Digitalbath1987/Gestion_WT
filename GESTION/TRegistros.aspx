<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="TRegistros.aspx.cs" Inherits="GESTION.PagoFacturas.TRegistros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
        .auto-style13 {
            height: 21px;
            text-align: center;
        }
        .auto-style18 {
            text-align: center;
            width: 137px;
        }
        .auto-style23 {
            height: 21px;
            width: 137px;
        }
        .auto-style24 {
            width: 137px;
        }
        .auto-style25 {
            font-weight: bold;
        }
                     .auto-style28 {
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
    <table class="auto-style11">
        <tr>
            <td colspan="8" class="auto-style28"><strong>Registros </strong></td>
        </tr>
        <tr>
            <td class="auto-style23"></td>
            <td class="auto-style23"></td>
            <td class="auto-style23"></td>
            <td class="auto-style23"></td>
            <td class="auto-style23"></td>
            <td class="auto-style23"></td>
            <td class="auto-style23"></td>
            <td class="auto-style23"></td>
        </tr>
        <tr>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style24"><strong>
                <asp:DropDownList ID="ddlestado" runat="server" AutoPostBack="True" CssClass="auto-style25" Height="95%" OnSelectedIndexChanged="ddlestado_SelectedIndexChanged" Width="95%">
                    <asp:ListItem Selected="True" Value="0">TODOS</asp:ListItem>
                    <asp:ListItem Value="1">PENDIENTE</asp:ListItem>
                    <asp:ListItem Value="2">PAGADO</asp:ListItem>
                </asp:DropDownList>
                </strong></td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="8">   
                <div class="auto-style8">
                    <asp:GridView ID="gvFacturas" runat="server" DataKeyNames="id_factura" AutoGenerateColumns="False"   DataSourceID="listarFacturas" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvFacturas_SelectedIndexChanged" CssClass="auto-style174">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="id_factura" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_factura" />
                                <asp:BoundField DataField="empresa" HeaderText="Empresa" SortExpression="empresa" />
                                <asp:BoundField DataField="agente" HeaderText="Agente" SortExpression="agente" />
                                <asp:BoundField DataField="ninvoice" HeaderText="Nº Invoice" SortExpression="ninvoice" />
                                <asp:BoundField DataField="FINVOICE" HeaderText="Fecha Invoice" SortExpression="FINVOICE" />
                                <asp:BoundField DataField="nnc" HeaderText="Nº Nota Credito" SortExpression="nnc" />
                                <asp:BoundField DataField="moneda" HeaderText="Moneda" SortExpression="moneda" />
                                <asp:BoundField DataField="tc" HeaderText="Tasa Cambio" SortExpression="tc" />
                                <asp:BoundField DataField="condicion" HeaderText="Condicion" SortExpression="condicion" />
                                <asp:BoundField DataField="usuario" HeaderText="Usuario" SortExpression="usuario" />
                                <asp:BoundField DataField="fechaingreso" HeaderText="Fecha Ingreso" SortExpression="fechaingreso" />
                                <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                                <asp:BoundField DataField="fechapago" HeaderText="Fecha Pago" SortExpression="fechapago" />
                                <asp:CommandField ButtonType="Image" HeaderText="Detalle" ShowSelectButton="True" SelectImageUrl="/Gestion2/Imagenes/btnbpeq.jpg" />
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
                        </div>
                        <asp:SqlDataSource ID="listarFacturas" runat="server" SelectCommand="SELECT TOP 1000 * FROM Facturas2 WITH(NOLOCK) ORDER BY id_factura DESC" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>"></asp:SqlDataSource>
                   </td>
        </tr>
        <tr>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="8">&nbsp;</td>
        </tr>
        </table>
</asp:Content>
