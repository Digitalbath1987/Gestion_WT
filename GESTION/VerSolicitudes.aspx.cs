using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Cheques
{
    public partial class VerSolicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void gvsol_Cheques_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SolCheque"] = int.Parse(gvsol_Cheques.SelectedValue.ToString());
            Response.Redirect("~/VerDetalleNcobro.aspx");
            
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string val = ddlFiltro.SelectedValue.ToString();

            if (val == "Empresa")
            {

                Panel_Empresa.Visible = true;

                panel_tipo.Visible = false;
                panel_Doc.Visible = false;
                panel_OP.Visible = false;



            }
            else if (val == "Tipo")
            {

                Panel_Empresa.Visible = false;
                panel_tipo.Visible = true;

                panel_Doc.Visible = false;
                panel_OP.Visible = false;




            }
            else if (val == "Usuario")
            {

                Panel_Empresa.Visible = false;
                panel_Doc.Visible = true;

                panel_tipo.Visible = false;

                panel_OP.Visible = false;



            }
            else if (val == "Todo")
            {

                Panel_Empresa.Visible = false;
                panel_Doc.Visible = false;

                panel_tipo.Visible = false;

                panel_OP.Visible = false;


            }
            else if (val == "Operacion")
            {

                Panel_Empresa.Visible = false;
                panel_Doc.Visible = false;

                panel_tipo.Visible = false;

                panel_OP.Visible = true;



            }

        }


        protected void btnFiltrar_ServerClick(object sender, EventArgs e)
        {


            string val = ddlFiltro.SelectedValue.ToString();

            if (val == "Empresa")
            {


                Panel_Empresa.Visible = true;

                SolCheques.SelectCommand = "SELECT * FROM Sol_Cheques WITH(NOLOCK)  where Empresa ='" + ddlempresa.SelectedValue + "' order by Ncorrelativo Desc";
                SolCheques.DataBind();






            }
            else if (val == "Tipo")
            {
                panel_tipo.Visible = true;


                SolCheques.SelectCommand = "SELECT * FROM Sol_Cheques WITH(NOLOCK)  where Tipo ='" + ddlTipo.SelectedValue + "' order by Ncorrelativo Desc";
                SolCheques.DataBind();


            }
            else if (val == "Usuario")
            {
                panel_Doc.Visible = true;
                SolCheques.SelectCommand = "SELECT *  FROM Sol_Cheques WITH(NOLOCK) where Usuario = '" + ddlUsuario.SelectedValue +"' order by Ncorrelativo Desc";
                SolCheques.DataBind();


            }else if (val == "Todo")
            {
                Panel_Empresa.Visible = false;
                panel_Doc.Visible = false;

                panel_tipo.Visible = false;

                panel_OP.Visible = false;

                SolCheques.SelectCommand = "SELECT * FROM [Sol_Cheques] WITH(NOLOCK) ORDER BY [Ncorrelativo] DESC";
                SolCheques.DataBind();


            }
            else if (val == "Operacion")
            {

                panel_OP.Visible = true;


                SolCheques.SelectCommand = "SELECT * FROM [Sol_Cheques] WITH(NOLOCK) where Operacion ='" + txtoperacion.Text + "' order by Ncorrelativo Desc";
                SolCheques.DataBind();




            }


        }











    }
}