using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Control_Operaciones
{
    public partial class VerRegistros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


       

        protected void gvregistros_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IdRegistro"] = int.Parse(gvregistros.SelectedValue.ToString());
            Response.Redirect("~/Detalle_Control_Op.aspx");
              
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string val = ddlFiltro.SelectedValue.ToString();

            if (val == "Naviera")
            {
                Panel_Empresa.Visible = true;

                panel_Doc.Visible = false;
                panel_OP.Visible = false;


            }
            else if (val == "MBL-HBL")
            {

                Panel_Empresa.Visible = false;
                panel_Doc.Visible = true;

                panel_OP.Visible = false;



            }
            else if (val == "Todo")
            {

                Panel_Empresa.Visible = false;
                panel_Doc.Visible = false;


                panel_OP.Visible = false;


            }
            else if (val == "Operacion")
            {

                Panel_Empresa.Visible = false;
                panel_Doc.Visible = false;

                panel_OP.Visible = true;



            }

        }



        protected void btnFiltrar_ServerClick(object sender, EventArgs e)
        {


            string val = ddlFiltro.SelectedValue.ToString();

            if (val == "Naviera")
            {

                Panel_Empresa.Visible = true;
                Listado.SelectCommand = "SELECT * FROM [Controlop] WITH(NOLOCK) where Naviera='" + ddlNaviera.SelectedValue +"' ORDER BY [id_Control] DESC";
                gvregistros.DataBind();

            }
            else if (val == "MBL-HBL")
            {
                panel_Doc.Visible = true;

                Listado.SelectCommand = "SELECT * FROM [Controlop] WITH(NOLOCK) where MBL_HBL='" + txtDocumento.Text +"' ORDER BY [id_Control] DESC";
                gvregistros.DataBind();
            }
            else if (val == "Todo")
            {
                Panel_Empresa.Visible = false;
                panel_Doc.Visible = false;
                panel_OP.Visible = false;
                Listado.SelectCommand = "SELECT * FROM [Controlop] WITH(NOLOCK) ORDER BY [id_Control] DESC";
                gvregistros.DataBind();

            }
            else if (val == "Operacion")
            {
                panel_OP.Visible = true;
                Listado.SelectCommand = "SELECT * FROM [Controlop] WITH(NOLOCK) where Operacion = '" + txtoperacion.Text +"'  ORDER BY [id_Control] DESC";
                gvregistros.DataBind();
            }


        }


    }
}