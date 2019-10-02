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
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, ImageClickEventArgs e)
        {
            string validar = Session["Usuarios"].ToString();
            
            if (validar == "SI")
            {
                
            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT count(id_Usuario)as contador FROM Usuarios WITH(NOLOCK) where Usuario ='" + txtusuario.Text  +"' or rut='"+ txtrut.Text +"'";
            dr = cmd.ExecuteReader();
            dr.Read();
            int contador = int.Parse(dr["contador"].ToString());
            if (contador >=1) {
            lblmensaje.Text = "Usuario o Rut ya existe";
            this.lblmensaje.ForeColor = System.Drawing.Color.Red;
            lblmensaje.Visible = true;
            Conn.Close();
            }
            else {
            Entidades.Gestion.CREARUSUARIO CREARUSUARIO = new Entidades.Gestion.CREARUSUARIO();
             try {
                    CREARUSUARIO.Usuario = txtusuario.Text;
                    CREARUSUARIO.Contraseña = txtcontraseña.Text;
                    CREARUSUARIO.Nombre = txtnombre.Text;
                    CREARUSUARIO.Apellido = txtapellido.Text;
                    CREARUSUARIO.Rut = txtrut.Text;
                    CREARUSUARIO.id_Perfil = int.Parse(ddldepartamento.SelectedValue);
                    CREARUSUARIO.Modificar = rbmod.SelectedValue.ToString();
                    CREARUSUARIO.Eliminar = rbeliminar.SelectedValue.ToString();
                    CREARUSUARIO.Usuarios = rbcuser.SelectedValue.ToString();
                    CREARUSUARIO.Perfiles = rbcuser.SelectedValue.ToString();
                    CREARUSUARIO.Agentes = rbcagentes.SelectedValue.ToString();
                    CREARUSUARIO.Registrar = rbregistrar.SelectedValue.ToString();
                    GestorGestion gestorgestion = new GestorGestion();
                    bool result = gestorgestion.CREARUSUARIO(CREARUSUARIO);
                    if (result == true){
                        lblmensaje.Text = "USUARIO CREADO CORRECTAMENTE";
                        this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                        lblmensaje.Visible = true;

                        gvuduarios.DataBind();
                        txtapellido.Text = "";
                        txtcontraseña.Text = "";
                        txtnombre.Text = "";
                        txtpass.Text = "";
                        txtrut.Text = "";
                        txtusuario.Text = "";
                         
                    } else {
                        lblmensaje.Text = "Error al guardar los datos ....";
                        this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                        lblmensaje.Visible = true;
                    }
                    }catch (Exception){
                    lblmensaje.Text = "Error de proceso desconocido ....";
                    this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                    lblmensaje.Visible = true;
                }
             }
            Conn.Close();
                }
            else {
                lblmensaje.Text = "Usuario sin privilegios para Crear Cuentas";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
              }
           }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string validar = Session["Eliminar"].ToString();



            if (validar == "SI")
            {
                

                string eliminar = gvuduarios.SelectedValue.ToString();
                SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "DELETE FROM Usuarios WHERE Usuario ='" + eliminar + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                lblmensaje.Text = "Usuario eliminado correctamente";
                this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                lblmensaje.Visible = true;
                gvuduarios.DataBind();

            }
            else {
                lblmensaje.Text = "Usuario sin privilegios para Eliminar";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;


            }

        }
    }
}