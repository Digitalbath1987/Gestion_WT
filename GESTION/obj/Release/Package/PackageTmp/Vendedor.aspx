<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Vendedor.aspx.cs" Inherits="GESTION.Mantenedor.Vendedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
 
    <style type="text/css">
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

           

               .auto-style8 {
        width: 100%;
        height: 622px;
    }

           

               .auto-style27 {
        padding: 1px 4px;
        text-align: center;
        font-size: x-large;
        height: 30px;
        text-transform: uppercase;
        color: #FFFFFF;
        background-color: #000099;
        border-right-style: solid;
        border-right-width: 1px;
    }
    .auto-style40 {
        height: 78px;
    }
    .auto-style45 {
        width: 147px;
        height: 18px;
    }
    .auto-style46 {
        width: 148px;
        height: 18px;
    }
    .auto-style50 {
        height: 78px;
        text-align: center;
    }

           

               .auto-style51 {
        height: 16px;
            text-align: center;
        }

           

               .auto-style52 {
            width: 147px;
            height: 30px;
        }
        .auto-style53 {
            height: 30px;
        }
        .auto-style54 {
            width: 148px;
            height: 30px;
        }
        .auto-style55 {
            text-align: left;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    
       <table class="auto-style8">
        <tr>
            <td class="auto-style27" colspan="8">Clientes</td>
        </tr>
        <tr>
            <td class="auto-style52"></td>
            <td class="auto-style52"></td>
            <td class="auto-style53" colspan="2"><strong>Nombre Vendedor :</strong></td>
            <td class="auto-style53" colspan="2">
                <asp:TextBox ID="txtnombre" runat="server" Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvnombremp" runat="server" ControlToValidate="txtnombre" ErrorMessage="*" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
        </tr>
        <tr>
            <td class="auto-style52"></td>
            <td class="auto-style52"></td>
            <td class="auto-style53" colspan="2"><strong>Correo&nbsp; :</strong></td>
            <td class="auto-style53" colspan="2">
                <asp:TextBox ID="txtcorreo" runat="server" Height="90%" Width="70%" TextMode="Email"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvgiro" runat="server" ControlToValidate="txtcorreo" ErrorMessage="*" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
        </tr>
        <tr>
            <td class="auto-style51" colspan="8">

                  <br />
                <div id="Alertaok" class="alert alert-success" runat="server" visible="false">¡Registro Realizado Correctamente!</div>

                   <div id="Alertanook" runat="server" visible="false" class="alert alert-danger">¡Error En El Registro , Favor Revisar los Datos...!</div>
                 <div id="modificarnook" runat="server" visible="false" class="alert alert-danger">¡No posee permisos para modificar , contacte al Administrador!</div>
            </td>
        </tr>
        <tr>
            <td class="auto-style50" colspan="8">
                <button id="Registrar" type="button" class="testbutton" runat="server"  onserverclick="btnRegistrar_Click" validationgroup="ingresar">
                <span class="glyphicon glyphicon-floppy-disk"></span> Registrar</button>&nbsp;<br />
                <div class="auto-style55">
                <asp:GridView ID="gvnavieras" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Vendedores" ForeColor="#333333" GridLines="None" Height="100%" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
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
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style40" colspan="8">
                <asp:SqlDataSource ID="Vendedores" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [Nombre], [Correo] FROM [Vendedores] ORDER BY [Nombre]"></asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="Cliente" ConnectionString='<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>' SelectCommand="SELECT * FROM [Clientes] ORDER BY [Nombre_Empresa]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="Navieras" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Naviera] ORDER BY [Naviera]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style45">&nbsp;</td>
            <td class="auto-style45">&nbsp;</td>
            <td class="auto-style45">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
        </tr>
        <tr>
   
    
            <td class="auto-style45">&nbsp;</td>
            <td class="auto-style45">&nbsp;</td>
            <td class="auto-style45">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
            <td class="auto-style46">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
