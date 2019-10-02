<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Perfiles.aspx.cs" Inherits="GESTION.Mantenedor.Perfiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
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


        .auto-style67 {
            color: #333333;
            border-style: outset;
            border-width: 2px;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td colspan="7" class="auto-style66"><strong>Perfiles de Usuarios</strong></td>
        </tr>
        <tr>
            <td colspan="7">
                <div class="auto-style8">
                    <asp:GridView ID="gvperfiles" runat="server" AutoGenerateColumns="False" DataKeyNames="Usuario" CellPadding="4" DataSourceID="users" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="100%" CssClass="auto-style67" OnSelectedIndexChanged="gvperfiles_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                            <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                            <asp:BoundField DataField="Modificar" HeaderText="Modificar" SortExpression="Modificar" />
                            <asp:BoundField DataField="Eliminar" HeaderText="Eliminar" SortExpression="Eliminar" />
                            <asp:BoundField DataField="Usuarios" HeaderText="Usuarios" SortExpression="Usuarios" />
                            <asp:BoundField DataField="Perfiles" HeaderText="Perfiles" SortExpression="Perfiles" />
                            <asp:BoundField DataField="Agentes" HeaderText="Agentes" SortExpression="Agentes" />
                            <asp:BoundField DataField="Registrar" HeaderText="Registrar" SortExpression="Registrar" />
                            <asp:CommandField ButtonType="Image" HeaderText="Modificar" SelectImageUrl="~/Imagenes/btnmod.jpg" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="users" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [Nombre], [Apellido], [Usuario], [Modificar], [Eliminar], [Usuarios], [Perfiles], [Agentes], [Registrar] FROM [Usuarios] ORDER BY [Nombre]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style8">
                <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
