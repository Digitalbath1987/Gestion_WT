<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="IngresarPagoFactura.aspx.cs" Inherits="GESTION.PagoFacturas.IngresarPagoFactura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
   

   



      <style type="text/css">

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


.btnAmarillo {
  background: #0fb800;
  background-image: -webkit-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -moz-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -ms-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -o-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: linear-gradient(to bottom, #f7ff00, #f7ff00);
  -webkit-border-radius: 10px;
  border-radius: 10px;
  border: 2px solid #f7ff00;
  font-family: Arial;
  color: #000000;
  font-size: 14px;
padding: 10px 25px;
 text-shadow: 1px 1px 0px #f7ff00;
  box-shadow: 1px 1px 1px #f7ff00;
}

.btnAmarillo:hover {
  background: #f7ff00;
  background-image: -webkit-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -moz-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -ms-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: -o-linear-gradient(top, #f7ff00, #f7ff00);
  background-image: linear-gradient(to bottom, #f7ff00, #f7ff00);
  text-decoration: none;
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

   <script>function MostrarModalJS() {
    window.location.href = '#modalHtml';
}</script>
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >




<div class="container">

    <div class="container">
            <div id="ok" runat="server" visible="false" class="alert alert-success">Registro Realizado Correctamente!!!!!!!</div>
<div id="nook" runat="server" visible="false"  class="alert alert-danger">Error en el Registro a la BD, verificar datos!!!</div>
<div id="duplimsj" runat="server" visible="false"  class="alert alert-danger">Error en el Registro, N° de Invoice ya existe!!!</div>

    </div>

  <ul class="nav nav-tabs success">
    <li class="active"><a data-toggle="tab" href="#home">Registrar Invoice <i class="fas fa-file-signature"></i></a></li>

   
  </ul>

  <div class="tab-content">


  <div id="home" class="tab-pane fade in active">

<div class="container">
    <div class="panel panel-default">
    <div class="panel-heading"><h4><strong>Detalle de Factura</strong></h4></div> 
    <div class="panel-body">
        

    <div class="row">
    <div class="col-sm-12">
    <div class="form-group">


<div class="container"> 
<div class="row">
<div class="col-sm-4 text-left">

<h5><strong> Factura Emitida a la Empresa : </strong> </h5>
</div>
    <div class="col-sm-4 text-left ">

        <asp:DropDownList ID="DDL_EMP" class="form-control" runat="server">
         <asp:ListItem>World Transport Int. Ltda</asp:ListItem>
         <asp:ListItem>Tr3s Vias Ltda</asp:ListItem>
         <asp:ListItem>World Transport Courier Ltda</asp:ListItem>
</asp:DropDownList> 

        </div>
<div class="col-sm-4 text-left ">

</div>

</div>
 </div>

<br />


    </div> 
    </div>
    </div> 




   <div class="row">
    <div class="col-sm-4">
    <div class="form-group">
    <label for="ejemplo_email_1">
    Nº Invoice</label> <i class="glyphicon glyphicon-file"></i>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtninvoice" CssClass="alert-text" Display="Dynamic" ErrorMessage="Debe Registrar N° Invoive!!!!" SetFocusOnError="True" ValidationGroup="Registrar" />
    <div class="input-group">
    <span class="input-group-btn">
    <asp:TextBox ID="txtninvoice" runat="server" class="form-control" placeholder="Introduce  Nº Documento"></asp:TextBox>
    <button id="Button2" runat="server" class="btn btn-secondary"  type="button" validationgroup="Buscar">
    <span class="glyphicon glyphicon-search"></span>
    </button>
    </span>
    </div>    
    </div>
    </div>
           
        
    <div class="col-sm-4">
    <div class="form-group">
    <label for="ejemplo_email_1">
    Agente :</label> <i class="glyphicon glyphicon-user"></i>
    <asp:DropDownList ID="ddlagente" runat="server" class="form-control" DataTextField="Nombre" DataValueField="Nombre" DataSourceID="Agente">
    </asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="Agente" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [Agentes2] ORDER BY [Nombre]"></asp:SqlDataSource>
    </div> 
    </div>  
                       

    <div class="col-sm-4">
    <div class="form-group">
    <label for="ejemplo_email_1">
    Fecha Invoice :</label><i class="glyphicon glyphicon-calendar"></i>
    <asp:TextBox ID="txtfinvoice"  TextMode="Date"  runat="server" class="form-control" placeholder="Ingresar Fecha Invoice"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvNumOpe" runat="server" ControlToValidate="txtfinvoice" CssClass="alert-text" Display="Dynamic" ErrorMessage="Debe Registrar Fecha!!!!" SetFocusOnError="True" ValidationGroup="Registrar" />
    </div>           
    </div>  

    </div>  


    <div class="row">

    <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Moneda :</label><i class="glyphicon glyphicon-usd"></i>
   <asp:DropDownList ID="ddlmoneda" runat="server" class="form-control" DataTextField="Detalle" DataValueField="Detalle" AutoPostBack="true" DataSourceID="Moneda" OnSelectedIndexChanged="ddlmoneda_SelectedIndexChanged">
   </asp:DropDownList>
   <asp:SqlDataSource runat="server" ID="Moneda" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [Moneda]"></asp:SqlDataSource>
   </div>  
   </div> 


    <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Condicion de Pago :</label><i class="glyphicon glyphicon-calendar"></i>
   <asp:DropDownList ID="ddlcp" runat="server" class="form-control"  DataTextField="Detalle" DataValueField="Detalle" AutoPostBack="true" >
   <asp:ListItem Selected="True">30 Dias</asp:ListItem>
   <asp:ListItem>15 Dias</asp:ListItem>
   <asp:ListItem>Pago Urgente</asp:ListItem>
   </asp:DropDownList>
   </div>            
   </div>  


    <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Tasa de Cambio:</label><i class="glyphicon glyphicon-piggy-bank"></i>
   <asp:TextBox ID="txttc" runat="server" class="form-control" OnTextChanged="txttc_TextChanged" AutoPostBack="true"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttc" CssClass="alert-text" Display="Dynamic" ErrorMessage="Debe Tasa de cambio!!!!" SetFocusOnError="True" ValidationGroup="Registrar" />
   </div> 
   </div> 

    </div> 



   <div class="row">


   <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Observacion :</label><i class="glyphicon glyphicon-comment"></i>
   <asp:TextBox ID="txtobservacion" runat="server" class="form-control" placeholder="Introduce Observacion"></asp:TextBox>
   </div>  
   </div> 


   <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Fecha de Pago:</label><i class="glyphicon glyphicon-calendar"></i>
   <asp:TextBox ID="fpago"  TextMode ="Date" Enabled="false" runat="server" class="form-control" placeholder="Fecha de Pago"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fpago" CssClass="alert-text" Display="Dynamic" ErrorMessage="Debe Ingresar Fecha Pago!!!!" SetFocusOnError="True" ValidationGroup="Registrar" />
   </div>  
   </div> 


   <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Detalle Pago :</label><i class="glyphicon glyphicon-comment"></i>
   <asp:TextBox ID="txtdetalle" runat="server" class="form-control" placeholder="Detalle de pago"></asp:TextBox>
   </div>
   </div> 


   </div>    


        
    <div class="row">
    <div class="col-sm-12">
    <div class="form-group">
    <span>Nota de Credito Asociada ? : </span>
    <input name="collapseGroup" type="radio" data-toggle="collapse" data-target=".collapseOne:not(.in)"/> SI&nbsp;&nbsp;&nbsp; 
    <input name="collapseGroup" type="radio" data-toggle="collapse" data-target=".collapseOne.in" checked/> NO
    <div class="collapseOne panel-collapse collapse">
    <div class="panel-body">


     <div class="col-xs-4">
     <label for="ejemplo_email_1">
     N° Nota Credito
     </label>
     <i class="glyphicon glyphicon-folder-close"></i>
     <asp:TextBox ID="txtnnc" runat="server" class="form-control" placeholder="Nota Credito Asociada"></asp:TextBox>
     </div>

     <div class="col-xs-4">
     <label for="ejemplo_email_1">
     Monto operacion
     </label>
     <i class="glyphicon glyphicon-usd"></i>
     <asp:TextBox ID="txtvnc" runat="server" class="form-control" placeholder="Monto Operacion" OnTextChanged="txtvnc_TextChanged"></asp:TextBox>
     </div>

     <div class="col-xs-4">
     <label for="ejemplo_email_1">
     Fecha Nota Credito
     </label>
     <i class="glyphicon glyphicon-calendar"></i>
     <asp:TextBox ID="txtfnc" runat="server" class="form-control" TextMode="Date" ></asp:TextBox>
     </div>
       

    </div>  
    </div>
    </div>  
    </div>
    </div>







</div>    
</div>

    <div class="panel panel-default">
  <div class="panel-heading"> <h4><strong>N° Operacion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" runat="server" onserverclick="btnquitarop_Click" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-minus-sign"></i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" runat="server" onserverclick="btnagreop_Click"  class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-plus-sign"></i></button></strong></h4></div> 
  <div class="panel-body">
  <div class="row">


    
   <asp:Panel runat="server"  Visible="true" >   
     <div class="col-sm-2">
     <div class="form-group">
     <div class="panel panel-default">
     <div class="panel-body ">
   


     <label for="ejemplo_email_1">
     N° Operacion
     </label>
     <i class="glyphicon glyphicon-file"></i>
     <asp:TextBox ID="op0" runat="server" class="form-control" placeholder="N° Operacion"></asp:TextBox>
     <label for="ejemplo_email_1">
     Monto
     </label>
     <i class="glyphicon glyphicon-usd"></i>
     <asp:TextBox ID="monto0" runat="server" class="form-control" placeholder="Monto"  OnTextChanged="monto0_TextChanged" AutoPostBack="True"></asp:TextBox>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="monto0" ErrorMessage="Decimales Con Comas" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="Registrar"></asp:RegularExpressionValidator>
     <br />
     <label for="ejemplo_email_1">
     House
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="House0" runat="server" class="form-control" placeholder="House"></asp:TextBox>
     <br />
     <label for="ejemplo_email_1">
     Factura Venta
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="txtF_Venta0" runat="server" class="form-control" placeholder="Factura de Venta"></asp:TextBox>
     </div>    
     </div>
     </div>
     </div>
     </asp:Panel>


   <asp:Panel runat="server" Visible="false" ID="panop1" >
     <div class="col-sm-2">
     <div class="panel panel-default">
     <div class="panel-body">
     <label for="ejemplo_email_1">
     N° Operacion
     </label>
     <i class="glyphicon glyphicon-file"></i>
     <asp:TextBox ID="op1" runat="server" class="form-control" placeholder="N° Operacion"></asp:TextBox>
     <label for="ejemplo_email_1">
     Monto
     </label>
     <i class="glyphicon glyphicon-usd"></i> 
     <asp:TextBox ID="monto1" runat="server" class="form-control" placeholder="Monto" AutoPostBack="True"  OnTextChanged="monto1_TextChanged"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="monto1" ErrorMessage="Decimales Con Comas" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="Registrar"></asp:RegularExpressionValidator>
     <br />
     <label for="ejemplo_email_1">
     House
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="House1" runat="server" class="form-control" placeholder="House"></asp:TextBox>
           <br />
     <label for="ejemplo_email_1">
     Factura Venta
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="txtF_Venta1" runat="server" class="form-control" placeholder="Factura de Venta"></asp:TextBox>
     </div>
     </div>
     </div>
     </asp:Panel>


   <asp:Panel runat="server"  Visible="false" ID="panop2" >
     <div class="col-sm-2">
     <div class="panel panel-default">
     <div class="panel-body">
     <label for="ejemplo_email_1">
     N° Operacion
     </label>
     <i class="glyphicon glyphicon-file"></i>
     <asp:TextBox ID="op2" runat="server" class="form-control" placeholder="N° Operacion"></asp:TextBox>
     <label for="ejemplo_email_1">
     Monto
     </label>
     <i class="glyphicon glyphicon-usd"></i> 
     <asp:TextBox ID="monto2" runat="server" class="form-control" placeholder="Monto" AutoPostBack="True"  OnTextChanged="monto2_TextChanged"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="monto2" ErrorMessage="Decimales Con Comas" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="Registrar"></asp:RegularExpressionValidator>
     <br />
     <label for="ejemplo_email_1">
     House
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="House2" runat="server" class="form-control" placeholder="House"></asp:TextBox>
           <br />
     <label for="ejemplo_email_1">
     Factura Venta
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="txtF_Venta2" runat="server" class="form-control" placeholder="Factura de Venta"></asp:TextBox>
     </div>
     </div>
     </div>
     </asp:Panel>


   <asp:Panel runat="server" Visible="false" ID="panop3" >
     <div class="col-sm-2">
     <div class="panel panel-default">
     <div class="panel-body">
     <label for="ejemplo_email_1">
     N° Operacion
     </label>
     <i class="glyphicon glyphicon-file"></i>
     <asp:TextBox ID="op3" runat="server" class="form-control" placeholder="N° Operacion"></asp:TextBox>
     <label for="ejemplo_email_1">
     Monto
     </label>
     <i class="glyphicon glyphicon-usd"></i> 
     <asp:TextBox ID="monto3" runat="server" class="form-control" placeholder="Monto" AutoPostBack="True"  OnTextChanged="monto3_TextChanged"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="monto3" ErrorMessage="Decimales Con Comas" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="Registrar"></asp:RegularExpressionValidator>
     <br /><label for="ejemplo_email_1">
     House
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="House3" runat="server" class="form-control" placeholder="House"></asp:TextBox>
           <br />
     <label for="ejemplo_email_1">
     Factura Venta
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="txtF_Venta3" runat="server" class="form-control" placeholder="Factura de Venta"></asp:TextBox>
     </div>
     </div>
     </div>
     </asp:Panel>


   <asp:Panel runat="server" Visible="false" ID="panop4" >
     <div class="col-sm-2">
     <div class="panel panel-default">
     <div class="panel-body">
     <label for="ejemplo_email_1">
     N° Operacion
     </label>
     <i class="glyphicon glyphicon-file"></i>
     <asp:TextBox ID="op4" runat="server" class="form-control" placeholder="N° Operacion"></asp:TextBox>
     <label for="ejemplo_email_1">
     Monto
     </label>
     <i class="glyphicon glyphicon-usd"></i> 
     <asp:TextBox ID="monto4" runat="server" class="form-control" placeholder="Monto" AutoPostBack="True"  OnTextChanged="monto4_TextChanged"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="monto4" ErrorMessage="Decimales Con Comas" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="Registrar"></asp:RegularExpressionValidator>
     <br /><label for="ejemplo_email_1">
     House
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="House4" runat="server" class="form-control" placeholder="House"></asp:TextBox>
           <br />
     <label for="ejemplo_email_1">
     Factura Venta
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="txtF_Venta4" runat="server" class="form-control" placeholder="Factura de Venta"></asp:TextBox>
     </div>
     </div>
     </div>
     </asp:Panel>


   <asp:Panel runat="server" Visible="false"  ID="panop5">
    <div class="col-sm-2">
    <div class="panel panel-default">
    <div class="panel-body">
    <label for="ejemplo_email_1">
    N° Operacion
    </label>
    <i class="glyphicon glyphicon-file"></i>
    <asp:TextBox ID="op5" runat="server" class="form-control" placeholder="N° Operacion"></asp:TextBox>
    <label for="ejemplo_email_1">
    Monto
    </label>
    <i class="glyphicon glyphicon-usd"></i> 
    <asp:TextBox ID="monto5" runat="server" class="form-control" placeholder="Monto" AutoPostBack="True"  OnTextChanged="monto5_TextChanged"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="monto5" ErrorMessage="Decimales Con Comas" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="Registrar"></asp:RegularExpressionValidator>
    <br /><label for="ejemplo_email_1">
    House
    </label>
    <i class="glyphicon glyphicon-duplicate"></i>
    <asp:TextBox ID="House5" runat="server" class="form-control" placeholder="House"></asp:TextBox>
          <br />
     <label for="ejemplo_email_1">
     Factura Venta
     </label>
     <i class="glyphicon glyphicon-duplicate"></i>
     <asp:TextBox ID="txtF_Venta5" runat="server" class="form-control" placeholder="Factura de Venta"></asp:TextBox>
    </div>
    </div>
    </div>
    </asp:Panel>

 </div>    
 </div>
 </div>
    

    <div class="panel panel-default">
<div class="panel-heading"><h4><strong>Adjuntar PDF Invoice</strong></h4></div> 
<div class="panel-body">
<div class="row text-center">
<asp:FileUpload ID="fuinvoice" runat="server"  />
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="fuinvoice" CssClass="alert-text" Display="Dynamic" ErrorMessage="Debe Adjuntar Archivo!!!!" SetFocusOnError="True" ValidationGroup="Registrar" />
</div>
</div> 
</div>

    <div class="panel panel-default">
<div class="panel-heading"><h4><strong>Montos Totales</strong></h4></div> 
<div class="panel-body">
<div class="row text-center">

   <div class="col-sm-2">
   <div class="form-group">
   Total Operacion : <asp:TextBox ID="txttotalop" Enabled="false" Width="100px" runat="server"></asp:TextBox>
   </div> 
   </div> 
      
   <div class="col-sm-2">
    <div class="form-group">
    Nota de Cobro :  <asp:TextBox ID="txtvnotac"   Enabled="false" Width="100px"  runat="server"></asp:TextBox>
    </div> 
    </div> 

   <div class="col-sm-2">
    <div class="form-group">
     Monto Neto :  <asp:TextBox ID="txttneto"  Enabled="false" Width="100px"  runat="server"></asp:TextBox>
    </div> 
    </div>
    
   <div class="col-sm-2">
    <div class="form-group">
    Total CLP :  <asp:TextBox ID="txttotal"  Enabled="false" Width="100px" runat="server"></asp:TextBox>
    </div> 
    </div> 

       
</div>
</div> 
</div>


<div class="panel-footer">
<div>

<button id="btnRegistrar" type="button" class="btnVerde" runat="server"   onserverclick="btnRegistrar_ServerClick" validationgroup="Registrar">
<span class="glyphicon glyphicon-floppy-disk"></span> Registrar</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</div>
</div>



</div>

    </div>


    



   
  
  </div>



</div>



     
  








</asp:Content>