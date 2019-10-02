using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GESTION.Cobranzas_Agentes
{
    public partial class CobranzaAgentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e){
            if (!Page.IsPostBack)
            {
               
            }
      }


        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT COUNT(NDocumento) as Buscador FROM CobranzaAgentes where NDocumento='" + txtndocumento.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            int valor = int.Parse(dr["Buscador"].ToString());
            Conn.Close();
            if (valor == 0){

                //si no existe se ejecuta este codigo 

                try{
               
                Conn.Open();
                cmd.Connection = Conn;
                DateTime Hoy = DateTime.Today;
                string linkpdf;
                if (IsPostBack)
                {
                    Boolean fileOK = false;
                    String path = Server.MapPath("/Gestion2/Cobranzas Agentes/PDF/");
                   
                    if (ARCHIVO.HasFile)
                    {
                        String fileExtension = System.IO.Path.GetExtension(ARCHIVO.FileName).ToLower();
                        String[] allowedExtensions = { ".PDF", ".pdf" };//formatos admitidos
                        for (int i = 0; i < allowedExtensions.Length; i++)
                        {
                            if (fileExtension == allowedExtensions[i])
                            {
                                fileOK = true;
                                NOPDF.Visible = false;
                            } else  {
                                NOPDF.Visible = true;
                         
                            }
                        }
                        if (fileOK){
                            ARCHIVO.PostedFile.SaveAs(path +""+ txtndocumento.Text +""+ ARCHIVO.FileName);
                            linkpdf = "/Gestion2/Cobranzas Agentes/PDF/" + txtndocumento.Text +""+ ARCHIVO.FileName +""; //SE ASIGNA LA DIRECCION DEL PDF

                                string maskValores = "###########.##";
                                string formateado = Convert.ToDecimal(txtvalor.Text).ToString(maskValores, CultureInfo.GetCultureInfo("en-US"));
                                                              

                            cmd.CommandText = "INSERT INTO CobranzaAgentes(NDocumento, TDocumento, Agente, FEmision, Moneda, ValorDocumento, Observacion, EstadoDocumento, Usuario, Operacion, LinkArchivo)VALUES('" + txtndocumento.Text + "','" + ddltipo.SelectedValue + "','" + ddlagente.SelectedValue + "','" + txtfemision.Text + "','" + ddlmoneda.SelectedValue + "','" + formateado + "', '" + txtobserv.Text + "','Pendiente', '" + Session["Usuario"].ToString() + "', '" + txtnoperacion.Text + "', '" + linkpdf.ToString() + "')";
 
                            dr = cmd.ExecuteReader();
                            dr.Read();
                            Conn.Close();
                            Alertaok.Visible = true;
                            Alertanook.Visible = false;
                            eliminarreg.Visible = false;
                            registrook.Visible = false;
                            noexiste.Visible = false;
                                RegExist.Visible = false;
                                gvregistros.DataBind();
                      }else {
                            NOPDF.Visible = true;
                            noexiste.Visible = false;
                                RegExist.Visible = false;

                            }
                    }
                }

               
            }catch (Exception ex){
                Alertanook.Visible = true;
                Alertaok.Visible = false;
                eliminarreg.Visible = false;
                registrook.Visible = false;
                noexiste.Visible = false;
                    RegExist.Visible = false;

                }

            }else{
            RegExist.Visible = true; //aqui el mensaje muestra que el registro ya existe 
                Alertanook.Visible = false;
                Alertaok.Visible = false;
                eliminarreg.Visible = false;
                registrook.Visible = false;
                noexiste.Visible = false;

            }
            

        }

        protected void gvregistros_RowCommand(object sender, GridViewCommandEventArgs e) {
            int num = Convert.ToInt32(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
           if (e.CommandName == "PDF") {

                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT [ID_Cobro],[NDocumento],[TDocumento],[Agente],[FEmision],[Moneda],[ValorDocumento],[Observacion],[EstadoDocumento],[Usuario],[Operacion],[LinkArchivo] FROM [dbo].[CobranzaAgentes] where [ID_Cobro] = '" + num + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                string  pdfbuscar = dr["LinkArchivo"].ToString();
                string Ndocumento = dr["NDocumento"].ToString();
                System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
                response.ClearContent();
                response.Clear();
                response.ContentType = "text/plain";
                response.AddHeader("Content-Disposition",
                                    "attachment; filename=Invoice " + Ndocumento + ".pdf;");
                
                response.TransmitFile(Server.MapPath("" + pdfbuscar + ""));

                response.Flush();
                response.End();

            }
            if (e.CommandName == "Pagar"){// si presiona pagar se ejecuta este codigo 
                string validar = Session["Modificar"].ToString();
                if (validar == "SI")
                {
                 Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT [ID_Cobro],[NDocumento],[TDocumento],[Agente],[FEmision],[Moneda],[ValorDocumento],[Observacion],[EstadoDocumento],[Usuario],[Operacion],[LinkArchivo] FROM [dbo].[CobranzaAgentes] where [ID_Cobro] = '" + num + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                txtdocumentopag.Text = dr["NDocumento"].ToString();
                txtmonedapag.Text = dr["Moneda"].ToString();
                DateTime Hoy = DateTime.Today;
                txtFechapag.Text = Hoy.ToString("dd-MM-yyyy");
                btnpagar.Visible = true;
                txtmonto_factura.Text = dr["ValorDocumento"].ToString();
                //aqui deberia solo asignar lo que queda pendiente
                float Valor = float.Parse(dr["ValorDocumento"].ToString());
                Session["BuscarPagos"] = dr["NDocumento"].ToString();
                BuscarPagos();
                float pendiente = Valor - float.Parse(Session["Valor_Encontrado"].ToString());
                txtmonto_Pagado.Text = pendiente.ToString(); ;//aqui se entrega el valor encontrado
                Conn.Close();
                string script = @"window.location.href = '#modalHtml2';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
                if (txtmonto_Pagado.Text =="0")
                {
                btnpagar.Visible = false;
                }
                txtvalorpag.Text = "";
                txtdetallepag.Text = "";
                }
                else{
                registrook.Visible = false;
                sinpermisos.Visible = true;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                    Alertanook.Visible = false;
                    noexiste.Visible = false;
                }
            }

            if (e.CommandName == "Anular")//si presiona anular
            {
                string validar = Session["Modificar"].ToString();
                if (validar == "SI"){
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "UPDATE CobranzaAgentes  SET EstadoDocumento = 'Anulado' WHERE ID_Cobro = '" + num + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                Conn.Close();
                gvregistros.DataBind();
                registrook.Visible = true;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                    noexiste.Visible = false;
                } else {
                    registrook.Visible = false;
                    sinpermisos.Visible = true;
                    eliminarreg.Visible = false;
                    Alertaok.Visible = false;
                    Alertanook.Visible = false;
                    noexiste.Visible = false;
                }
            }
            if (e.CommandName == "Ver"){
             
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT [ID_Cobro],[NDocumento],[TDocumento],[Agente],[FEmision],[Moneda],[ValorDocumento],[Observacion],[EstadoDocumento],[Usuario],[Operacion],[LinkArchivo] FROM [dbo].[CobranzaAgentes] where [ID_Cobro] = '" + num + "'";
                dr = cmd.ExecuteReader();
                dr.Read();

                string script = @"window.location.href = '#modalHtml3';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
                lblid.Text = dr["NDocumento"].ToString();
                txtvaldet.Text = dr["ValorDocumento"].ToString();
                txtnopedet.Text = dr["Operacion"].ToString();
                txtobsdet.Text = dr["Observacion"].ToString();
                txtfemidet.Text = dr["FEmision"].ToString();
                txtmonedadet.Text = dr["Moneda"].ToString();
                txtagentedet.Text = dr["Agente"].ToString();
                Conn.Close();
                
            }



           





            if (e.CommandName == "Eliminar"){
                Response.Write("Eliminar " + num + "");
                string validar = Session["Eliminar"].ToString();
                if (validar == "SI"){
                   Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "DELETE FROM CobranzaAgentes  WHERE ID_Cobro ='" + num + "'";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    gvregistros.DataBind();
                    Conn.Close();
                    eliminarreg.Visible = true;
                    registrook.Visible = false;
                    sinpermisos.Visible = false;
                    Alertaok.Visible = false;
                    Alertanook.Visible = false;
                    noexiste.Visible = false;
                } else  {
                    registrook.Visible = false;
                    sinpermisos.Visible = false;
                    eliminarreg.Visible = false;
                    Alertaok.Visible = false;
                    Alertanook.Visible = false;
                    noexiste.Visible = false;
                }
                
            }

            
        }

        
        protected void btnpagar_ServerClick(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            string maskValores = "###########.##";
            string formateado = Convert.ToDecimal(txtvalorpag.Text).ToString(maskValores, CultureInfo.GetCultureInfo("en-US"));
            cmd.CommandText = "INSERT INTO PagoCobrosAgentes(Fecha_Pago,Valor_Pago,Moneda,Banco,Detalle_Pago,Usuario_Pago,N_Documento) VALUES('" + txtFechapag.Text + "','" + formateado + "','" + txtmonedapag.Text + "','" + ddlbancopag.SelectedValue + "','" + txtdetallepag.Text + "','" + Session["Usuario"] + "','" + txtdocumentopag.Text + "')";
            dr = cmd.ExecuteReader();
            dr.Read();
           Conn.Close();
           //aqui se pregunta si esta total pagado y se cambia el estado si es que esta cancelado el total
           Comparar();
           float VDocumento = float.Parse(Session["VDocumento"].ToString());
           float VPagado = float.Parse(Session["VPagado"].ToString());
           if (VPagado>= VDocumento){

           
           actualizarestado();



           }
            gvregistros.DataBind();
            txtdocumentopag.Text = "";
            txtdocumentopag.Text="";
            txtdetallepag.Text = "";
            gvpagos.DataBind();
            gvregistros.DataBind();
            eliminarreg.Visible = false;
            registrook.Visible = false;
            sinpermisos.Visible = false;
            Alertaok.Visible = true;
            Alertanook.Visible = false;
           }
        
        protected void actualizarestado()
        {

            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "UPDATE CobranzaAgentes  SET EstadoDocumento = 'Pagado' WHERE NDocumento = '" + txtdocumentopag.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();


        }
        protected void BuscarPagos(){

            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT sum(Valor_Pago) as Pagos  FROM PagoCobrosAgentes where N_Documento = '"+ Session["BuscarPagos"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();


            if (dr["Pagos"].ToString() =="")
            {

                Session["Valor_Encontrado"] = "0";

            }
            else{

                Session["Valor_Encontrado"] = dr["Pagos"].ToString();
            }

            Conn.Close();
           
        }


      
       protected void Comparar()
       {
       SqlConnection Conn = new SqlConnection();
       Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
       SqlCommand cmd = new SqlCommand();
       SqlDataReader dr;
       Conn.Open();
       cmd.Connection = Conn;
       cmd.CommandText = "SELECT ValorDocumento as VDocumento , (SELECT SUM(Valor_Pago) FROM PagoCobrosAgentes where  N_Documento = '" + txtdocumentopag.Text + "') as VPagado   FROM CobranzaAgentes where  NDocumento = '" + txtdocumentopag.Text + "'";
       dr = cmd.ExecuteReader();
       dr.Read();
       Session["VDocumento"] = dr["VDocumento"].ToString();
       Session["VPagado"] = dr["VPagado"].ToString();


        if (dr["VDocumento"].ToString()=="")
        {
        Session["VDocumento"] = "0";
        Session["VPagado"] = "0";
         }else {
        Session["VDocumento"] = dr["VDocumento"].ToString();
        Session["VPagado"] = dr["VPagado"].ToString();
        }
      
        Conn.Close();


        }
     


        protected void Busqueda_ServerClick(object sender, EventArgs e)
        {

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT [ID_Cobro],[NDocumento],[TDocumento],[Agente],[FEmision],[Moneda],[ValorDocumento],[Observacion],[EstadoDocumento],[Usuario],[Operacion],[LinkArchivo] FROM [dbo].[CobranzaAgentes] where [NDocumento] = '" + txtndocumento.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {

                string script = @"window.location.href = '#modalHtml3';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
                lblid.Text = dr["NDocumento"].ToString();
                txtvaldet.Text = dr["ValorDocumento"].ToString();
                txtnopedet.Text = dr["Operacion"].ToString();
                txtobsdet.Text = dr["Observacion"].ToString();
                txtfemidet.Text = dr["FEmision"].ToString();
                txtmonedadet.Text = dr["Moneda"].ToString();
                txtagentedet.Text = dr["Agente"].ToString();

            } else {

                noexiste.Visible = true;
            }
            Conn.Close();

        }

        protected void gvpagos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int num = Convert.ToInt32(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            if (e.CommandName == "Eliminar")
            {
                                              
                string validar = Session["Eliminar"].ToString();
                if (validar == "SI")
                {
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "DELETE  FROM PagoCobrosAgentes WHERE ID_Pago ='" + num + "'";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    gvregistros.DataBind();
                    Conn.Close();
                    eliminarreg.Visible = true;
                    registrook.Visible = false;
                    sinpermisos.Visible = false;
                    Alertaok.Visible = false;
                    Alertanook.Visible = false;
                    noexiste.Visible = false;
                    gvpagos.DataBind();
                }
                else
                {
                    registrook.Visible = false;
                    sinpermisos.Visible = false;
                    eliminarreg.Visible = false;
                    Alertaok.Visible = false;
                    Alertanook.Visible = false;
                    noexiste.Visible = false;
                }



            }
        }

        protected void btn_mod_ServerClick(object sender, EventArgs e)
        {
            string validar = Session["Modificar"].ToString();
            if (validar == "SI")
            {

                txtfemidet.Enabled = true;
                txtvaldet.Enabled = true;
                txtnopedet.Enabled = true;
                txtmonedadet.Enabled = true;
                txtagentedet.Enabled = true;
                txtobsdet.Enabled = true;
                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;
                btn_guardarcambios.Visible = true;
                btn_mod.Visible = false;
                string script = @"window.location.href = '#modalHtml3';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
            }
            else{

                registrook.Visible = false;
                sinpermisos.Visible = true;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;



            }
        }

        protected void btn_guardarcambios_ServerClick(object sender, EventArgs e)
        {

            string validar = Session["Modificar"].ToString();
            if (validar == "SI")
            {
                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "UPDATE CobranzaAgentes   SET Agente = '"+ txtagentedet.Text +"',FEmision = '"+ txtfemidet.Text +"',Moneda = '"+ txtmonedadet.Text +"',ValorDocumento = '"+ txtvaldet.Text +"',Observacion =  '"+ txtobsdet.Text +"',Operacion = '"+ txtnopedet.Text +"' WHERE NDocumento= '"+ lblid.Text +"'";
                dr = cmd.ExecuteReader();
                dr.Read();
                txtfemidet.Enabled = false;
                txtvaldet.Enabled = false;
                txtnopedet.Enabled = false;
                txtmonedadet.Enabled = false;
                txtagentedet.Enabled = false;
                txtobsdet.Enabled = false;




                btn_guardarcambios.Visible = false;
                btn_mod.Visible = true;
                string script = @"window.location.href = '#modalHtml3';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);

            }
            else
            {

                registrook.Visible = false;
                sinpermisos.Visible = true;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;
                btn_guardarcambios.Visible = false;
                btn_mod.Visible = true;
            }




        }
    }

}






