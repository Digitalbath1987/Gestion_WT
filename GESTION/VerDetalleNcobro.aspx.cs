using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Cheques
{
    public partial class VerDetalleNcobro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack){

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT * FROM Sol_Cheques WITH(NOLOCK) where Ncorrelativo = '" + Session["SolCheque"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
             
                            lblid.Text = dr["Ncorrelativo"].ToString();
                            ddltipo.SelectedValue = dr["Tipo"].ToString();
                            ddlempresa.SelectedValue = dr["Empresa"].ToString();
                            txtnomsol.Text = dr["Nombre_Solicitante"].ToString();
                            txtrut.Text = dr["Rut_Receptor"].ToString();
                            txtDescripcion.Text = dr["Descripcion"].ToString();
                            ddlmoneda.SelectedValue = dr["Moneda"].ToString();
                            txtmonto.Text = dr["Monto"].ToString();
                            txtcarpeta.Text = dr["Carpeta"].ToString();
                            txtoperacion.Text = dr["Operacion"].ToString();
                            txtEmbarque.Text = dr["Embarque"].ToString();
                            lblbeneficiario.Text = dr["Beneficiario"].ToString();
                //txtnotaC.Text = dr["Nota_Cobro"].ToString();

                Boolean valor = Boolean.Parse(dr["Nota_Cobro"].ToString());

                if (valor == true)
                {
                    btnmprNCobro.Visible = true;
                    ddlvendedor.Visible = true;
                }
                else
                {
                    btnmprNCobro.Visible = false;
                    ddlvendedor.Visible = false;
                }
                Conn.Close();

                cargarnc();

            }//cierre del postback

        }

        protected void gvFacturas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SolCheque"] = int.Parse(gvregistros.SelectedValue.ToString());
            Response.Redirect("~/VerDetalleNcobro.aspx");



        }

        protected void cargarnc()
        {
            
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT *  FROM NotadeCobro WITH(NOLOCK) where NdeCobro ='" + Session["SolCheque"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();


            if (dr.HasRows)
            {
                //txtnotaC.Text = dr["NdeCobro"].ToString();
                txtncobronc.Text = dr["NdeCobro"].ToString();
                txtrutnc.Text = dr["Rut"].ToString();
                txtseñnc.Text = dr["Señores"].ToString();
                txtdireccionnc.Text = dr["Direccion"].ToString();
                txtcomnc.Text = dr["Comuna"].ToString();
                txtciudadnc.Text = dr["Ciudad"].ToString();
                txttelefononc.Text = dr["Telefono"].ToString();
                txtgironc.Text = dr["Giro"].ToString();
                txtfeminc.Text = dr["Fecha_Emision"].ToString();
                txtfvencnc.Text = dr["Fecha_Vencimiento"].ToString();
                txtdesc1.Text = dr["Descripcion1"].ToString();
                txtdesc2.Text = dr["Descripcion2"].ToString();
                txtdesc3.Text = dr["Descripcion3"].ToString();
                txtdesc4.Text = dr["Descripcion4"].ToString();
                txtdesc5.Text = dr["Descripcion5"].ToString();
                txtdesc6.Text = dr["Descripcion6"].ToString();
                txtcant1.Text = dr["Cantidad1"].ToString();
                txtcant2.Text = dr["Cantidad2"].ToString();
                txtcant3.Text = dr["Cantidad3"].ToString();
                txtcant4.Text = dr["Cantidad4"].ToString();
                txtcant5.Text = dr["Cantidad5"].ToString();
                txtcant6.Text = dr["Cantidad6"].ToString();
                txtprecio1.Text = dr["Precio1"].ToString();
                txtprecio2.Text = dr["Precio2"].ToString();
                txtprecio3.Text = dr["Precio3"].ToString();
                txtprecio4.Text = dr["Precio4"].ToString();
                txtprecio5.Text = dr["Precio5"].ToString();
                txtprecio6.Text = dr["Precio6"].ToString();
                ddlvendedor.SelectedValue = dr["Vendedor"].ToString();
            }
            else {


                //txtnotaC.Text = "";
                txtrutnc.Text = "";
                txtseñnc.Text = "";
                txtdireccionnc.Text = "";
                txtcomnc.Text = "";
                txtciudadnc.Text = "";
                txttelefononc.Text = "";
                txtgironc.Text = "";
                txtfeminc.Text = "";
                txtfvencnc.Text = "";
                txtdesc1.Text = "";
                txtdesc2.Text = "";
                txtdesc3.Text = "";
                txtdesc4.Text = "";
                txtdesc5.Text = "";
                txtdesc6.Text = "";
                txtcant1.Text = "";
                txtcant2.Text = "";
                txtcant3.Text = "";
                txtcant4.Text = "";
                txtcant5.Text = "";
                txtcant6.Text = "";
                txtprecio1.Text = "";
                txtprecio2.Text = "";
                txtprecio3.Text = "";
                txtprecio4.Text = "";
                txtprecio5.Text = "";
                txtprecio6.Text = "";
            }
                        Conn.Close();
        }



        protected void btnimprsol_Click(object sender, EventArgs e) {
            Session["SolCheque"] = lblid.Text;
           string str;
            str = "window.open('/Gestion2/ImprimirSolCheque.aspx','Sol_Cheques','width=980px,height=980px,sc rollbars=no,resizable=no')";
            Response.Write("<script languaje=javascript>" + str + "</script>");
        }


        protected void btnmprNCobro_Click(object sender, EventArgs e){
            Session["SolCheque"] = lblid.Text;
            string str;
            str = "window.open('/Gestion2/ImpNotaCob.aspx','Sol_Ncobro','width=1010px,height=980px,sc rollbars=no,resizable=no')";
            Response.Write("<script languaje=javascript>" + str + "</script>");
        }

        protected void ddltipo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_ServerClick(object sender, EventArgs e)
        {
            string validar = Session["Eliminar"].ToString();
            if (validar == "SI") {
                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "DELETE FROM Sol_Cheques  WHERE Ncorrelativo ='" + lblid.Text + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                Alertaok.Visible = true;
                Alertanook.Visible = false;
                Eliminar_NC();
                gvregistros.DataBind();
                Conn.Close();

            } else {

                Alertanook.Visible = true;

                Alertaok.Visible = false;
               
            }
        }

        protected void Eliminar_NC()
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "DELETE FROM NotadeCobro WHERE NdeCobro ='" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
        }


    }
}