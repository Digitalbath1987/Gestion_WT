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
    public partial class ModPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                
                lblid.Text = Session["modperfil"].ToString();
                SqlConnection cOnn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                cOnn.Open();
                cmd.Connection = cOnn;
                cmd.CommandText = " SELECT Usuario,Nombre,Apellido,Modificar,Eliminar,Usuarios,Perfiles,Agentes,Registrar  FROM Usuarios WHERE Usuario ='" + lblid.Text + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                {

                    lblnombre.Text = dr["Nombre"].ToString();
                    lblapellido.Text = dr["Apellido"].ToString();
                    lblusuario.Text= dr["Usuario"].ToString();
                    rbmod.SelectedValue = dr["Modificar"].ToString();
                    rbeli.SelectedValue = dr["Eliminar"].ToString();
                    rbuser.SelectedValue = dr["Usuarios"].ToString();
                    rbperfil.SelectedValue = dr["Perfiles"].ToString();
                    rbagent.SelectedValue = dr["Agentes"].ToString();
                    rbfullac.SelectedValue = dr["Registrar"].ToString();


                } else {
                    lblmensaje.Text = " No Existe ";
                    this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                    lblmensaje.Visible = true;
                    
                }
                cOnn.Close();
            }
       
            
    }

    protected void btnVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Perfiles.aspx");
        }

    
 

        protected void btnmod_Click(object sender, ImageClickEventArgs e)
        {
            rbeli.Enabled = true;
            rbfullac.Enabled = true;
            rbmod.Enabled = true;
            rbperfil.Enabled = true;
            rbuser.Enabled = true;
            rbagent.Enabled = true;
            btnGuardar.Visible = true;
            btnGuardar.Enabled = true;
            btnmod.Visible = false;


        }

        protected void btnGuardar_Click(object sender, ImageClickEventArgs e)
        {
                       
            SqlConnection cOnn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "UPDATE Usuarios SET  Modificar = '"+ rbmod.SelectedItem  +"',Eliminar =  '"+rbeli.SelectedItem  +"',Usuarios =  '"+  rbuser.SelectedItem +"',Perfiles =  '"+ rbperfil.SelectedItem +"',Agentes =  '"+ rbagent.SelectedItem +"',Registrar =  '"+ rbfullac.SelectedItem +"' WHERE Usuario ='" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();

            lblmensaje.Text = " Los cambios se Realizaron Correctamente ";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;



        }
    }
}