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

namespace GESTION.Cheques
{
    public partial class ImprimirSolCheque : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e){

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT * FROM Sol_Cheques where Ncorrelativo = '" + Session["SolCheque"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();

            lblid.Text = dr["Ncorrelativo"].ToString();
            lbltipo.Text = dr["Tipo"].ToString();
            lblnombre.Text = dr["Nombre_Solicitante"].ToString();
            lblrut.Text = dr["Rut_Receptor"].ToString();
            lbldescripcion.Text = dr["Descripcion"].ToString();
            lblmoneda.Text = dr["Moneda"].ToString();
            lblmonto.Text = dr["Monto"].ToString();
            lblnumcarpe.Text = dr["Carpeta"].ToString();
            lblnumope.Text = dr["Operacion"].ToString();
            lblnumemb.Text = dr["Embarque"].ToString();
            lblnumchequ.Text = "";
            lbluser.Text = dr["Usuario"].ToString();
            lblfecha.Text = dr["Fecha_Registro"].ToString();
            lblBeneficiario.Text = dr["Beneficiario"].ToString();
            Boolean valor = Boolean.Parse(dr["Nota_Cobro"].ToString());

            
            if(valor == true  ){
                lblSI.Visible = true;
                lblNO.Visible = false;
                nota1.Visible = true;
                nota2.Visible = true;
                nota2.Text = dr["Ncorrelativo"].ToString();
            }
            else{

                lblNO.Visible = true;
                lblSI.Visible = false;
                nota1.Visible = false;
                nota2.Visible = false;

            }

            lblempresa.Text = dr["Empresa"].ToString();


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



            Conn.Close();
            

        }

        protected void rblnotadecobro_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}