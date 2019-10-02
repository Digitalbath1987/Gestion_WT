using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using Entidades.Gestion;
using Gestion.CapadeDatos;
using System.Globalization;
using System.Net;
using System.Text.RegularExpressions;
using System.Net.Mail;

namespace GESTION.PagoFacturas
{
    public partial class IngresarPagoFactura : System.Web.UI.Page{
 
        protected void Page_Load(object sender, EventArgs e){

            if (!Page.IsPostBack)
            {
                Session["cant"] = 1;
                txtvnc.Text = "0";
                txttc.Text = Session["dolar"].ToString();
                string validar = Session["Registrar"].ToString();
           
                DateTime today = DateTime.Now;
                DateTime answer = today.AddDays(30);
                fpago.Text = answer.ToString("yyyy-MM-dd");
             
                string DDL_Empresas_Eleccion = Session["Perfil"].ToString();

                if (DDL_Empresas_Eleccion == "Courier") { 
                DDL_EMP.SelectedValue = "World Transport Courier Ltda";
                    DDL_EMP.Enabled = false;
                }
                else if(DDL_Empresas_Eleccion == "Terrestre")
                {
                DDL_EMP.SelectedValue = "Tr3s Vias Ltda";
                    DDL_EMP.Enabled = false;

                }
                string validar2 = Session["Eliminar"].ToString();
                if (validar2 == "SI")
                {
                  //  lbltexeli.Visible = true;
                  //  txtideliminar.Visible = true;
                  //  btnEliminar.Visible = true;
                }
                Session["contex"] = 0;
                monto0.Text = "0";
                monto1.Text = "0";
                monto2.Text = "0";
                monto3.Text = "0";
                monto4.Text = "0";
                monto5.Text = "0";

            }
            calcular();
         }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlmoneda_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlmoneda.SelectedValue.ToString() == "USD")
            {
               
                txttc.Text = Session["dolar"].ToString();
                calcular();
            }
            else if (ddlmoneda.SelectedValue.ToString() == "EUR")
            {
               
                txttc.Text = Session["euro"].ToString();
                calcular();
            }
            else if (ddlmoneda.SelectedValue.ToString() == "GBP")
            {
                txttc.Text = "1";

                calcular();
            }
            else if (ddlmoneda.SelectedValue.ToString() == "CLP")
            {

                txttc.Text = "1";
   
                calcular();
            }
            else if (ddlmoneda.SelectedValue.ToString() == "CAD")
            {
  
                txttc.Text = "1";

                calcular();
            }
            else if (ddlmoneda.SelectedValue.ToString() == "NZD")
            {
   
                txttc.Text = "1";

                calcular();
            }
            else
            {
         
                txttc.Text = "1";

                calcular();

            }//cierre del if
        }

        private void calcular()
        {
            //suma de operaciones
            double valortotal;
            valortotal = (Convert.ToDouble(monto0.Text) + Convert.ToDouble(monto1.Text) + Convert.ToDouble(monto2.Text) + Convert.ToDouble(monto3.Text) + Convert.ToDouble(monto4.Text) + Convert.ToDouble(monto5.Text));
            txttotalop.Text = valortotal.ToString();
            //asignar nc 
            txtvnotac.Text = txtvnc.Text;

            //total entre op - nc
            txttneto.Text = (Convert.ToDouble(valortotal.ToString()) - Convert.ToDouble(txtvnc.Text)).ToString();

            //total en pesos
            double TOTAL;
            TOTAL = Convert.ToDouble(txttneto.Text) * Convert.ToDouble(txttc.Text);
            CultureInfo elGR1t = CultureInfo.CreateSpecificCulture("el-GR");
            Console.WriteLine(TOTAL.ToString("0,0", elGR1t));
            txttotal.Text = String.Format(elGR1t, "{0:0,0}", TOTAL);
        }

        protected void monto0_TextChanged(object sender, EventArgs e)
        {

            calcular();

        }

        protected void monto1_TextChanged(object sender, EventArgs e)
        {
            calcular();
        }

        protected void monto2_TextChanged(object sender, EventArgs e)
        {


            calcular();
        }

        protected void monto3_TextChanged(object sender, EventArgs e)
        {


            calcular();
        }

        protected void monto4_TextChanged(object sender, EventArgs e)
        {

            calcular();
        }

        protected void monto5_TextChanged(object sender, EventArgs e)
        {

            calcular();
        }
        
        protected void btnagreop_Click(object sender, EventArgs e)
        {
            int num = int.Parse(Session["contex"].ToString());
            switch (num)
            {
                case 0:
                    panop1.Visible = true;
                    op1.Visible = true;
                    monto1.Visible = true;
                    House1.Visible = true;
                    txtF_Venta1.Visible = true;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) + 1;
                    break;
                case 1:
                    panop2.Visible = true;
                    op2.Visible = true;
                    monto2.Visible = true;
                    House2.Visible = true;
                    txtF_Venta2.Visible = true;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) + 1;
                    break;
                case 2:
                    panop3.Visible = true;
                    op3.Visible = true;
                    monto3.Visible = true;
                    House3.Visible = true;
                    txtF_Venta3.Visible = true;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) + 1;
                    break;
                case 3:
                    panop4.Visible = true;
                    op4.Visible = true;
                    monto4.Visible = true;
                    House4.Visible = true;
                    txtF_Venta4.Visible = true;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) + 1;
                    break;
                case 4:
                    panop5.Visible = true;
                    op5.Visible = true;
                    monto5.Visible = true;
                    House5.Visible = true;
                    txtF_Venta5.Visible = true;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) + 1;
                    break;
            }
        }

        protected void btnquitarop_Click(object sender, EventArgs e)
        {
            int num = int.Parse(Session["contex"].ToString());
            switch (num)
            {
                case 1:
                    panop1.Visible = false;
                    op1.Visible = false;
                    monto1.Visible = false;
                    House1.Visible = false;
                    txtF_Venta1.Visible = false;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) - 1;
                    monto1.Text = "0";
                    break;
                case 2:
                    panop2.Visible = false;
                    op2.Visible = false;
                    monto2.Visible = false;
                    House2.Visible = false;
                    txtF_Venta2.Visible = false;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) - 1;
                    monto2.Text = "0";
                    break;
                case 3:
                    panop3.Visible = false;
                    op3.Visible = false;
                    monto3.Visible = false;
                    House3.Visible = false;
                    txtF_Venta3.Visible = false;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) - 1;
                    monto3.Text = "0";
                    break;
                case 4:
                    panop4.Visible = false;
                    op4.Visible = false;
                    monto4.Visible = false;
                    House4.Visible = false;
                    txtF_Venta4.Visible = false;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) - 1;
                    monto4.Text = "0";
                    break;
                case 5:
                    panop5.Visible = false;
                    op5.Visible = false;
                    monto5.Visible = false;
                    House5.Visible = false;
                    txtF_Venta5.Visible = false;
                    Session["contex"] = int.Parse(Session["contex"].ToString()) - 1;
                    monto5.Text = "0";
                    break;

            }

        }
                
        protected void txtvnc_TextChanged(object sender, EventArgs e)
        {
            calcular();
        }

        protected void ddlcp_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcp.SelectedValue == "30 Dias")
            {
            
                DateTime today = DateTime.Now;
                DateTime answer = today.AddDays(30);
                fpago.Text = answer.ToString("yyyy-MM-dd"); 

                
            }
            else if (ddlcp.SelectedValue == "15 Dias")
            {
                DateTime today = DateTime.Now;
                DateTime answer = today.AddDays(15);
                fpago.Text = answer.ToString("yyyy-MM-dd");
            }
            else
            {
                DateTime Hoy = DateTime.Today;
                fpago.Text = Hoy.ToString("yyyy-MM-dd");
            }


        }

        protected void txttc_TextChanged(object sender, EventArgs e)
        {
            calcular();
        }

        public void enviarmail()
        {
            SqlConnection cOnn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = "SELECT id_Mail,UserMail,PassMail,FirmaMail,PuertoMail,ServerMail,Estado,UserAvisoMail,UserUrgentMail FROM Mail";
            dr = cmd.ExecuteReader();
            dr.Read();
            try
            {
                if (ddlcp.SelectedValue == "Pago Urgente")
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("" + dr["ServerMail"].ToString() + "");
                    mail.From = new MailAddress("" + dr["UserMail"].ToString() + "", "" + Session["Nombre"] + "  " + Session["Apellido"] + "", Encoding.UTF8);
                    mail.IsBodyHtml = true;
                    MailAddress bcc = new MailAddress("" + dr["UserurgentMail"].ToString() + "");
                    mail.Bcc.Add(bcc);
                    mail.Subject = "URGENTE !!!!!! Se Ha Registrado Nº Invoice " + txtninvoice.Text + "  Fecha de Pago " + fpago.Text + "";
                    DateTime Hoy = DateTime.Today;
                    mail.Body = (" <strong> El Usuario " + Session["Nombre"].ToString() + " " + Session["Apellido"].ToString() + " Ha Realizao el registro de la Invoice Nº " + txtninvoice.Text + " con Fecha :" + Hoy.ToString("yyyy-MM-dd") + "<br/><br/><br/><br/><strong>Detalles</strong> <br/><br/><br/><br/>Moneda     :" + ddlmoneda.SelectedValue.ToString() + " <br/>T/Cambio   :" + txttc.Text + " <br/>Total OP   :" + txttotalop.Text + " <br/>Valor N/C  :" + txtvnc.Text + " <br/>Total      :" + txttneto.Text + " <br/>Total Pesos:" + txttotal.Text + " <br/><br/><br/><br/>" + dr["FirmaMail"].ToString() + "");
                    mail.To.Add("" + dr["UserAvisoMail"].ToString() + "");
                    SmtpServer.Port = int.Parse(dr["PuertoMail"].ToString());
                    SmtpServer.Credentials = new System.Net.NetworkCredential("" + dr["UserMail"].ToString() + "", "" + dr["PassMail"].ToString() + "");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                }
                else
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("" + dr["ServerMail"].ToString() + "");
                    mail.From = new MailAddress("" + dr["UserMail"].ToString() + "", "" + Session["Nombre"] + "  " + Session["Apellido"] + "", Encoding.UTF8);
                    mail.IsBodyHtml = true;
                    mail.Subject = " Se Ha Registrado Nº Invoice " + txtninvoice.Text + "  Fecha de Pago " + fpago.Text + "";
                    DateTime Hoy = DateTime.Today;
                    mail.Body = (" <strong> El Usuario " + Session["Nombre"].ToString() + " " + Session["Apellido"].ToString() + " Ha Realizao el registro de la Invoice Nº " + txtninvoice.Text + " con Fecha :" + Hoy.ToString("yyyy-MM-dd") + "<br/><br/><br/><br/><strong>Detalles</strong> <br/><br/><br/><br/>Moneda     :" + ddlmoneda.SelectedValue.ToString() + " <br/>T/Cambio   :" + txttc.Text + " <br/>Total OP   :" + txttotalop.Text + " <br/>Valor N/C  :" + txtvnc.Text + " <br/>Total      :" + txttneto.Text + " <br/>Total Pesos:" + txttotal.Text + " <br/><br/><br/><br/>" + dr["FirmaMail"].ToString() + "");
                    mail.To.Add("" + dr["UserAvisoMail"].ToString() + "");
                    SmtpServer.Port = int.Parse(dr["PuertoMail"].ToString());
                    SmtpServer.Credentials = new System.Net.NetworkCredential("" + dr["UserMail"].ToString() + "", "" + dr["PassMail"].ToString() + "");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                }


            }
            catch (Exception ex)
            {

            }

        }

      

        protected void btnRegistrar_ServerClick(object sender, EventArgs e)
        {
            SqlConnection Conn1 = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd1 = new SqlCommand();
            SqlDataReader dr1;
            Conn1.Open();
            cmd1.Connection = Conn1;
            cmd1.CommandText = "SELECT count(id_factura) as existe FROM Facturas2 where ninvoice ='" + txtninvoice.Text + "'";
            dr1 = cmd1.ExecuteReader();
            dr1.Read();
            string valor = dr1["existe"].ToString();
            //aqui revisar que tegistro no este 
            if (valor == "0"){
                Conn1.Close();
                // de aqui hasta aqui 
                Entidades.Gestion.INGRESARFACTURA INGRESARFACTURA = new Entidades.Gestion.INGRESARFACTURA();
                try{
                    INGRESARFACTURA.EMPRESA = DDL_EMP.SelectedValue.ToString();
                    INGRESARFACTURA.AGENTE = ddlagente.SelectedItem.ToString();
                    INGRESARFACTURA.NINVOICE = txtninvoice.Text;
                    INGRESARFACTURA.FINVOICE = txtfinvoice.Text;
                    INGRESARFACTURA.NUMERONC = txtnnc.Text;
                    INGRESARFACTURA.VALORNC = txtvnc.Text;
                    INGRESARFACTURA.FECHANC = txtfnc.Text;
                    INGRESARFACTURA.MONEDA = ddlmoneda.SelectedValue.ToString();
                    INGRESARFACTURA.TC = txttc.Text;
                    INGRESARFACTURA.CONDICION = ddlcp.SelectedValue.ToString();
                    INGRESARFACTURA.OBSERVACION = txtobservacion.Text;
                    INGRESARFACTURA.DETALLE = txtdetalle.Text;
                    INGRESARFACTURA.USUARIO = Session["Usuario"].ToString();
                    DateTime Hoy = DateTime.Today;
                    INGRESARFACTURA.FECHA_EMISION = Hoy.ToString("yyyy-MM-dd");//FECHA DE INGRESO AUTOMATICA 
                    INGRESARFACTURA.ESTADO = "PENDIENTE";
                    INGRESARFACTURA.FECHAPAGO = fpago.Text;//-----------------
                    if (IsPostBack){
                        Boolean fileOK = false;
                        String path = Server.MapPath("/Gestion2/PagoFacturas/PDF/");          
                        if (fuinvoice.HasFile){
                            String fileExtension = System.IO.Path.GetExtension(fuinvoice.FileName).ToLower();
                            String[] allowedExtensions = { ".PDF", ".pdf" };//formatos admitidos
                            for (int i = 0; i < allowedExtensions.Length; i++) {
                                if (fileExtension == allowedExtensions[i])
                                {
                                    fileOK = true;
                                }
                                else
                                {
                                    nook.Visible = true;
                                    ok.Visible = false;
                                }
                            }
                            if (fileOK)
                            {                             
                                fuinvoice.PostedFile.SaveAs(path + "" + txtninvoice.Text + "" + fuinvoice.FileName);
                                
                             //   lblmensaje.Text = "File uploaded!";
                                INGRESARFACTURA.LINKPDF = "/Gestion2/PagoFacturas/PDF/" + txtninvoice.Text + "" + fuinvoice.FileName + ""; 

                            }
                            else
                            {
                                nook.Visible = true;
                                ok.Visible = false;
                            }
                        }
                    }


                    ////////////////////////////// aqui el duplicado 




                    SqlConnection dupli = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                    SqlCommand cmddupli = new SqlCommand();
                    SqlDataReader drdupli;
                    dupli.Open();
                    cmddupli.Connection = dupli;
                    cmddupli.CommandText = "SELECT COUNT(linkpdf) as linkpdf FROM Facturas2 where linkpdf = '" + Session["buscarduplicado"] + "'";
                    drdupli = cmddupli.ExecuteReader();
                    drdupli.Read();

                    int val = int.Parse(drdupli["linkpdf"].ToString());

                    if (val >= 1)
                    {

                        string script = @"window.location.href = '#modalHtml';";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
                        nook.Visible = true;
                        ok.Visible = false;
                        duplimsj.Visible = false;
                        dupli.Close();
                    }
                    else
                    { // aquis e ejecuta el guardado 

                        dupli.Close();


                        GestorGestion gestorgestion = new GestorGestion();
                        bool result = gestorgestion.INGRESARFACTURA(INGRESARFACTURA);
                        if (result == true)
                        {  // AQUI comienza a guardar en la tabla OP
                            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                            SqlCommand cmd = new SqlCommand();
                            SqlDataReader dr;
                            Conn.Open();
                            cmd.Connection = Conn;
                            //  aqui se programa el switch para el ingreso de la op

                            int num = int.Parse(Session["contex"].ToString());
                            string maskValores0 = "###########.##";
                            string maskValores1 = "###########.##";
                            string maskValores2 = "###########.##";
                            string maskValores3 = "###########.##";
                            string maskValores4 = "###########.##";
                            string maskValores5 = "###########.##";
                            string formateado0 = Convert.ToDecimal(monto0.Text).ToString(maskValores0, CultureInfo.GetCultureInfo("en-US"));
                            string formateado1 = Convert.ToDecimal(monto1.Text).ToString(maskValores1, CultureInfo.GetCultureInfo("en-US"));
                            string formateado2 = Convert.ToDecimal(monto2.Text).ToString(maskValores2, CultureInfo.GetCultureInfo("en-US"));
                            string formateado3 = Convert.ToDecimal(monto3.Text).ToString(maskValores3, CultureInfo.GetCultureInfo("en-US"));
                            string formateado4 = Convert.ToDecimal(monto4.Text).ToString(maskValores4, CultureInfo.GetCultureInfo("en-US"));
                            string formateado5 = Convert.ToDecimal(monto5.Text).ToString(maskValores5, CultureInfo.GetCultureInfo("en-US"));

                            switch (num)
                            {
                                case 0:
                                    cmd.CommandText = "INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op0.Text + "','" + formateado0 + "' ,'" + House0.Text + "' ,'" + txtninvoice.Text + "','"+ txtF_Venta0.Text  +"')";
                                    dr = cmd.ExecuteReader();
                                    dr.Read();
                                    Conn.Close();
                                    nook.Visible = false;
                                    ok.Visible = true;
                                    duplimsj.Visible = false;
                                    break;
                                case 1:
                                    cmd.CommandText = "INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op0.Text + "','" + formateado0 + "' ,'" + House0.Text + "' ,'" + txtninvoice.Text + "'','" + txtF_Venta0.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op1.Text + "','" + formateado1 + "' ,'" + House1.Text + "' ,'" + txtninvoice.Text + "','"+ txtF_Venta1.Text+"')";
                                    dr = cmd.ExecuteReader();
                                    dr.Read();
                                    Conn.Close();
                                    nook.Visible = false;
                                    ok.Visible = true;
                                    duplimsj.Visible = false;
                                    break;
                                case 2:
                                    cmd.CommandText = "INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op0.Text + "','" + formateado0 + "' ,'" + House0.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta0.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op1.Text + "','" + formateado1 + "'  ,'" + House1.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta1.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op2.Text + "','" + formateado2 + "' ,'" + House2.Text + "' ,'" + txtninvoice.Text + "','"+ txtF_Venta2.Text +"')";
                                    dr = cmd.ExecuteReader();
                                    dr.Read();
                                    Conn.Close();
                                    nook.Visible = false;
                                    ok.Visible = true;
                                    duplimsj.Visible = false;
                                    break;
                                case 3:
                                    cmd.CommandText = "INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op0.Text + "','" + formateado0 + "' ,'" + House0.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta0.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op1.Text + "','" + formateado1 + "'  ,'" + House1.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta1.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op2.Text + "','" + formateado2 + "' ,'" + House2.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta2.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op3.Text + "','" + formateado3 + "' ,'" + House3.Text + "' ,'" + txtninvoice.Text + "','"+ txtF_Venta3.Text +"')";
                                    dr = cmd.ExecuteReader();
                                    dr.Read();
                                    Conn.Close();
                                    nook.Visible = false;
                                    ok.Visible = true;
                                    duplimsj.Visible = false;
                                    break;
                                case 4:
                                    cmd.CommandText = "INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op0.Text + "','" + formateado0 + "' ,'" + House0.Text + "','" + txtninvoice.Text + "','" + txtF_Venta0.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op1.Text + "','" + formateado1 + "'  ,'" + House1.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta1.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op2.Text + "','" + formateado2 + "' ,'" + House2.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta2.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op3.Text + "','" + formateado3 + "' ,'" + House3.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta3.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op4.Text + "','" + formateado4 + "' ,'" + House4.Text + "' ,'" + txtninvoice.Text + "','"+ txtF_Venta4.Text +"')";
                                    dr = cmd.ExecuteReader();
                                    dr.Read();
                                    Conn.Close();
                                    nook.Visible = false;
                                    ok.Visible = true;
                                    duplimsj.Visible = false;



                                    break;
                                case 5:
                                    cmd.CommandText = "INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op0.Text + "','" + formateado0 + "','" + House0.Text + "','" + txtninvoice.Text + "','" + txtF_Venta0.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op1.Text + "','" + formateado1 + "'  ,'" + House1.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta1.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op2.Text + "','" + formateado2 + "'  ,'" + House2.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta2.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op3.Text + "','" + formateado3 + "' ,'" + House3.Text + "' ,'" + txtninvoice.Text + "','" + txtF_Venta3.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op4.Text + "','" + formateado4 + "','" + House4.Text + "'  ,'" + txtninvoice.Text + "','" + txtF_Venta4.Text + "')INSERT INTO Operaciones(numop,monto,House,ninvoice,Fventa)VALUES ('" + op5.Text + "','" + formateado5 + "' ,'" + House5.Text + "' ,'" + txtninvoice.Text + "','"+ txtF_Venta5.Text +"')";
                                    dr = cmd.ExecuteReader();
                                    dr.Read();
                                    Conn.Close();
                                    nook.Visible = false;
                                    ok.Visible = true;
                                    duplimsj.Visible = false;
                                    break;

                            }//cierre del switch

                            //aqui hay que programar el envio de correo avisando el ingreso

                            enviarmail();

                            //aqui hay que programar el envio de correo avisando el ingreso
                            Response.Redirect("~/pagos_agentes_Listado.aspx");

                        }
                        else
                        {
                            nook.Visible = true;
                            ok.Visible = false;
                            duplimsj.Visible = false;
                        }






                    }// aqui termina la validar dupli











                }
                catch (Exception)
                {
                    nook.Visible = true;
                    ok.Visible = false;
                    duplimsj.Visible = false;
                }


                // hasta aqui 


            }
            else
            {

                Conn1.Close();
                nook.Visible = false;
                ok.Visible = false;

                duplimsj.Visible = true;

            }//cierre del if de no repetir







        }






    }
}