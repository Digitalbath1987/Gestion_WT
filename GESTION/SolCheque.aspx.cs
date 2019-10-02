using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Configuration;
using Entidades.Gestion;
using Gestion.CapadeDatos;
using System.Globalization;
using System.Net;
using System.Text.RegularExpressions;
using System.Net.Mail;


namespace GESTION.Cheques
{
    public partial class SolCheque : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                      

            if (!Page.IsPostBack){
                txtnombre.Text = "" + Session["Nombre"] + "  " + Session["Apellido"] + "";
                Session["notadecobro"] = "FALSE";
            }
            
        }
        

        protected void txtrut_TextChanged(object sender, EventArgs e)
        {
           txtrutmod.Text = lblrut.Text;
           txtrutmod.DataBind();
            cargardatos();

        }
        protected void ModMoneyUSD_Click(object sender, EventArgs e)
        {
            lblmoney.Text = "USD";
        }
        protected void ModMoneyCLP_Click(object sender, EventArgs e)
        {
            lblmoney.Text = "CLP";
        }
        protected void ModMoneyEUR_Click(object sender, EventArgs e)
        {
            lblmoney.Text = "EUR";
        }

        protected void Ver_ServerClick(object sender, EventArgs e)
        {

        }

        protected void Registrar_ServerClick(object sender, EventArgs e)
        {
            asignar_folio(); // busca el ultimo registro y le suma +1
            Registrar_sol_Cheque(); //inserta con el valor entregado en la clase asignar_folio()
            gvregistros.DataBind();
            txtdescripcion.Text = "";
            txtrut.Text = "";
            txtnoperacion.Text = "";
            txtmonto.Text = "";
            txtncarpeta.Text = "";
            Session["SolCheque"] = Session["contador"].ToString();
            Response.Redirect("~/VerDetalleNcobro.aspx");
        }

        protected void Registrar_sol_Cheque()
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            DateTime Hoy = DateTime.Today;
            cmd.CommandText = "INSERT INTO Sol_Cheques(Ncorrelativo,Empresa,Nombre_Solicitante,Rut_Receptor,Descripcion,Moneda,Monto,Carpeta,Operacion,Embarque,Nota_Cobro,Usuario,Estado,Fecha_Registro,Tipo,Beneficiario) VALUES('" + Session["contador"] + "','" + ddlEmpresa.SelectedValue + "','" + txtnombre.Text + "','" + txtrut.Text + "','" + txtdescripcion.Text + "','" + lblmoney.Text + "','" + txtmonto.Text + "','" + txtncarpeta.Text + "','" + txtnoperacion.Text + "','" + txtembarque.Text + "','" + Session["notadecobro"] + "','" + Session["Usuario"] + "','3','" + Hoy.ToString("dd-MM-yyyy") + "','" + ddltipo.SelectedValue + "','"+ txtNomBeneficiario.Text +"')";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
            ok.Visible = true;
            nook.Visible = false;
        }


        


        protected void asignar_folio()
        {
                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT TOP 1 Ncorrelativo as contador FROM Sol_Cheques WITH(NOLOCK) order by ID desc";
                dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows){
                int contador = int.Parse(dr["contador"].ToString()) + 1;
                Session["contador"] = contador.ToString();
                }else{

                }
                Conn.Close();
           

        }



        protected void gvFacturas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SolCheque"] = int.Parse(gvregistros.SelectedValue.ToString());
            Response.Redirect(" ~/VerDetalleNcobro.aspx");
        }

        protected void btncancelar_ServerClick(object sender, EventArgs e)
        {
        Page.DataBind();
         
        }

        protected void cargardatos()
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT Rut,Nombre_Empresa,Ciudad,Comuna,Direccion,Telefono,Giro FROM Clientes WITH(NOLOCK) where rut='" + txtrutmod.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                txtciudadmod.Text = dr["Ciudad"].ToString();
                txtcommod.Text = dr["Comuna"].ToString();
                txtseñmod.Text = dr["Nombre_Empresa"].ToString();
                txtdireccmod.Text = dr["Direccion"].ToString();
                //  dd-MM-yyyy
                txttelfmod.Text = dr["Telefono"].ToString();
                txtgiromod.Text = dr["Giro"].ToString();
                DateTime Hoy = DateTime.Today;
                txtfemimod.Text = Hoy.ToString("yyyy-MM-dd");
                txtfechvencmod.Text = Hoy.AddDays(5).ToString("yyyy-MM-dd");
            }
            else
            {
                txtciudadmod.Text = "";
                txtcommod.Text = "";
                txtseñmod.Text = "";
                txtdireccmod.Text = "";
                txttelfmod.Text = "";
                txtgiromod.Text = "";



            }
            Conn.Close();


        }

        protected void CrearNotaC_ServerClick(object sender, EventArgs e)
        {

            cargardatos();

            string validar = txtseñmod.Text;

            if (validar == "")
            {

                rutnook.Visible = true;

            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "popuopmodal", "MostrarModalJS2();", true);
                rutnook.Visible = false;
            }




        }

        protected void btngrabartodo_ServerClick(object sender, EventArgs e)
        {

            Session["notadecobro"] = "True";
            asignar_folio(); // busca el ultimo registro y le suma +1
            Registrar_sol_Cheque(); //inserta con el valor entregado en la clase asignar_folio()
            gvregistros.DataBind();

            try
            {
                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "INSERT INTO NotadeCobro(Rut,Señores,Direccion,Comuna,Ciudad,Telefono,Giro,Fecha_Emision,Fecha_Vencimiento,Descripcion1,Descripcion2,Descripcion3,Descripcion4,Descripcion5,Descripcion6,Cantidad1,Cantidad2,Cantidad3,Cantidad4,Cantidad5,Cantidad6,Precio1,Precio2,Precio3,Precio4,Precio5,Precio6,Observacion,NdeCobro,Vendedor,Pagado)VALUES('" + txtrutmod.Text + "','" + txtseñmod.Text + "','" + txtdireccmod.Text + "','" + txtcommod.Text + "','" + txtciudadmod.Text + "','" + txttelfmod.Text + "','" + txtgiromod.Text + "','" + txtfemimod.Text + "','" + txtfechvencmod.Text + "','" + txtdescmod1.Text + "','" + txtdescmod2.Text + "','" + txtdescmod3.Text + "','" + txtdescmod4.Text + "','" + txtdescmod5.Text + "','" + txtdescmod6.Text + "','" + txtcantmod1.Text + "','" + txtcantmod2.Text + "','" + txtcantmod3.Text + "','" + txtcantmod4.Text + "','" + txtcantmod5.Text + "','" + txtcantmod6.Text + "','" + txtprecmod1.Text + "','" + txtprecmod2.Text + "','" + txtprecmod3.Text + "','" + txtprecmod4.Text + "','" + txtprecmod5.Text + "','" + txtprecmod6.Text + "','" + txtobservacion.Text + "','" + Session["contador"] + "','" + ddlVendedor.SelectedValue + "','False')";
                dr = cmd.ExecuteReader();
                dr.Read();
                Conn.Close();
                modal2ok.Visible = true;
                modal2oknook.Visible = false;
                gvregistros.DataBind();



               



                txtdescripcion.Text = "";
                txtrut.Text = "";
                txtnoperacion.Text = "";
                txtmonto.Text = "";
                txtncarpeta.Text = "";
                Session["SolCheque"] = Session["contador"].ToString();
                Response.Redirect("~/VerDetalleNcobro.aspx");
            }

            catch (Exception ex)
            {
                modal2oknook.Visible = true;
                modal2ok.Visible = false;
            }
        }
    }
}