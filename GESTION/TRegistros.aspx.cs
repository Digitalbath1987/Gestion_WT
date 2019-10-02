using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.PagoFacturas
{
    public partial class TRegistros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvFacturas_SelectedIndexChanged(object sender, EventArgs e){
            Session["IDINVOICE"] = int.Parse(gvFacturas.SelectedValue.ToString());
            Response.Redirect("~/VerDett.aspx");
        }

        protected void ddlestado_SelectedIndexChanged(object sender, EventArgs e){
            int num = int.Parse(ddlestado.SelectedValue);
            switch (num){
                case 0:
                    listarFacturas.SelectCommand = "SELECT * FROM Facturas2 WITH(NOLOCK)";
                    gvFacturas.DataBind();

                    break;
                case 1:
                    listarFacturas.SelectCommand = "SELECT * FROM Facturas2 WITH(NOLOCK) where estado = 'PENDIENTE'";
                    gvFacturas.DataBind();
                    break;
                case 2:
                    listarFacturas.SelectCommand = "SELECT * FROM Facturas2 WITH(NOLOCK) where estado = 'PAGADO'";
                    gvFacturas.DataBind();
                   break;
            
            }
        }
    }
}