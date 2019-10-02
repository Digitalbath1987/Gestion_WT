using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GESTION
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string script = @"window.location.href = '#nombralo';";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
            if (!Page.IsPostBack)
            {
                Session.Abandon();
                Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));

            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT Usuarios.Usuario,Usuarios.id_Usuario,Usuarios.Contraseña,Usuarios.Nombre,Usuarios.Apellido,Perfiles.Detalle_Perfil,Usuarios.Modificar,Usuarios.Eliminar,Usuarios.Usuarios,Usuarios.Perfiles,Usuarios.Agentes,Usuarios.Registrar from Usuarios,Perfiles  where Usuarios.Usuario = '" + txtUsuario.Text + "'AND Usuarios.Contraseña ='" + txtContraseña.Text + "'AND Usuarios.id_Perfil = Perfiles.id_Perfil";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                Session["Nombre"] = dr["Nombre"].ToString();
                Session["Apellido"] = dr["Apellido"].ToString();
                Session["Perfil"] = dr["Detalle_Perfil"].ToString();
                Session["Usuario"] = dr["Usuario"].ToString();
                Session["id_Usuario"] = dr["id_Usuario"].ToString();
                Session["idUsuario"] = dr["id_Usuario"];
                Session["Modificar"] = dr["Modificar"].ToString();
                Session["Eliminar"] = dr["Eliminar"].ToString();
                Session["Usuarios"] = dr["Usuarios"].ToString();
                Session["Perfiles"] = dr["Perfiles"].ToString();
                Session["Agentes"] = dr["Agentes"].ToString();
                Session["Registrar"] = dr["Registrar"].ToString();
                Alertanook.Visible = false;
                Alertaok.Visible = true;
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                Alertanook.Visible = true;
                Alertaok.Visible = false;

            }
            conn.Close();
        }
    }
}
