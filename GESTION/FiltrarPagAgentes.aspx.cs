using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.PagoFacturas
{
    public partial class FiltrarPagAgentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlSelectfiltr_SelectedIndexChanged(object sender, EventArgs e)
        {
            int num;
            num = int.Parse(ddlSelectfiltr.SelectedValue.ToString());
            switch (num)
            {
                case 0:
                    lblagente.Visible = false;
                    ddlAgente.Visible = false;
                    lbluser.Visible = false;
                    ddlUser.Visible = false;

                    break;
                case 1:
                    //Agente
                    lblagente.Visible = true;
                    ddlAgente.Visible = true;
                    lbluser.Visible = false;
                    ddlUser.Visible = false;
                    break;
                case 2:
                    //usuario
                    lbluser.Visible = true;
                    ddlUser.Visible = true;
                    lblagente.Visible = false;
                    ddlAgente.Visible = false;

                    break;
            }
        }

        protected void Filtrar_Click(object sender, EventArgs e)
        {
            int num;
            num = int.Parse(ddlSelectfiltr.SelectedValue.ToString());
            switch (num)
            {
                case 0:
                    //todos
                    Agentes.SelectCommand = "SELECT id_factura,empresa,agente,ninvoice,FINVOICE, (select SUM(Operaciones.monto) from  Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto,nnc,vnc,fnc,linkpdf,moneda,tc,condicion,observ,detalle,usuario,fechaingreso,estado,fechapago FROM Facturas2 ORDER BY [id_factura] DESC";
                    gvfacturas.DataBind();
                    break;
                case 1:
                    //agente
                    Agentes.SelectCommand = "SELECT id_factura,empresa,agente,ninvoice,FINVOICE, (select SUM(Operaciones.monto) from  Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto,nnc,vnc,fnc,linkpdf,moneda,tc,condicion,observ,detalle,usuario,fechaingreso,estado,fechapago FROM Facturas2 where agente = '" + ddlAgente.SelectedValue + "' ORDER BY [id_factura] DESC";
                    gvfacturas.DataBind();

                    break;
                case 2:
                    //usuario
                    Agentes.SelectCommand = "SELECT id_factura,empresa,agente,ninvoice,FINVOICE, (select SUM(Operaciones.monto) from  Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto,nnc,vnc,fnc,linkpdf,moneda,tc,condicion,observ,detalle,usuario,fechaingreso,estado,fechapago FROM Facturas2 where usuario = '" + ddlUser.SelectedValue + "' ORDER BY [id_factura] DESC";
                    gvfacturas.DataBind();

                    break;
            }
        }

        protected void gvfacturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int num = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Ver")
            {

                Session["IDINVOICE"] = num;
                Response.Redirect("~/VerDett.aspx");


            }

        }
    }
}