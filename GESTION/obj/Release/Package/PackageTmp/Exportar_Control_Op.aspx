<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Exportar_Control_Op.aspx.cs" Inherits="GESTION.Control_Operaciones.Exportar_Control_Op" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">

     .titulo{
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

            .auto-style8 {
                width: 100%;
            }

            .auto-style9 {
                height: 20px;
                text-align: center;
            }

                    .testbutton {
  font-family: arial;
  color: #14396A !important;
  font-size: 14px;
  text-shadow: 1px 1px 0px #7CACDE;
  box-shadow: 1px 1px 1px #BEE2F9;
  padding: 10px 25px;
  -moz-border-radius: 10px;
  -webkit-border-radius: 10px;
  border-radius: 10px;
  border: 2px solid #3866A3;
  background: #63B8EE;
  background: linear-gradient(top,  #63B8EE,  #468CCF);
  background: -ms-linear-gradient(top,  #63B8EE,  #468CCF);
  background: -webkit-gradient(linear, left top, left bottom, from(#63B8EE), to(#468CCF));
  background: -moz-linear-gradient(top,  #63B8EE,  #468CCF);
}
.testbutton:hover {
  color: #14396A !important;
  background: #468CCF;
  background: linear-gradient(top,  #468CCF,  #63B8EE);
  background: -ms-linear-gradient(top,  #468CCF,  #63B8EE);
  background: -webkit-gradient(linear, left top, left bottom, from(#468CCF), to(#63B8EE));
  background: -moz-linear-gradient(top,  #468CCF,  #63B8EE);
}

        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">







    <table class="auto-style8">
        <tr>
            <td class="titulo" colspan="3"><strong>Exportar</strong></td>
        </tr>
        <tr>
            <td class="textheader">&nbsp;</td>
            <td class="textheader">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="textheader">&nbsp;</td>
            <td class="textheader">
                <button id="Registrar" runat="server" class="testbutton" onserverclick="btnExportar_Click" type="button" validationgroup="registrar">
                 
                      <span class="glyphicon glyphicon-save-file"></span>Exportar
                </button>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="textheader">&nbsp;</td>
            <td class="textheader">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9" colspan="3">
                <asp:GridView ID="gvexporcontrolop" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_Control" DataSourceID="registrosexp" ForeColor="#333333" GridLines="None" Height="100%" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id_Control" HeaderText="id_Control" InsertVisible="False" ReadOnly="True" SortExpression="id_Control" />
                        <asp:BoundField DataField="Naviera" HeaderText="Naviera" SortExpression="Naviera" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                        <asp:BoundField DataField="MBL_HBL" HeaderText="MBL_HBL" SortExpression="MBL_HBL" />
                        <asp:BoundField DataField="ETA" HeaderText="ETA" SortExpression="ETA" />
                        <asp:BoundField DataField="F_Entrega" HeaderText="F_Entrega" SortExpression="F_Entrega" />
                        <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
                          <asp:BoundField DataField="A_LLegada" HeaderText="A_LLegada" SortExpression="A_LLegada" />
                          <asp:BoundField DataField="Canje" HeaderText="Canje" SortExpression="Canje" />
                        <asp:BoundField DataField="P_Facturas" HeaderText="P_Facturas" SortExpression="P_Facturas" />
                     <asp:BoundField DataField="Sidemar" HeaderText="Sidemar" SortExpression="Sidemar" />
                        <asp:BoundField DataField="Oservacion" HeaderText="Oservacion" SortExpression="Oservacion" />
                        <asp:BoundField DataField="ObservacionG" HeaderText="ObservacionG" SortExpression="ObservacionG" />
                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                       <asp:BoundField DataField="Presentacion" HeaderText="Presentacion" SortExpression="Presentacion" />
                        <asp:BoundField DataField="Usuario_Registro" HeaderText="Usuario_Registro" SortExpression="Usuario_Registro" />
                        <asp:BoundField DataField="Fecha_Registro" HeaderText="Fecha_Registro" SortExpression="Fecha_Registro" />
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
                <asp:SqlDataSource ID="registrosexp" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Controlop] ORDER BY [id_Control] DESC"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="textheader">&nbsp;</td>
            <td class="textheader">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>







</asp:Content>
