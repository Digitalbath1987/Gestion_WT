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
using System.Globalization;


namespace GESTION.PagoFacturas
{
    public partial class RealizarPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblID.Text = Session["IDINVOICE"].ToString();
                SqlConnection Conn = new SqlConnection
                {
                    ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
                };
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT id_factura,empresa,agente,ninvoice,FINVOICE,nnc,vnc,fnc,linkpdf,moneda,tc,condicion,observ,detalle,usuario,fechaingreso,estado,fechapago  FROM Facturas2 with(nolock) where id_factura ='" + lblID.Text + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                lblninvoice.Text = dr["ninvoice"].ToString();
                lblempresa.Text = dr["empresa"].ToString();
                lblagente.Text = dr["agente"].ToString();
                Session["montoNC"] = dr["vnc"].ToString();
                Session["NUMInvoice"] = dr["ninvoice"].ToString();
                Session["montoTC"] = dr["tc"].ToString();
                Session["money"] = dr["moneda"].ToString();
                Session["Fecha"] = dr["fechaingreso"].ToString();
                Conn.Close();
                Deuda();
                Pagos();
                //aqui se calcula el saldo pendiente 
                double TOTAL;
                TOTAL = Convert.ToDouble(lbltotdeuda.Text)- Convert.ToDouble(lblmontpag.Text);
                lblsaldpend.Text = TOTAL.ToString();
                txtmontpaga.Text = lblsaldpend.Text;
                if (lblsaldpend.Text == "0"){
                    this.lblsaldpend.ForeColor = System.Drawing.Color.Green;
                    txtmontpaga.Enabled = false;
                    btnPagar.Enabled = false;
                }else {
                this.lblsaldpend.ForeColor = System.Drawing.Color.Red;
                }

                repetidos();
            }
        }

        private void Deuda()
        {
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT SUM(monto) as monto FROM Operaciones with(nolock) where ninvoice ='" + Session["NUMInvoice"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            lbltotal.Text = dr["monto"].ToString(); //asignamos el valor del monto de la OP
            money.Text = Session["money"].ToString();
            VNotaCred.Text = Session["montoNC"].ToString();
            double montosnc = Convert.ToDouble(dr["monto"].ToString()) - Convert.ToDouble(Session["montoNC"].ToString());
            lbltotdeuda.Text = montosnc.ToString(); //Asignamos el valor total restando la nota de credito
            double montos;
            montos = montosnc * Convert.ToDouble(Session["montoTC"].ToString());
            CultureInfo elGR = CultureInfo.CreateSpecificCulture("el-GR");
            Console.WriteLine(montos.ToString("0,0", elGR));
            lblpesos.Text = String.Format(elGR, "{0:0,0}", montos);// transformamos en pesos 
            lblTCambio.Text = Session["montoTC"].ToString();
            lblFecha.Text = Session["Fecha"].ToString();
            Conn.Close();
        }

        private void Pagos()
        {
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT sum(Monto_Pago) as pagos  FROM Pagos_Facturas with(nolock) where NInvoice = '" + Session["NUMInvoice"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Session["Pagados"]= dr["pagos"].ToString();
            if (Session["Pagados"].ToString() == "" ){
             lblmontpag.Text = "0";
            }else{
            lblmontpag.Text = Session["Pagados"].ToString();
            }
            Conn.Close();
        }


        private void repetidos()
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
            cmd.CommandText = "SELECT COUNT(ninvoice) as contador  FROM Facturas2 with(nolock) where ninvoice = '" + lblninvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            int contador =  int.Parse(dr["contador"].ToString());
            if (contador>1){
                lblrepetido.Visible = true;
                lblrepetido.Text = "Esta Invoice se Encuentra Ingresada por segunda vez , Favor Revisar antes de pagar";
                this.lblrepetido.ForeColor = System.Drawing.Color.Red;
            }
            Conn.Close();
        }

        protected void btnPagar_Click(object sender, ImageClickEventArgs e)
        {
            string validar = Session["Registrar"].ToString();
            if (validar == "SI"){
            if (lblsaldpend.Text == "0") {
                lblmensaje.Text = "no exite saldo pendiente";
                lblmensaje.Visible = true;
                this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                lblmensaje.Visible = true;
                }else{
                // cambio las comas por puntos
                string maskValores = "###########.##";
                string formateado = Convert.ToDecimal(txtmontpaga.Text).ToString(maskValores, CultureInfo.GetCultureInfo("en-US"));
                //comienza el registro del pago
                SqlConnection Conn = new SqlConnection
                {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
                };
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                DateTime Hoy = DateTime.Today;
                cmd.Connection = Conn;
                cmd.CommandText = "INSERT INTO Pagos_Facturas(User_Pago,Fecha_Pago,Banco,Monto_Pago,Detalle_Pago,NInvoice)VALUES('" + Session["Usuario"] + "','" + Hoy.ToString("yyyy-MM-dd") + "','" + ddlbanco.SelectedValue + "','" + formateado + "','" + txtdetallep.Text + "','" + lblninvoice.Text + "')";
                dr = cmd.ExecuteReader();
                dr.Read();
                // si el saldo es 0 cambiar al estado pagado 
                    Deuda();
                    Pagos();
                    //aqui se calcula el saldo pendiente 
                    double TOTAL;
                    TOTAL = Convert.ToDouble(lbltotdeuda.Text) - Convert.ToDouble(lblmontpag.Text);
                    lblsaldpend.Text = TOTAL.ToString();
                    txtmontpaga.Text = lblsaldpend.Text;
                    if (lblsaldpend.Text == "0")
                    {
                        txtmontpaga.Enabled = false;
                        btnPagar.Enabled = false;
                        cambiar_estado();
                    }
                    
                // falta programar envio de correo aqui informando el pago 
                                             
                }
                } else {
                lblmensaje.Text = "No Posee Permisos , Contacte al administrador";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
            }

        }

        protected void btnVolver_Click(object sender, ImageClickEventArgs e)
        {
               Response.Redirect("~/VerDett.aspx");
          
        }

        private void cambiar_estado()
        {

            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "UPDATE Facturas2  SET estado ='PAGADO' WHERE ninvoice = '"+ lblninvoice.Text +"'";
            dr = cmd.ExecuteReader();
            dr.Read();
             Response.Redirect("~/VerDett.aspx");
            //  Response.Redirect("/PagoFacturas/VerDett.aspx");

        }


    }
}