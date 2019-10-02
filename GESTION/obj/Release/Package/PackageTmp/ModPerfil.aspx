<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ModPerfil.aspx.cs" Inherits="GESTION.Mantenedor.ModPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
            height: 503px;
        }
        .auto-style37 {
            font-size: large;
        }
        .auto-style40 {
            height: 40px;
            text-align: center;
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
        .auto-style75 {
            width: 182px;
            text-align: right;
            height: 39px;
        }
        .auto-style76 {
            width: 183px;
            text-align: center;
            height: 39px;
        }
        .auto-style78 {
            height: 22px;
            width: 182px;
            text-align: right;
        }
        .auto-style91 {
            width: 182px;
            height: 39px;
        }
        .auto-style92 {
        border: 1px outset #808080;
        width: 183px;
        text-align: center;
        font-size: large;
        height: 39px;
    }
        .auto-style93 {
        border: 1px outset #808080;
        width: 183px;
        text-align: center;
        height: 39px;
    }
        .auto-style94 {
            width: 183px;
            height: 39px;
        }
        .auto-style95 {
            width: 182px;
            height: 40px;
        }
        .auto-style96 {
            border: 1px outset #808080;
        width: 183px;
            text-align: center;
            font-size: large;
            height: 40px;
        }
        .auto-style97 {
            border: 1px outset #808080;
        width: 183px;
            text-align: center;
            height: 40px;
        }
        .auto-style98 {
            width: 183px;
            height: 40px;
        }
        .auto-style99 {
            width: 182px;
            height: 101px;
        }
        .auto-style100 {
            height: 101px;
            text-align: center;
        }
        .auto-style101 {
            width: 183px;
            height: 101px;
        }
        .auto-style102 {
            width: 182px;
            height: 22px;
        }
        .auto-style103 {
            width: 183px;
            height: 22px;
        }
        .auto-style105 {
            height: 22px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td class="auto-style66" colspan="6"><strong>Modificar Perfil</strong></td>
        </tr>
        <tr>
            <td class="auto-style91">&nbsp;</td>
            <td class="auto-style91"><strong>&nbsp;<asp:Label ID="lblid" runat="server" Text="Label" Visible="False"></asp:Label>
                </strong></td>
            <td class="auto-style92"><strong>Nombre </strong></td>
            <td class="auto-style93"><strong>
                <asp:Label ID="lblnombre" runat="server" CssClass="auto-style37" Text="Label" Enabled="False"></asp:Label>
                </strong></td>
            <td class="auto-style94">&nbsp;</td>
            <td class="auto-style94">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style75">&nbsp;</td>
            <td class="auto-style91">&nbsp;</td>
            <td class="auto-style92"><strong>Apellido </strong></td>
            <td class="auto-style93"><strong>
                <asp:Label ID="lblapellido" runat="server" CssClass="auto-style37" Text="Label" Enabled="False"></asp:Label>
                </strong></td>
            <td class="auto-style94">&nbsp;</td>
            <td class="auto-style76">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style91">&nbsp;</td>
            <td class="auto-style91">&nbsp;</td>
            <td class="auto-style92"><strong>Usuario </strong></td>
            <td class="auto-style93"><strong>
                <asp:Label ID="lblusuario" runat="server" CssClass="auto-style37" Text="Label" Enabled="False"></asp:Label>
                </strong></td>
            <td class="auto-style94">&nbsp;</td>
            <td class="auto-style94">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style91">&nbsp;</td>
            <td class="auto-style91">&nbsp;</td>
            <td class="auto-style92"><strong>Modificar </strong></td>
            <td class="auto-style93"><strong>
                <asp:RadioButtonList ID="rbmod" runat="server" RepeatDirection="Horizontal" Enabled="False">
                    <asp:ListItem>NO</asp:ListItem>
                    <asp:ListItem>SI</asp:ListItem>
                </asp:RadioButtonList>
                </strong></td>
            <td class="auto-style94">&nbsp;</td>
            <td class="auto-style94">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style91">&nbsp;</td>
            <td class="auto-style91">&nbsp;</td>
            <td class="auto-style92"><strong>Eliminar </strong></td>
            <td class="auto-style93"><strong>
                <asp:RadioButtonList ID="rbeli" runat="server" RepeatDirection="Horizontal" Enabled="False">
                    <asp:ListItem>NO</asp:ListItem>
                    <asp:ListItem>SI</asp:ListItem>
                </asp:RadioButtonList>
                </strong></td>
            <td class="auto-style94">&nbsp;</td>
            <td class="auto-style94">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style91"></td>
            <td class="auto-style91">
                &nbsp;</td>
            <td class="auto-style92"><strong>Usuarios </strong></td>
            <td class="auto-style93"><strong>
                <asp:RadioButtonList ID="rbuser" runat="server" RepeatDirection="Horizontal" Enabled="False">
                    <asp:ListItem>NO</asp:ListItem>
                    <asp:ListItem>SI</asp:ListItem>
                </asp:RadioButtonList>
                </strong></td>
            <td class="auto-style94"></td>
            <td class="auto-style94"></td>
        </tr>
        <tr>
            <td class="auto-style91"></td>
            <td class="auto-style91"></td>
            <td class="auto-style92"><strong>Perfiles </strong></td>
            <td class="auto-style93"><strong>
                <asp:RadioButtonList ID="rbperfil" runat="server" RepeatDirection="Horizontal" Enabled="False">
                    <asp:ListItem>NO</asp:ListItem>
                    <asp:ListItem>SI</asp:ListItem>
                </asp:RadioButtonList>
                </strong></td>
            <td class="auto-style94"></td>
            <td class="auto-style94"></td>
        </tr>
        <tr>
            <td class="auto-style91"></td>
            <td class="auto-style91"></td>
            <td class="auto-style92"><strong>Agentes </strong></td>
            <td class="auto-style93"><strong>
                <asp:RadioButtonList ID="rbagent" runat="server" RepeatDirection="Horizontal" Enabled="False">
                    <asp:ListItem>NO</asp:ListItem>
                    <asp:ListItem>SI</asp:ListItem>
                </asp:RadioButtonList>
                </strong></td>
            <td class="auto-style94"></td>
            <td class="auto-style94"></td>
        </tr>
        <tr>
            <td class="auto-style95">&nbsp;</td>
            <td class="auto-style95">&nbsp;</td>
            <td class="auto-style96"><strong>Registrar Full Acces</strong></td>
            <td class="auto-style97"><strong>
                <asp:RadioButtonList ID="rbfullac" runat="server" RepeatDirection="Horizontal" Enabled="False">
                    <asp:ListItem>NO</asp:ListItem>
                    <asp:ListItem>SI</asp:ListItem>
                </asp:RadioButtonList>
                </strong></td>
            <td class="auto-style98">&nbsp;</td>
            <td class="auto-style98">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style102"></td>
            <td class="auto-style78"> </td>
            <td class="auto-style105" colspan="2">
                <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style103">
            </td>
            <td class="auto-style103"></td>
        </tr>
        <tr>
            <td class="auto-style99"></td>
            <td class="auto-style99"></td>
            <td class="auto-style100" colspan="2">
                <asp:ImageButton ID="btnmod" runat="server" Height="100%" ImageAlign="Bottom" ImageUrl="/Gestion2/Imagenes/mofuser.jpg" OnClick="btnmod_Click" Width="30%" />
            &nbsp;<asp:ImageButton ID="btnGuardar" runat="server" Height="100%" ImageUrl="/Gestion2/Imagenes/guardar.jpg" Visible="False" Width="30%" ImageAlign="Bottom" OnClick="btnGuardar_Click" />
            </td>
            <td class="auto-style101"></td>
            <td class="auto-style101"></td>
        </tr>
        <tr>
            <td class="auto-style102"></td>
            <td class="auto-style102"></td>
            <td class="auto-style105" colspan="2">
            </td>
            <td class="auto-style103"></td>
            <td class="auto-style103"></td>
        </tr>
        <tr>
            <td class="auto-style95">&nbsp;</td>
            <td class="auto-style95">&nbsp;</td>
            <td class="auto-style40" colspan="2">
                <asp:ImageButton ID="btnVolver" runat="server" Height="95%" ImageUrl="/Gestion2/Imagenes/btnVolver.png" Width="71px" OnClick="btnVolver_Click" />
            </td>
            <td class="auto-style98">&nbsp;</td>
            <td class="auto-style98">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
