<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="CambiarPass.aspx.cs" Inherits="GESTION.Mantenedor.CambiarPass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
        .auto-style22 {
            width: 140px;
        }
        .auto-style23 {
            width: 141px;
        }
        .auto-style24 {
            font-weight: bold;
        }
        .auto-style25 {
            width: 140px;
            height: 40px;
        }
        .auto-style26 {
            width: 141px;
            height: 40px;
        }
        .auto-style27 {
            width: 140px;
            height: 35px;
        }
        .auto-style28 {
            text-align: center;
            height: 35px;
        }
        .auto-style29 {
            width: 141px;
            height: 35px;
        }
          .auto-style36 {
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
    .auto-style37 {
        height: 40px;
        text-align: center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
        <tr>
            <td class="auto-style36" colspan="8"><strong>Cambiar Contraseña</strong></td>
        </tr>
        <tr>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style25">
                &nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
            <td class="auto-style25"><strong>Contraseña Nueva</strong></td>
            <td class="auto-style25">
                <asp:TextBox ID="txtpass" runat="server" Height="80%" Width="80%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpass" ErrorMessage="*" ValidationGroup="grabar">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
            <td class="auto-style25"><strong>Repita Contraseña (Nueva)</strong></td>
            <td class="auto-style25">
                <asp:TextBox ID="txtpassrep" runat="server" Height="80%" Width="80%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassrep" ErrorMessage="*" ValidationGroup="grabar">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpass" ControlToValidate="txtpassrep" ErrorMessage="*" ValidationGroup="grabar">*</asp:CompareValidator>
            </td>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
            <td class="auto-style37" colspan="2"><strong>
                <asp:Label ID="lblmensaje" runat="server" Text="Label" Visible="False"></asp:Label>
                </strong></td>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
            <td class="auto-style26"></td>
        </tr>
        <tr>
            <td class="auto-style27"></td>
            <td class="auto-style27"></td>
            <td class="auto-style27"></td>
            <td class="auto-style28" colspan="2"><strong>
                <asp:Button ID="btncambiar" runat="server" CssClass="auto-style24" Text="Grabar" Height="32px" OnClick="btncambiar_Click" ValidationGroup="grabar" Width="94px" />
                </strong></td>
            <td class="auto-style27"></td>
            <td class="auto-style27"></td>
            <td class="auto-style29"></td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
