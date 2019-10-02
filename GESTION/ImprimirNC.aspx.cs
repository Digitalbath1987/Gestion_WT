using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gestion.CapadeDatos;
using Entidades.Gestion;
using System.Data.SqlClient;


namespace GESTION.Otros
{
    public partial class ImprimirNC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT  NotaCreditos.id_NC,NotaCreditos.fecha,Empresas.RazonSocial,NotaCreditos.Cliente,NotaCreditos.RUT,NotaCreditos.Motivo,NotaCreditos.Detalle ,NotaCreditos.NOperación,NotaCreditos.NFactura,NotaCreditos.FechaFactura,TipoFactura.TipoFactura,NotaCreditos.MontoNetoFact,NotaCreditos.MontoIVAFact,NotaCreditos.MontoExentoFact,NotaCreditos.TotalFact,NotaCreditos.MontoNetoNC,NotaCreditos.MontoIVANC,NotaCreditos.MontoExentoNC,NotaCreditos.TotalNC,NotaCreditos.Vendedor,NotaCreditos.NFReemplazante,NotaCreditos.tiponota,Usuarios.Usuario  from NotaCreditos, Empresas,TipoFactura, Usuarios where NotaCreditos.Empresa = Empresas.id_Empresa and NotaCreditos.idTipoFactura = TipoFactura.id_TipoFactura and NotaCreditos.id_Usuario = Usuarios.id_Usuario and NotaCreditos.id_NC = '" + Session["SelectedverNC"] + "' ";
            dr = cmd.ExecuteReader();
            dr.Read();

            lblusuario.Text = dr["Usuario"].ToString();
            lblnsolicitud.Text = dr["id_NC"].ToString();
            lblfechasolicitud.Text = dr["fecha"].ToString();
            lblempresa.Text = dr["RazonSocial"].ToString();
            lblcliente.Text = dr["Cliente"].ToString();
            lblrut.Text = dr["RUT"].ToString();
            lblmotivo.Text = dr["Motivo"].ToString();
            lbldetallemotivo.Text = dr["Detalle"].ToString();
            lbloperacion.Text = dr["NOperación"].ToString();
            lblnfactura.Text = dr["NFactura"].ToString();
            lblfechafactura.Text = dr["FechaFactura"].ToString();
            lbltipofactura.Text = dr["TipoFactura"].ToString();
            lblfiva.Text = dr["MontoIVAFact"].ToString();
            lblfneto.Text = dr["MontoNetoFact"].ToString();
            lblfexenta.Text = dr["MontoExentoFact"].ToString();
            lblftotal.Text = dr["TotalFact"].ToString();
            lblncneto.Text = dr["MontoNetoNC"].ToString();
            lblnciva.Text = dr["MontoIVANC"].ToString();
            lblncexento.Text = dr["MontoExentoNC"].ToString();
            lblnctotal.Text = dr["TotalNC"].ToString();
            lblfreemplazante.Text= dr["NFReemplazante"].ToString();
            lblvendedor.Text =  dr["Vendedor"].ToString();
            string tnota = dr["tiponota"].ToString();
            if (tnota == "Nota de Debito")
            {
                tiponota.Text = dr["tiponota"].ToString();

            }



            if (lblempresa.Text == "World Transport Int. Ltda")
            {

                wti.Visible = true;
            }
            else if (lblempresa.Text == "Tres Vias Ltda ")
            {


                tr3s.Visible = true;
            }
            else if (lblempresa.Text == "World Transport Courier ltda")
                {
                courier.Visible = true;
                }


        }
    }
}