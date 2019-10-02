using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Mantenedor
{
    public partial class Perfiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvperfiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            string validar = Session["Perfiles"].ToString();
            if (validar == "SI")
            {
                Session["modperfil"] =  gvperfiles.SelectedValue.ToString();
                Response.Redirect("~/ModPerfil.aspx");
            }
            else {
                lblmensaje.Text = "Usuario sin privilegios para Modificar Perfiles";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
                
            }
        }




    }
}