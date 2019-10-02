<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="BuscarOP.aspx.cs" Inherits="GESTION.PagoFacturas.BuscarOP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }

    .auto-style17 {
        width: 137px;
    }
    .auto-style18 {
        width: 137px;
        height: 22px;
    }
    .auto-style19 {
        width: 137px;
        height: 22px;
        text-align: center;
    }
    .auto-style20 {
        width: 137px;
        height: 21px;
    }
      

        .auto-style28 {
        text-align: center;
        font-size: x-large;
        height: 26px;
        text-transform: uppercase;
        color: #FFFFFF;
        border-right-style: solid;
        border-right-width: 1px;
        padding: 1px 4px;
        background-color: #000099;
    }

        .auto-style29 {
            font-size: small;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td class="auto-style28" colspan="8"><strong>Buscar Operaciones</strong></td>
        </tr>
        <tr>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style19"><strong>Buscar</strong></td>
            <td class="auto-style19"><strong>
                <asp:DropDownList ID="ddlTipoBusq" runat="server" Height="90%" Width="90%" AutoPostBack="True" OnSelectedIndexChanged="ddlTipoBusq_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="0">TODOS</asp:ListItem>
                    <asp:ListItem Value="1">OPERACION</asp:ListItem>
                    <asp:ListItem Value="2">HOUSE</asp:ListItem>
                    <asp:ListItem Value="3">INVOICE</asp:ListItem>
                </asp:DropDownList>
                </strong></td>
            <td class="auto-style19">
                <asp:TextBox ID="txtBuscar" runat="server" Height="90%" Width="90%" AutoPostBack="True" OnTextChanged="txtBuscar_TextChanged"></asp:TextBox>
            </td>
            <td class="auto-style18"></td>
            <td class="auto-style18"></td>
            <td class="auto-style18"></td>
            <td class="auto-style18"></td>
            <td class="auto-style18"></td>
        </tr>
        <tr>
            <td colspan="8">
                <div class="auto-style8">
                <asp:GridView ID="gvop" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_factura" DataSourceID="ListOP" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="gvop_SelectedIndexChanged" CssClass="auto-style29">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="idop" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="idop" />
                        <asp:BoundField DataField="numop" HeaderText="Nº Operacion" SortExpression="numop" />
                        <asp:BoundField DataField="monto" HeaderText="Monto Operacion" SortExpression="monto" />
                        <asp:BoundField DataField="House" HeaderText="Nº House" SortExpression="House" />
                        <asp:BoundField DataField="ninvoice" HeaderText="Nº Invoice" SortExpression="ninvoice" />
                        <asp:BoundField DataField="id_factura" HeaderText="ID Invoice" SortExpression="ninvoice" />


                        <asp:CommandField ButtonType="Image" HeaderText="Detalle" ShowSelectButton="True" SelectImageUrl="~/Imagenes/btnbpeq.jpg" />
                   
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
                <asp:SqlDataSource ID="ListOP" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT TOP 1000 Operaciones.idop,Operaciones.numop,Operaciones.monto,Operaciones.House,Operaciones.ninvoice,Facturas2.id_factura FROM Operaciones, Facturas2 where Facturas2.ninvoice = Operaciones.ninvoice ORDER BY Operaciones.idop DESC"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style17">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
