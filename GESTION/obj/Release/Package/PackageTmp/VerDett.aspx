<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="VerDett.aspx.cs" Inherits="GESTION.PagoFacturas.VerDett" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading">
<div class="row">
<div class="col-sm-8">
<div class="row">
<div class="col-sm-4">
<h4><strong>Invoice N :  <asp:Label ID="lblid" runat="server" Text="Label"></asp:Label></strong></h4>
</div> 

<div class="col-sm-8">
<asp:ImageButton ID="btnMod" runat="server" Height="20px" ImageUrl="/Gestion2/Imagenes/btnmod.jpg" OnClick="btnMod_Click" Width="24px" />
<asp:ImageButton ID="btneliminvo" runat="server" ImageUrl="/Gestion2/Imagenes/eliminarFact.jpg" Width="24px" Height="20px" OnClick="btneliminvo_Click" />
</div>



</div>

</div> 

 <div class="col-sm-4">
Descargar PDF : <asp:ImageButton ID="pdf" runat="server" Height="31px" ImageUrl="/Gestion2/Imagenes/descargpdf.jpg" OnClick="pdf_Click" Width="29px" />
</div> 
</div>    

</div>
<div class="panel-body">
    <div class="col-sm-4">
<asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
</div> 
<div class="row">


<div class="col-sm-8">
<div class="panel panel-default">

<div class="panel-body">

<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading">Detalle de Invoice</div>
<div class="panel-body">


<div class="row">

<div class="col-sm-6">
<div class="form-group">
<label for="ejemplo_email_1">
Nº Invoice :</label> <i class="fas fa-file-invoice-dollar"></i>
<asp:TextBox ID="txtNInvoice" runat="server" class="form-control" AutoPostBack="True" OnTextChanged="txtNInvoice_TextChanged"></asp:TextBox>
</div> 
</div>  


<div class="col-sm-6">
<div class="form-group">
<label for="ejemplo_email_1">
Empresa</label> <i class="fas fa-industry"></i>
<asp:DropDownList ID="ddlempr" class="form-control" runat="server" Enabled="False">
<asp:ListItem Value="World Transport Int. Ltda">World Transport Int. Ltda</asp:ListItem>
<asp:ListItem>Tr3s Vias Ltda</asp:ListItem>
<asp:ListItem>World Transport Courier Ltda</asp:ListItem>
</asp:DropDownList>
</div> 
</div>  

</div>  


<div class="row">

<div class="col-sm-6">
<div class="form-group">
<label for="ejemplo_email_1">
Agente</label> <i class="fas fa-user-tie"></i>
<asp:DropDownList ID="ddlagente" class="form-control" runat="server" DataSourceID="agentes" DataTextField="Nombre" DataValueField="Nombre"  Enabled="False">
</asp:DropDownList>
<asp:SqlDataSource ID="agentes" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Agentes2] with(nolock) ORDER BY [Nombre]"></asp:SqlDataSource>
</div> 
</div>                   
    

<div class="col-sm-6">
<div class="form-group">
<label for="ejemplo_email_1">
Fecha Invoice</label> <i class="fas fa-calendar-alt"></i>
<asp:TextBox ID="txtfechainvoice" class="form-control" runat="server" Enabled="False"></asp:TextBox>
</div> 
</div> 


</div>  


<div class="row">

<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Moneda</label> <i class="fas fa-money-bill-alt"></i>
<asp:DropDownList ID="ddlmoneda" class="form-control" runat="server" DataSourceID="moneda" DataTextField="Detalle" DataValueField="Detalle" Height="90%" Width="90%" Enabled="False">
</asp:DropDownList>
<asp:SqlDataSource ID="moneda" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Moneda] with(nolock)"></asp:SqlDataSource>
</div> 
</div>
    

<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
T/C</label> <i class="fas fa-exchange-alt"></i>
<asp:TextBox ID="txttc" runat="server"  class="form-control" Enabled="False"></asp:TextBox>
</div> 
</div>

<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Estado</label> <i class="fas fa-calendar-check"></i>
<asp:DropDownList ID="DDLESTADO" runat="server" class="form-control"  Enabled="False">
<asp:ListItem>PENDIENTE</asp:ListItem>
<asp:ListItem>PAGADO</asp:ListItem>
</asp:DropDownList>
</div> 
</div>




</div>  


<div class="row">



<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Usuario</label> <i class="fas fa-users"></i>
<asp:DropDownList ID="ddluser" class="form-control" runat="server" DataSourceID="USUARIOS" DataTextField="Usuario" DataValueField="Usuario"  Enabled="False">
</asp:DropDownList>
<asp:SqlDataSource ID="USUARIOS" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [id_Usuario], [Usuario] FROM [Usuarios] with(nolock)"></asp:SqlDataSource>
</div> 
</div>

    <div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Fecha Ingreso</label> <i class="fas fa-calendar-alt"></i>
<asp:TextBox ID="TXTINGRESO" class="form-control" runat="server"  Enabled="False"></asp:TextBox>
</div> 
</div>


<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Fecha de Pago(Estimada)</label> <i class="fas fa-calendar-alt"></i>
<asp:TextBox ID="txtfpago" class="form-control" runat="server"  Enabled="False"></asp:TextBox>
</div> 
</div>


</div>


<div class="row">

<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Condicion </label> <i class="fas fa-hand-holding-usd"></i>
<asp:TextBox ID="txtcondicion" class="form-control" runat="server"  Enabled="False"></asp:TextBox>
</div> 
</div>


<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Observacion</label> <i class="fas fa-comment-dots"></i> 
<asp:TextBox ID="txtobserv" class="form-control" runat="server"  Enabled="False"></asp:TextBox>
</div> 
</div>

<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Detalle </label> <i class="fas fa-comment-dots"></i>
<asp:TextBox ID="txtdetalle" class="form-control" runat="server" Enabled="False"></asp:TextBox>
</div> 
</div>


</div>



<div class="row">


<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Numero N/C </label> <i class="fas fa-file-contract"></i>
<asp:TextBox ID="txtnumnc" class="form-control" runat="server"  Enabled="False"></asp:TextBox>
</div> 
</div>


<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Valor N/C  </label> <i class="fas fa-file-invoice-dollar"></i>
<asp:TextBox ID="txtvalornc" class="form-control" runat="server"  Enabled="False"></asp:TextBox>
</div> 
</div>

<div class="col-sm-4">
<div class="form-group">
<label for="ejemplo_email_1">
Fecha N/C </label> <i class="fas fa-calendar-alt"></i>
<asp:TextBox ID="txtfechanc" class="form-control" runat="server"  Enabled="False"></asp:TextBox>
</div> 
</div>

</div>



</div>
</div>
</div> 


</div>


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading">Operaciones</div>
<div class="panel-body">
<asp:GridView ID="gvoperaciones" runat="server"  AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idop" DataSourceID="operaciones" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" OnSelectedIndexChanged="gvoperaciones_SelectedIndexChanged">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="idop" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="idop" />
<asp:BoundField DataField="numop" HeaderText="Nº Operacion" SortExpression="numop" />
<asp:BoundField DataField="monto" HeaderText="Monto Operacion" SortExpression="monto" />
<asp:BoundField DataField="House" HeaderText="House" SortExpression="monto" />
<asp:BoundField DataField="ninvoice" HeaderText="Nº Invoice" SortExpression="ninvoice"  Visible="false"/>
<asp:BoundField DataField="Fventa" HeaderText="F Venta" SortExpression="Fventa" />
<asp:CommandField  HeaderText="Eliminar" ButtonType="Image" ShowSelectButton="True" SelectImageUrl="/Gestion2/Imagenes/eliminarFact.jpg" />
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
<asp:SqlDataSource ID="operaciones" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Operaciones] with(nolock) WHERE ([ninvoice] = @ninvoice)">
<SelectParameters>
<asp:ControlParameter ControlID="txtNInvoice" Name="ninvoice" PropertyName="Text" Type="String" />
</SelectParameters>
</asp:SqlDataSource>


</div>
</div>
</div> 
</div>


</div>
</div> 
</div>


<div class="col-sm-4">
<div class="panel panel-default">
<div class="panel-body">


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading">Pagos Realizados</div>
<div class="panel-body">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:GridView ID="gvpagos" runat="server"  AutoGenerateColumns="False" Width="100%" Height="100%" DataKeyNames="Id_Pago" DataSourceID="PagosList" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" CaptionAlign="Top" ShowHeaderWhenEmpty="true" EmptyDataText="Sin Pagos Registrados"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Font-Size="Small">
<AlternatingRowStyle BackColor="White" VerticalAlign="Middle" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="Id_Pago" HeaderText="ID" Visible="false" SortExpression="Id_Pago" />
<asp:BoundField DataField="User_Pago" HeaderText="Usuario" SortExpression="User_Pago" />
<asp:BoundField DataField="Fecha_Pago" HeaderText="Fecha Pago" SortExpression="Fecha_Pago" />
<asp:BoundField DataField="Banco" HeaderText="Banco" SortExpression="Banco" />
<asp:BoundField DataField="Monto_Pago" HeaderText="Monto" SortExpression="Monto_Pago" />
<asp:BoundField DataField="Detalle_Pago" HeaderText="Detalle" SortExpression="Detalle_Pago" />
<asp:CommandField ButtonType="Image" HeaderText="Eliminar" ShowSelectButton="True" SelectImageUrl="/Gestion2/Imagenes/eliminarFact.jpg" />
</Columns>
<EditRowStyle BackColor="#999999" />
<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="26px" HorizontalAlign="Center" VerticalAlign="Middle" />
<PagerSettings Position="Top" />
<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="#F7F6F3" BorderStyle="Solid" VerticalAlign="Middle" ForeColor="#333333" />
<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
<SortedAscendingCellStyle BackColor="#E9E7E2" HorizontalAlign="Center" VerticalAlign="Top" />
<SortedAscendingHeaderStyle BackColor="#506C8C" />
<SortedDescendingCellStyle BackColor="#FFFDF8" />
<SortedDescendingHeaderStyle BackColor="#6F8DAE" VerticalAlign="Top" />
</asp:GridView>
<asp:SqlDataSource ID="PagosList" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Pagos_Facturas] with(nolock) WHERE ([NInvoice] = @NInvoice)">
<SelectParameters>
<asp:ControlParameter ControlID="txtNInvoice" Name="NInvoice" PropertyName="Text" Type="String" />
</SelectParameters>
</asp:SqlDataSource>             
</div>
</div>
</div>
</div>
</div>
</div> 


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading">Montos</div>
<div class="panel-body">

<div class="row">
<div class="col-sm-12">
Monto OP: <asp:Label ID="lblmontop" runat="server" Text="Label"></asp:Label>
</div>
</div>

<div class="row">
<div class="col-sm-12">
Valor N/C: <asp:Label ID="lblNC" runat="server" Text="Label"></asp:Label>
</div>
</div>

<div class="row">
<div class="col-sm-12">
MontoTotal:<asp:Label ID="lblmontot" runat="server" Text="Label"></asp:Label>
<asp:Label ID="lblmoneda" runat="server" Text="Label"></asp:Label>
</div>
</div>

<div class="row">
<div class="col-sm-12">
</div>
</div>

<div class="row">
<div class="col-sm-12">
Monto Pesos :<asp:Label ID="lblpesos" runat="server" Text="Label"></asp:Label>
CLP
</div>
</div>         

<div class="row">
<div class="col-sm-12">

</div>
</div>  

<div class="row">
<div class="col-sm-12">
    Monto Pagado : <asp:Label ID="lblpagos" runat="server" Text="Label"></asp:Label>
</div>
</div>  

<div class="row">
<div class="col-sm-12">
Saldo Pendiente :<asp:Label ID="lblSaldo" runat="server" CssClass="auto-style118" Text="Label"></asp:Label>
</div>
</div>  

<div class="row">
<div class="col-sm-12">
<asp:Label ID="lblcobro" runat="server" ForeColor="Red" Text="Agente Tiene 1 Cobro Pendiente !!!!!"></asp:Label>
  
<asp:LinkButton ID="linkver" runat="server" OnClick="linkver_Click" Visible="False">Ver</asp:LinkButton>
                
<asp:Label ID="lblrepetido" runat="server" Text="Label" Visible="False"></asp:Label>
</div>
</div>  


</div>
</div>
</div> 
</div>


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-body">

<asp:ImageButton ID="btngregarop" runat="server" Height="80px" ImageAlign="Bottom" ImageUrl="/Gestion2/Imagenes/agreop.jpg" OnClick="btngregarop_Click" Width="90px" />
&nbsp;
<asp:ImageButton ID="btnPagar" runat="server" Height="80px" Width="90px" ImageUrl="/Gestion2/Imagenes/pagar.jpg" OnClick="btnPagar_Click" ImageAlign="Bottom" />
&nbsp;
<asp:ImageButton ID="btnEnvMail" runat="server" Height="80px" ImageUrl="/Gestion2/Imagenes/Mail.jpg" Width="90px" OnClick="btnEnvMail_Click" />

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
