<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="FiltrarNC.aspx.cs" Inherits="GESTION.Otros.FiltrarNC" %>
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
<div class="panel-heading"><h4><strong>Filtrar Nota de Credito y Debito</strong></h4></div>
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
<asp:ListItem>Empresa</asp:ListItem>
<asp:ListItem>Operacion</asp:ListItem>
<asp:ListItem>Tipo</asp:ListItem>
<asp:ListItem>Factura</asp:ListItem>
</asp:DropDownList>
</div>





<asp:Panel runat="server" ID="panel_Doc" Visible="false">
<div class="col-xs-2">
<label for="ejemplo_email_1"><strong>Factura</strong></label>
<i class="glyphicon glyphicon-copy"></i><asp:TextBox runat="server" class="form-control" TextMode="Number" id="txtDocumento"></asp:TextBox> 
<asp:RequiredFieldValidator ID="rfvope" runat="server" ControlToValidate="txtDocumento" CssClass="alert-text" Display="Dynamic" ErrorMessage="N° Documento!!!!" SetFocusOnError="True" ValidationGroup="CREARNC" />
</div>
</asp:Panel>


    <asp:Panel runat="server" ID="panel_OP" Visible="false">
<div class="col-xs-2">
<label for="ejemplo_email_1"><strong>Operacion</strong></label>
<i class="glyphicon glyphicon-copy"></i><asp:TextBox runat="server" class="form-control" placeholder="Ingresar operacion" id="txtoperacion"></asp:TextBox> 
</div>
</asp:Panel>



<asp:Panel runat="server" ID="panel_tipo" Visible="false">
<div class="col-xs-2">
<label for="ejemplo_email_1">Tipo</label>
<i class="glyphicon glyphicon-list"></i>
<asp:DropDownList ID="ddlTipo" runat="server" class="form-control"  >
<asp:ListItem>Nota de Credito</asp:ListItem>
<asp:ListItem>Nota de Debito</asp:ListItem>
</asp:DropDownList>
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
     
     <div id="SinNC" runat="server" class="alert alert-danger" visible="false"><i class="glyphicon glyphicon-thumbs-down"></i>&nbsp;&nbsp;¡No Existe Nota de Cobro Registrada!,Favor Contactar a Contabilidad...</div>
   
     
   

<div class="row">
<div class="col-xs-12">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Registros</strong></h4>
<div class="panel-body">
<div class="scrolling-table-container">


    <asp:GridView ID="gvCobroAgente" runat="server" AutoGenerateColumns="False" DataKeyNames="id_NC" DataSourceID="NotasdeNC" CellPadding="4" ForeColor="#333333" GridLines="None" Height="100%" Width="100%"  EmptyDataText="Sin Registros" ShowHeaderWhenEmpty="True" OnRowCommand="gvnotacreditos_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="id_NC" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="id_NC"></asp:BoundField>
            <asp:BoundField DataField="tiponota" HeaderText="Tipo" SortExpression="tiponota"></asp:BoundField>
            <asp:BoundField DataField="NOperación" HeaderText="Operacion" SortExpression="NOperación"></asp:BoundField>
            <asp:BoundField DataField="NFactura" HeaderText="Factura" SortExpression="NFactura"></asp:BoundField>
            <asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa"></asp:BoundField>
                 
            <asp:BoundField DataField="TotalNC" HeaderText="Monto" SortExpression="TotalNC"></asp:BoundField>


                                     <asp:TemplateField HeaderText="imp. Solicitud" ItemStyle-HorizontalAlign="Center" >
                                    <ItemTemplate>
                                    <asp:LinkButton  ID="Imprimir" CommandName="Imprimir" ToolTip="Imprimir Nota de C/D " CommandArgument='<%# Bind("id_NC") %>' runat="server" >
                                    <span aria-hidden="true" class="glyphicon glyphicon-print"></span>
                                    </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Height="12px"></ItemStyle>                                
                                    </asp:TemplateField>




                                    <asp:TemplateField HeaderText="Descargar NC" ItemStyle-HorizontalAlign="Center" >
                                    <ItemTemplate>
                                    <asp:LinkButton  ID="NotaCD" CommandName="NotaCD" ToolTip="Descargar Nota de C/D asociada" CommandArgument='<%# Bind("id_NC") %>' runat="server" >
                                    <span aria-hidden="true" class="glyphicon glyphicon-save-file"></span>
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




    <asp:SqlDataSource runat="server" ID="NotasdeNC" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand=""></asp:SqlDataSource>
   
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
