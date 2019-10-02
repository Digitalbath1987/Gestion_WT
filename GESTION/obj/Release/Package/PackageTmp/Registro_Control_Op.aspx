<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Registro_Control_Op.aspx.cs" Inherits="GESTION.Control_Operaciones.Registro_Control_Op" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
     


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
        </style>


    <script>function MostrarModalJS() {
    window.location.href = '#modalHtml';
}</script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Filtrar BLs</strong></h4></div>
<div class="panel-body">


    <div class="row">

    
       <div class="col-sm-8">
       <div class="panel panel-default">
       <div class="panel-heading"><h4><strong>Detalle</strong></h4></div> 
       <div class="panel-body">    
       
               <div class="row">
    
     <div class="col-sm-4">
     <div class="form-group">
     <label for="ejemplo_email_1">
     Naviera :</label><i class="glyphicon glyphicon-user"></i>
     <asp:DropDownList ID="ddlNaviera" runat="server" class="form-control" DataSourceID="Naviera" DataTextField="Naviera" DataValueField="Naviera" AutoPostBack="True" OnSelectedIndexChanged="ddlNaviera_SelectedIndexChanged">
     </asp:DropDownList>
     <asp:SqlDataSource ID="Naviera" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Naviera]"></asp:SqlDataSource>
     </div>
     </div>
              

    <div class="col-sm-4">
    <div class="form-group">
    <label for="ejemplo_email_1">
    Cliente :</label><i class="glyphicon glyphicon-duplicate"></i>
    <asp:TextBox ID="txtCliente" runat="server" class="form-control" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvcliente" runat="server" ControlToValidate="txtCliente" class="form-control" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
    </div>
    </div>  
              
              
    <div class="col-sm-4">
    <div class="form-group">
    <label for="ejemplo_email_1">
    MBL / HBL :</label><i class="glyphicon glyphicon-duplicate"></i>
    <asp:TextBox ID="txtmbl" runat="server" class="form-control" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvmbl" runat="server" ControlToValidate="txtmbl" CssClass="auto-style82" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
    </div>           
    </div>  

 </div>  

               <div class="row">

        <div class="col-sm-4">
          <div class="form-group">
          <label for="ejemplo_email_1">
           ETA :</label><i class="glyphicon glyphicon-calendar"></i>
          <asp:TextBox ID="txteta" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfveta" runat="server" ControlToValidate="txteta" CssClass="auto-style82" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
          </div>  
        </div> 

        <div class="col-sm-4">


         <div class="form-group">
         <label for="ejemplo_email_1">
         Fecha Entrega :</label><i class="glyphicon glyphicon-calendar"></i>
         <asp:TextBox ID="txtfentrega" runat="server" class="form-control"  TextMode="Date"></asp:TextBox>
         </div>  


        </div> 
        
        <div class="col-sm-4">

          <div class="form-group">
          <label for="ejemplo_email_1">
           Customer :</label><i class="glyphicon glyphicon-user"></i>
          <asp:DropDownList ID="ddlcustomer" runat="server" class="form-control"  DataSourceID="Customer" DataTextField="Nombre" DataValueField="Nombre">
          </asp:DropDownList>
          <asp:SqlDataSource ID="Customer" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [Nombre] FROM [Customers]"></asp:SqlDataSource>
          </div> 

        </div> 

    </div> 


               <div class="row">

         <div class="col-sm-4">
          <div class="form-group">
          <label for="ejemplo_email_1">
           Operacion :</label><i class="glyphicon glyphicon-duplicate"></i>
          <asp:TextBox ID="txtoperacion" runat="server" class="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvope" runat="server" ControlToValidate="txtoperacion"  ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
          </div>  
        </div> 

           <div class="col-sm-4">
          <div class="form-group">
          <label for="ejemplo_email_1">
           Tipo :</label><i class="glyphicon glyphicon-tasks"></i>
          <asp:DropDownList ID="ddltipo" runat="server" class="form-control">
          <asp:ListItem>Retiro Directo</asp:ListItem>
          <asp:ListItem>Desconsolidado</asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtoperacion"  ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
          </div>  
        </div> 

           <div class="col-sm-4">
          <div class="form-group">
          <label for="ejemplo_email_1">
           Pago Facturas :</label><i class="glyphicon glyphicon-piggy-bank"></i>
          <asp:TextBox ID="txtpfactura" runat="server" class="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvpf" runat="server" ControlToValidate="txtpfactura" CssClass="auto-style82" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
          </div>  
        </div> 

    </div>    


               <div class="row">
      
       <div class="col-sm-6">
       <div class="form-group">
       <label for="ejemplo_email_1">
        Observacion :</label><i class="glyphicon glyphicon-comment"></i>
       <asp:TextBox ID="txtobserv" runat="server" class="form-control"></asp:TextBox>
       </div> 
       </div>    
     
          <div class="col-sm-6">
       <div class="form-group">
       <label for="ejemplo_email_1">
        Observacion General :</label><i class="glyphicon glyphicon-comment"></i>
       <asp:TextBox ID="txtobservg" runat="server"  class="form-control"></asp:TextBox>
       </div> 
       </div>    
   
   
   </div> 
    
      </div>    
      </div>
      </div>
    

    <div class="col-sm-4">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Estado</strong></h4></div>
<div class="panel-body">
<div><i class="glyphicon glyphicon-duplicate"><span class="auto-style67">&nbsp;<asp:CheckBox ID="cbcanje" runat="server" Text="   Canje " /></span></i></div><br />
<div><i class="glyphicon glyphicon-duplicate" ><span class="auto-style67">&nbsp;<asp:CheckBox ID="cbsidemar" runat="server" Text="   Sidemar" /></span></i></div><br />
<div><i class="glyphicon glyphicon-duplicate"><span class="auto-style67">&nbsp;<asp:CheckBox ID="cbpresentacion" runat="server" Text="   Presentacion" /></span></i></div><br />
<div><i class="glyphicon glyphicon-warning-sign"><span class="auto-style67">&nbsp;<asp:CheckBox ID="cballegada" runat="server" Text="  Aviso llegada" /></span></i></div><br />
</div>  
</div>
</div>
   
    <div class="col-sm-4">
    <div class="panel panel-default">
    <div class="panel-heading">
    <div class="panel-body">

    <div id="Alertaok" class="alert alert-success" runat="server" visible="false">¡Registro Realizado Correctamente!</div>

    <div id="Alertanook" runat="server" visible="false" class="alert alert-danger">¡Error En El Registro , Favor Revisar los Datos...!</div>



    <button id="Registrar" type="button" class="btnVerde" runat="server"  onserverclick="btnRegistrar_Click" validationgroup="registrar">
    <span class="glyphicon glyphicon-floppy-disk"></span> Registrar</button><br /><br />
    <button id="Ver" type="button" class="btnAmarillo" runat="server" onclick="MostrarModalJS(); return false;" >
    <span class="glyphicon glyphicon-eye-open"></span> Registros
    </button>

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
   <div class="auto-style83"><h2><strong> Registros</strong></h2></div> <br/>  <br/>
       <div class="scrolling-table-container">





             <asp:GridView ID="gvregistros" runat="server" AutoGenerateColumns="False"  DataKeyNames="id_Control" DataSourceID="Registros" CellPadding="4" ForeColor="#333333" GridLines="None"  ShowFooter="True" CssClass="auto-style84" HorizontalAlign="Left" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvregistros_SelectedIndexChanged" >
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                 <Columns>
                     <asp:BoundField DataField="id_Control" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_Control" />
                     <asp:BoundField DataField="Naviera" HeaderText="Naviera" SortExpression="Naviera" />
                     <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                     <asp:BoundField DataField="MBL_HBL" HeaderText="MBL HBL" SortExpression="MBL_HBL" >
                         <ItemStyle Font-Bold="True"></ItemStyle>
                     </asp:BoundField>
                     <asp:BoundField DataField="ETA" HeaderText="ETA" SortExpression="ETA" />
                     <asp:BoundField DataField="F_Entrega" HeaderText="Fecha Entrega" SortExpression="F_Entrega" />
                     <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
                     <asp:BoundField DataField="Operacion" HeaderText="Operacion" SortExpression="Operacion">
                         <ItemStyle Font-Bold="True"></ItemStyle>
                     </asp:BoundField>
                     <asp:BoundField DataField="P_Facturas" HeaderText="Pago Facturas" SortExpression="P_Facturas" />
                     <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                     <asp:BoundField DataField="Usuario_Registro" HeaderText="Usuario" SortExpression="Usuario_Registro" />
                     <asp:BoundField DataField="Fecha_Registro" HeaderText="Fecha Registro" SortExpression="Fecha_Registro" />
                     <asp:CheckBoxField DataField="A_LLegada" HeaderText="A LLegada" SortExpression="A_LLegada">
                         <ItemStyle Font-Bold="True"></ItemStyle>
                     </asp:CheckBoxField>
                     <asp:CheckBoxField DataField="Canje" HeaderText="Canje" SortExpression="Canje">
                         <ItemStyle Font-Bold="True"></ItemStyle>
                     </asp:CheckBoxField>
                     <asp:CheckBoxField DataField="Presentacion" HeaderText="Presentacion" SortExpression="Presentacion">
                         <ItemStyle Font-Bold="True"></ItemStyle>
                     </asp:CheckBoxField>
                     <asp:CheckBoxField DataField="Sidemar" HeaderText="Sidemar" SortExpression="Sidemar">
                         <ItemStyle Font-Bold="True"></ItemStyle>
                     </asp:CheckBoxField>
                      
                     
                     <asp:CommandField ShowSelectButton="True" headerText="Seleccionar"   ControlStyle-CssClass="btn default btn-xs purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-eye-open'></i>">
                     
<ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
                     </asp:CommandField>
                     
                 </Columns>
                 <EditRowStyle BackColor="#999999" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                 <PagerSettings Mode="NextPreviousFirstLast" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" />
                 <SortedAscendingCellStyle BackColor="#E9E7E2" HorizontalAlign="Center" />
                 <SortedAscendingHeaderStyle BackColor="#506C8C" HorizontalAlign="Center" />
                 <SortedDescendingCellStyle BackColor="#FFFDF8" HorizontalAlign="Center" />
                 <SortedDescendingHeaderStyle BackColor="#6F8DAE" HorizontalAlign="Center" />
             </asp:GridView>

             </div>

             <asp:SqlDataSource ID="Registros" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Controlop] ORDER BY [id_Control] DESC"></asp:SqlDataSource>

 
 </div>
 </div>




    
    


    </asp:Content>
