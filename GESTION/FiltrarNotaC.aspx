<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="FiltrarNotaC.aspx.cs" Inherits="GESTION.Cheques.FiltrarNotaC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     
        <style type="text/css">
                 
        .auto-style10 {
            width: 298px
        }
        
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
<div class="panel-heading"><h4><strong>Filtrar Notas de Cobro</strong></h4></div>
<div class="panel-body">

    <div class="row">
    <div class="col-xs-12">
    <div class="panel panel-default">
    <div class="panel-heading"><h4><strong>Filtrar</strong></h4> 
    <div class="panel-body">

        

<div class="form-group">


<div class="col-xs-2">
<label for="ejemplo_email_1">Filtrar Por:</label>
<i class="glyphicon glyphicon-list"></i>
<asp:DropDownList ID="ddlFiltro" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged">
<asp:ListItem>Todo</asp:ListItem>
<asp:ListItem>Cliente</asp:ListItem>
<asp:ListItem>Empresa</asp:ListItem>
<asp:ListItem>Operacion</asp:ListItem>

</asp:DropDownList>
</div>





<asp:Panel runat="server" ID="panel_Clie" Visible="false">
<div class="col-xs-2">
<label for="ejemplo_email_1">Cliente</label>
<i class="glyphicon glyphicon-list"></i>
    <asp:DropDownList ID="ddlClientes" runat="server" class="form-control" DataSourceID="Clientes" DataTextField="Nombre_Empresa" DataValueField="Nombre_Empresa">
    </asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="Clientes" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [Clientes] ORDER BY [Nombre_Empresa]"></asp:SqlDataSource>
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
<label for="ejemplo_email_1">Empresa</label>
<i class="glyphicon glyphicon-list"></i>
    <asp:DropDownList ID="ddlempresa" runat="server" class="form-control" DataSourceID="Empresa" DataTextField="RazonSocial" DataValueField="RazonSocial">
    </asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="Empresa" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT [RazonSocial] FROM [Empresas]"></asp:SqlDataSource>
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
     
     <div id="SinNC" runat="server" class="alert alert-danger" visible="false"><i class="glyphicon glyphicon-thumbs-down"></i>&nbsp;&nbsp;¡No Existe Nota de Cobro Registrada!,</div>

<div class="row">
<div class="col-xs-12">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Registros</strong></h4>
<div class="panel-body">
<div class="scrolling-table-container">

    <asp:GridView ID="gvsol_Cheques" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="NdeCobro" DataSourceID="Nota_De_Cobros" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" CssClass="auto-style10" OnSelectedIndexChanged="gvsol_Cheques_SelectedIndexChanged" EmptyDataText="Sin Registros" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Id_NotaCobro" HeaderText="Id_NotaCobro" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="Id_NotaCobro" />
            <asp:BoundField DataField="NdeCobro" HeaderText="Nº" SortExpression="NdeCobro"></asp:BoundField>
            <asp:BoundField DataField="Rut" HeaderText="Rut" SortExpression="Rut"></asp:BoundField>
            <asp:BoundField DataField="Señores" HeaderText="Razon Social" SortExpression="Señores" />
         
            <asp:BoundField DataField="Fecha_Emision" HeaderText="Emision" SortExpression="Fecha_Emision" />
            <asp:BoundField DataField="Fecha_Vencimiento" HeaderText="Vencimiento" SortExpression="Fecha_Vencimiento" />
            <asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor"></asp:BoundField>


            <asp:CheckBoxField DataField="Pagado" HeaderText="Pagadas" SortExpression="Pagado" />


            <asp:CommandField ShowSelectButton="True" headerText="Detalle"   ControlStyle-CssClass="btn default btn-xs purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-eye-open'></i>">
            <ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
           </asp:CommandField>



         </Columns>
        <EditRowStyle BackColor="#999999"></EditRowStyle>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>
        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="Nota_De_Cobros" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand=""></asp:SqlDataSource>
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
