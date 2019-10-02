<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Correo.aspx.cs" Inherits="GESTION.Mantenedor.Correo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style11 {
        width: 100%;
    }
    .auto-style37 {
        width: 182px;
    }
    .auto-style38 {
        width: 183px;
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
        .auto-style67 {
            height: 23px;
            width: 182px;
        }
        .auto-style68 {
            height: 23px;
            width: 183px;
        }
        .auto-style75 {
            border: 2px outset #808080;
            height: 30px;
            width: 183px;
        }
        .auto-style76 {
            border: 2px outset #808080;
            height: 30px;
            width: 183px;
            text-align: center;
        }
        .auto-style77 {
            height: 30px;
            width: 182px;
        }
        .auto-style78 {
            height: 30px;
            width: 183px;
        }
        .auto-style79 {
            height: 23px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
    <tr>
        <td class="auto-style66" colspan="6"><strong>Parametros de Correo</strong></td>
    </tr>
    <tr>
        <td class="auto-style77"></td>
        <td class="auto-style77"></td>
        <td class="auto-style75"><strong>Mail Sender :</strong></td>
        <td class="auto-style76">
            <strong>
            <asp:TextBox ID="txtMail" runat="server" TextMode="Email" Enabled="False" Height="90%" Width="70%"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMail" ErrorMessage="*" ValidationGroup="mail">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style78"></td>
        <td class="auto-style78"></td>
    </tr>
    <tr>
        <td class="auto-style77"></td>
        <td class="auto-style77"></td>
        <td class="auto-style75"><strong>Pass Mail :</strong></td>
        <td class="auto-style76">
            <strong>
            <asp:TextBox ID="txtPass" runat="server" Enabled="False" Height="90%" Width="70%"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="*" ValidationGroup="mail">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style78"></td>
        <td class="auto-style78"></td>
    </tr>
    <tr>
        <td class="auto-style77"></td>
        <td class="auto-style77"></td>
        <td class="auto-style75"><strong>SMTP Server</strong></td>
        <td class="auto-style76">
            <strong>
            <asp:TextBox ID="txtserver" runat="server" Enabled="False" Height="90%" Width="70%"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtserver" ErrorMessage="*" ValidationGroup="mail">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style78"></td>
        <td class="auto-style78"></td>
    </tr>
    <tr>
        <td class="auto-style77"></td>
        <td class="auto-style77"></td>
        <td class="auto-style75"><strong>Port SMTP</strong></td>
        <td class="auto-style76">
            <strong>
            <asp:TextBox ID="txtport" runat="server" TextMode="Number" Enabled="False" Height="90%" Width="70%"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtport" ErrorMessage="*" ValidationGroup="mail">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style78"></td>
        <td class="auto-style78"></td>
    </tr>
    <tr>
        <td class="auto-style77">&nbsp;</td>
        <td class="auto-style77">&nbsp;</td>
        <td class="auto-style75"><strong>Mail Avisos</strong></td>
        <td class="auto-style76">
            <asp:TextBox ID="txtmavisos" runat="server" Enabled="False" Height="90%" Width="70%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtmavisos" ErrorMessage="*" ValidationGroup="mail">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style78">&nbsp;</td>
        <td class="auto-style78">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style77">&nbsp;</td>
        <td class="auto-style77">&nbsp;</td>
        <td class="auto-style75"><strong>Mail Urgente</strong></td>
        <td class="auto-style76">
            <asp:TextBox ID="txtmurgent" runat="server" Enabled="False" Height="90%" Width="70%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtmurgent" ErrorMessage="*" ValidationGroup="mail">*</asp:RequiredFieldValidator>
        </td>
        <td class="auto-style78">&nbsp;</td>
        <td class="auto-style78">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style67"></td>
        <td class="auto-style67"></td>
        <td class="auto-style79" colspan="2">
            <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
        </td>
        <td class="auto-style68"></td>
        <td class="auto-style68"></td>
    </tr>
    <tr>
        <td class="auto-style37">&nbsp;</td>
        <td class="auto-style37">&nbsp;</td>
        <td class="auto-style8" colspan="2">
            <asp:ImageButton ID="modmail" runat="server" Height="70%" ImageUrl="~/Imagenes/modmail.jpg" OnClick="modmail_Click" Width="40%" />
            <asp:ImageButton ID="btnGuardar" runat="server" Height="70%" ImageAlign="Bottom" ImageUrl="~/Imagenes/guardar.jpg" OnClick="btnGuardar_Click" Visible="False" Width="40%" ValidationGroup="mail" />
        </td>
        <td class="auto-style38">&nbsp;</td>
        <td class="auto-style38">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style37">&nbsp;</td>
        <td class="auto-style37">&nbsp;</td>
        <td class="auto-style38">&nbsp;</td>
        <td class="auto-style38">&nbsp;</td>
        <td class="auto-style38">&nbsp;</td>
        <td class="auto-style38">&nbsp;</td>
    </tr>
</table>
</asp:Content>
