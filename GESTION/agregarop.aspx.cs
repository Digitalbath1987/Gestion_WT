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
using System.Globalization;


namespace GESTION.PagoFacturas
{
    public partial class agregarop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        if (!Page.IsPostBack)
            {
                lblinvoice.Text = Session["NINVOICE"].ToString();
            }//cierre del postback
         }

        protected void btnregistrar_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
                    
            string insertop = "###########.##";
            string formateadoop = Convert.ToDecimal(txtmonto.Text).ToString(insertop, CultureInfo.GetCultureInfo("en-US"));
            
            cmd.CommandText = "INSERT INTO Operaciones  (numop,monto,House,ninvoice,Fventa) VALUES ('" + txtnumop.Text +"','"+ formateadoop + "','" + House.Text + "','" + lblinvoice.Text +"','"+ txt_Fventa.Text +"')";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblmensaje.Text = "Operacion Registrada!";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;
            gvope.DataBind();
            txtmonto.Text = "";
            Conn.Close();
       }

        protected void btnVolver_Click(object sender, ImageClickEventArgs e)
        {
        Response.Redirect("/Gestion2/VerDett.aspx");
        }

        protected void gvope_SelectedIndexChanged(object sender, EventArgs e)
        {
            string validar = Session["Eliminar"].ToString();
            if (validar == "SI")
            {
                string eliminar = gvope.SelectedValue.ToString();
                SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "DELETE FROM Operaciones WHERE idop ='" + eliminar + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                lblmensaje.Text = "Operacion Eliminada!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                lblmensaje.Visible = true;
                // correo informando de la eliminacion 
                gvope.DataBind();
             }else {
                lblmensaje.Text = "No Posee Permisos,contacte Administrador!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
              }
            

        }
    }
}