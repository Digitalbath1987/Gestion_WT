using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GESTION.Cheques
{
    public partial class FiltrarNotaC : System.Web.UI.Page
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

              
                panel_Clie.Visible = false;
                panel_OP.Visible = false;



            }          
            else if (val == "Cliente")
            {

                Panel_Empresa.Visible = false;
                panel_Clie.Visible = true;



                panel_OP.Visible = false;



            }
            else if (val == "Todo")
            {

                Panel_Empresa.Visible = false;
                panel_Clie.Visible = false;

         

                panel_OP.Visible = false;


            }
            else if (val == "Operacion")
            {

                Panel_Empresa.Visible = false;
                panel_Clie.Visible = false;

            

                panel_OP.Visible = true;



            }

        }


        protected void btnFiltrar_ServerClick(object sender, EventArgs e)
        {


            string val = ddlFiltro.SelectedValue.ToString();

            if (val == "Empresa")
            {


                Panel_Empresa.Visible = true;

                Nota_De_Cobros.SelectCommand = "SELECT Rut,Señores,Fecha_Emision,Fecha_Vencimiento,NdeCobro,Vendedor,Pagado FROM NotadeCobro , Sol_Cheques where Sol_Cheques.Ncorrelativo= NotadeCobro.NdeCobro and  Sol_Cheques.Empresa = '" + ddlempresa.SelectedValue + "'  ORDER BY NdeCobro DESC";
                Nota_De_Cobros.DataBind();
             

            }
            
            else if (val == "Cliente")
            {
                panel_Clie.Visible = true;
                Nota_De_Cobros.SelectCommand = "SELECT * FROM NotadeCobro where Señores = '"+ ddlClientes.SelectedValue + "' ORDER BY NdeCobro DESC";
                Nota_De_Cobros.DataBind();


            }
            else if (val == "Todo")
            {
                Panel_Empresa.Visible = false;
                panel_Clie.Visible = false;



                panel_OP.Visible = false;

                Nota_De_Cobros.SelectCommand = "SELECT * FROM NotadeCobro ORDER BY NdeCobro DESC";
                Nota_De_Cobros.DataBind();


            }
            else if (val == "Operacion")
            {

                panel_OP.Visible = true;
                Nota_De_Cobros.SelectCommand = "SELECT Rut,Señores,Fecha_Emision,Fecha_Vencimiento,NdeCobro,Vendedor,Pagado FROM NotadeCobro , Sol_Cheques where Sol_Cheques.Ncorrelativo= NotadeCobro.NdeCobro and  Sol_Cheques.Operacion = '"+ txtoperacion.Text +"'  ORDER BY NdeCobro DESC";
                Nota_De_Cobros.DataBind();

            }

        }


   
     
    }
}