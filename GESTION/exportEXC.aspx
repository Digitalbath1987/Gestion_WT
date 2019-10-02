<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="exportEXC.aspx.cs" Inherits="GESTION.Cobranzas_Agentes.exportEXC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <style type="text/css">
        .auto-style1 {
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
 


           .auto-style8 {
               text-align: left;
           }
 


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container">
<div class="panel panel-primary">
     <div class="panel-heading"><h5><strong>Exportar Registros Cobro de Agentes</strong> </h5> </div>
         <div class="panel-body">
             
             <table class="table">
             <tbody>
                 <tr>
                 <td>
                 <button id="btnexportxls"  type="button" class="testbutton" runat="server" onserverclick="btnexportxls_ServerClick"><span class="glyphicon glyphicon-save-file"></span> Exportar Excel</button>
                 </td>
                 </tr>
                 <tr>
                 <td>
                 </td>
                          <asp:GridView ID="gvlispagocobr" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_Cobro" DataSourceID="Listpagocobr" GridLines="Vertical" Width="100%" >
                          <AlternatingRowStyle BackColor="#DCDCDC" />
                          <Columns>
                          <asp:BoundField DataField="ID_Cobro" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Cobro" />
                          <asp:BoundField DataField="NDocumento" HeaderText="Nº Documento" SortExpression="NDocumento" >
                              <ItemStyle Font-Bold="True" Font-Size="Large" />
                              </asp:BoundField>
                          <asp:BoundField DataField="Operacion" HeaderText="Operacion" SortExpression="Operacion" />
                          <asp:BoundField DataField="TDocumento" HeaderText="Tipo Documento" SortExpression="TDocumento" />
                          <asp:BoundField DataField="Agente" HeaderText="Agente" SortExpression="Agente" />
                          <asp:BoundField DataField="FEmision" HeaderText="Fecha Emision" SortExpression="FEmision" />
                          <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda" />
                          <asp:BoundField DataField="ValorDocumento" HeaderText="Valor Documento" SortExpression="ValorDocumento" />
                          <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
                          <asp:BoundField DataField="EstadoDocumento" HeaderText="Estado Documento" SortExpression="EstadoDocumento" />
                          <asp:BoundField DataField="Usuario" HeaderText="Usuario Registro" SortExpression="Usuario" />
                          </Columns>
                          <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                          <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                          <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                          <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                          <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                          <SortedAscendingCellStyle BackColor="#F1F1F1" />
                          <SortedAscendingHeaderStyle BackColor="#0000A9" />
                          <SortedDescendingCellStyle BackColor="#CAC9C9" />
                          <SortedDescendingHeaderStyle BackColor="#000065" />
                          </asp:GridView>
                          <asp:SqlDataSource ID="Listpagocobr" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [CobranzaAgentes]"></asp:SqlDataSource>

                 </tr>





             </tbody>
             </table>


          </div>  
    </div> 
</div> 








</asp:Content>
