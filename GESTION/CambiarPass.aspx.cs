using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Entidades.Gestion;
using Gestion.CapadeDatos;


namespace GESTION.Mantenedor
{
    public partial class CambiarPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncambiar_Click(object sender, EventArgs e)
        {
            string usuario = Session["Usuario"].ToString();
            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "UPDATE Usuarios   SET Contraseña ='"+ txtpassrep.Text +"'  WHERE Usuario ='" + usuario + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            
            lblmensaje.Text = "Se ha Cambiado la Contraseña Correctamente!";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;










        }
    }
}