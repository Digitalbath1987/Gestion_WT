using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Entidades.Gestion;

namespace GESTION.PagoFacturas
{
    public partial class AgregarNombreAgente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {

            SqlConnection Conn = new SqlConnection("Data Source=WTLSRVNET;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "INSERT INTO Agentes(Nombre)VALUES('" + txtNombre.Text + "')";
            dr = cmd.ExecuteReader();
            dr.Read();

            lblmensaje.Text = "Los Datos se Actualizaron Correctamente ....";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;
            Conn.Close();
            txtNombre.Text = "";
            
        }
    }
}