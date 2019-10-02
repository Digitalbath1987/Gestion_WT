<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="agregarop.aspx.cs" Inherits="GESTION.PagoFacturas.agregarop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
        .auto-style12 {
            height: 21px;
            text-align: center;
        }
        .auto-style20 {
            height: 21px;
            width: 137px;
        }
        .auto-style21 {
            width: 137px;
        }
        .auto-style111 {
            font-size: medium;
            font-weight: bold;
            color: #FFFFFF;
            background-color: #3399FF;
        }
        .auto-style66 {
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
        .auto-style117 {
            width: 18px;
        }
        .auto-style118 {
            height: 21px;
            width: 122px;
        }
        .auto-style119 {
            width: 122px;
        }
        .auto-style120 {
            width: 5px;
        }
        .auto-style124 {
            height: 30px;
            width: 137px;
        }
        .auto-style125 {
            height: 30px;
            width: 122px;
        }
        .auto-style126 {
            border-style: solid;
            border-width: 2px;
            height: 30px;
            text-align: center;
        }
        .auto-style127 {
            width: 137px;
            height: 41px;
        }
        .auto-style128 {
            width: 122px;
            height: 41px;
        }
        .auto-style129 {
            text-align: center;
            height: 41px;
        }
        .auto-style130 {
            width: 137px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td class="auto-style66" colspan="8"><strong>Agregar Operaciones</strong></td>
        </tr>
        <tr>
            <td class="auto-style124"></td>
            <td class="auto-style125"></td>
            <td class="auto-style126" colspan="2"><strong>Invoice</strong></td>
            <td class="auto-style126" colspan="2"><strong>
                <asp:Label ID="lblinvoice" runat="server" Text="Label"></asp:Label>
                </strong></td>
            <td class="auto-style124"></td>
            <td class="auto-style124"></td>
        </tr>
        <tr>
            <td class="auto-style124"></td>
            <td class="auto-style125"></td>
            <td class="auto-style126" colspan="2"><strong>Nº Operacion</strong></td>
            <td class="auto-style126" colspan="2"><strong>
                <asp:TextBox ID="txtnumop" runat="server" Height="90%" Width="70%"></asp:TextBox>
                </strong></td>
            <td class="auto-style124"></td>
            <td class="auto-style124"></td>
        </tr>
        <tr>
            <td class="auto-style124"></td>
            <td class="auto-style125"></td>
            <td class="auto-style126" colspan="2"><strong>House</strong></td>
            <td class="auto-style126" colspan="2">
                <asp:TextBox ID="House" runat="server" Height="90%" Width="70%"></asp:TextBox>
            </td>
            <td class="auto-style124"></td>
            <td class="auto-style124"></td>
        </tr>
        <tr>
            <td class="auto-style124"></td>
            <td class="auto-style125"></td>
            <td class="auto-style126" colspan="2"><strong>Monto</strong></td>
            <td class="auto-style126" colspan="2"><strong>
                <asp:TextBox ID="txtmonto" runat="server" Height="90%" Width="70%"></asp:TextBox>
                </strong></td>
            <td class="auto-style124"></td>
            <td class="auto-style124"></td>
        </tr>
         <tr>
            <td class="auto-style124"></td>
            <td class="auto-style125"></td>
            <td class="auto-style126" colspan="2"><strong>Factura Venta</strong></td>
            <td class="auto-style126" colspan="2"><strong>
                <asp:TextBox ID="txt_Fventa" runat="server" Height="90%" Width="70%"></asp:TextBox>
                </strong></td>
            <td class="auto-style124"></td>
            <td class="auto-style124"></td>
        </tr>
        <tr>
            <td class="auto-style20"></td>
            <td class="auto-style118"></td>
            <td class="auto-style12" colspan="4">
                <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style127"></td>
            <td class="auto-style128"></td>
            <td class="auto-style129" colspan="4">
                <strong>
                <asp:Button ID="btnregistrar" runat="server" Text="Registrar" CssClass="auto-style111" Height="90%" OnClick="btnregistrar_Click" Width="25%" />
                </strong>
            </td>
            <td class="auto-style127"></td>
            <td class="auto-style127"></td>
        </tr>
        <tr>
            <td class="auto-style130">
                <asp:ImageButton ID="btnVolver" runat="server" Height="65px" ImageAlign="Bottom" ImageUrl="~/Imagenes/btnVolver.png" OnClick="btnVolver_Click" Width="66px" />
            </td>
            <td colspan="6">
                <div class="auto-style8">
                <asp:GridView ID="gvope" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idop" DataSourceID="operaciones" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="gvope_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="idop" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="idop" />
                        <asp:BoundField DataField="numop" HeaderText="Numero OP" SortExpression="numop" />
                        <asp:BoundField DataField="monto" HeaderText="Monto" SortExpression="monto" />
                          <asp:BoundField DataField="House" HeaderText="House" SortExpression="monto" />
                        <asp:BoundField DataField="ninvoice" HeaderText="Nº Invoice" SortExpression="ninvoice" />
                        <asp:BoundField DataField="Fventa" HeaderText="Fventa" SortExpression="Fventa" />
                        <asp:CommandField ButtonType="Image"  HeaderText="Eliminar" SelectImageUrl="~/Imagenes/eliminarFact.jpg" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="operaciones" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Operaciones] WHERE ([ninvoice] = @ninvoice)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblinvoice" Name="ninvoice" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style21">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style119">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style117">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style120">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
