using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Solicitud_Guia_Despacho
{
    public partial class Guia_Despacho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT Id_Guia_Despacho,Correlativo_Guia_Despacho,Usuario_Solicitante,FORMAT(Fecha_Solicitud,'dd-MM-yyyy') as Fecha_Solicitud,Empresa,Nombre_Cliente,Rut_Cliente,Nombre_Conductor,Patente_Vehiculo,Detalle_guia_Despacho  FROM Guia_Despachos with(nolock) where Correlativo_Guia_Despacho ='" + Session["Numero_Guia_Imprimir"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();

            lbl_Correlativo.Text = dr["Correlativo_Guia_Despacho"].ToString();
            lbluser.Text = dr["Usuario_Solicitante"].ToString();
            lblfecha.Text = dr["Fecha_Solicitud"].ToString();
            lblempresa.Text = dr["Empresa"].ToString();
            lblnombre.Text = dr["Nombre_Cliente"].ToString();
            lblpatente.Text = dr["Patente_Vehiculo"].ToString();
            lblconductor.Text = dr["Nombre_Conductor"].ToString();
            lbldetalle.Text = dr["Detalle_guia_Despacho"].ToString();
            lblrut.Text = dr["Rut_Cliente"].ToString();
            Conn.Close();
        }
    }
}