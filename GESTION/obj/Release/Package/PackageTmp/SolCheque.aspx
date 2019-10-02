<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="SolCheque.aspx.cs" Inherits="GESTION.Cheques.SolCheque" %>
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
.modalDialog2
 {
 position: fixed;
 top: -1;
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
 width: 80%;
 height : 80%;
 position: center;
 margin: 10% auto;
 padding: 5px 5px 5px 5px;
 border-radius: 10px;
 background: #fff;
 background: -moz-linear-gradient(#fff, #999);
 background: -webkit-linear-gradient(#fff, #999);
 background: #fff;
    top: 0px;
    left: -21px;
}
 
 .close2
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
 
 .close2:hover
 {
 background: #00d9ff;
 }
 .DataGridFixedHeader2
{
position: relative;
top: expression(this.offsetParent.scrollTop-3); /*this works fine with IE only, but FireFox seems to be ignoring this*/
}


         .scrolling-table-container {
    height: 500px;
    overflow-y: scroll;
    overflow-x: hidden;
            font-size: x-small;
        }


        #scrolly{
            width: 1000px;
            height: 250px;
            overflow: auto;
            overflow-y: hidden;
            margin: 0 auto;
            white-space: nowrap
        }

        img{
            width: 300px;
            height: 150px;
            margin: 20px 10px;
            display: inline;
        }

        
         .tablas {
             text-align: right;
             Height:90%;
             Width: 90%;
         }

         .tablas2
         {
              text-align: left;
               Width: 124px;
         }

         .tablas3
         {
              text-align: left;
               Width: 124px;
         }

         .tablas4
         {
              text-align: left;
               Width: 800px;

                Height: 200px;
         }



        .alert-text {
            font-size: medium;
        }


        </style>
<script>
function MostrarModalJS() {
window.location.href = '#modalHtml';
}</script>
<script>function MostrarModalJS2() {
window.location.href = '#modalHtml2';
    }
</script>

    <script>

     $(function () {
        $('#worked .add-row').click(function () {
            var template = '<tr><td><input class="form-control" type="text"></td><td><input class="form-control" type="text"></td><td><input class="form-control" type="text"></td><td><input class="form-control" type="text"></td><td><button type="button" class="btn btn-danger delete-row">-</button></td></tr>';
            $('#worked tbody').append(template);
        });

        $('#worked').on('click', '.delete-row', function () {
            $(this).parent().parent().remove();
        });
    })

    </script>

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

    <script type="text/javascript">
        function ocultarbtn() {
            document.getElementById('<%=Registrar.ClientID %>').style.visibility = "hidden";
        };

        function mostrarbtn() {
        document.getElementById('<%=Registrar.ClientID %>').style.visibility = "visible";
        };

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4> <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Solicitud de Cheques / Transferencias / Nota de Cobro  </strong> </h4></div>
<div class="panel-body">


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Detalle</strong></h4></div> 
<div class="panel-body">    
       
   <div class="row">
    
    <div class="col-sm-4">
    <div class="form-group">
    <label for="ejemplo_email_1">
    Tipo Solicitud :</label><i class="glyphicon glyphicon-th-list"></i>
    <asp:DropDownList ID="ddltipo" class="form-control" runat="server">
    <asp:ListItem Selected="True">CHEQUE</asp:ListItem>
    <asp:ListItem>TRANSFERENCIA</asp:ListItem>
    </asp:DropDownList>
    </div>
    </div>
              

    <div class="col-sm-4">
    <div class="form-group">
    <label for="ejemplo_email_1">
    Empresa :</label><i class="glyphicon glyphicon-tasks"></i>
    <asp:DropDownList ID="ddlEmpresa" runat="server" class="form-control" DataSourceID="Empresa" DataTextField="RazonSocial" DataValueField="RazonSocial" >
    </asp:DropDownList>
    <asp:SqlDataSource ID="Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Empresas]"></asp:SqlDataSource>
    </div>
    </div>  
              
              
    <div class="col-sm-4">
    <div class="form-group">
    <label for="ejemplo_email_1">
    Nombre Solicitante :</label><i class="glyphicon glyphicon-user"></i>
    <asp:TextBox runat="server" class="form-control" placeholder="Ingresar Destino" Enabled="false" id="txtnombre"></asp:TextBox> 
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe Ingresar Destino!!!!" ControlToValidate="txtnombre" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="reg" />
    </div>           
    </div>  
   
       
   </div>  

   <div class="row">

   <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Nombre del beneficiario</label><i class="glyphicon glyphicon-user"></i>
   <asp:TextBox ID="txtNomBeneficiario" class="form-control" placeholder="Beneficiario" runat="server"></asp:TextBox>  
   <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Debe Ingresar Beneficiario!!!!" ControlToValidate="txtNomBeneficiario" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="reg" />
   </div>  
   </div> 
    
   <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Rut del Beneficiario :</label><i class="glyphicon glyphicon-globe"></i>
   <asp:TextBox ID="txtrut" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control" placeholder="Ingresar Rut" runat="server"></asp:TextBox>  
   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe Ingresar Rut!!!!" ControlToValidate="txtrut" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="reg" />
   </div>  
   </div>
       
   <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Monto:</label><i class="glyphicon glyphicon-piggy-bank"></i>
   <div class="form-group">
   <div class="row">
   <div class="col-lg-10">
   <div class="input-group">
   <div class="input-group-btn">
   <button id="money" runat="server" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   <asp:Label ID="lblmoney" runat="server" Text="CLP"></asp:Label><span class="caret"></span></button>
   <ul class="dropdown-menu" runat="server" id="ddlmoney">
   <li><a id="CLP" runat="server" onserverclick="ModMoneyCLP_Click">CLP</a></li>
   <li><a id="USD" runat="server" onserverclick="ModMoneyUSD_Click">USD</a></li>
   <li><a id="EUR" runat="server" onserverclick="ModMoneyEUR_Click">EUR</a></li>
   </ul>
   </div>
   <asp:TextBox  runat="server" class="form-control" placeholder="Ingresar Monto" id="txtmonto"></asp:TextBox> 
   </div>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Debe Ingresar Monto!!!!" ControlToValidate="txtmonto" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="reg" />
   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe Ingresar Monto!!!!" ControlToValidate="txtmonto" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="CREARNC" />
   </div>
   </div>
   </div>
   
   
   
   </div>  
   </div>

   </div>

   <div class="row">

   <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   Descripcion :</label><i class="glyphicon glyphicon-comment"></i>
   <asp:TextBox runat="server" class="form-control" placeholder="Ingresar Descripcion" id="txtdescripcion"></asp:TextBox> 
   </div>  
   </div> 

   <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   N° de Carpeta:</label><i class="glyphicon glyphicon-level-up"></i>
   <asp:TextBox runat="server" class="form-control" placeholder="Ingresar N° Carpeta" id="txtncarpeta"></asp:TextBox> 
   </div>  
   </div>

   <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   N° de Operacion :</label><i class="glyphicon glyphicon-copy"></i>
   <asp:TextBox runat="server" class="form-control" placeholder="Ingresar Destino" id="txtnoperacion"></asp:TextBox> 
   <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtnoperacion" CssClass="alert-text" Display="Dynamic" ErrorMessage="Falta N° Operacion!!!!" SetFocusOnError="True" ValidationGroup="CREARNC" />
   </div>  
   </div> 

   </div>    

   <div class="row">

 <div class="col-sm-4">
   <div class="form-group">
   <label for="ejemplo_email_1">
   N° de Embarque :</label><i class="glyphicon glyphicon-copy"></i>
   <asp:TextBox runat="server" class="form-control" placeholder="Ingresar Embarque" id="txtembarque"></asp:TextBox> 
   </div>  
</div>
</div>
   
   <div class="row">
<div class="col-sm-12">
<span>&nbsp;&nbsp;&nbsp;<strong> Nota de Cobro Asociada ? : </strong></span>
<input id="no" name="collapseGroup" type="radio" data-toggle="collapse"  onclick="mostrarbtn()" runat="server"  data-target=".collapseOne.in" checked/> NO &nbsp;&nbsp;&nbsp; 
<input id="si" name="collapseGroup" type="radio" data-toggle="collapse"  onclick="ocultarbtn()" runat="server"    data-target=".collapseOne:not(.in)"/> SI
<div class="collapseOne panel-collapse collapse">
<div class="panel-body">
<div class="form-group">
<label for="ejemplo_email_1">Rut Nota Cobro</label> <i class="glyphicon glyphicon-file"></i>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="lblrut" CssClass="alert-text" Display="Dynamic" ErrorMessage="Falta Rut Asociado!!!!" SetFocusOnError="True" ValidationGroup="CREARNC" />
<div class="input-group">
<span class="input-group-btn">
<asp:TextBox ID="lblrut" runat="server" class="form-control" onblur="javascript:formatoRut(this.value,this.id)" OnTextChanged="txtrut_TextChanged"  validationgroup="CREARNC" placeholder="Rut de la Nota Cobro"></asp:TextBox>
<button id="CrearNotaC" runat="server" onserverclick="CrearNotaC_ServerClick"   class="btn btn-secondary btn-danger"     type="button" validationgroup="CREARNC">
<span class="glyphicon glyphicon-file"></span> Crear Nota de Cobro
</button>
</span>
</div>
</div>
</div>
</div>
</div>
</div>  
    
   <div class="row">
   <div id="ok" runat="server" visible="false" class="alert alert-success"> <i class="glyphicon glyphicon-thumbs-up"></i> Registro Correcto!!!!</div>
   <div id="nook" runat="server" visible="false"  class="alert alert-danger"><i class="glyphicon glyphicon-thumbs-down"></i> Error en el registro , revisar los datos o contacte al administrador!!!</div>
   <div id="rutnook" runat="server" visible="false"  class="alert alert-danger"><i class="glyphicon glyphicon-thumbs-down"></i> Error,Rut no esta asociado a ningun cliente registrado , revisar los datos o contacte al administrador!!!</div>
   </div> 

<br />
   <div class="panel-footer">
<div>
<button id="Registrar" runat="server" class="btn btn-success" onserverclick="Registrar_ServerClick"  type="button" validationgroup="reg" >
<span class="glyphicon glyphicon-floppy-disk"></span>Registrar</button>
<button id="Ver" type="button" class="btn btn-warning" runat="server" onclick="MostrarModalJS(); return false;" >
<span class="glyphicon glyphicon-eye-open"></span> Registros</button>
</div>  
</div>

</div>  
</div>    
</div>
</div>


</div>
</div>
</div>
    



<div id="modalHtml" class="modalDialog">
<div class="textheader">
<a href="#cerrar" title="Cerrar" class="close">X</a>
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading">
<h5> <strong>Registros</strong> </h5></div>
<div class="panel-body">
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:GridView ID="gvregistros" runat="server" AutoGenerateColumns="False"  DataKeyNames="Ncorrelativo" DataSourceID="Registros" CellPadding="4" ForeColor="#333333" GridLines="None" Height="98%" Width="98%" ShowFooter="True"  HorizontalAlign="Left" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvFacturas_SelectedIndexChanged" >
<AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
<Columns>
<asp:BoundField DataField="ID" HeaderText="ID" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
<asp:BoundField DataField="Ncorrelativo" HeaderText="Nº Solicitud" SortExpression="Ncorrelativo" />
<asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa" />
<asp:BoundField DataField="Nombre_Solicitante" HeaderText="Nombre" SortExpression="Nombre_Solicitante" />
<asp:BoundField DataField="Beneficiario" HeaderText="Beneficiario" SortExpression="Beneficiario" />
<asp:BoundField DataField="Rut_Receptor" HeaderText="Rut" SortExpression="Rut_Receptor" />
<asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
<asp:BoundField DataField="Moneda" HeaderText="Moneda" SortExpression="Moneda" />
<asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto"></asp:BoundField>
<asp:BoundField DataField="Carpeta" HeaderText="Carpeta" SortExpression="Carpeta" />
<asp:BoundField DataField="Usuario" Visible="false" HeaderText="Usuario" SortExpression="Usuario" />
<asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
<asp:BoundField DataField="Fecha_Registro" Visible="false" HeaderText="Fecha_Registro" SortExpression="Fecha_Registro" />
<asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
<asp:CheckBoxField DataField="Nota_Cobro" HeaderText="Nota Cobro" SortExpression="Nota_Cobro" />
<asp:CommandField ShowSelectButton="True" headerText="Selec"   ControlStyle-CssClass="btn default btn-xs purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-eye-open'></i>">
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
<asp:SqlDataSource ID="Registros" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Sol_Cheques] ORDER BY [Ncorrelativo] DESC"></asp:SqlDataSource>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>



<div id="modalHtml2" class="modalDialog2">
<div class="textheader2">
<a href="#cerrar" title="Cerrar" class="close">X</a>
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading">
<h4> <strong>Nota de Cobro</strong> </h4></div>
<div class="panel-body">

<div class="scrolling-table-container">

<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Datos del cliente</strong></h4></div> 
<div class="panel-body">  
    
<div class="row">

<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Rut :</label>
<asp:TextBox ID="txtrutmod" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control"  OnTextChanged="txtrut_TextChanged"  runat="server"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Debe Ingresar Rut Cliente!!!!" ControlToValidate="txtrutmod" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
             
</div>
</div>
              
<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Señores :</label>
<asp:TextBox ID="txtseñmod" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control" AutoPostBack="true"   runat="server"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Debe Ingresar Razon Social!!!!" ControlToValidate="txtseñmod" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
</div>
</div>  
              
<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Giro :</label>
<asp:TextBox ID="txtgiromod" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control"  runat="server"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Debe Ingresar Giro!!!!" ControlToValidate="txtgiromod" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
</div>           
</div>  

<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Direccion :</label>
<asp:TextBox ID="txtdireccmod" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control"  runat="server"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Debe Ingresar Direccion!!!!" ControlToValidate="txtdireccmod" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
        
</div>           
</div>  

</div>  


<div class="row">

<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Ciudad :</label>
<asp:TextBox ID="txtciudadmod" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control"  runat="server"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Debe Ingresar Ciudad!!!!" ControlToValidate="txtciudadmod" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
</div>
</div>  
              
<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Comuna :</label>
<asp:TextBox ID="txtcommod" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control"  runat="server"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Debe Ingresar Comuna!!!!" ControlToValidate="txtcommod" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
</div>           
</div>  
    
<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Telefono :</label>
<asp:TextBox ID="txttelfmod" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control"  runat="server"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Debe Ingresar Telefono!!!!" ControlToValidate="txttelfmod" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
</div>           
</div>  

<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Fecha de Emision :</label>
<asp:TextBox ID="txtfemimod" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control"  runat="server"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Debe Ingresar Fecha de Emision!!!!" ControlToValidate="txtfemimod" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
</div>           
</div>  

</div>  


<div class="row">

<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Fecha de Vencimiento :</label>
<asp:TextBox ID="txtfechvencmod" onblur="javascript:formatoRut(this.value,this.id)"  class="form-control"  runat="server"></asp:TextBox>  
<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Ingresar Fecha de Vencimiento!!!!" ControlToValidate="txtfechvencmod" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
             
</div>
</div>  
              
<div class="col-sm-3">
<div class="form-group">
<label for="ejemplo_email_1">
Vendedor :</label>
<asp:DropDownList ID="ddlVendedor" runat="server" DataSourceID="Vendedor" class="form-control"  DataTextField="Nombre" DataValueField="Nombre" >
</asp:DropDownList>
<asp:SqlDataSource ID="Vendedor" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Vendedores] ORDER BY [Nombre]"></asp:SqlDataSource>
</div>           
</div>  

<div class="col-sm-3">
<div class="form-group">
</div>           
</div>  

<div class="col-sm-3">
<div class="form-group">
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
<div class="panel-heading"><h4><strong>Descripcion del cobro</strong></h4></div> 
<div class="panel-body">  
    
<div class="panel panel-warning">
<div class="panel-body"> 
<div class="row">

<div class="col-sm-8">
<div class="form-group">
<label for="ejemplo_email_1">
Descripcion :</label> 
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<label for="ejemplo_email_1">
Cantidad :</label> 
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<label for="ejemplo_email_1">
Precio:</label>  
</div>
</div>
    
</div>  
</div>
</div>

<div class="panel panel-default">
<div class="panel-body"> 
<div class="row">

<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtdescmod1" class="form-control" runat="server" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtdescmod1" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtcantmod1" class="form-control" text="1" runat="server"  TextMode="Number"></asp:TextBox>     
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtprecmod1"  class="form-control" runat="server" >0</asp:TextBox>    
</div>
</div>
<asp:RegularExpressionValidator ID="revprecio1" runat="server" ErrorMessage="*" ControlToValidate="txtprecmod1" ValidationExpression="[0-9]{1,9}(\.[0-9]{0,2})?$" ValidationGroup="regNC">*</asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtprecmod1" Display="Dynamic" SetFocusOnError="True" CssClass="alert-text" ValidationGroup="regNC" />    


</div>  
</div>
</div>

<div class="panel panel-default">
<div class="panel-body"> 
<div class="row">

<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtdescmod2"  class="form-control" runat="server"></asp:TextBox>
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtcantmod2"  class="form-control" runat="server"   text="0"  TextMode="Number"></asp:TextBox>
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtprecmod2" class="form-control"  runat="server" >0</asp:TextBox>
</div>
</div>



<asp:RegularExpressionValidator ID="revprecio2" runat="server" ErrorMessage="*" ControlToValidate="txtprecmod2" ValidationExpression="[0-9]{1,9}(\.[0-9]{0,2})?$" ValidationGroup="regNC">*</asp:RegularExpressionValidator>
</div>  
</div>
</div>

<div class="panel panel-default">
<div class="panel-body"> 
<div class="row">

<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtdescmod3" class="form-control"  runat="server" ></asp:TextBox>
</div>
</div>
    
<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtcantmod3"  class="form-control" runat="server"  text="0"  TextMode="Number"></asp:TextBox>
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtprecmod3"  class="form-control" runat="server" >0</asp:TextBox>
</div>
</div>
    

<asp:RegularExpressionValidator ID="revprecio3" runat="server" ErrorMessage="*" ControlToValidate="txtprecmod3" ValidationExpression="[0-9]{1,9}(\.[0-9]{0,2})?$" ValidationGroup="regNC">*</asp:RegularExpressionValidator>
</div>  
</div>
</div>

<div class="panel panel-default">
<div class="panel-body"> 
<div class="row">

<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtdescmod4" class="form-control"  runat="server"></asp:TextBox>
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtcantmod4" class="form-control"  runat="server"  text="0"  TextMode="Number"></asp:TextBox>  
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtprecmod4" class="form-control"  runat="server" >0</asp:TextBox>
</div>
</div>
   
<asp:RegularExpressionValidator ID="revprecio4" runat="server" ErrorMessage="*" ControlToValidate="txtprecmod4" ValidationExpression="[0-9]{1,9}(\.[0-9]{0,2})?$" ValidationGroup="regNC">*</asp:RegularExpressionValidator>   
</div>  
</div>
</div>

<div class="panel panel-default">
<div class="panel-body"> 
<div class="row">

<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtdescmod5" class="form-control" runat="server" ></asp:TextBox>
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtcantmod5" class="form-control" runat="server"  text="0"  TextMode="Number"></asp:TextBox>
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtprecmod5" class="form-control" runat="server" >0</asp:TextBox>   
</div>
</div>
   
    

<asp:RegularExpressionValidator ID="revprecio5" runat="server" ErrorMessage="*" ControlToValidate="txtprecmod5" ValidationExpression="[0-9]{1,9}(\.[0-9]{0,2})?$" ValidationGroup="regNC">*</asp:RegularExpressionValidator>


</div>  
</div>
</div>

<div class="panel panel-default">
<div class="panel-body"> 
<div class="row">

<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtdescmod6" class="form-control"  runat="server" ></asp:TextBox>
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtcantmod6" class="form-control"  runat="server"  text="0"  TextMode="Number"></asp:TextBox>
</div>
</div>

<div class="col-sm-2">
<div class="form-group">
<asp:TextBox ID="txtprecmod6"  class="form-control" runat="server" >0</asp:TextBox>
</div>
</div>
   
<asp:RegularExpressionValidator ID="revprecio6" runat="server" ErrorMessage="*" ControlToValidate="txtprecmod6" ValidationExpression="[0-9]{1,9}(\.[0-9]{0,2})?$" ValidationGroup="regNC">*</asp:RegularExpressionValidator>
</div>  
</div>
</div>



 
</div> 
</div> 
</div> 
</div> 

  
<div class="row">



<div class="col-sm-8">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Observacion de la nota de cobro</strong></h4></div> 
<div class="panel-body">    
<div class="row">
<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtobservacion"   class="form-control" rows="5" TextMode="MultiLine" runat="server" ></asp:TextBox>
</div>
</div>
</div>
</div>
</div>
</div>

<div class="col-sm-4">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Crear Nota de cobro</strong></h4></div> 
<div class="panel-body">    
<div class="row">
<div class="col-sm-4">
<div class="form-group">
       
<div id="modal2ok" class="alert alert-success" runat="server" visible="false">¡Registro Realizado Correctamente!</div>
<div id="modal2oknook" runat="server" visible="false" class="alert alert-danger">¡Error En El Registro , Favor Revisar los Datos...!</div>
                   

<button id="btngrabartodo" type="button"  class="btn btn-success" onserverclick="btngrabartodo_ServerClick" runat="server" validationgroup="regNC"  >
<span class="glyphicon glyphicon-floppy-saved"></span> Crear Nota de Cobro</button>
<br/>
<br/>
<br/>
<button id="btncancelar" type="button"  class="btn btn-danger" runat="server"  onserverclick="btncancelar_ServerClick"  >
<span class="glyphicon glyphicon-remove-circle"></span> Cancelar</button>


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
</div>
</div>

</asp:Content>
