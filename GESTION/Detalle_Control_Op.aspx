<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Detalle_Control_Op.aspx.cs" Inherits="GESTION.Control_Operaciones.Detalle_Control_Op" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 100%;
            height: 175px;
        }
        .auto-style12 {
            height: 22px;
        }
        .auto-style22 {
            height: 22px;
            width: 147px;
        }
        .auto-style23 {
            height: 22px;
            width: 148px;
        }
           .titulo{
            padding: 1px 4px;
        text-align: center;
            font-size: x-large;
        height: 26px;
        text-transform: uppercase;
        color: #FFFFFF;
        background-color: #000099;
        border-right-style: solid;
        border-right-width: 1px;
    }
        .auto-style32 {
            height: 24px;
            width: 147px;
        }
        .auto-style33 {
            height: 24px;
            width: 148px;
        }
        .auto-style40 {
            height: 60px;
        }
        .auto-style41 {
            height: 60px;
            width: 148px;
        }
        .auto-style49 {
            height: 24px;
            width: 200px;
        }
        .auto-style50 {
            height: 60px;
            width: 200px;
        }
        .auto-style54 {
            height: 22px;
            width: 200px;
        }
        .auto-style56 {
            height: 59px;
            text-align: center;
        }
        .auto-style57 {
            height: 60px;
            text-align: left;
        }
        .auto-style59 {
            height: 81px;
            width: 200px;
        }
        .auto-style60 {
            height: 81px;
        }
        .auto-style61 {
            height: 81px;
            width: 148px;
        }
        .auto-style62 {
            height: 81px;
            text-align: center;
        }
        .auto-style67 {
            font-size: large;
        }
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
        .auto-style68 {
            height: 22px;
            width: 148px;
            text-align: center;
        }
        .auto-style69 {
            height: 22px;
            text-align: center;
        }
        .auto-style76 {
            height: 67px;
            width: 200px;
        }
        .auto-style77 {
            height: 67px;
        }
        .auto-style78 {
            text-align: center;
            height: 67px;
        }
        .auto-style79 {
            height: 67px;
            width: 148px;
        }
        .auto-style80 {
            height: 59px;
            text-align: center;
            width: 148px;
        }
        .auto-style81 {
            height: 60px;
            text-align: center;
        }
        .auto-style82 {
            font-size: x-large;
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





        .auto-style83 {
            padding: 1px 4px;
            text-align: center;
            font-size: x-large;
            height: 68px;
            text-transform: uppercase;
            color: #FFFFFF;
            background-color: #000099;
            border-right-style: solid;
            border-right-width: 1px;
        }





        .auto-style84 {
            font-size: small;
        }
        .auto-style85 {
            text-align: left;
        }





        </style>


    <script>function MostrarModalJS() {
    window.location.href = '#modalHtml';
}</script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table class="auto-style8">
        <tr>
            <td class="titulo" colspan="8"><strong>
                </strong>
                Numero de ID : <asp:Label ID="lblidreg" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style49"></td>
            <td class="auto-style32"></td>
            <td class="auto-style32"></td>
            <td class="auto-style32"></td>
            <td class="auto-style32"></td>
            <td class="auto-style33"></td>
            <td class="auto-style33"></td>
            <td class="auto-style33"></td>
        </tr>
        <tr>
            <td class="auto-style50"></td>
            <td colspan="2" class="auto-style40">
                
                     <br />     <strong>Naviera :</strong><br />
<i class="glyphicon glyphicon-user">&nbsp;</i><asp:DropDownList ID="ddlNaviera" Enabled="false" runat="server" Height="60%" Width="70%" DataSourceID="Naviera" DataTextField="Naviera" DataValueField="Naviera" AutoPostBack="True" >
                    </asp:DropDownList>
               
               
                     <asp:SqlDataSource ID="Naviera" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Naviera]"></asp:SqlDataSource>
               
               
                    <br />
               
               
            </td>
            <td class="auto-style40" colspan="2">
                
                 
                <br />
                <strong>Cliente :</strong><br />
                &nbsp; <i class="glyphicon glyphicon-duplicate">&nbsp;</i><asp:TextBox ID="txtCliente" Enabled="false" runat="server" Height="60%" Width="70%"></asp:TextBox>
                <strong>
                <asp:RequiredFieldValidator ID="rfvcliente" runat="server" ControlToValidate="txtCliente" CssClass="auto-style82" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
                </strong>
                <br />
                
                 
            </td>
            <td class="auto-style40" colspan="2">   <br /><strong>MBL / HBL :</strong><br />
                &nbsp;
             <i class="glyphicon glyphicon-duplicate">&nbsp;</i><asp:TextBox ID="txtmbl" runat="server" Enabled="false"  Height="60%" Width="70%"></asp:TextBox>


               
                <strong>
                <asp:RequiredFieldValidator ID="rfvmbl" runat="server" ControlToValidate="txtmbl" CssClass="auto-style82" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
                </strong>


               
                <br />


               
            </td>
            <td class="auto-style41"></td>
        </tr>
        <tr>
            <td class="auto-style50"></td>
            <td class="auto-style40" colspan="2"> 
                <br />
                <strong>ETA :</strong><br />
            <i class="glyphicon glyphicon-calendar">&nbsp;</i><asp:TextBox ID="txteta" Enabled="false" runat="server" Height="60%" Width="70%" TextMode="Date"></asp:TextBox>
                               
                <strong>
                <asp:RequiredFieldValidator ID="rfveta" runat="server" ControlToValidate="txteta" CssClass="auto-style82" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
                </strong>
                               
                <br />
                               
            </td>
            <td class="auto-style40" colspan="2"> 
                <br />
                <strong>Fecha Entrega :</strong><br />
<i class="glyphicon glyphicon-calendar">&nbsp;</i><asp:TextBox ID="txtfentrega" runat="server" Enabled="false" Height="60%" Width="70%" TextMode="Date"></asp:TextBox>


                
                <strong>
                <asp:RequiredFieldValidator ID="rfvfentre" runat="server" ControlToValidate="txtfentrega" CssClass="auto-style82" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
                </strong>


                
            </td>
            <td class="auto-style40" colspan="2"> 
             
                    <br />
             
                    <strong>Customer :</strong><br />
<i class="glyphicon glyphicon-user">&nbsp;</i><asp:DropDownList ID="ddlcustomer" runat="server" Enabled="false" Height="60%" Width="70%" DataSourceID="Customer" DataTextField="Nombre" DataValueField="Nombre">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Customer" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [Nombre] FROM [Customers]"></asp:SqlDataSource>
                    <br />
            </td>
            <td class="auto-style41"></td>
        </tr>
        <tr>
            <td class="auto-style50"></td>
            <td class="auto-style57"> 
            


            </td>
            <td class="auto-style57"> 
  
               
               
  
               
                <br />
                <br />
                <i class="glyphicon glyphicon-warning-sign"><span class="auto-style67">&nbsp;<asp:CheckBox ID="cballegada" runat="server" Text="  Aviso llegada" />
                </span></i>
                <br />
  
               
               
  
               
            </td>
            <td class="auto-style81">   
               
                &nbsp;

                <br />
                <br />
                <i class="glyphicon glyphicon-duplicate"><span class="auto-style67">&nbsp;<asp:CheckBox ID="cbcanje" runat="server" Text="   Canje " />
                   </span></i>
                <br />
                </td>
            <td class="auto-style56">   
                
                <br />
                <br />
                <i class="glyphicon glyphicon-duplicate" ><span class="auto-style67">&nbsp;<asp:CheckBox ID="cbsidemar" runat="server" Text="   Sidemar" />
                </span></i>   
                
             </td>
            <td class="auto-style80">   
                <br />
                <br />
                <i class="glyphicon glyphicon-duplicate"><span class="auto-style67">&nbsp;<asp:CheckBox ID="cbpresentacion" runat="server" Text="   Presentacion" />
                </span></i></td>
            <td class="auto-style41"></td>
        </tr>
        <tr>
            <td class="auto-style50"></td>
            <td class="auto-style40" colspan="2">   <br /><strong>Operacion :</strong><br />
                &nbsp;
             <i class="glyphicon glyphicon-duplicate">&nbsp;</i><asp:TextBox ID="txtoperacion" Enabled="false" runat="server" Height="60%" Width="70%"></asp:TextBox>


               
                <strong>
                <asp:RequiredFieldValidator ID="rfvope" runat="server" ControlToValidate="txtoperacion" Enabled="false" CssClass="auto-style82" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
                </strong>


               
                <br />


               
            </td>
            <td class="auto-style40" colspan="2">
                
                      <br /><strong>Tipo :</strong><br />
                
                     <i class="glyphicon glyphicon-tasks">&nbsp;</i><asp:DropDownList ID="ddltipo" Enabled="false" runat="server" Height="60%" Width="70%">
                          <asp:ListItem>Retiro Directo</asp:ListItem>
                          <asp:ListItem>Desconsolidado</asp:ListItem>
                    </asp:DropDownList>
                 
            </td>
            <td class="auto-style40" colspan="2">
                <br />
                <strong>Pago Facturas :</strong><br />
                <i class="glyphicon glyphicon-piggy-bank">&nbsp;</i><asp:TextBox ID="txtpfactura" Enabled="false" runat="server" Height="60%" Width="70%"></asp:TextBox>
                <strong>
                <asp:RequiredFieldValidator ID="rfvpf" runat="server" ControlToValidate="txtpfactura" CssClass="auto-style82" ErrorMessage="*" ValidationGroup="registrar"></asp:RequiredFieldValidator>
                </strong>
                <br />
            </td>
            <td class="auto-style41"></td>
        </tr>
        <tr>
            <td class="auto-style76"></td>
            <td class="auto-style77"></td>
            <td class="auto-style78" colspan="2"><i class="glyphicon glyphicon-comment">&nbsp;</i><strong>Observacion :</strong></td>
            <td class="auto-style78" colspan="2"><i class="glyphicon glyphicon-comment">&nbsp;</i><strong>Observacion General :</strong></td>
            <td class="auto-style79"></td>
            <td class="auto-style79"></td>
        </tr>
        <tr>
            <td class="auto-style59">&nbsp;</td>
            <td class="auto-style60">&nbsp;</td>
            <td class="auto-style60" colspan="2">
                <asp:TextBox ID="txtobserv" Enabled="false" runat="server" Height="100%" Width="100%"></asp:TextBox>
            </td>
            <td class="auto-style62" colspan="2">
                <asp:TextBox ID="txtobservg" Enabled="false" runat="server" Height="100%" Width="100%"></asp:TextBox>
            </td>
            <td class="auto-style61">&nbsp;</td>
            <td class="auto-style61">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style69" colspan="8">
                <br />
                <div id="Alertaok" class="alert alert-success" runat="server" visible="false">¡Registro Realizado Correctamente!</div>
               <div id="Alertanook" runat="server" visible="false" class="alert alert-danger">¡Error En El Registro , Favor Revisar los Datos...!</div>
                 <div id="Alertamodificarok" class="alert alert-success" runat="server" visible="false">¡Habilitado para modificar!</div>
                <div id="modificarnook" runat="server" visible="false" class="alert alert-danger">¡No posee permisos para modificar , contacte al Administrador!</div>



            </td>
     
        </tr>
        <tr>
            <td class="auto-style69" colspan="8">    
                
                 <button id="Registrar" type="button" class="testbutton" runat="server" onserverclick="btnRegistrar_Click"   validationgroup="registrar">
                <span class="glyphicon glyphicon-floppy-disk"></span>Actualizar</button>
                
                         &nbsp;&nbsp;
                
                
                 <button id="btnmodificar" type="button" class="testbutton" runat="server" onserverclick="btnmodificar_Click"  >
                <span class="glyphicon glyphicon-pencil"></span> Modificar
                 </button>
                
                &nbsp;&nbsp;
                
                
                 <button id="Ver" type="button" class="testbutton" runat="server" onclick="MostrarModalJS(); return false;" >
                <span class="glyphicon glyphicon-eye-open"></span> Registros
                 </button>

                  


            </td>

        </tr>
        <tr>
            <td class="auto-style54">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style12" colspan="2">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style68">&nbsp;</td>
        </tr>
        </table>
      <div id="modalHtml" class="modalDialog">
     <div>
 <a href="#cerrar" title="Cerrar" class="close">X</a>
   <div class="auto-style83"><h2><strong> Registros</strong></h2></div> <br/>  <br/>
       <div class="scrolling-table-container">


             <div class="auto-style85">


             <asp:GridView ID="gvregistros" runat="server" AutoGenerateColumns="False"  DataKeyNames="id_Control" DataSourceID="Registros" CellPadding="4" ForeColor="#333333" GridLines="None" Height="90%" Width="100%" ShowFooter="True" CssClass="auto-style84" HorizontalAlign="Left" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvregistros_SelectedIndexChanged" >
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                 <Columns>
                     <asp:BoundField DataField="id_Control" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_Control" />
                     <asp:BoundField DataField="Naviera" HeaderText="Naviera" SortExpression="Naviera" />
                     <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                     <asp:BoundField DataField="MBL_HBL" HeaderText="MBL HBL" SortExpression="MBL_HBL" />
                     <asp:BoundField DataField="ETA" HeaderText="ETA" SortExpression="ETA" />
                     <asp:BoundField DataField="F_Entrega" HeaderText="Fecha Entrega" SortExpression="F_Entrega" />
                     <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
                     <asp:BoundField DataField="Operacion" HeaderText="Operacion" SortExpression="Operacion" />
                     <asp:BoundField DataField="P_Facturas" HeaderText="Pago Facturas" SortExpression="P_Facturas" />
                     <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                     <asp:BoundField DataField="Usuario_Registro" HeaderText="Usuario" SortExpression="Usuario_Registro" />
                     <asp:BoundField DataField="Fecha_Registro" HeaderText="Fecha Registro" SortExpression="Fecha_Registro" />
                     <asp:CheckBoxField DataField="A_LLegada" HeaderText="A LLegada" SortExpression="A_LLegada" />
                     <asp:CheckBoxField DataField="Canje" HeaderText="Canje" SortExpression="Canje" />
                     <asp:CheckBoxField DataField="Presentacion" HeaderText="Presentacion" SortExpression="Presentacion" />
                     <asp:CheckBoxField DataField="Sidemar" HeaderText="Sidemar" SortExpression="Sidemar" />
                      
                     
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
 </div>



    </asp:Content>
