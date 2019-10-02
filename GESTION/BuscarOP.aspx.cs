using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.PagoFacturas
{
    public partial class BuscarOP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack){
                if (ddlTipoBusq.SelectedValue == "0")
                {
                    ListOP.SelectCommand = "SELECT Operaciones.idop,Operaciones.numop,Operaciones.monto,Operaciones.House,Operaciones.ninvoice,Facturas2.id_factura FROM Operaciones, Facturas2 where Facturas2.ninvoice = Operaciones.ninvoice";
                    gvop.DataBind();
                    txtBuscar.Enabled = false;
                    txtBuscar.Text = "";
                }
                else {
                    txtBuscar.Enabled = true;
                }


            }
        }

        protected void gvop_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDINVOICE"] = int.Parse(gvop.SelectedValue.ToString());
            Response.Redirect("~/VerDett.aspx");
         


        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {

            int num = int.Parse(ddlTipoBusq.SelectedValue.ToString());
            switch (num)
            {
                case 0:
                    ListOP.SelectCommand = "SELECT Operaciones.idop,Operaciones.numop,Operaciones.monto,Operaciones.House,Operaciones.ninvoice,Facturas2.id_factura FROM Operaciones, Facturas2 where Facturas2.ninvoice = Operaciones.ninvoice  ";
                    gvop.DataBind();
                    break;
                case 1:
                    ListOP.SelectCommand = "SELECT Operaciones.idop,Operaciones.numop,Operaciones.monto,Operaciones.House,Operaciones.ninvoice,Facturas2.id_factura FROM Operaciones, Facturas2 where Facturas2.ninvoice = Operaciones.ninvoice  and  Operaciones.numop ='" + txtBuscar.Text + "' ";
                    gvop.DataBind();
                    break;
                case 2:
                    ListOP.SelectCommand = "SELECT Operaciones.idop,Operaciones.numop,Operaciones.monto,Operaciones.House,Operaciones.ninvoice,Facturas2.id_factura FROM Operaciones, Facturas2 where Facturas2.ninvoice = Operaciones.ninvoice  and  Operaciones.House ='" + txtBuscar.Text + "' ";
                    
                       gvop.DataBind();
                    break;
                case 3:
                    ListOP.SelectCommand = "SELECT Operaciones.idop,Operaciones.numop,Operaciones.monto,Operaciones.House,Operaciones.ninvoice,Facturas2.id_factura FROM Operaciones, Facturas2 where Facturas2.ninvoice = Operaciones.ninvoice  and  Operaciones.ninvoice ='" + txtBuscar.Text + "' ";
                    gvop.DataBind();
                    break;
             
            }//cierre del switch





            


        }

        protected void ddlTipoBusq_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoBusq.SelectedValue == "0")
            {
                ListOP.SelectCommand = "SELECT Operaciones.idop,Operaciones.numop,Operaciones.monto,Operaciones.House,Operaciones.ninvoice,Facturas2.id_factura FROM Operaciones, Facturas2 where Facturas2.ninvoice = Operaciones.ninvoice  ";
                gvop.DataBind();
                txtBuscar.Enabled = false;
                txtBuscar.Text = "";
            }
            else {
                txtBuscar.Enabled = true;
            }
        }
    }
}