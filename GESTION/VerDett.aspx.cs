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
using System.Net.Mail;
using System.Text;

namespace GESTION.PagoFacturas
{
    public partial class VerDett : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblid.Text = Session["IDINVOICE"].ToString();
                SqlConnection Conn = new SqlConnection
                {
                    ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
                };
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT id_factura,empresa,agente,ninvoice,FINVOICE,nnc,vnc,fnc,linkpdf,moneda,tc,condicion,observ,detalle,usuario,fechaingreso,estado ,fechapago  FROM Facturas2 WITH(NOLOCK) where id_factura ='" + lblid.Text + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                ddlempr.SelectedValue = dr["empresa"].ToString();
                ddlagente.SelectedValue = dr["agente"].ToString();
                Session["agentecobros"] = dr["agente"].ToString();
                txtNInvoice.Text = dr["ninvoice"].ToString();
                txtfechainvoice.Text = dr["FINVOICE"].ToString();
                txttc.Text= dr["tc"].ToString();
                ddlmoneda.SelectedValue = dr["moneda"].ToString();
                Session["moned"] = dr["moneda"].ToString();
                DDLESTADO.SelectedValue = dr["estado"].ToString();
                ddluser.SelectedValue = dr["usuario"].ToString();
                TXTINGRESO.Text = dr["fechaingreso"].ToString();
                txtfpago.Text= dr["fechapago"].ToString();
                txtcondicion.Text= dr["condicion"].ToString();
                txtdetalle.Text = dr["detalle"].ToString();
                txtobserv.Text = dr["observ"].ToString();
                txtnumnc.Text = dr["nnc"].ToString();
                txtvalornc.Text = dr["vnc"].ToString();
                txtfechanc.Text= dr["fnc"].ToString();
                Session["Link"] = dr["linkpdf"].ToString();
                lblmoneda.Text = dr["moneda"].ToString();
                Conn.Close();
                Pagos();
                Saldo();
                RevisarDeudas();
                lblmensaje.Visible = false;
                repetidos();
            }//cierre del postback
   
        }

        protected void txtNInvoice_TextChanged(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT id_factura,empresa,agente,ninvoice,FINVOICE,nnc,vnc,fnc,linkpdf,moneda,tc,condicion,observ,detalle,usuario,fechaingreso,estado ,fechapago  FROM Facturas2 WITH(NOLOCK) where ninvoice ='" + txtNInvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblmensaje.Visible = false;
            // aqui hay que programar si no existe 
            BuscarRegistro();
            if (Session["existe"].ToString()=="0")
            {
                lblid.Text = "No existe Registro";
                lblmontot.Text = "0";
                lblpagos.Text = "0";
                lblSaldo.Text = "0";
                lblpesos.Text = "0";
                lblmensaje.Visible = false;
                } else {
                ddlempr.SelectedValue = dr["empresa"].ToString();
                ddlagente.SelectedValue = dr["agente"].ToString();
                txtfechainvoice.Text = dr["FINVOICE"].ToString();
                txttc.Text = dr["tc"].ToString();
                ddlmoneda.SelectedValue = dr["moneda"].ToString();
                DDLESTADO.SelectedValue = dr["estado"].ToString();
                ddluser.SelectedValue = dr["usuario"].ToString();
                TXTINGRESO.Text = dr["fechaingreso"].ToString();
                txtfpago.Text = dr["fechapago"].ToString();
                txtcondicion.Text = dr["condicion"].ToString();
                txtdetalle.Text = dr["detalle"].ToString();
                txtobserv.Text = dr["observ"].ToString();
                txtnumnc.Text = dr["nnc"].ToString();
                txtvalornc.Text = dr["vnc"].ToString();
                txtfechanc.Text = dr["fnc"].ToString();
                lblid.Text = dr["id_factura"].ToString();
                Session["Link"] = dr["linkpdf"].ToString();
                lblmoneda.Text = dr["moneda"].ToString();
                RevisarDeudas();
                Pagos();
                Saldo();
                RevisarDeudas();
                lblmensaje.Visible = false;
                repetidos();
                }
            Conn.Close();
         }

        protected void pdf_Click(object sender, ImageClickEventArgs e){
          System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            response.ClearContent();
            response.Clear();
            response.ContentType = "text/plain";
              response.AddHeader("Content-Disposition",
                                  "attachment; filename=Invoice " + txtNInvoice.Text + ".pdf;");
            response.TransmitFile(Server.MapPath("" + Session["Link"] + ""));
            response.Flush();
            response.End();
           }

        protected void btnPagar_Click(object sender, ImageClickEventArgs e){
            string validar = Session["Registrar"].ToString();
            if (validar == "SI"){
                Session["IDINVOICE"] = lblid.Text;
                   Response.Redirect("~/RealizarPago.aspx");
                  }else {
                lblmensaje.Text = "No Posee Permisos,contacte Administrador!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
             }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string validar = Session["Eliminar"].ToString();
            if (validar == "SI")
            {
                // aqui se hace conexion a BD para eliminar el registro 
                string eliminar = gvpagos.SelectedValue.ToString();
                SqlConnection Conn = new SqlConnection
                {
                    ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
                };
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "DELETE FROM Pagos_Facturas WITH(NOLOCK) WHERE Id_Pago ='" + eliminar + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                lblmensaje.Text = "Pago Eliminado!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
                // correo informando de la eliminacion 
                gvpagos.DataBind();
                Conn.Close();
            }else{
                lblmensaje.Text = "No Posee Permisos,contacte Administrador!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
            }
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
            cmd.CommandText = "SELECT COUNT(ninvoice) as contador  FROM Facturas2 WITH(NOLOCK) where ninvoice = '" + txtNInvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();

            int contador = int.Parse(dr["contador"].ToString());
            if (contador > 1)
            {
                lblrepetido.Visible = true;
                lblrepetido.Text = "Esta Invoice se Encuentra Ingresada por segunda vez , Favor Revisar antes de pagar";
                this.lblrepetido.ForeColor = System.Drawing.Color.Red;
            }
            Conn.Close();
        }

        private void Pagos()
        {
            //total de los pagos realizados
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT sum(Monto_Pago) as pagos  FROM Pagos_Facturas WITH(NOLOCK) where NInvoice = '" + txtNInvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Session["PagosRealizados"] = dr["pagos"].ToString();

            string pagos = dr["pagos"].ToString();
             if (pagos.ToString() == ""){
                lblpagos.Text = "0";
            }else {
                lblpagos.Text = pagos.ToString();
                            }
            Conn.Close();
        }

        private void Saldo()       
        {
            // total de las op por la tasa de cambio 
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT SUM(monto) as monto FROM Operaciones WITH(NOLOCK) where ninvoice ='" + txtNInvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            
            string montoop = dr["monto"].ToString();
            lblmontop.Text = montoop;
            lblNC.Text = txtvalornc.Text;
            Double montonc = (Convert.ToDouble(montoop.ToString()) - Convert.ToDouble(txtvalornc.Text));
            lblmontot.Text = montonc.ToString();

            //tranformacion a  pesos 
            double value2;
            value2 = montonc * Convert.ToDouble(txttc.Text);
            CultureInfo elGR = CultureInfo.CreateSpecificCulture("el-GR");
            Console.WriteLine(value2.ToString("0,0", elGR));
            lblpesos.Text = String.Format(elGR, "{0:0,0}", value2);
         //   lblmoneda.Text = Session["moned"].ToString();
       
            if (lblpagos.Text == "0") {
                lblSaldo.Text = lblmontot.Text; /// aquiii
                this.lblSaldo.ForeColor = System.Drawing.Color.Red;
            }else{
                double saldo = montonc - Convert.ToDouble(lblpagos.Text);
               lblSaldo.Text = saldo.ToString();
                this.lblSaldo.ForeColor = System.Drawing.Color.Red;
            }
            Conn.Close();

        }
        private void BuscarRegistro()
        {
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT count(id_factura) as existe FROM Facturas2 WITH(NOLOCK) where ninvoice ='" + txtNInvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Session["existe"] = dr["existe"].ToString();
            Conn.Close();
        }

        protected void gvoperaciones_SelectedIndexChanged(object sender, EventArgs e) {
          string validar = Session["Eliminar"].ToString();
            if (validar == "SI"){
                //aqui va a validar que no sea el unico registro 
                contar();
                int Contarelimin = int.Parse(Session["contaelimi"].ToString());
                if (Contarelimin > 1) { 
               string eliminar = gvoperaciones.SelectedValue.ToString();
                    SqlConnection Conn = new SqlConnection
                    {
                        ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
                    };
                    SqlCommand cmd = new SqlCommand();
                    SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "DELETE FROM Operaciones WHERE idop ='" + eliminar + "'";
                dr = cmd.ExecuteReader();
                dr.Read();

                lblmensaje.Text = "Operacion Eliminada!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                lblmensaje.Visible = true;

                // correo informando de la eliminacion 
                gvoperaciones.DataBind();
                Conn.Close();
                }
                else {
                    lblmensaje.Text = "Debe agregar Nueva OP primero y luego Eliminar la antigua";
                    this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                    lblmensaje.Visible = true;
                } // cierre de la validacion del conteo que no sea unico
            } else{
                lblmensaje.Text = "No Posee Permisos,contacte Administrador!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
            }
       }

        protected void btneliminvo_Click(object sender, ImageClickEventArgs e){
            string validar = Session["Eliminar"].ToString();
            if (validar == "SI"){
                SqlConnection Conn = new SqlConnection
                {
                    ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
                };
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "DELETE FROM Facturas2 WHERE id_factura ='" + lblid.Text  + "'";
                // aqui eliminar las operaciones y los pagos asociados a la invoice
                dr = cmd.ExecuteReader();
                dr.Read();
                lblmensaje.Text = "Invoice Eliminada!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                lblmensaje.Visible = true;
                gvoperaciones.DataBind();
                gvpagos.DataBind();
                Conn.Close();
                eliminarop();
                eliminarpago();
                maileliminar();
            }else {
                lblmensaje.Text = "No Posee Permisos,contacte Administrador!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
            }
        }

        protected void btngregarop_Click(object sender, ImageClickEventArgs e){
            string validar = Session["Registrar"].ToString();
            if (validar == "SI"){
                Session["NINVOICE"] = txtNInvoice.Text;
                  Response.Redirect("~/agregarop.aspx");
            }else {
                lblmensaje.Text = "No Posee Permisos,contacte Administrador!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
            }
        }

        protected void btnEnvMail_Click(object sender, ImageClickEventArgs e){
            SqlConnection cOnn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "SELECT id_Agente,Nombre,Correo  FROM Agentes2 WITH(NOLOCK) where Nombre = '" + ddlagente.SelectedValue + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Session["CorreoAgente"] = dr["Correo"].ToString();
            cOnn.Close();
            enviarmail();
        }


        public void enviarmail(){
            string validar = Session["Registrar"].ToString();
            if (validar == "SI")
            {
                SqlConnection cOnn = new SqlConnection
                {
                    ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
                };
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                cOnn.Open();
                cmd.Connection = cOnn;
                cmd.CommandText = "SELECT id_Mail,UserMail,PassMail,FirmaMail,PuertoMail,ServerMail,Estado,UserAvisoMail,UserUrgentMail FROM Mail WITH(NOLOCK)";
                dr = cmd.ExecuteReader();
                dr.Read();
            try{
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("" + dr["ServerMail"].ToString() + "");
                    mail.From = new MailAddress("" + dr["UserMail"].ToString() + "", "" + Session["Nombre"] + "  " + Session["Apellido"] + "", Encoding.UTF8);
                    mail.IsBodyHtml = true;
                    MailAddress bcc = new MailAddress("" + dr["UserAvisoMail"].ToString() + "");
                    mail.Bcc.Add(bcc);
                    mail.Subject = "Detalle de Pago Invoice Nº " + txtNInvoice.Text + "";
                    DateTime Hoy = DateTime.Today;
                    mail.Body = ("<strong> Estimados " + ddlagente.SelectedValue + ",<br/><br/><br/><br/>      Se ha Registrado un Pago de " + ddlempr.SelectedValue + " con Fecha : " + Hoy.ToString("dd-MM-yyyy") + " asociado a la Invoice Nº " + txtNInvoice.Text + ".<br/><br/><br/><br/><strong>Detalles</strong><br/><br/><br/>Monto OP: " + lblmontop.Text + "<br/>Valor N/C: " + lblNC.Text + " <br/>MontoTotal: " + lblmontot.Text + " " + lblmoneda.Text + "<br/>Monto Pesos : " + lblpesos.Text + " CLP <br/>Monto Pagado : " + lblpagos.Text + " <br/>Saldo Pendiente :  " + lblSaldo.Text + "  <br/><br/><br/><br/><br/>" + dr["FirmaMail"].ToString() + "");
                    mail.To.Add("" + Session["CorreoAgente"].ToString() + "");
                    SmtpServer.Port = int.Parse(dr["PuertoMail"].ToString());
                    SmtpServer.Credentials = new System.Net.NetworkCredential("" + dr["UserMail"].ToString() + "", "" + dr["PassMail"].ToString() + "");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
    
            }catch (Exception ex){

            }
            cOnn.Close();
            } else {
                lblmensaje.Text = "No Posee Permisos,contacte Administrador!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
            }
        }

        protected void btnMod_Click(object sender, ImageClickEventArgs e){
            string validar = Session["Modificar"].ToString();
            if (validar == "SI")
            {
                Response.Redirect("~/ModificarPagos.aspx");
                Session["IDINVOICE"] = lblid.Text;
                }else {
                lblmensaje.Text = "No Posee Permisos,contacte Administrador!";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
            }
        }

        protected void eliminarop(){
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "DELETE FROM Operaciones WHERE ninvoice ='" + txtNInvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblmensaje.Text = "Registro Eliminado!!!!!!!!!!";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;
            Conn.Close();
         
        }
        protected void eliminarpago(){
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "DELETE FROM Pagos_Facturas WHERE NInvoice ='" + txtNInvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblmensaje.Text = "Registro Eliminado!!!!!!!!!!";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;
            Conn.Close();
        }

        public void maileliminar(){
            SqlConnection cOnn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "SELECT id_Mail,UserMail,PassMail,FirmaMail,PuertoMail,ServerMail,Estado,UserAvisoMail,UserUrgentMail FROM Mail WITH(NOLOCK)";
            dr = cmd.ExecuteReader();
            dr.Read();
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("" + dr["ServerMail"].ToString() + "");
            mail.From = new MailAddress("" + dr["UserMail"].ToString() + "", "" + Session["Nombre"] + "  " + Session["Apellido"] + "", Encoding.UTF8);
            mail.IsBodyHtml = true;
            mail.Subject = "Invoice Nº " + txtNInvoice.Text + " ha sido Eliminada";
            DateTime Hoy = DateTime.Today;
            mail.Body = ("<strong> El Usuario " + Session["Nombre"].ToString() + " " + Session["Apellido"].ToString() + " ha Eliminado un Registro con Fecha : " + Hoy.ToString("dd-MM-yyyy") + " asociado a la Invoice Nº " + txtNInvoice.Text + " <br/><br/><br/><br/><br/>" + dr["FirmaMail"].ToString() + "");
            mail.To.Add("" + dr["UserAvisoMail"].ToString() + "");

            SmtpServer.Port = int.Parse(dr["PuertoMail"].ToString());
            SmtpServer.Credentials = new System.Net.NetworkCredential("" + dr["UserMail"].ToString() + "", "" + dr["PassMail"].ToString() + "");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            cOnn.Close();
        }


        public void contar(){
            SqlConnection cOnn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "SELECT count(idop) as contador FROM Operaciones WITH(NOLOCK)  where ninvoice ='" + txtNInvoice.Text +"' ";
            dr = cmd.ExecuteReader();
            dr.Read();
            Session["contaelimi"] = dr["contador"].ToString();
            cOnn.Close();
        }

        public void RevisarDeudas(){
            SqlConnection cOnn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "SELECT count(ID_Cobro) as cont FROM CobranzaAgentes WITH(NOLOCK) where EstadoDocumento = 'Pendiente' and  Agente = '" + Session["agentecobros"].ToString() + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            int valor = int.Parse(dr["cont"].ToString());
            if (valor == 0) {
                lblcobro.Visible = false;
                linkver.Visible = false;
            }else{
                lblcobro.Visible = true;
                linkver.Visible = true;
            }
            cOnn.Close();
        }

        protected void linkver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CobranzaAgentes.aspx");
        }
    }


    }
