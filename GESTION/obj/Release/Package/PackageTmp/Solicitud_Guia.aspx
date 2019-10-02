<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Solicitud_Guia.aspx.cs" Inherits="GESTION.Solicitud_Guia_Despacho.Solicitud_Guia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
      <style type="text/css">



.modalDialog2
 {
 position: fixed;
 top: 0;
 right: 0;
 bottom: 0;
 left: 0;
 background: rgba(180,180,180,0.8);
 z-index: 99999;
 opacity: 0;
 -webkit-transition: opacity 600ms ease-in;
 -moz-transition: opacity 600ms ease-in;
 transition: opacity 600ms ease-in;
 pointer-events: none;
 }
 .modalDialog2:target
 {
 opacity: 1;
 pointer-events: auto;
 }
 
 .modalDialog2 > div
 {
 width: 30%;
 position: relative;
 margin: 10% auto;
 padding: 5px 20px 13px 20px;
 border-radius: 10px;
 background: #fff;
 background: -moz-linear-gradient(#fff, #999);
 background: -webkit-linear-gradient(#fff, #999);
 background: #fff;
    top: 0px;
    left: -21px;
}

.modalDialog
 {
 position: fixed;
 top: 0;
 right: 0;
 bottom: 0;
 left: 0;
 background: rgba(180,180,180,0.8);
 z-index: 99999;
 opacity: 0;
 -webkit-transition: opacity 600ms ease-in;
 -moz-transition: opacity 600ms ease-in;
 transition: opacity 600ms ease-in;
 pointer-events: none;
 }
 .modalDialog:target
 {
 opacity: 1;
 pointer-events: auto;
 }
 
 .modalDialog > div
 {
 width: 90%;
 position: relative;
 margin: 10% auto;
 padding: 5px 20px 13px 20px;
 border-radius: 10px;
 background: #fff;
 background: -moz-linear-gradient(#fff, #999);
 background: -webkit-linear-gradient(#fff, #999);
 background: #fff;
    top: 0px;
    left: -21px;
}
 
 .close
 {
 background: #606061;
 color: #FFFFFF;
 line-height: 25px;
 position: absolute;
 right: -12px;
 text-align: center;
 top: -10px;
 width: 24px;
 text-decoration: none;
 font-weight: bold;
 -webkit-border-radius: 12px;
 -moz-border-radius: 12px;
 border-radius: 12px;
 -moz-box-shadow: 1px 1px 3px #000;
 -webkit-box-shadow: 1px 1px 3px #000;
 box-shadow: 1px 1px 3px #000;
 }
 
 .close:hover
 {
 background: #00d9ff;
 }

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
<script type="text/javascript">
     function formatoRut(texto, inputText) {
     objRut = document.getElementById(inputText);
     var rut_aux = "";
     for (i = 0; i < texto.length; i++)
     if (texto.charAt(i) != ' ' && texto.charAt(i) != '.' && texto.charAt(i) != '-')
     rut_aux = rut_aux + texto.charAt(i);
     largo = rut_aux.length;
     if (largo == 0) return false;
     if (largo < 2) return false;
     for (i = 0; i < largo; i++) {
     var letra = rut_aux.charAt(i);
     if (!letra.match(/^([0-9]|[kK])$/)) return false;
     }
     var rut_inv = "";
     for (i = (largo - 1), j = 0; i >= 0; i-- , j++) rut_inv = rut_inv + rut_aux.charAt(i);
     var dtexto = "";
     dtexto = dtexto + rut_inv.charAt(0);
     dtexto = dtexto + '-';
     cnt = 0;
     for (i = 1, j = 2; i < largo; i++ , j++) {
     if (cnt == 3) {
     dtexto = dtexto + '.';
     j++;
     dtexto = dtexto + rut_inv.charAt(i);
     cnt = 1;
     } else {
     dtexto = dtexto + rut_inv.charAt(i);
     cnt++;
     }
     }
     rut_inv = "";
     for (i = (dtexto.length - 1), j = 0; i >= 0; i-- , j++) rut_inv = rut_inv + dtexto.charAt(i);
     objRut.value = rut_inv.toUpperCase()
     }
  </script>
    
   <script>function MostrarModalJS() {
    window.location.href = '#modalHtml';
}</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container">
<div class="panel panel-primary">
<div class="panel-heading">
<h4><strong>Guia de Despacho</strong></h4></div>
<div class="panel-body">
<div class="form-group">
<div class="panel panel-default">
<div class="panel-heading"><strong>Solicitud</strong></div>
<div class="panel-body">


    
<div class="row">

<div class="col-sm-8">


<div class="row">
<div class="col-sm-6">
<div class="form-group">
<label for="ejemplo_email_1">Empresa</label>
<i class="glyphicon glyphicon-lock"></i>
<asp:DropDownList ID="ddlEmpresa" runat="server" class="form-control" DataSourceID="Empresas" DataTextField="RazonSocial" DataValueField="id_Empresa">
</asp:DropDownList>
<asp:SqlDataSource ID="Empresas" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [RazonSocial], [id_Empresa] FROM [Empresas] with(nolock)"></asp:SqlDataSource>
</div>
</div>
<div class="col-sm-6">
<div class="form-group">
<label for="ejemplo_email_1">
Nombre del Cliente</label>  <i class="fas fa-user-tie"></i>
<asp:TextBox id="txt_Nombre"  class="form-control" runat="server" placeholder="Nombre Del Cliente"></asp:TextBox> 
<asp:RequiredFieldValidator ID="rfv_txt_Nombre" runat="server" ErrorMessage="Debe Ingresar Nombre!!!!" ControlToValidate="txt_Nombre" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
</div> 
</div>


</div>
    <div class="row">
<div class="col-sm-6">
<div class="form-group">
<label for="ejemplo_email_1">
Rut del Cliente</label> <i class="fas fa-id-card"></i>
<asp:TextBox id="txt_Rut"  class="form-control" runat="server" onblur="javascript:formatoRut(this.value,this.id)" placeholder="Rut del cliente"></asp:TextBox> 
<asp:RequiredFieldValidator ID="rfv_txt_Rut" runat="server" ErrorMessage="Debe Ingresar RUT!!!!" ControlToValidate="txt_Rut" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
</div> 
</div>
<div class="col-sm-6">
<div class="form-group">
<label for="ejemplo_email_1">
Nombre del Conductor</label>  <i class="fas fa-user-tie"></i>
<asp:TextBox id="txt_Conductor"  class="form-control" runat="server" placeholder="Nombre Del Conductor"></asp:TextBox> 
</div> 
</div>


</div>
    <div class="row">
<div class="col-sm-6">
<div class="form-group">
<label for="ejemplo_email_1">
Patente del Vehiculo</label>  <i class="fas fa-truck"></i>
<asp:TextBox id="txt_Patente"  class="form-control" runat="server" placeholder="Patente"></asp:TextBox> 
</div> 
</div>
<div class="col-sm-6">


</div>
</div>
</div>

<div class="col-sm-4">

<div class="form-group">
<label for="ejemplo_email_1">
Detalle</label>  <i class="fas fa-comment-alt"></i>
<asp:TextBox id="txt_Detalle" TextMode="multiline" class="form-control" placeholder="Ingrese Detalle"  Columns="500" Rows="10"  runat="server" />
</div> 
</div>

</div>


</div>
<div class="alert alert-success" runat="server" id="Registro_OK" visible="false"> <strong>Registrado Correctamente!!</strong>Se ha registrado solicitud N° : <asp:Label ID="lbl_ID" runat="server" Text=""></asp:Label> .</div>
<div class="alert alert-danger" runat="server" id="Registro_NOOK" visible="false"><strong>Error en Registro!</strong>Verifique que los datos esten correctamente o contacte al Administrador</div>
<div class="alert alert-danger" runat="server" id="Sin_Permisos" visible="false"><strong>Acceso Denegado!</strong>No posee privilegios,Favor contacte al Administrador</div>
<div class="alert alert-success" runat="server" id="Eliminar_OK" visible="false"> <strong>Se ha eliminado el Registro!!!!</strong></div>

<div class="panel-footer">
<div class="row">
<div class="col-sm-3">
</div>
<div class="col-sm-3">
<button runat="server" id="btn_Registrar" type="button" class="btn btn-success btn-lg" ValidationGroup="registrar" onserverclick="btn_Registrar_ServerClick"><i class="far fa-save"></i> Registrar</button>
</div>
<div class="col-sm-3">
<button runat="server" id="btn_Listar" type="button" class="btn btn-warning btn-lg" onclick="MostrarModalJS(); return false;"><i class="fas fa-th-list"></i> Ver Registros</button>
</div>
<div class="col-sm-3">
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

    
 <div id="modalHtml" class="modalDialog">
 <div>
 <a href="#cerrar" title="Cerrar" class="close">X</a>
    <div class="row">
    <div class="col-xs-12">
    <div class="panel panel-default">
    <div class="panel-heading"><strong>Registros Guias de Despacho</strong><button type="button" id="Btn_Descargar" runat="server"  onserverclick="Btn_Descargar_ServerClick" class="btn btn-info btn-xs"><i class="fas fa-file-download"></i></button></div>
    <div class="panel-body">

    <div class="scrolling-table-container">
    <div style="overflow-x:auto;">
    <div class="table-responsive-sm">
    <table class="table">
        <asp:GridView ID="GV_Guias_Despachos" runat="server" AutoGenerateColumns="False" DataKeyNames="Correlativo_Guia_Despacho" Width="100%" Height="100%" DataSourceID="Listados_Guias_Despachos" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GV_Guias_Despachos_RowCommand" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="Id_Guia_Despacho" HeaderText="Id_Guia_Despacho" ReadOnly="True" Visible="false" InsertVisible="False" SortExpression="Id_Guia_Despacho"></asp:BoundField>
                <asp:BoundField DataField="Correlativo_Guia_Despacho" HeaderText="N° Solicitud" SortExpression="Correlativo_Guia_Despacho"></asp:BoundField>
                <asp:BoundField DataField="Usuario_Solicitante" HeaderText="Solicitante" SortExpression="Usuario_Solicitante"></asp:BoundField>
                <asp:BoundField DataField="Fecha_Solicitud" HeaderText="Fecha" SortExpression="Fecha_Solicitud"></asp:BoundField>
                <asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa"></asp:BoundField>
                <asp:BoundField DataField="Nombre_Cliente" HeaderText="Cliente" SortExpression="Nombre_Cliente"></asp:BoundField>
                <asp:BoundField DataField="Rut_Cliente" HeaderText="Rut" SortExpression="Rut_Cliente"></asp:BoundField>
                <asp:BoundField DataField="Nombre_Conductor" HeaderText="Conductor" SortExpression="Nombre_Conductor"></asp:BoundField>
                <asp:BoundField DataField="Patente_Vehiculo" HeaderText="Patente" SortExpression="Patente_Vehiculo"></asp:BoundField>
               <asp:TemplateField HeaderText="Botones" >            
              <ItemTemplate>
                <asp:LinkButton  ID="Imprimir_Guia" CommandName="Imprimir" ToolTip="Imprimir Guia Despacho" CommandArgument='<%# Bind("Correlativo_Guia_Despacho") %>' runat="server" >
                <span aria-hidden="true" class="fas fa-print btn-lg"></span>
                </asp:LinkButton>

                <asp:LinkButton  ID="Detalle_Guia" CommandName="Detalle" ToolTip="Ver Detalle Guia Despacho" CommandArgument='<%# Bind("Correlativo_Guia_Despacho") %>' runat="server" >
                <span aria-hidden="true" class="fas fa-eye btn-lg"></span>
                </asp:LinkButton>

                <asp:LinkButton  ID="Eliminar_Guia" CommandName="Eliminar" ToolTip="Eliminar Guia Despacho" CommandArgument='<%# Bind("Correlativo_Guia_Despacho") %>' runat="server" >
                <span aria-hidden="true" class="fas fa-trash-alt btn-lg"></span>
                </asp:LinkButton>           
                </ItemTemplate>
                <ItemStyle Height="12px"></ItemStyle>   
                </asp:TemplateField>
      
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
        <asp:SqlDataSource runat="server" ID="Listados_Guias_Despachos" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT Id_Guia_Despacho,Correlativo_Guia_Despacho,Usuario_Solicitante,FORMAT(Fecha_Solicitud,'dd-MM-yyyy') as Fecha_Solicitud,CASE When Empresa = 'World Transport Int. Ltda' THEN 'WTI' when  Empresa = 'World Transport Courier ltda' THEN 'WTC' when  Empresa = 'Tres Vias Ltda' THEN 'TR3SV' when  Empresa = 'AGRICOLA MARCELINO VALENZUELA REYES E.I.R.L.' THEN 'MVR' when  Empresa = 'World Transport Peru' THEN 'WTP'end as Empresa,Nombre_Cliente,Rut_Cliente,Nombre_Conductor,Patente_Vehiculo  FROM Guia_Despachos with(nolock) ORDER BY Correlativo_Guia_Despacho DESC"></asp:SqlDataSource>
    </table>
    </div>
    </div>
    </div>  
    </div>
    </div>
    </div>  
    </div> 
</div>
</div>




 <div id="modalHtml2" class="modalDialog2">
<div>
<a href="#cerrar" title="Cerrar" class="close">X</a>
<div ><h2><strong>Guia de Despacho N° : <asp:Label ID="lbl_ID_Mod" runat="server" Text="Label"></asp:Label></strong></h2></div>
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">

<div class="row">
<div class="col-sm-12">
    <div class="form-group">
<label for="ejemplo_email_1">Empresa</label>
<i class="glyphicon glyphicon-lock"></i>   
<asp:TextBox id="ddl_empresa_mod"  class="form-control" Enabled="false" runat="server" placeholder="Empresa"></asp:TextBox> 
</div>

</div>
</div>

<div class="row">
<div class="col-sm-12">
<div class="form-group">
<label for="ejemplo_email_1">
Nombre del Cliente</label>  <i class="fas fa-user-tie"></i>
<asp:TextBox id="txtnombre_mod"  class="form-control" runat="server" Enabled="false" placeholder="Nombre Del Cliente"></asp:TextBox> 
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe Ingresar Nombre!!!!" ControlToValidate="txt_Nombre" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
</div>

</div>
</div>

<div class="row">
<div class="col-sm-12">
    <div class="form-group">
<label for="ejemplo_email_1">
Rut del Cliente</label> <i class="fas fa-id-card"></i>
<asp:TextBox id="txtrut_mod"  class="form-control" runat="server"  Enabled="false" onblur="javascript:formatoRut(this.value,this.id)" placeholder="Rut del cliente"></asp:TextBox> 
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe Ingresar RUT!!!!" ControlToValidate="txt_Rut" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="registrar" />
</div> 

</div>
</div>

<div class="row">
<div class="col-sm-12">
    <div class="form-group">
<label for="ejemplo_email_1">
Nombre del Conductor</label>  <i class="fas fa-user-tie"></i>
<asp:TextBox id="txtconductor_mod"  class="form-control"  Enabled="false" runat="server" placeholder="Nombre Del Conductor"></asp:TextBox> 
</div> 

</div>
</div>

<div class="row">
<div class="col-sm-12">
    
<div class="form-group">
<label for="ejemplo_email_1">
Patente del Vehiculo</label>  <i class="fas fa-truck"></i>
<asp:TextBox id="txtpatente_mod"  class="form-control"  Enabled="false" runat="server" placeholder="Patente"></asp:TextBox> 
</div> 
</div>
</div>

<div class="row">
<div class="col-sm-12">
<div class="form-group">
<label for="ejemplo_email_1">
Detalle</label>  <i class="fas fa-comment-alt"></i>
<asp:TextBox id="txtdetalle_mod" TextMode="multiline" Enabled="false" class="form-control" placeholder="Ingrese Detalle"  Columns="500" Rows="10"  runat="server" />
</div> 
</div>
</div>
<button type="button" id="btn_Modificar" runat="server" onserverclick="btn_Modificar_ServerClick" class="btn btn-primary">Modificar</button>
<button type="button" id="btn_Grabar" runat="server" visible="false" onserverclick="btn_Grabar_ServerClick" class="btn btn-warning">Grabar</button>
</div>
</div>
</div>
</div>
</div>
       <asp:GridView ID="gvDescargar" runat="server" AutoGenerateColumns="False" Visible="false"  DataKeyNames="Id_Guia_Despacho" Width="100%" Height="100%" DataSourceID="Listados_Guias_Despachos" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="Id_Guia_Despacho" HeaderText="Id_Guia_Despacho" ReadOnly="True" Visible="false" InsertVisible="False" SortExpression="Id_Guia_Despacho"></asp:BoundField>
                <asp:BoundField DataField="Correlativo_Guia_Despacho" HeaderText="N° Solicitud" SortExpression="Correlativo_Guia_Despacho"></asp:BoundField>
                <asp:BoundField DataField="Usuario_Solicitante" HeaderText="Solicitante" SortExpression="Usuario_Solicitante"></asp:BoundField>
                <asp:BoundField DataField="Fecha_Solicitud" HeaderText="Fecha" SortExpression="Fecha_Solicitud"></asp:BoundField>
                <asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa"></asp:BoundField>
                <asp:BoundField DataField="Nombre_Cliente" HeaderText="Cliente" SortExpression="Nombre_Cliente"></asp:BoundField>
                <asp:BoundField DataField="Rut_Cliente" HeaderText="Rut" SortExpression="Rut_Cliente"></asp:BoundField>
                <asp:BoundField DataField="Nombre_Conductor" HeaderText="Conductor" SortExpression="Nombre_Conductor"></asp:BoundField>
                <asp:BoundField DataField="Patente_Vehiculo" HeaderText="Patente" SortExpression="Patente_Vehiculo"></asp:BoundField>
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
</asp:Content>
