<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Filtros.aspx.cs" Inherits="GESTION.Cobranzas_Agentes.Filtros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


        <style type="text/css">
            .auto-style8 {
            width: 100%;
        }
     
        .auto-style10 {
            width: 298px
        }
        .auto-style11 {
            width: 297px
        }
     
        .auto-style12 {
            height: 19px;
            text-align: center;
        }
     
        .auto-style13 {
            text-align: center;
            border-bottom: 1px solid #eee;
            margin-left: 0;
            margin-right: 0;
            margin-top: 40px;
            margin-bottom: 20px;
            padding-bottom: 9px;
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




 .modalDialog3
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
 .modalDialog3:target
 {
 opacity: 1;
 pointer-events: auto;
 }
 
 .modalDialog3 > div
 {
 width: 50%;
 height: 70%;
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



        </style>



    <script>function MostrarModalJS() {
    window.location.href = '#modalHtml';
}</script>





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Filtrar Cobro de Agentes</strong></h4></div>
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
<asp:ListItem>Estado</asp:ListItem>
<asp:ListItem>Operacion</asp:ListItem>
<asp:ListItem>Agente</asp:ListItem>
<asp:ListItem>Tipo</asp:ListItem>
<asp:ListItem>Documento</asp:ListItem>
</asp:DropDownList>
</div>


<asp:Panel runat="server" ID="panel_Doc" Visible="false">
<div class="col-xs-2">
<label for="ejemplo_email_1"><strong>Documento</strong></label>
<i class="glyphicon glyphicon-copy"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar Documento" id="txtDocumento"></asp:TextBox> 
<asp:RequiredFieldValidator ID="rfvope" runat="server" ControlToValidate="txtDocumento" CssClass="alert-text" Display="Dynamic" ErrorMessage="N° Documento!!!!" SetFocusOnError="True" ValidationGroup="CREARNC" />
</div>
</asp:Panel>


    <asp:Panel runat="server" ID="panel_OP" Visible="false">
<div class="col-xs-2">
<label for="ejemplo_email_1"><strong>Operacion</strong></label>
<i class="glyphicon glyphicon-copy"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar operacion" id="txtoperacion"></asp:TextBox> 
</div>
</asp:Panel>

<asp:Panel runat="server" ID="panel_agente" Visible="false">
<div class="col-xs-2">
<label for="ejemplo_email_1">Agentes</label>
<i class="glyphicon glyphicon-user"></i>
    <asp:DropDownList ID="ddlagente" runat="server" class="form-control" DataSourceID="Agentes" DataTextField="Nombre" DataValueField="Nombre">
    </asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="Agentes" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT [id_Agente], [Nombre] FROM [Agentes2] ORDER BY [Nombre]"></asp:SqlDataSource>
</div>
</asp:Panel>


<asp:Panel runat="server" ID="panel_tipo" Visible="false">
<div class="col-xs-2">
<label for="ejemplo_email_1">Tipo</label>
<i class="glyphicon glyphicon-list"></i>
<asp:DropDownList ID="ddlTipo" runat="server" class="form-control"  >
<asp:ListItem>DNO</asp:ListItem>
<asp:ListItem>FE</asp:ListItem>
<asp:ListItem>NC</asp:ListItem>
<asp:ListItem>Otros</asp:ListItem>
</asp:DropDownList>
</div>
</asp:Panel>


<asp:Panel runat="server" ID="panel_estado" Visible="false">
<div class="col-xs-2">
<label for="ejemplo_email_1">Estado</label>
<i class="glyphicon glyphicon-list"></i>
<asp:DropDownList ID="ddlestado" runat="server" class="form-control"  >
<asp:ListItem>Pendiente</asp:ListItem>
<asp:ListItem>Pagado</asp:ListItem>
<asp:ListItem>Anulado</asp:ListItem>
</asp:DropDownList>
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
    
             <div id="Alertaok" runat="server" class="alert alert-success" visible="false">
                   <i class="glyphicon glyphicon-thumbs-up"></i> ¡Registro Realizado Correctamente!</div>

                <div id="Alertanook" runat="server" class="alert alert-danger" visible="false">
                    <i class="glyphicon glyphicon-thumbs-down"></i>¡Error En El Registro , Favor Revisar los Datos...!</div>
                <div id="noexiste" runat="server" class="alert alert-danger" visible="false">
                    <i class="glyphicon glyphicon-thumbs-down"></i>¡No existe ese Registro , Favor Revisar los Datos...!</div>
     <div id="registrook" class="alert alert-success" runat="server" visible="false"><i class="glyphicon glyphicon-thumbs-up"></i>¡Realizado Correctamente!</div>

                   <div id="sinpermisos" runat="server" visible="false" class="alert alert-danger"><i class="glyphicon glyphicon-thumbs-down"></i>¡Error En El Registro, No Posee Permisos.!</div>
                
                   <div id="eliminarreg" runat="server" visible="false" class="alert alert-danger"><i class="glyphicon glyphicon-thumbs-up"></i>¡Registro Eliminado Correctamente</div>
           <div id="RegExist" runat="server" visible="false" class="alert alert-danger"><i class="glyphicon glyphicon-thumbs-down"></i>¡Error , El Documento ya se encuentra Registrado!</div>


<div class="row">
<div class="col-xs-12">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Registros</strong></h4>
<div class="panel-body">
<div class="scrolling-table-container">


<asp:GridView ID="gvCobroAgente" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Cobro" DataSourceID="CobroCheques"  CellPadding="4" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" OnRowCommand="gvregistros_RowCommand" EmptyDataText="Sin Registros" ShowHeaderWhenEmpty="True" >
<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
<Columns>
<asp:BoundField DataField="ID_Cobro" HeaderText="ID_Cobro" ReadOnly="True" InsertVisible="False" Visible="false" SortExpression="ID_Cobro"></asp:BoundField>
<asp:BoundField DataField="NDocumento" HeaderText="Documento" SortExpression="NDocumento">
<ItemStyle Font-Bold="True"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="TDocumento" HeaderText="Tipo" SortExpression="TDocumento"></asp:BoundField>
<asp:BoundField DataField="Agente" HeaderText="Agente" SortExpression="Agente"></asp:BoundField>
<asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda"></asp:BoundField>
<asp:BoundField DataField="ValorDocumento" HeaderText="Monto" SortExpression="ValorDocumento"></asp:BoundField>
<asp:BoundField DataField="EstadoDocumento" HeaderText="Estado" SortExpression="EstadoDocumento"></asp:BoundField>
<asp:BoundField DataField="Operacion" HeaderText="Operacion" SortExpression="Operacion">
<ItemStyle Font-Bold="True"></ItemStyle>
</asp:BoundField>
<asp:TemplateField HeaderText="PDF" ItemStyle-HorizontalAlign="Center" >
<ItemTemplate>
<asp:LinkButton  ID="PDF" CommandName="PDF" ToolTip="Descargar PDF" CommandArgument='<%# Bind("ID_Cobro") %>' runat="server"  >
<span aria-hidden="true" class="glyphicon glyphicon-save-file"></span>
</asp:LinkButton>
</ItemTemplate>
<ItemStyle Height="12px"></ItemStyle>                                
</asp:TemplateField>
<asp:TemplateField HeaderText="Pagar" ItemStyle-HorizontalAlign="Center" >
<ItemTemplate>
<asp:LinkButton  ID="Pagar" CommandName="Pagar" ToolTip="Registrar Pago" CommandArgument='<%# Bind("ID_Cobro") %>' runat="server" >
<span aria-hidden="true" class="glyphicon glyphicon-usd"></span>
</asp:LinkButton>
</ItemTemplate>
<ItemStyle Height="12px"></ItemStyle>                                
</asp:TemplateField>
<asp:TemplateField HeaderText="Ver" ItemStyle-HorizontalAlign="Center" >
<ItemTemplate>
<asp:LinkButton Height="12px" ID="Ver" CommandName="Ver" ToolTip="Ver detalle del Pago" CommandArgument='<%# Bind("ID_Cobro") %>' runat="server" >
<span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span>
</asp:LinkButton>
</ItemTemplate>
<ItemStyle Height="12px"></ItemStyle>                                
</asp:TemplateField>
<asp:TemplateField HeaderText="Anular" ItemStyle-HorizontalAlign="Center" >
<ItemTemplate>
<asp:LinkButton Height="12px" ID="Anular" CommandName="Anular" ToolTip="Anular Pago" CommandArgument='<%# Bind("ID_Cobro") %>' runat="server" >
<span aria-hidden="true" class="glyphicon glyphicon-ban-circle"></span>
</asp:LinkButton>
</ItemTemplate>
<ItemStyle Height="12px"></ItemStyle>                                
</asp:TemplateField>
<asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center" >
<ItemTemplate>
<asp:LinkButton Height="12px" ID="Eliminar" CommandName="Eliminar" ToolTip="Eliminar Registro" CommandArgument='<%# Bind("ID_Cobro") %>' runat="server" >
<span aria-hidden="true" class="glyphicon glyphicon-remove-circle"></span>
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
<asp:SqlDataSource runat="server" ID="CobroCheques" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [CobranzaAgentes] ORDER BY [ID_Cobro] DESC"></asp:SqlDataSource>
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
   <div class="auto-style13"><h2><strong> Registrar Pago</strong></h2></div>
       <div class="scrolling-table-container">
            <div class="auto-style85">


                 

                
     <div class="form-group">
    <label for="ejemplo_email_1">Nº Documento</label>
  <i class="glyphicon glyphicon-file"></i>
      <asp:TextBox id="txtdocumentopag" Enabled="false" placeholder="Introduce  Nº Documento" class="form-control" runat="server"></asp:TextBox></div>


     <div class="form-group">
    <label for="ejemplo_email_1">Moneda</label>
  <i class="glyphicon glyphicon-usd"></i>
      <asp:TextBox id="txtmonedapag" Enabled="false" class="form-control" runat="server"></asp:TextBox></div>



     <div class="form-group">
    <label for="ejemplo_email_1">Fecha</label>
  <i class="glyphicon glyphicon-calendar"></i>
      <asp:TextBox id="txtFechapag"  Enabled="false" class="form-control" runat="server"></asp:TextBox></div>



  <div class="form-group">
    <label for="ejemplo_email_1">Monto</label>
  <i class="glyphicon glyphicon-piggy-bank"></i>
      <asp:TextBox id="txtmonto_factura" Enabled="false" placeholder="Introduce  Nº Documento" class="form-control" runat="server" ></asp:TextBox></div>

     <div class="form-group">
    <label for="ejemplo_email_1">Monto Pendiente</label>
  <i class="glyphicon glyphicon-piggy-bank"></i>
      <asp:TextBox id="txtmonto_Pagado" placeholder="Introduce  Nº Documento" Enabled="false" class="form-control" runat="server" ></asp:TextBox></div>

     <div class="form-group">
    <label for="ejemplo_email_1">Monto a Pagar</label>
  <i class="glyphicon glyphicon-piggy-bank"></i>
      <asp:TextBox id="txtvalorpag" placeholder="Introduce  Nº Documento" class="form-control" runat="server" ></asp:TextBox></div>
<asp:RegularExpressionValidator ID="revValor_Pagar" runat="server" ControlToValidate="txtvalorpag" ErrorMessage="Decimales Con Comas" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="Registrar"></asp:RegularExpressionValidator>



                 <div class="form-group">
    <label for="ejemplo_email_1">Banco</label>
       <i class="glyphicon glyphicon-usd"></i>
                     <asp:DropDownList ID="ddlbancopag" class="form-control" runat="server" DataSourceID="Bancos" DataTextField="Detalle" DataValueField="Detalle"></asp:DropDownList>
                     <asp:SqlDataSource runat="server" ID="Bancos" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [Bancos] ORDER BY [Detalle]"></asp:SqlDataSource>
                    
  </div>

     <div class="form-group">
    <label for="ejemplo_email_1">Detalle</label>
  <i class="glyphicon glyphicon-file"></i>
      <asp:TextBox id="txtdetallepag" placeholder="Ingrese Detalle del Pago" class="form-control" runat="server"></asp:TextBox></div>



                <button id="btnpagar" onserverclick="btnpagar_ServerClick"  type="button"  class="btnVerde" runat="server"   >
                <span class="glyphicon glyphicon-usd"></span>Registrar Pago</button>

         

             </div>

       </div>
 </div>
 </div>


          <div id="modalHtml3" class="modalDialog3">
     <div>
 <a href="#cerrar" title="Cerrar" class="close">X</a>
   <div class="auto-style13"><h2><strong> Detalle Documento Nº : <asp:Label ID="lblid" Enabled="false" runat="server" Text="Label"></asp:Label></strong></h2></div>
       <div class="scrolling-table-container">


           <table class="auto-style8">
               <tr>
                   <td><div class="form-group">
    <label for="ejemplo_email_1">Fecha Emision</label>
  <i class="glyphicon glyphicon-calendar"></i> <asp:TextBox  class="form-control" Enabled="false" id="txtfemidet"  runat="server"></asp:TextBox>
    </div></td>
                   <td><div class="form-group">
    <label for="ejemplo_email_1">Valor</label>
   <i class="glyphicon glyphicon-piggy-bank"></i>  <asp:TextBox runat="server" type="number"  Enabled="false" class="form-control" id="txtvaldet"></asp:TextBox> 
  </div></td>
               </tr>
               <tr>
                   <td> <div class="form-group">
    <label for="ejemplo_email_1">Nº Operacion</label>
  <i class="glyphicon glyphicon-folder-open"></i>
           <asp:TextBox id="txtnopedet"  class="form-control" runat="server"  Enabled="false"  placeholder="Introduce  Nº Operacion"></asp:TextBox> 
  </div></td>
                   <td><div class="form-group">
    <label for="ejemplo_email_1">Moneda</label>
  <i class="glyphicon glyphicon-usd"></i>
    <asp:TextBox ID="txtmonedadet"  class="form-control" runat="server"  Enabled="false" placeholder="Introduce Observacion"></asp:TextBox> 
  </div>
       </td>
               </tr>
               <tr>
                   <td><div class="form-group">
    <label for="ejemplo_email_1">Agente</label>
  <i class="glyphicon glyphicon-user"></i>
    <asp:TextBox ID="txtagentedet"  class="form-control" runat="server"  Enabled="false" placeholder="Introduce Observacion"></asp:TextBox> 
  </div></td>
                   <td>
<div class="form-group">
    <label for="ejemplo_email_1">Observacion</label>
  <i class="glyphicon glyphicon-comment"></i>
    <asp:TextBox ID="txtobsdet"  class="form-control" runat="server"  Enabled="false" placeholder="Introduce Observacion"></asp:TextBox> 
  </div></td>
               </tr>
               <tr>
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td colspan="2">

                       <asp:GridView ID="gvpagos" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Pago" DataSourceID="PagosRegistrados" CellPadding="4"  ShowFooter="True" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="90%" EmptyDataText="Sin Registro de Pago" ShowHeaderWhenEmpty="True">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
               <Columns>
                   <asp:BoundField DataField="ID_Pago" HeaderText="ID_Pago" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="ID_Pago"></asp:BoundField>
                   <asp:BoundField DataField="Fecha_Pago" HeaderText="Fecha" SortExpression="Fecha_Pago"></asp:BoundField>
                   <asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda"></asp:BoundField>
                   <asp:BoundField DataField="Valor_Pago" HeaderText="Valor" SortExpression="Valor_Pago"></asp:BoundField>
                   <asp:BoundField DataField="Banco" HeaderText="Banco" SortExpression="Banco"></asp:BoundField>
                 
                   <asp:BoundField DataField="Usuario_Pago" HeaderText="Usuario" SortExpression="Usuario_Pago"></asp:BoundField>
                   <asp:BoundField DataField="N_Documento" HeaderText="Documento" SortExpression="N_Documento"></asp:BoundField>
                   <asp:BoundField DataField="Detalle_Pago" HeaderText="Detalle" SortExpression="Detalle_Pago"></asp:BoundField>
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
           <asp:SqlDataSource runat="server" ID="PagosRegistrados" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [PagoCobrosAgentes] WHERE ([N_Documento] = @N_Documento)">
               <SelectParameters>
                   <asp:ControlParameter ControlID="lblid" PropertyName="Text" Name="N_Documento" Type="String"></asp:ControlParameter>
               </SelectParameters>
           </asp:SqlDataSource>
                   </td>
               </tr>
           </table>

       </div>
 </div>
              
 </div>


 </asp:Content>
