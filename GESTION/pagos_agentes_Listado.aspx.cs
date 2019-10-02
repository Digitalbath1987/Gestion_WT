using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION
{
    public partial class pagos_agentes_Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvFacturas_SelectedIndexChanged(object sender, EventArgs e)
        {
           Session["IDINVOICE"] = int.Parse(gvFacturas.SelectedValue.ToString());
           Response.Redirect("~/VerDett.aspx");

        }

    }
}