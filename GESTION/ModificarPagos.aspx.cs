using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.PagoFacturas
{
    public partial class ModificarPagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack){
                lblid.Text = Session["IDINVOICE"].ToString();
                SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT id_factura,empresa,agente,ninvoice,FINVOICE,nnc,vnc,fnc,linkpdf,moneda,tc,condicion,observ,detalle,usuario,fechaingreso,estado ,fechapago  FROM Facturas2 where id_factura ='" + lblid.Text + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                ddlempresa.SelectedValue = dr["empresa"].ToString();
                ddlagente.SelectedValue = dr["agente"].ToString();
                txtinvoice.Text = dr["ninvoice"].ToString();
                txtfechaInvoice.Text = dr["FINVOICE"].ToString();
                txttc.Text = dr["tc"].ToString();
                ddlmoneda.SelectedValue = dr["moneda"].ToString();
                ddlestado.SelectedValue = dr["estado"].ToString();
                txtfechaIngreso.Text = dr["fechaingreso"].ToString();
                txtfechapago.Text = dr["fechapago"].ToString();
                ddlcondicion.Text = dr["condicion"].ToString();
                txtdetalle.Text = dr["detalle"].ToString();
                txtobserv.Text = dr["observ"].ToString();
                txtnnc.Text = dr["nnc"].ToString();
                txtvalornc.Text = dr["vnc"].ToString();
                txtfechanc.Text = dr["fnc"].ToString();
                Session["modopinvo"] = dr["ninvoice"].ToString();

                Conn.Close();
             }//cierre del postback




        }

        protected void btnmod_Click(object sender, ImageClickEventArgs e)
        {
            if (rbmod.Text =="NO") {
            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "UPDATE Facturas2 SET empresa ='"+ ddlempresa.SelectedValue  +"',agente ='"+ ddlagente.SelectedValue  +"',ninvoice ='"+ txtinvoice.Text +"',FINVOICE ='"+ txtfechaInvoice.Text +"',nnc ='"+ txtnnc.Text +"',vnc ='"+ txtvalornc.Text +"',fnc ='"+ txtfechanc.Text +"',moneda ='"+ ddlmoneda.SelectedValue +"',tc ='"+ txttc.Text +"',condicion ='"+ ddlcondicion.SelectedValue +"',observ ='"+ txtobserv.Text +"',detalle ='"+ txtdetalle.Text +"',fechaingreso ='"+ txtfechaIngreso.Text +"',estado ='"+ ddlestado.SelectedValue +"',fechapago ='"+ txtfechapago.Text +"'WHERE id_factura='"+ lblid.Text +"'";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblmensaje.Text = "Los Datos se Actualizaron Correctamente ....";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;
            Conn.Close();
            maileliminar();

                // aqui hay que mod la op y el pago 
                modop();
                modpago();

            }
            else {


                if (IsPostBack)
                {
                    Boolean fileOK = false;
                     String path = Server.MapPath("/Gestion2/PagoFacturas/PDF/");
                    //  String path = Server.MapPath("/PagoFacturas/PDF/");
                    if (flupload.HasFile)
                    {
                        String fileExtension = System.IO.Path.GetExtension(flupload.FileName).ToLower();
                        String[] allowedExtensions = { ".PDF", ".pdf" };//formatos admitidos
                        for (int i = 0; i < allowedExtensions.Length; i++)
                        {
                            if (fileExtension == allowedExtensions[i])
                            {
                                fileOK = true;
                            }
                            else {
                                lblmensaje.Text = "El Formato debe ser en PDF";
                            }
                        }
                        if (fileOK)
                        {
                            flupload.PostedFile.SaveAs(path + flupload.FileName);
                            lblmensaje.Text = "File uploaded!";
                              string linkpdf   = "/Gestion2/PagoFacturas/PDF/" + flupload.FileName + ""; //SE ASIGNA LA DIRECCION DEL PDF
                                                                                                         //  string linkpdf   = "/PagoFacturas/PDF/" + flupload.FileName + ""; //SE ASIGNA LA DIRECCION DEL PDF


                            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                            SqlCommand cmd = new SqlCommand();
                            SqlDataReader dr;
                            Conn.Open();
                            cmd.Connection = Conn;
                            cmd.CommandText = "UPDATE Facturas2 SET empresa ='" + ddlempresa.SelectedValue + "',agente ='" + ddlagente.SelectedValue + "',ninvoice ='" + txtinvoice.Text + "',FINVOICE ='" + txtfechaInvoice.Text + "',nnc ='" + txtnnc.Text + "',vnc ='" + txtvalornc.Text + "',fnc ='" + txtfechanc.Text + "',moneda ='" + ddlmoneda.SelectedValue + "',tc ='" + txttc.Text + "',condicion ='" + ddlcondicion.SelectedValue + "',observ ='" + txtobserv.Text + "',detalle ='" + txtdetalle.Text + "',fechaingreso ='" + txtfechaIngreso.Text + "',estado ='" + ddlestado.SelectedValue + "',linkpdf ='" + linkpdf + "',fechapago ='" + txtfechapago.Text + "'WHERE id_factura='" + lblid.Text + "'";
                            dr = cmd.ExecuteReader();
                            dr.Read();
                            lblmensaje.Text = "Los Datos se Actualizaron Correctamente ....";
                            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                            lblmensaje.Visible = true;
                            Conn.Close();
                            maileliminar();

                            // aqui hay que mod la op y el pago 
                            modop();
                            modpago();


                        }
                        else {
                            lblmensaje.Text = "Cannot accept files of this type.";
                        }
                    }
                }// cierre de la carga del archivo
                

            }
            

        }

        public void maileliminar()
        {
            SqlConnection cOnn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "SELECT id_Mail,UserMail,PassMail,FirmaMail,PuertoMail,ServerMail,Estado,UserAvisoMail,UserUrgentMail FROM Mail";
            dr = cmd.ExecuteReader();
            dr.Read();
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("" + dr["ServerMail"].ToString() + "");
            mail.From = new MailAddress("" + dr["UserMail"].ToString() + "", "" + Session["Nombre"] + "  " + Session["Apellido"] + "", Encoding.UTF8);
            mail.IsBodyHtml = true;
            mail.Subject = "Invoice Nº " + txtinvoice.Text + " ha sido Modificada";
            DateTime Hoy = DateTime.Today;
            mail.Body = ("<strong> El Usuario " + Session["Nombre"].ToString() + " " + Session["Apellido"].ToString() + " ha Modificado un Registro con Fecha : " + Hoy.ToString("dd-MM-yyyy") + " asociado a la Invoice Nº " + txtinvoice.Text + " ID : " + lblid.Text + "  <br/><br/><br/><br/><br/>" + dr["FirmaMail"].ToString() + "");
            mail.To.Add("" + dr["UserAvisoMail"].ToString() + "");

            SmtpServer.Port = int.Parse(dr["PuertoMail"].ToString());
            SmtpServer.Credentials = new System.Net.NetworkCredential("" + dr["UserMail"].ToString() + "", "" + dr["PassMail"].ToString() + "");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            cOnn.Close();
        }

        protected void rbmod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbmod.Text == "SI")
            {
                flupload.Visible = true;

            }
            else
            {
                flupload.Visible = false;

            }
         }

        protected void modop()
        {

            SqlConnection cOnn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "UPDATE Operaciones SET ninvoice = '"+ txtinvoice.Text +"' WHERE ninvoice = '"+ Session["modopinvo"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            cOnn.Close();
        }

        protected void modpago()
        {

            SqlConnection cOnn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "UPDATE Pagos_Facturas SET NInvoice = '"+ txtinvoice.Text +"' WHERE NInvoice = '"+ Session["modopinvo"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            cOnn.Close();

            
        }












    }
    
}
