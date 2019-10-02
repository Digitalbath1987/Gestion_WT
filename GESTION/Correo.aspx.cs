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
    public partial class Correo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack){
                             
                SqlConnection cOnn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                cOnn.Open();
                cmd.Connection = cOnn;
                cmd.CommandText = "SELECT id_Mail,UserMail,PassMail,FirmaMail,PuertoMail,ServerMail,Estado,UserAvisoMail,UserurgentMail FROM Mail";
                dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows){
                    txtMail.Text= dr["UserMail"].ToString();
                    txtPass.Text = dr["PassMail"].ToString();
                    txtport.Text = dr["PuertoMail"].ToString();
                    txtserver.Text = dr["ServerMail"].ToString();
                    txtmavisos.Text = dr["UserAvisoMail"].ToString();
                    txtmurgent.Text = dr["UserurgentMail"].ToString();

                    btnGuardar.Enabled = false;
                  }else {
                    lblmensaje.Text = " No Existe ";
                    this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                    lblmensaje.Visible = true;
                 }
                cOnn.Close();
                }
            }

        protected void modmail_Click(object sender, ImageClickEventArgs e)
        {
            txtMail.Enabled = true;
            txtPass.Enabled = true;
            txtport.Enabled = true;
            txtserver.Enabled = true;
            btnGuardar.Visible = true;
            btnGuardar.Enabled = true;
            modmail.Visible = false;
            txtmavisos.Enabled = true;
            txtmurgent.Enabled = true;

        }

        protected void btnGuardar_Click(object sender, ImageClickEventArgs e)
        {

            SqlConnection cOnn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "UPDATE Mail SET UserMail = '"+ txtMail.Text +"',PassMail = '"+ txtPass.Text +"',PuertoMail = '"+ txtport.Text +"' ,ServerMail = '"+ txtserver.Text+ "',UserAvisoMail = '" + txtmavisos.Text + "',UserurgentMail = '" + txtmurgent.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblmensaje.Text = "datos actualizados";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;
            btnGuardar.Visible = false;
            modmail.Visible = true;
            txtMail.Enabled = false;
            txtPass.Enabled = false;
            txtport.Enabled = false;
            txtserver.Enabled = false;
            txtmavisos.Enabled = false;
            txtmurgent.Enabled = false;


        }
    }
}