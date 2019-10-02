<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="GESTION.Mantenedor.Clientes" %>
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
        height: 34px;
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
    .auto-style47 {
        width: 147px;
        height: 40px;
    }
    .auto-style48 {
        height: 40px;
    }
    .auto-style49 {
        width: 148px;
        height: 40px;
    }
    .auto-style50 {
        height: 78px;
        text-align: center;
    }

           

               .auto-style51 {
        height: 28px;
            text-align: center;
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
            <td class="auto-style47"></td>
            <td class="auto-style47"></td>
            <td class="auto-style48" colspan="2"><strong>RUT :</strong></td>
            <td class="auto-style48" colspan="2">
                <asp:TextBox ID="txtrut" runat="server" onblur="javascript:formatoRut(this.value,this.id)"  Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvrut" runat="server" ControlToValidate="txtrut" ErrorMessage="*" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style49"></td>
            <td class="auto-style49"></td>
        </tr>
        <tr>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style48" colspan="2"><strong>Nombre Empresa :</strong></td>
            <td class="auto-style48" colspan="2">
                <asp:TextBox ID="txtnombre" runat="server" Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvnombremp" runat="server" ControlToValidate="txtnombre" ErrorMessage="*" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style49">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style48" colspan="2"><strong>Giro :</strong></td>
            <td class="auto-style48" colspan="2">
                <asp:TextBox ID="txtgiro" runat="server" Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvgiro" runat="server" ControlToValidate="txtgiro" ErrorMessage="*" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style49">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style48" colspan="2"><strong>Ciudad :</strong></td>
            <td class="auto-style48" colspan="2">
                <asp:TextBox ID="txtciudad" runat="server" Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvciudad" runat="server" ControlToValidate="txtciudad" ErrorMessage="*" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style49">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style48" colspan="2"><strong>Comuna :</strong></td>
            <td class="auto-style48" colspan="2">
                <asp:TextBox ID="txtcomuna" runat="server" Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvcomuna" runat="server" ControlToValidate="txtcomuna" ErrorMessage="*" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style49">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style48" colspan="2"><strong>Direccion :</strong></td>
            <td class="auto-style48" colspan="2">
                <asp:TextBox ID="txtdireccion" runat="server" Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvingresar" runat="server" ControlToValidate="txtdireccion" ErrorMessage="*" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style49">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style47">&nbsp;</td>
            <td class="auto-style48" colspan="2"><strong>Telefono :</strong></td>
            <td class="auto-style48" colspan="2">
                <asp:TextBox ID="txtelefono" runat="server" Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvtelefono" runat="server" ControlToValidate="txtelefono" ErrorMessage="*" ValidationGroup="ingresar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style49">&nbsp;</td>
            <td class="auto-style49">&nbsp;</td>
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
                <span class="glyphicon glyphicon-floppy-disk"></span> Registrar</button>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style40" colspan="8">
                <asp:GridView ID="gvnavieras" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Cliente" ForeColor="#333333" GridLines="None" Height="100%" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Rut" HeaderText="Rut" SortExpression="Rut" />
                        <asp:BoundField DataField="Nombre_Empresa" HeaderText="Empresa" SortExpression="Nombre_Empresa" />
                        <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
                        <asp:BoundField DataField="Comuna" HeaderText="Comuna" SortExpression="Comuna"></asp:BoundField>
                        <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion"></asp:BoundField>
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono"></asp:BoundField>
                        <asp:BoundField DataField="Giro" HeaderText="Giro" SortExpression="Giro"></asp:BoundField>
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
