<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="FiltrarPagAgentes.aspx.cs" Inherits="GESTION.PagoFacturas.FiltrarPagAgentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
        .auto-style12 {
            height: 21px;
        }
        .auto-style19 {
            height: 21px;
            width: 146px;
        }
        .auto-style20 {
            height: 21px;
            width: 147px;
        }
        .auto-style21 {
            width: 146px;
        }
        .auto-style22 {
            width: 147px;
        }
        .auto-style25 {
            height: 22px;
            width: 146px;
        }
        .auto-style26 {
            height: 22px;
            width: 147px;
        }
        .auto-style27 {
            text-align: center;
            height: 21px;
        }
    .auto-style28 {
        height: 27px;
        width: 146px;
        text-align: right;
    }
    .auto-style29 {
        text-align: center;
        height: 27px;
    }
    .auto-style31 {
        height: 27px;
        width: 147px;
    }
    .auto-style32 {
        font-weight: bold;
        color: #FFFFFF;
        font-size: small;
        background-color: #0066FF;
    }
                 .auto-style34 {
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
 .scrolling-table-container {
    height: 378px;
    overflow-y: scroll;
    overflow-x: hidden;
}




    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td class="auto-style34" colspan="8"><strong>Filtrar Pago / Agentes</strong></td>
        </tr>
        <tr>
            <td class="auto-style19"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style28">
                <asp:DropDownList ID="ddlSelectfiltr" runat="server" AutoPostBack="True" Height="90%" OnSelectedIndexChanged="ddlSelectfiltr_SelectedIndexChanged" Width="90%">
                    <asp:ListItem Value="0">Todos</asp:ListItem>
                    <asp:ListItem Value="1">Agente</asp:ListItem>
                    <asp:ListItem Value="2">Usuario</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style29" colspan="2">
                <strong>
                <asp:Label ID="lbluser" runat="server" Text="Usuario :" Visible="False"></asp:Label>
&nbsp;
                <asp:DropDownList ID="ddlUser" runat="server" Height="90%" Width="70%" DataSourceID="Users" DataTextField="Usuario" DataValueField="Usuario" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [Usuario] FROM [Usuarios] ORDER BY [Usuario]"></asp:SqlDataSource>
                </strong>
            </td>
            <td class="auto-style29" colspan="2"><strong>
&nbsp;
                <asp:Label ID="lblagente" runat="server" Text="Agente :" Visible="False"></asp:Label>
&nbsp;
                <asp:DropDownList ID="ddlAgente" runat="server" Height="90%" Width="70%" DataSourceID="agente" DataTextField="Nombre" DataValueField="Nombre" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="agente" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [Nombre] FROM [Agentes2] ORDER BY [Nombre]"></asp:SqlDataSource>
                </strong></td>
            <td class="auto-style29" colspan="2"><strong>
&nbsp; </strong>
                <asp:Button ID="Filtrar" runat="server" CssClass="auto-style32" Height="90%" OnClick="Filtrar_Click" Text="Filtrar" Width="30%" />
            </td>
            <td class="auto-style31"></td>
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12" colspan="8">
               
                

    <div class="row">
    <div class="col-xs-12">
    <div class="panel panel-default">
    <div class="panel-heading"><strong>Registros</strong></div>
    <div class="panel-body">

         
      
      <div class="scrolling-table-container">

            
                
                <asp:GridView ID="gvfacturas" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_factura" DataSourceID="Agentes" ForeColor="#333333" GridLines="None" Width="100%" OnRowCommand="gvfacturas_RowCommand"  >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id_factura" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_factura" />
                        <asp:BoundField DataField="empresa" HeaderText="Empresa" SortExpression="empresa" />
                        <asp:BoundField DataField="agente" HeaderText="Agente" SortExpression="agente" />
                        <asp:BoundField DataField="ninvoice" HeaderText="Nº Invo" SortExpression="ninvoice" />
                        <asp:BoundField DataField="FINVOICE" HeaderText="F. Invo" SortExpression="FINVOICE" />
                        <asp:BoundField DataField="moneda" HeaderText="Moneda" SortExpression="moneda" />
                        <asp:BoundField DataField="tc" HeaderText="T/C" SortExpression="tc" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" />
                        <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                        <asp:BoundField DataField="fechapago" HeaderText="Fecha Pago" SortExpression="fechapago" />

                        <asp:TemplateField HeaderText="Ver" ItemStyle-HorizontalAlign="Center" >
                         <ItemTemplate>
                         <asp:LinkButton Height="16px" ID="Ver" CommandName="Ver" ToolTip="Ver detalle del Pago" CommandArgument='<%# Bind("id_factura") %>' runat="server" >
                         <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
                         </asp:LinkButton>
                         </ItemTemplate>
                         <ItemStyle Height="12px"></ItemStyle>                                
                         </asp:TemplateField>

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
                <asp:SqlDataSource ID="Agentes" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT id_factura,empresa,agente,ninvoice,FINVOICE, (select SUM(Operaciones.monto) from  Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto,nnc,vnc,fnc,linkpdf,moneda,tc,condicion,observ,detalle,usuario,fechaingreso,estado,fechapago FROM Facturas2 ORDER BY [id_factura] DESC"></asp:SqlDataSource>
            
    </div>  
    </div>
    </div>
    </div>  
    </div>   
            
            
            </td>
        </tr>
        <tr>
            <td class="auto-style25"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td colspan="8">&nbsp;</td>
        </tr>
        </table>
</asp:Content>
