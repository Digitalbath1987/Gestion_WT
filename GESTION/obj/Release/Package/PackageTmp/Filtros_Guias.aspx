<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Filtros_Guias.aspx.cs" Inherits="GESTION.Control_Operaciones.Filtros_Guias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
         <style type="text/css">
    .DataGridFixedHeader
{
position: relative;
top: expression(this.offsetParent.scrollTop-3); /*this works fine with IE only, but FireFox seems to be ignoring this*/
}
   .scrolling-table-container {
    height: 378px;
    overflow-y: scroll;
    overflow-x: hidden;
}
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Filtrar Guias Aereas <i class="fas fa-plane"></i></strong></h4></div>
<div class="panel-body">

    <div class="row">
    <div class="col-xs-12">
    <div class="panel panel-default">
    <div class="panel-heading"><h4><strong>Filtrar</strong></h4> 
    <div class="panel-body">

        

<div class="form-group">


<div class="row">

<div class="col-sm-2">
<label for="ejemplo_email_1">Filtrar Por:</label>
<i class="fas fa-filter"></i>
<asp:DropDownList ID="ddlFiltro" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltro_SelectedIndexChanged">
<asp:ListItem>Todo</asp:ListItem>
<asp:ListItem>AWB_AF</asp:ListItem>
<asp:ListItem>Estado</asp:ListItem>
<asp:ListItem>Empresa</asp:ListItem>
</asp:DropDownList>
</div>

<asp:Panel runat="server" ID="panel_AWB" Visible="false">
<div class="col-sm-2">
<label for="ejemplo_email_1"><strong>AWB</strong></label>
<i class="fas fa-plane"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Documento" id="txtDocumento"></asp:TextBox> 
<asp:RequiredFieldValidator ID="rfvope" runat="server" ControlToValidate="txtDocumento" CssClass="alert-text" Display="Dynamic" ErrorMessage="N° Documento!!!!" SetFocusOnError="True" ValidationGroup="CREARNC" />
</div>
</asp:Panel>

<asp:Panel runat="server" ID="panel_Empresa" Visible="false">
<div class="col-sm-2">
<label for="ejemplo_email_1"><strong>Empresa</strong></label>
<i class="fas fa-industry"></i>
<asp:DropDownList ID="ddlempresa" runat="server"  class="form-control" DataSourceID="Empresa" DataTextField="RazonSocial" DataValueField="RazonSocial"></asp:DropDownList>
<asp:SqlDataSource runat="server" ID="Empresa" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [Empresas]"></asp:SqlDataSource>
</div>
</asp:Panel>

<asp:Panel runat="server" ID="panel_estado" Visible="false">
<div class="col-sm-2">
<label for="ejemplo_email_1">Estado</label>
<i class="glyphicon glyphicon-list"></i>
<asp:DropDownList ID="ddlestado" runat="server" class="form-control" DataSourceID="Estate" DataTextField="Estado" DataValueField="Estado"></asp:DropDownList>
<asp:SqlDataSource runat="server" ID="Estate" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT DISTINCT Estado FROM Guia"></asp:SqlDataSource>
</div>
</asp:Panel>
     
<div class="col-sm-2"><br />
<button id="btnFiltrar" type="button"  class="btn btn-primary" runat="server"  onserverclick="btnFiltrar_ServerClick" ><span class="glyphicon glyphicon-search" ></span>Buscar</button>
</div>


</div>

</div>
 


   
        


    </div>
    </div>
    </div>
    </div>
    </div>
    

<div class="panel-footer">
<div>
<div id="ok" runat="server" visible="false" class="alert alert-success">Registro Realizado Correctamente!!!!!!!</div>
<div id="nook" runat="server" visible="false"  class="alert alert-danger">Error en el Registro!!!</div>
<div id="eliok" runat="server" visible="false" class="alert alert-success">Registro Eliminado Correctamente!!!!!!!</div>
<div id="elinook" runat="server" visible="false"  class="alert alert-danger">No posee Permisos , Contacte al Administrador!!!</div>
<div id="Pagar" runat="server" visible="false" class="alert alert-success">Registro se Actualizo Como Pagado Correctamente!!!!!!!</div>

</div>
</div>

<div class="row">
<div class="col-xs-12">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Registros</strong></h4>
<div class="panel-body">
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">

<asp:GridView ID="gvRegistros" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" style="font-size: x-small;" DataSourceID="Registros" CellPadding="4" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" OnRowCommand="gvregistros_RowCommand">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID">
<ItemStyle Font-Bold="True" Font-Size="Large" />
</asp:BoundField>
<asp:BoundField DataField="AWBAF" HeaderText="AWBAF" SortExpression="AWBAF"></asp:BoundField>
<asp:BoundField DataField="Fecha_Reserva" HeaderText="Reserva" SortExpression="Fecha_Reserva"></asp:BoundField>
<asp:BoundField DataField="Destino" HeaderText="Destino" SortExpression="Destino"></asp:BoundField>
<asp:BoundField DataField="Operador" HeaderText="Operador" SortExpression="Operador"></asp:BoundField>
<asp:BoundField DataField="Aerolinea" HeaderText="Aerolinea" SortExpression="Aerolinea"></asp:BoundField>
<asp:BoundField DataField="Operacion" HeaderText="Op" SortExpression="Operacion"></asp:BoundField>
<asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente"></asp:BoundField>
<asp:BoundField DataField="Fact_Venta" HeaderText="Venta" SortExpression="Fact_Venta"></asp:BoundField>
<asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda"></asp:BoundField>
<asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto"></asp:BoundField>
<asp:BoundField DataField="Costo" HeaderText="Costo" SortExpression="Costo"></asp:BoundField>
<asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado">
<ItemStyle Font-Bold="True" />
</asp:BoundField>
<asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa"></asp:BoundField>
<asp:BoundField DataField="Fecha_Ingreso" HeaderText="Registro" SortExpression="Fecha_Ingreso"></asp:BoundField>
<asp:TemplateField HeaderText="Pagar" ItemStyle-HorizontalAlign="Center" >
<ItemTemplate>
<asp:LinkButton  ID="Pagar" CommandName="Pagar" ToolTip="Registrar Pago" CommandArgument='<%# Bind("ID") %>' runat="server" >
<span aria-hidden="true" class="glyphicon glyphicon-usd"></span>
</asp:LinkButton>
</ItemTemplate>
<ItemStyle Height="12px"></ItemStyle>                                
</asp:TemplateField>
<asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center" >
<ItemTemplate>
<asp:LinkButton Height="12px" ID="Eliminar" CommandName="Eliminar" ToolTip="Eliminar Registro" CommandArgument='<%# Bind("ID") %>' runat="server" >
<span aria-hidden="true" class="glyphicon glyphicon-remove-circle"></span>
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
<asp:SqlDataSource runat="server" ID="Registros" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand=""></asp:SqlDataSource>
</div>
 </div>           
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
