using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Control_Operaciones
{
    public partial class Registro_Control_Op : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e){
       
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
           try
            {
                SqlConnection Conn = new SqlConnection
                {
                    ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
                };
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                DateTime Hoy = DateTime.Today;
                cmd.CommandText = "INSERT INTO Controlop(Naviera,Cliente,MBL_HBL,ETA,F_Entrega,Customer,A_LLegada,Canje,P_Facturas,Sidemar,Oservacion,ObservacionG,Tipo,Presentacion,Usuario_Registro,Fecha_Registro,Operacion) VALUES ('" + ddlNaviera.SelectedValue + "','" + txtCliente.Text + "','" + txtmbl.Text + "','" + txteta.Text + "','" + txtfentrega.Text + "','" + ddlcustomer.SelectedValue + "','" + cballegada.Checked + "','" + cbcanje.Checked + "','" + txtpfactura.Text + "','" + cbsidemar.Checked + "','" + txtobserv.Text + "','" + txtobservg.Text + "','" + ddltipo.SelectedValue + "','" + cbpresentacion.Checked + "','" + Session["Usuario"] + "','" + Hoy.ToString("yyyy-MM-dd") + "','" + txtoperacion.Text + "')";
                dr = cmd.ExecuteReader();
                dr.Read();
                Conn.Close();
                Alertaok.Visible = true;
                Alertanook.Visible = false;
                gvregistros.DataBind();
            }catch (Exception ex){
                Alertanook.Visible = true;
                Alertaok.Visible = false;
            }
        }

        protected void ddlNaviera_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT ID_Nav,Naviera,Tipo FROM Naviera where Naviera = '" + ddlNaviera.SelectedValue + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            string tipo = dr["Tipo"].ToString();
            ddltipo.SelectedValue = tipo;
            Conn.Close();
        }

        protected void gvregistros_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IdRegistro"] = int.Parse(gvregistros.SelectedValue.ToString());
            Response.Redirect("~/Detalle_Control_Op.aspx");
        }

    }
}