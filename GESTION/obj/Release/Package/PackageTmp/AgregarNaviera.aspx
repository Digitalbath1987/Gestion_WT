<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AgregarNaviera.aspx.cs" Inherits="GESTION.Mantenedor.AgregarNaviera" %>
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

           

               .auto-style19 {
        width: -155;
        height: 78px;
    }
    .auto-style20 {
        width: 162px;
        height: 78px;
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
    .auto-style42 {
        width: 147px;
        height: 78px;
    }
    .auto-style43 {
        width: 148px;
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
    }

           

               </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
       <table class="auto-style8">
        <tr>
            <td class="auto-style27" colspan="8">Naviera</td>
        </tr>
        <tr>
            <td class="auto-style47"></td>
            <td class="auto-style47"></td>
            <td class="auto-style48" colspan="2"><strong>Nombre :</strong></td>
            <td class="auto-style48" colspan="2">
                <asp:TextBox ID="txtnom" runat="server" Height="90%" Width="70%"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnom" ErrorMessage="*" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
                
            </td>
            <td class="auto-style49"></td>
            <td class="auto-style49"></td>
        </tr>
        <tr>
            <td class="auto-style47"></td>
            <td class="auto-style47"></td>
            <td class="auto-style48" colspan="2"><strong>Tipo :</strong></td>
            <td class="auto-style48" colspan="2">
                <asp:DropDownList ID="ddlnaviera" runat="server" Height="90%" Width="70%">
                 <asp:ListItem>Retiro Directo</asp:ListItem>
                          <asp:ListItem>Desconsolidado</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style49"></td>
            <td class="auto-style49"></td>
        </tr>
        <tr>
            <td class="auto-style42"></td>
            <td class="auto-style42"></td>
            <td class="auto-style19" colspan="2"></td>
            <td class="auto-style20" colspan="2"></td>
            <td class="auto-style43"></td>
            <td class="auto-style43"></td>
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
                <button id="Registrar" type="button" class="testbutton" runat="server"  onserverclick="btnRegistrar_Click" validationgroup="registrar">
                <span class="glyphicon glyphicon-floppy-disk"></span> Registrar</button>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style40" colspan="8">
                <asp:GridView ID="gvnavieras" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Nav" DataSourceID="Navieras" ForeColor="#333333" GridLines="None" Height="100%" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="ID_Nav" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Nav" />
                        <asp:BoundField DataField="Naviera" HeaderText="Naviera" SortExpression="Naviera" />
                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
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
