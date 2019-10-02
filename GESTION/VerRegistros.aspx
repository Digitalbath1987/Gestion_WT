<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="VerRegistros.aspx.cs" Inherits="GESTION.Control_Operaciones.VerRegistros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">

.btnVerde {
  background: #0fb800;
  background-image: -webkit-linear-gradient(top, #00991f, #0fb800);
  background-image: -moz-linear-gradient(top, #00991f, #0fb800);
  background-image: -ms-linear-gradient(top, #00991f, #0fb800);
  background-image: -o-linear-gradient(top, #00991f, #0fb800);
  background-image: linear-gradient(to bottom, #00991f, #0fb800);
  -webkit-border-radius: 10px;
  border-radius: 10px;
  border: 2px solid #0fb800;
  font-family: Arial;
  color: #000000;
  font-size: 14px;
padding: 10px 25px;
 text-shadow: 1px 1px 0px #0fb800;
  box-shadow: 1px 1px 1px #0fb800;
}

.btnVerde:hover {
  background: #0fb800;
  background-image: -webkit-linear-gradient(top, #00991f, #0fb800);
  background-image: -moz-linear-gradient(top, #00991f, #0fb800);
  background-image: -ms-linear-gradient(top, #00991f, #0fb800);
  background-image: -o-linear-gradient(top, #00991f, #0fb800);
  background-image: linear-gradient(to bottom, #00991f, #0fb800);
  text-decoration: none;
}
 .scrolling-table-container {
    height: 378px;
    overflow-y: scroll;
    overflow-x: hidden;
}



 .DataGridFixedHeader
{
position: relative;
top: expression(this.offsetParent.scrollTop-3); /*this works fine with IE only, but FireFox seems to be ignoring this*/
}
</style>


</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Filtrar BLs</strong></h4></div>
<div class="panel-body">


    <div class="row">
    <div class="col-xs-12">
    <div class="panel panel-default">
    <div class="panel-heading"><h4><strong>Filtrar</strong></h4> 
    <div class="panel-body">




        

    <div class="form-group">


         <div class="col-xs-2"><label for="ejemplo_email_1">Filtrar Por:</label><i class="glyphicon glyphicon-list"></i>
         <asp:DropDownList ID="ddlFiltro" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged">
         <asp:ListItem>Todo</asp:ListItem>
         <asp:ListItem>Naviera</asp:ListItem>
         <asp:ListItem>Operacion</asp:ListItem>
          <asp:ListItem>MBL-HBL</asp:ListItem>
         </asp:DropDownList>
         </div>





         <asp:Panel runat="server" ID="panel_Doc" Visible="false">
         <div class="col-xs-2">
         <label for="ejemplo_email_1"><strong>MBL HBL</strong></label>
         <i class="glyphicon glyphicon-copy"></i><asp:TextBox runat="server" class="form-control" id="txtDocumento"></asp:TextBox> 
         <asp:RequiredFieldValidator ID="rfvope" runat="server" ControlToValidate="txtDocumento" CssClass="alert-text" Display="Dynamic" ErrorMessage="N° Documento!!!!" SetFocusOnError="True" ValidationGroup="CREARNC" />
         </div>
         </asp:Panel>


         <asp:Panel runat="server" ID="panel_OP" Visible="false">
         <div class="col-xs-2">
         <label for="ejemplo_email_1"><strong>Operacion</strong></label>
         <i class="glyphicon glyphicon-copy"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar operacion" id="txtoperacion"></asp:TextBox> 
         </div>
         </asp:Panel>



    

    
         <asp:Panel runat="server" ID="Panel_Empresa" Visible="false">
         <div class="col-xs-2">
         <label for="ejemplo_email_1">Naviera</label>
         <i class="glyphicon glyphicon-list"></i>
             <asp:DropDownList ID="ddlNaviera" runat="server" class="form-control" DataSourceID="Navieras" DataTextField="Naviera" DataValueField="Naviera">
             </asp:DropDownList>

             <asp:SqlDataSource runat="server" ID="Navieras" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT [Naviera] FROM [Naviera] ORDER BY [Naviera]"></asp:SqlDataSource>
         </div>
         </asp:Panel>

            
         <div class="col-xs-2">
         <br />
         <button id="btnFiltrar" type="button"  class="btnVerde" runat="server"  onserverclick="btnFiltrar_ServerClick"><span class="glyphicon glyphicon-search" ></span>Buscar</button>
         </div>
  



</div>





    </div>
    </div>
    </div>
    </div>
    </div>





<div class="row">
<div class="col-xs-12">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Registros</strong></h4>
<div class="panel-body">
<div class="scrolling-table-container">

   <asp:GridView ID="gvregistros" runat="server" AutoGenerateColumns="False" CellPadding="4" style="font-size: x-small;" DataKeyNames="id_Control" DataSourceID="Listado" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="gvregistros_SelectedIndexChanged" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id_Control" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_Control" />
                        <asp:BoundField DataField="Naviera" HeaderText="Naviera" SortExpression="Naviera" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                        <asp:BoundField DataField="MBL_HBL" HeaderText="MBL HBL" SortExpression="MBL_HBL" />
                        <asp:BoundField DataField="ETA" HeaderText="ETA" SortExpression="ETA" />
                        <asp:BoundField DataField="F_Entrega" HeaderText="Entrega" SortExpression="F_Entrega" />
                           
                        <asp:BoundField DataField="P_Facturas" HeaderText="Facturas" SortExpression="P_Facturas" />
                       
                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                       
                       <asp:BoundField DataField="Operacion" HeaderText="Operacion" SortExpression="Operacion" />
                       <asp:CheckBoxField DataField="Presentacion" HeaderText="Presentacion" SortExpression="Presentacion" />
                       <asp:CheckBoxField DataField="Sidemar" HeaderText="Sidemar" SortExpression="Sidemar" />
                       <asp:CheckBoxField DataField="A_LLegada" HeaderText="LLegada" SortExpression="A_LLegada" />
                        <asp:CheckBoxField DataField="Canje" HeaderText="Canje" SortExpression="Canje" />
               

                        <asp:CommandField ShowSelectButton="True" headerText="Ver"   ControlStyle-CssClass="btn default btn-xs purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-eye-open'></i>">
                    <ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
                    </asp:CommandField>




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
                <asp:SqlDataSource ID="Listado" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand=""></asp:SqlDataSource>
            



</div>           
</div>
</div>
</div>
</div>
</div>




</div>
</div>
</div>





</asp:Content>
