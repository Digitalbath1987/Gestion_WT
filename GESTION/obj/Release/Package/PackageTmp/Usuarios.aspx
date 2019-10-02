<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="GESTION.Mantenedor.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style11 {
        width: 100%;
    }
           .auto-style66 {
            text-align: center;
            font-size: x-large;
            height: 26px;
            text-transform: uppercase;
            color: #FFFFFF;
            border-right-style: solid;
            border-right-width: 1px;
            padding: 1px 4px;
            background-color: #000099;
        }
                
    .auto-style82 {
        width: 179px;
        text-align: center;
            height: 20px;
        }
    .auto-style86 {
        border: 1px outset #808080;
        width: 178px;
        height: 24px;
        text-align: center;
    }
    .auto-style87 {
        width: 179px;
        height: 24px;
    }
                    
        .auto-style94 {
            text-align: center;
            height: 20px;
        }
                
        .auto-style97 {
            border: 1px outset #808080;
        width: 178px;
            height: 44px;
            text-align: center;
        }
        .auto-style98 {
            width: 179px;
            text-align: center;
            height: 44px;
        }
        .auto-style103 {
            border: 1px outset #808080;
        width: 178px;
            height: 23px;
            text-align: center;
        }
        .auto-style104 {
            width: 179px;
            height: 23px;
        }
        .auto-style108 {
            border: 1px outset #808080;
        width: 178px;
            height: 26px;
            text-align: center;
        }
        .auto-style109 {
            width: 179px;
            text-align: center;
            height: 26px;
        }
        .auto-style111 {
            border: 1px outset #808080;
        width: 179px;
            height: 23px;
            text-align: left;
        }
        .auto-style112 {
            border: 1px outset #808080;
        width: 179px;
            height: 24px;
            text-align: left;
        }
        .auto-style113 {
            border: 1px outset #808080;
        width: 179px;
            height: 44px;
            text-align: left;
        }
        .auto-style114 {
            border: 1px outset #808080;
        width: 179px;
            height: 26px;
            text-align: left;
        }
                
        .auto-style115 {
            width: 178px;
            text-align: center;
        }
        .auto-style137 {
            width: 178px;
            height: 25px;
        }
        .auto-style138 {
        border: 1px outset #808080;
        width: 178px;
        height: 25px;
        text-align: center;
    }
        .auto-style139 {
        border: 1px outset #808080;
        width: 179px;
        height: 25px;
        text-align: left;
    }
        .auto-style140 {
            width: 179px;
            height: 25px;
        }
        .auto-style141 {
            width: 178px;
            height: 23px;
        }
        .auto-style142 {
            width: 178px;
            height: 24px;
        }
        .auto-style143 {
            width: 178px;
            text-align: center;
            height: 44px;
        }
        .auto-style144 {
            width: 178px;
            text-align: center;
            height: 25px;
        }
        .auto-style145 {
            width: 179px;
            text-align: center;
            height: 25px;
        }
        .auto-style146 {
            width: 178px;
            text-align: center;
            height: 26px;
        }
        .auto-style147 {
            width: 178px;
            text-align: center;
            height: 20px;
        }
        .auto-style148 {
            width: 178px;
        }
        .auto-style149 {
            width: 179px;
        }
        .auto-style150 {
            width: 179px;
            text-align: center;
        }
        .auto-style151 {
            width: 178px;
            height: 7px;
        }
        .auto-style152 {
            width: 179px;
            height: 7px;
        }
        .auto-style153 {
            width: 178px;
            text-align: center;
            height: 7px;
        }
        .auto-style155 {
            text-align: center;
            height: 7px;
        }
                
        .auto-style156 {
            width: 178px;
            height: 89px;
        }
        .auto-style157 {
            text-align: center;
            height: 89px;
        }
        .auto-style158 {
            width: 179px;
            height: 89px;
        }
                
        .auto-style159 {
            color: #333333;
            border-style: outset;
            border-width: 2px;
        }
                
    .auto-style160 {
        width: 178px;
        height: 26px;
    }
    .auto-style161 {
        width: 179px;
        height: 26px;
    }
                
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function formatoRut(texto, inputText) {
            objRut = document.getElementById(inputText);
            var rut_aux = "";
            for (i = 0; i < texto.length ; i++)
                if (texto.charAt(i) != ' ' && texto.charAt(i) != '.' && texto.charAt(i) != '-')
                    rut_aux = rut_aux + texto.charAt(i);

            largo = rut_aux.length;

            if (largo == 0) return false;
            if (largo < 2) return false;

            for (i = 0; i < largo ; i++) {
                var letra = rut_aux.charAt(i);
                if (!letra.match(/^([0-9]|[kK])$/)) return false;
            }
            var rut_inv = "";
            for (i = (largo - 1), j = 0; i >= 0; i--, j++) rut_inv = rut_inv + rut_aux.charAt(i);

            var dtexto = "";
            dtexto = dtexto + rut_inv.charAt(0);
            dtexto = dtexto + '-';
            cnt = 0;

            for (i = 1, j = 2; i < largo; i++, j++) {
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
            for (i = (dtexto.length - 1), j = 0; i >= 0; i--, j++) rut_inv = rut_inv + dtexto.charAt(i);

            objRut.value = rut_inv.toUpperCase()
        }
    </script>
    <table class="auto-style11">
    <tr>
        <td class="auto-style66" colspan="6"><strong>Crear Usuarios</strong></td>
    </tr>
    <tr>
        <td class="auto-style137"></td>
        <td class="auto-style137"></td>
        <td class="auto-style138"><strong>Nombre</strong></td>
        <td class="auto-style139">
            <asp:TextBox ID="txtnombre" runat="server" Height="95%" Width="60%"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvnom" runat="server" ControlToValidate="txtnombre" ErrorMessage="*" ValidationGroup="crear">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtnombre" ErrorMessage="*" ValidationExpression="[a-zA-ZñÑ\s]{2,50}" ValidationGroup="crear">*</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style140"></td>
        <td class="auto-style140"></td>
    </tr>
    <tr>
        <td class="auto-style141"></td>
        <td class="auto-style141"></td>
        <td class="auto-style103"><strong>Apellido</strong></td>
        <td class="auto-style111">
            <asp:TextBox ID="txtapellido" runat="server" Height="95%" Width="60%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtapellido" ErrorMessage="*" ValidationGroup="crear">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtapellido" ErrorMessage="*" ValidationExpression="crear" ValidationGroup="[a-zA-ZñÑ\s]{2,50}">*</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style104"></td>
        <td class="auto-style104"></td>
    </tr>
    <tr>
        <td class="auto-style160"></td>
        <td class="auto-style160"></td>
        <td class="auto-style108"><strong>Rut</strong></td>
        <td class="auto-style114">
            <asp:TextBox ID="txtrut" runat="server" onblur="javascript:formatoRut(this.value,this.id)"  Height="95%" Width="60%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtrut" ErrorMessage="*" ValidationGroup="crear">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style161"></td>
        <td class="auto-style161"></td>
    </tr>
    <tr>
        <td class="auto-style142"></td>
        <td class="auto-style142"></td>
        <td class="auto-style86"><strong>Departamento</strong></td>
        <td class="auto-style112">
            <asp:DropDownList ID="ddldepartamento" runat="server" DataSourceID="Departamentos" DataTextField="Detalle_Perfil" DataValueField="id_Perfil" Height="95%" Width="60%">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Departamentos" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT * FROM [Perfiles] ORDER BY [Detalle_Perfil]"></asp:SqlDataSource>
        </td>
        <td class="auto-style87"></td>
        <td class="auto-style87"></td>
    </tr>
    <tr>
        <td class="auto-style143"></td>
        <td class="auto-style143"></td>
        <td class="auto-style97"><strong>Usuario</strong></td>
        <td class="auto-style113">
            <asp:TextBox ID="txtusuario" runat="server" Height="95%" Width="60%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtusuario" ErrorMessage="*" ValidationGroup="crear">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style98"></td>
        <td class="auto-style98"></td>
    </tr>
    <tr>
        <td class="auto-style137"></td>
        <td class="auto-style137"></td>
        <td class="auto-style138"><strong>Contraseña</strong></td>
        <td class="auto-style139">
            <asp:TextBox ID="txtpass" runat="server" Height="95%" Width="60%" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtpass" ErrorMessage="*" ValidationGroup="crear">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style140"></td>
        <td class="auto-style140"></td>
    </tr>
    <tr>
        <td class="auto-style144"></td>
        <td class="auto-style144"></td>
        <td class="auto-style138"><strong>Repita contraseña</strong></td>
        <td class="auto-style139">
            <asp:TextBox ID="txtcontraseña" runat="server" Height="95%" Width="60%" TextMode="Password">*</asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpass" ControlToValidate="txtcontraseña" ErrorMessage="*" ValidationGroup="crear"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcontraseña" ErrorMessage="*" ValidationGroup="crear"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style145"></td>
        <td class="auto-style145"></td>
    </tr>
    <tr>
        <td class="auto-style144"></td>
        <td class="auto-style144"></td>
        <td class="auto-style138"><strong>Registrar Full</strong></td>
        <td class="auto-style139">
            <asp:RadioButtonList ID="rbregistrar" runat="server" Height="95%" RepeatDirection="Horizontal" Width="60%">
                <asp:ListItem Selected="True">NO</asp:ListItem>
                <asp:ListItem>SI</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="auto-style145"></td>
        <td class="auto-style145"></td>
    </tr>
    <tr>
        <td class="auto-style146"></td>
        <td class="auto-style146"></td>
        <td class="auto-style108"><strong>Modificar</strong></td>
        <td class="auto-style114">
            <asp:RadioButtonList ID="rbmod" runat="server" Height="95%" RepeatDirection="Horizontal" Width="60%">
                <asp:ListItem Selected="True">NO</asp:ListItem>
                <asp:ListItem>SI</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="auto-style109"></td>
        <td class="auto-style109"></td>
    </tr>
    <tr>
        <td class="auto-style137"></td>
        <td class="auto-style137"></td>
        <td class="auto-style138"><strong>Eliminar</strong></td>
        <td class="auto-style139">
            <asp:RadioButtonList ID="rbeliminar" runat="server" Height="92%" RepeatDirection="Horizontal" Width="60%">
                <asp:ListItem Selected="True">NO</asp:ListItem>
                <asp:ListItem>SI</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="auto-style140"></td>
        <td class="auto-style140"></td>
    </tr>
    <tr>
        <td class="auto-style144"></td>
        <td class="auto-style144"></td>
        <td class="auto-style138"><strong>Crear Usuarios</strong></td>
        <td class="auto-style139">
            <asp:RadioButtonList ID="rbcuser" runat="server" Height="95%" RepeatDirection="Horizontal" Width="60%">
                <asp:ListItem Selected="True">NO</asp:ListItem>
                <asp:ListItem>SI</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="auto-style145"></td>
        <td class="auto-style145"></td>
    </tr>
    <tr>
        <td class="auto-style137"></td>
        <td class="auto-style137"></td>
        <td class="auto-style138"><strong>Crear Agentes</strong></td>
        <td class="auto-style139">
            <asp:RadioButtonList ID="rbcagentes" runat="server" Height="95%" RepeatDirection="Horizontal" Width="60%">
                <asp:ListItem Selected="True">NO</asp:ListItem>
                <asp:ListItem>SI</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="auto-style140"></td>
        <td class="auto-style140"></td>
    </tr>
    <tr>
        <td class="auto-style144"></td>
        <td class="auto-style144"></td>
        <td class="auto-style138"><strong>Parametros de Correo</strong></td>
        <td class="auto-style139">
            <asp:RadioButtonList ID="rbccorreo" runat="server" Height="95%" RepeatDirection="Horizontal" Width="60%">
                <asp:ListItem Selected="True">NO</asp:ListItem>
                <asp:ListItem>SI</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="auto-style145"></td>
        <td class="auto-style145"></td>
    </tr>
    <tr>
        <td class="auto-style147"></td>
        <td class="auto-style147"></td>
        <td class="auto-style94" colspan="2"><strong></strong>
            <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
        </td>
        <td class="auto-style82"></td>
        <td class="auto-style82"></td>
    </tr>
    <tr>
        <td class="auto-style156"></td>
        <td class="auto-style156"></td>
        <td class="auto-style157" colspan="2">
            <asp:ImageButton ID="btnRegistrar" runat="server" Height="87px" ImageAlign="Bottom" ImageUrl="/Gestion2/Imagenes/Crear User.jpg" OnClick="btnRegistrar_Click" Width="127px" ValidationGroup="crear" />
        </td>
        <td class="auto-style158"></td>
        <td class="auto-style158"></td>
    </tr>
    <tr>
        <td class="auto-style153"></td>
        <td class="auto-style151"></td>
        <td class="auto-style155" colspan="2">
            &nbsp;</td>
        <td class="auto-style152"></td>
        <td class="auto-style152"></td>
    </tr>
    <tr>
        <td colspan="6">
            <div class="auto-style8">
                <asp:GridView ID="gvuduarios" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Usuario"  DataSourceID="user" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="auto-style159">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                        <asp:BoundField DataField="Rut" HeaderText="Rut" SortExpression="Rut" />
                        <asp:BoundField DataField="Modificar" HeaderText="Modificar" SortExpression="Modificar" />
                        <asp:BoundField DataField="Eliminar" HeaderText="Eliminar" SortExpression="Eliminar" />
                        <asp:BoundField DataField="Usuarios" HeaderText="Usuarios" SortExpression="Usuarios" />
                        <asp:BoundField DataField="Perfiles" HeaderText="Perfiles" SortExpression="Perfiles" />
                        <asp:BoundField DataField="Agentes" HeaderText="Agentes" SortExpression="Agentes" />
                        <asp:BoundField DataField="Registrar" HeaderText="Registrar" SortExpression="Registrar" />



                        <asp:CommandField HeaderText="Eliminar" ButtonType="Image" SelectImageUrl="/Intranet/Imagenes/eliminaruser.jpg" ShowSelectButton="True" />



                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="user" runat="server" ConnectionString="<%$ ConnectionStrings:GESTION.Properties.Settings.CadenadeConeccion %>" SelectCommand="SELECT [Nombre], [Apellido], [Usuario], [Rut], [Modificar], [Eliminar], [Usuarios], [Perfiles], [Agentes], [Registrar] FROM [Usuarios] ORDER BY [Usuario]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style148">&nbsp;</td>
        <td class="auto-style148">&nbsp;</td>
        <td class="auto-style115">&nbsp;</td>
        <td class="auto-style150">&nbsp;</td>
        <td class="auto-style149">&nbsp;</td>
        <td class="auto-style149">&nbsp;</td>
    </tr>
</table>
</asp:Content>
