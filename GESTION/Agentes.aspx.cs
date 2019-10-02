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
    public partial class Agentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CrearAgent_Click(object sender, ImageClickEventArgs e)
        {

            string validar = Session["Agentes"].ToString();



            if (validar == "SI")
            {

                
                Entidades.Gestion.CREARAGENTE CREARAGENTE = new Entidades.Gestion.CREARAGENTE();
            
            try
            {
                CREARAGENTE.NOMBRE = txtnom.Text;
                CREARAGENTE.CORREO = txtmail.Text;
                CREARAGENTE.RUT = txtrut.Text;

                GestorGestion gestorgestion = new GestorGestion();
                bool result = gestorgestion.CREARAGENTE(CREARAGENTE);
                if (result == true){
                    lblmensaje.Text = "Agente Registrado Correctamente";
                    this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                    lblmensaje.Visible = true;
                        txtnom.Text = "";
                        txtmail.Text = "";
                        txtrut.Text = "";
                        GVAgentes.DataBind();

                }else{

                    lblmensaje.Text = "No se Pudo Registrar Agente , Revisar Datos ";
                    this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                    lblmensaje.Visible = true;
                }
            }
            catch (Exception){
                lblmensaje.Text = "Error conexion a la Base de Datos , Favor Contactarse Con el Administrador de Sistemas ";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
            }


            } else {
                lblmensaje.Text = "Usuario sin privilegios para Crear Agentes";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;


            }




        }

        protected void GVAgentes_SelectedIndexChanged(object sender, EventArgs e)
        {

            string validar = Session["Eliminar"].ToString();



            if (validar == "SI")
            {


                string eliminar = GVAgentes.SelectedValue.ToString();
                SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "DELETE FROM Agentes2 WHERE id_Agente = '" + eliminar + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                lblmensaje.Text = "Agente eliminado correctamente";
                this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                lblmensaje.Visible = true;
                GVAgentes.DataBind();

            }
            else {
                lblmensaje.Text = "Usuario sin privilegios para Eliminar";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;


            }






        }
    }
}