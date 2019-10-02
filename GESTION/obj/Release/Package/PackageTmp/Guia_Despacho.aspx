<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Guia_Despacho.aspx.cs" Inherits="GESTION.Solicitud_Guia_Despacho.Guia_Despacho" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<style type="text/css">
        .auto-style1 {
            width: 741px;
            height: 859px;
        }
        .auto-style2 {
            text-align: center;
            font-size: medium;
            height: 86px;
        }
        .auto-style3 {
            font-size: medium;
            text-decoration: underline;
            font-weight: normal;
        }
        .auto-style15 {
            text-decoration: underline;
        }
        .auto-style27 {
            height: 17px;
            width: 184px;
            text-align: center;
            font-size: medium;
        }
        .auto-style30 {
            height: 17px;
            text-align: center;
            font-size: medium;
            width: 185px;
        }
        .auto-style50 {
            height: 17px;
            font-size: medium;
        }
        .auto-style53 {
            width: 184px;
            height: 13px;
            font-size: medium;
            text-align: center;
        }
        .auto-style54 {
            height: 13px;
            width: 185px;
            text-align: center;
        }
        .auto-style55 {
            width: 184px;
            height: 16px;
        }
        .auto-style56 {
            height: 16px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
        }
        .auto-style64 {
            font-size: medium;
        }
        .auto-style65 {
            height: 13px;
            font-size: medium;
        }
        .auto-style75 {
            height: 10px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: medium;
            }
        .auto-style78 {
        height: 13px;
        border-style: solid;
        border-width: 2px;
        padding: 1px 4px;
        font-size: medium;
    }
    </style>
</head>
<body  style="width: 748px; height: 862px" >
    
    <form id="form1" runat="server">
        
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="3">
                    <span class="auto-style64">
             
                    </span>
                    <h2>
                        
                        <strong>Solicitud de Guia Despacho N°</strong> <asp:Label ID="lbl_Correlativo" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
                     
                 
                    </h2>
                </td>
            </tr>
            <tr>
                <td class="auto-style75" colspan="3">

                    Empresa :&nbsp;
                    <asp:Label ID="lblempresa" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
               
                </td>
            </tr>
            <tr>
                <td class="auto-style75" colspan="3">
                    Nombre Cliente :&nbsp;
                    <asp:Label ID="lblnombre" runat="server" Text="Label" style="font-weight: 700"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style75" colspan="3">
                    Rut Cliente :&nbsp;
                    <asp:Label ID="lblrut" runat="server" Text="lblrut" style="font-weight: 700"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style75" colspan="3">
                    Nombre Conductor :&nbsp;
                    <asp:Label ID="lblconductor" runat="server" Text="lblconductor" style="font-weight: 700"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style75" colspan="3">

                    Patente&nbsp;
                    <asp:Label ID="lblpatente" runat="server" Text="lblpatente" style="font-weight: 700"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style78" colspan="3">

                    Detalle de la solicitud :&nbsp;
                    <asp:Label ID="lbldetalle" runat="server" style="font-weight: 700" Text="Label"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style50">&nbsp;</td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style27"><span class="auto-style15">
                    <span class="auto-style64">________________</span></span></td>
                <td class="auto-style50">&nbsp;</td>
                <td class="auto-style30"><span class="auto-style15">
                    <span class="auto-style64">________________</span></span></td>
            </tr>
            <tr>
                <td class="auto-style53"><strong>Solicitante</strong></td>
                <td class="auto-style65">&nbsp;</td>
                <td class="auto-style54"><strong>Jefe de Area</strong></td>
            </tr>
            <tr>
                <td class="auto-style55"><span class="auto-style64"><strong>De : </strong> </span> <em><strong>
                    <asp:Label ID="lbluser" runat="server" Text="Label" CssClass="auto-style64"></asp:Label>
                    </strong></em></td>
                <td class="auto-style56" colspan="2"><strong>Fecha Solicitud :
                    <asp:Label ID="lblfecha" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>

</html>
