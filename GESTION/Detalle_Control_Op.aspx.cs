using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Control_Operaciones
{
    public partial class Detalle_Control_Op : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblidreg.Text = Session["IdRegistro"].ToString();

            if (!Page.IsPostBack)
            {

                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                DateTime Hoy = DateTime.Today;
                cmd.CommandText = "SELECT id_Control,Naviera,Cliente,Operacion,MBL_HBL,ETA,F_Entrega,Customer,A_LLegada,Canje,P_Facturas,Sidemar,Oservacion,ObservacionG,Tipo,Presentacion,Usuario_Registro,Fecha_Registro FROM Controlop where id_Control ='" + Session["IdRegistro"]  + "'";
                dr = cmd.ExecuteReader();
                dr.Read();

                //aqui ahi que cargar 


                ddlNaviera.SelectedValue =  dr["Naviera"].ToString();
                txtCliente.Text = dr["Cliente"].ToString();
                txtmbl.Text = dr["MBL_HBL"].ToString();
                txteta.Text = dr["ETA"].ToString();
                txtfentrega.Text = dr["F_Entrega"].ToString();
                ddlcustomer.SelectedValue = dr["Customer"].ToString();
             
               cballegada.Checked = Boolean.Parse(dr["A_LLegada"].ToString());
               cbcanje.Checked = Boolean.Parse(dr["Canje"].ToString());
               cbsidemar.Checked = Boolean.Parse(dr["Sidemar"].ToString());
               cbpresentacion.Checked = Boolean.Parse(dr["Presentacion"].ToString());
               txtoperacion.Text = dr["Operacion"].ToString();
               ddltipo.SelectedValue = dr["Tipo"].ToString();
               txtpfactura.Text = dr["P_Facturas"].ToString();
               txtobserv.Text = dr["P_Facturas"].ToString();
               txtobservg.Text = dr["P_Facturas"].ToString();


            Conn.Close();

                gvregistros.DataBind();



            }// cierre del postback


        }

        protected void gvregistros_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["IdRegistro"] = int.Parse(gvregistros.SelectedValue.ToString());
             Response.Redirect("~/Detalle_Control_Op.aspx");

        



        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
           try
            {

                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                DateTime Hoy = DateTime.Today;
                cmd.CommandText = "UPDATE Controlop SET Naviera = '"+ ddlNaviera.SelectedValue +"',Cliente = '"+ txtCliente.Text +"',MBL_HBL = '"+ txtmbl.Text +"',ETA = '"+ txteta.Text +"',F_Entrega = '"+ txtfentrega.Text +"',Customer = '"+ ddlcustomer.SelectedValue +"',A_LLegada = '"+ cballegada.Checked +"',Canje = '"+ cbcanje.Checked +"',P_Facturas = '"+ txtpfactura.Text +"',Sidemar = '"+ cbsidemar.Checked +"',Oservacion = '"+ txtobserv.Text +"',ObservacionG = '"+ txtobservg.Text +"',Tipo = '"+ ddltipo.SelectedValue +"',Presentacion = '"+ cbpresentacion.Checked +"',Operacion = '"+ txtoperacion.Text +"' WHERE id_Control = '" + Session["IdRegistro"] + "'";
                dr = cmd.ExecuteReader();


                dr.Read();

                Conn.Close();

                Alertaok.Visible = true;
                Alertanook.Visible = false;
                Alertamodificarok.Visible = false;
                modificarnook.Visible = false;
                gvregistros.DataBind();


                ddlNaviera.Enabled = false;
                txtCliente.Enabled = false;
                txtmbl.Enabled = false;
                txteta.Enabled = false;
                txtfentrega.Enabled = false;
                ddlcustomer.Enabled = false;





                txtoperacion.Enabled = false;
                ddltipo.Enabled = false;
                txtpfactura.Enabled = false;
                txtobserv.Enabled = false;
                txtobservg.Enabled = false;




            }
            catch (Exception ex)
            {
                Alertanook.Visible = true;
                Alertaok.Visible = false;
                Alertamodificarok.Visible = false;
                modificarnook.Visible = false;
            }
    
        }




        protected void btnmodificar_Click(object sender, EventArgs e)
        {

            string validar = Session["Modificar"].ToString();
            if (validar == "SI")
            {
                Alertamodificarok.Visible = true;
                modificarnook.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;

                btnmodificar.Visible = false;


                ddlNaviera.Enabled = true;
                txtCliente.Enabled = true;
                txtmbl.Enabled = true;
                txteta.Enabled = true;
                txtfentrega.Enabled = true;
                ddlcustomer.Enabled = true;

                cballegada.Enabled = true;
                cbcanje.Enabled = true;
                cbsidemar.Enabled = true;
                cbpresentacion.Enabled = true;
                txtoperacion.Enabled = true;
                ddltipo.Enabled = true;
                txtpfactura.Enabled = true;
                txtobserv.Enabled = true;
                txtobservg.Enabled = true;

            }
            else {

                Alertamodificarok.Visible = false;
                modificarnook.Visible = true;

                Alertaok.Visible = false;
                Alertanook.Visible = false;


            }

        }


    }
}