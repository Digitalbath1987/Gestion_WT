<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Agentes.aspx.cs" Inherits="GESTION.Mantenedor.Agentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
        .auto-style13 {
            height: 21px;
        }
        .auto-style20 {
            height: 21px;
            width: 134px;
        }
        .auto-style22 {
            width: 133px;
        }
        .auto-style23 {
            width: 134px;
        }
        .auto-style24 {
            height: 21px;
            width: 133px;
        }
        .auto-style26 {
            height: 40px;
            width: 133px;
        }
        .auto-style27 {
            height: 40px;
            width: 134px;
        }
        .auto-style28 {
            border: 2px outset #808080;
            height: 40px;
        }
        .auto-style29 {
            height: 108px;
            width: 133px;
        }
        .auto-style30 {
            height: 108px;
            width: 134px;
        }
        .auto-style31 {
            height: 108px;
            text-align: center;
        }
        .auto-style32 {
            border: 2px outset #808080;
            height: 40px;
            text-align: center;
            font-size: x-large;
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
            width: 73px;
        }
        .auto-style68 {
            width: 208px;
        }
        .auto-style69 {
            height: 40px;
            width: 208px;
        }
        .auto-style70 {
            height: 21px;
            width: 208px;
        }
        .auto-style71 {
            height: 108px;
            width: 208px;
        }
        .auto-style72 {
            width: 32px;
        }
               .auto-style73 {
            color: #333333;
            border-style: outset;
            border-width: 2px;
        }
               </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td class="auto-style66" colspan="8"><strong>Agentes</strong></td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style69"></td>
            <td class="auto-style32" colspan="2"><strong>Nombre :</strong></td>
            <td class="auto-style28" colspan="2">
                <asp:TextBox ID="txtnom" runat="server" Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnom" ErrorMessage="*" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style27"></td>
            <td class="auto-style27"></td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style69"></td>
            <td class="auto-style32" colspan="2"><strong>Correo :</strong></td>
            <td class="auto-style28" colspan="2">
                <asp:TextBox ID="txtmail" runat="server" Height="90%" Width="70%" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmail" ErrorMessage="*" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style27"></td>
            <td class="auto-style27"></td>
        </tr>
        <tr>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style69">&nbsp;</td>
            <td class="auto-style32" colspan="2"><strong>RUT</strong></td>
            <td class="auto-style28" colspan="2">
                <asp:TextBox ID="txtrut" runat="server" Height="90%" Width="70%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvrut" runat="server" ControlToValidate="txtrut" ErrorMessage="*" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style27">&nbsp;</td>
            <td class="auto-style27">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style70"></td>
            <td class="auto-style13" colspan="2"></td>
            <td class="auto-style13" colspan="2"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style29"></td>
            <td class="auto-style71"></td>
            <td class="auto-style31" colspan="4">
                <asp:ImageButton ID="CrearAgent" runat="server" Height="100%" ImageUrl="/Gestion2/Imagenes/Crear Agente.jpg" OnClick="CrearAgent_Click" Width="21%" ValidationGroup="registrar" />
            </td>
            <td class="auto-style30"></td>
            <td class="auto-style30"></td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style68">&nbsp;</td>
            <td class="auto-style8" colspan="4">
                <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style68">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style72">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style67">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="8">
                <div class="auto-style8">
                    <asp:GridView ID="GVAgentes" runat="server"   AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_Agente" DataSourceID="agent" GridLines="None" HorizontalAlign="Center" Width="100%" OnSelectedIndexChanged="GVAgentes_SelectedIndexChanged" CssClass="auto-style73" ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="id_Agente" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_Agente" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="RUT" HeaderText="RUT" SortExpression="RUT" />
                            <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                            <asp:CommandField ButtonType="Image" HeaderText="Eliminar" SelectImageUrl="/Gestion2/Imagenes/eliminaruser.jpg" ShowSelectButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
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
                <asp:SqlDataSource ID="agent" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Agentes2]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style68">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style72">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style67">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style68">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style72">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style67">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
