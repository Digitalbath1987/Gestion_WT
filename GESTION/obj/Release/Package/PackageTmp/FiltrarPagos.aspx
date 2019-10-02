<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="FiltrarPagos.aspx.cs" Inherits="GESTION.PagoFacturas.FiltrarPagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
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
        .auto-style15 {
            width: 137px;
        }
        .auto-style23 {
            border-style: solid;
            border-width: 2px;
            height: 45px;
            text-align: center;
            background-color: #CCCCCC;
        }
        .auto-style24 {
            border-style: solid;
            border-width: 2px;
            width: 137px;
            height: 45px;
            text-align: center;
            background-color: #CCCCCC;
        }
        .auto-style25 {
            font-weight: bold;
        }
        .auto-style26 {
            height: 17px;
            width: 137px;
        }
        .auto-style27 {
            height: 19px;
        }
        .auto-style28 {
            height: 44px;
            text-align: center;
        }
        .auto-style29 {
            font-weight: bold;
            font-size: medium;
            color: #FFFFFF;
            background-color: #0066FF;
        }
        .auto-style30 {
            height: 44px;
            width: 137px;
        }
        .auto-style31 {
            height: 20px;
            width: 137px;
        }
    .auto-style32 {
        height: 20px;
        width: 137px;
        text-align: right;
    }
    .auto-style33 {
        font-size: x-small;
    }
    .auto-style34 {
        height: 14px;
        width: 137px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td class="auto-style13" colspan="7"><strong>Filtrar Busqueda PAgo Agentes</strong></td>
        </tr>
        <tr>
            <td class="auto-style24"><strong>Filtrar Por :</strong></td>
            <td class="auto-style23" colspan="2"><strong>
                <asp:DropDownList ID="ddlfiltro" runat="server" AutoPostBack="True" CssClass="auto-style25" Height="50%" Width="40%" OnSelectedIndexChanged="ddlfiltro_SelectedIndexChanged1">
                    <asp:ListItem Selected="True" Value="0">Solo Fechas</asp:ListItem>
                    <asp:ListItem Value="1">Nº Invoice</asp:ListItem>
                    <asp:ListItem Value="3">ID Factura</asp:ListItem>
                    <asp:ListItem Value="50">TODOS</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
                </strong>
                <asp:TextBox ID="txtfiltro" runat="server" Height="50%" Width="49%"></asp:TextBox>
            </td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style24"><strong>Rangos de Fecha</strong></td>
            <td class="auto-style24">
                <asp:RadioButtonList ID="RBFecha" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RBFecha_SelectedIndexChanged" RepeatDirection="Horizontal" style="height: 25px">
                    <asp:ListItem Selected="True">NO</asp:ListItem>
                    <asp:ListItem>SI</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style24">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24"><strong>
                <asp:Label ID="tipofecha" runat="server" Text="Tipo Fecha :" Visible="False"></asp:Label>
                </strong></td>
            <td class="auto-style23" colspan="2"><strong>
                <asp:DropDownList ID="ddltipofecha" runat="server" AutoPostBack="True" CssClass="auto-style25" Height="50%" Visible="False" Width="70%">
                    <asp:ListItem Value="10">Fecha Invoice</asp:ListItem>
                    <asp:ListItem Value="15">Fecha Registro</asp:ListItem>
                    <asp:ListItem Value="20">Fecha Pago</asp:ListItem>
                </asp:DropDownList>
                </strong>
            </td>
            <td class="auto-style24"><strong>
                <asp:Label ID="fechadesde" runat="server" Text="Fecha Desde  :" Visible="False"></asp:Label>
&nbsp;</strong></td>
            <td class="auto-style24"><strong>
                <asp:TextBox ID="txtFechaDesde" runat="server" Height="60%" TextMode="Date" Width="90%" Visible="False"></asp:TextBox>
                </strong></td>
            <td class="auto-style24"><strong>
                <asp:Label ID="FechaHasta" runat="server" Text="Fecha Hasta  :" Visible="False"></asp:Label>
                </strong></td>
            <td class="auto-style24"><strong>
                <asp:TextBox ID="txtFechaHasta" runat="server" Height="60%" TextMode="Date" Width="90%" Visible="False"></asp:TextBox>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style34"></td>
            <td class="auto-style34"></td>
            <td class="auto-style34"></td>
            <td class="auto-style34"></td>
            <td class="auto-style34"></td>
            <td class="auto-style34"></td>
            <td class="auto-style34"></td>
        </tr>
        <tr>
            <td class="auto-style30"></td>
            <td class="auto-style30"></td>
            <td class="auto-style30"></td>
            <td class="auto-style28" colspan="2"><strong>
                <asp:Button ID="btnFiltrar" runat="server" CssClass="auto-style29" Height="90%" OnClick="btnFiltrar_Click" Text="Filtrar" Width="36%" />
                </strong></td>
            <td class="auto-style30"></td>
            <td class="auto-style30">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style31"></td>
            <td class="auto-style31"></td>
            <td class="auto-style31"></td>
            <td class="auto-style31"></td>
            <td class="auto-style31"></td>
            <td class="auto-style31"></td>
            <td class="auto-style32">
                <asp:ImageButton ID="btnexpexcel" runat="server" OnClick="btnexpexcel_Click" Height="37px" ImageUrl="~/Imagenes/botonexportar.jpg" Width="45px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style27" colspan="7">

                   <div class="auto-style8">
                       <asp:GridView ID="gvfiltro" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_factura" DataSourceID="filtropagos" ForeColor="#333333" GridLines="None" Width="100%" CssClass="auto-style33">
                           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                           <Columns>
                               <asp:BoundField DataField="id_factura" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_factura" />
                               <asp:BoundField DataField="empresa" HeaderText="Empresa" SortExpression="empresa" />
                               <asp:BoundField DataField="agente" HeaderText="Agente" SortExpression="agente" />
                               <asp:BoundField DataField="ninvoice" HeaderText="Nº Invoice" SortExpression="ninvoice" />
                               <asp:BoundField DataField="FINVOICE" HeaderText="Fecha Invo" SortExpression="FINVOICE" />
                               <asp:BoundField DataField="nnc" HeaderText="Nº N/C" SortExpression="nnc" />
                               <asp:BoundField DataField="vnc" HeaderText="V N/C" SortExpression="vnc" />
                               <asp:BoundField DataField="fnc" HeaderText="Fecha N/C" SortExpression="fnc" />
                               <asp:BoundField DataField="moneda" HeaderText="Moneda" SortExpression="moneda" />
                               <asp:BoundField DataField="tc" HeaderText="T.Cambio" SortExpression="tc" />
                               <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" ReadOnly="True" />
                               <asp:BoundField DataField="condicion" HeaderText="Condicion" SortExpression="condicion" />
                               <asp:BoundField DataField="observ" HeaderText="Observacion" SortExpression="observ" />
                               <asp:BoundField DataField="detalle" HeaderText="Detalle Pago" SortExpression="detalle" />
                               <asp:BoundField DataField="usuario" HeaderText="Usuario" SortExpression="usuario" />
                               <asp:BoundField DataField="fechaingreso" HeaderText="Fecha Registro" SortExpression="fechaingreso" />
                               <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                               <asp:BoundField DataField="fechapago" HeaderText="Fecha Pago" SortExpression="fechapago" />
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
                  <asp:SqlDataSource ID="filtropagos" SelectCommand="SELECT TOP 1000 DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from  Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago  FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice ORDER BY Facturas2.id_factura DESC" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" ></asp:SqlDataSource>



            </td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
            <td class="auto-style15">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
