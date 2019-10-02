using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Cobranzas_Agentes
{
    public partial class Filtros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvregistros_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int num = Convert.ToInt32(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            if (e.CommandName == "PDF")
            {

                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT [ID_Cobro],[NDocumento],[TDocumento],[Agente],[FEmision],[Moneda],[ValorDocumento],[Observacion],[EstadoDocumento],[Usuario],[Operacion],[LinkArchivo] FROM [dbo].[CobranzaAgentes] where [ID_Cobro] = '" + num + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                string pdfbuscar = dr["LinkArchivo"].ToString();
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
            if (e.CommandName == "Pagar")
            {// si presiona pagar se ejecuta este codigo 
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
                    if (txtmonto_Pagado.Text == "0")
                    {
                        btnpagar.Visible = false;
                    }
                    txtvalorpag.Text = "";
                    txtdetallepag.Text = "";



                }
                else
                {
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
                if (validar == "SI")
                {
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "UPDATE CobranzaAgentes  SET EstadoDocumento = 'Anulado' WHERE ID_Cobro = '" + num + "'";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    Conn.Close();
                    gvCobroAgente.DataBind();
                    registrook.Visible = true;
                    sinpermisos.Visible = false;
                    eliminarreg.Visible = false;
                    Alertaok.Visible = false;
                    Alertanook.Visible = false;
                    noexiste.Visible = false;
                }
                else
                {
                    registrook.Visible = false;
                    sinpermisos.Visible = true;
                    eliminarreg.Visible = false;
                    Alertaok.Visible = false;
                    Alertanook.Visible = false;
                    noexiste.Visible = false;
                }
            }
            if (e.CommandName == "Ver")
            {

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
            

            if (e.CommandName == "Eliminar")
            {
                Response.Write("Eliminar " + num + "");
                string validar = Session["Eliminar"].ToString();
                if (validar == "SI")
                {
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "DELETE FROM CobranzaAgentes  WHERE ID_Cobro ='" + num + "'";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    gvCobroAgente.DataBind();
                    Conn.Close();
                    eliminarreg.Visible = true;
                    registrook.Visible = false;
                    sinpermisos.Visible = false;
                    Alertaok.Visible = false;
                    Alertanook.Visible = false;
                    noexiste.Visible = false;
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
            if (VPagado >= VDocumento)
            {


                actualizarestado();



            }
           

            txtdocumentopag.Text = "";
            txtdocumentopag.Text = "";
            txtdetallepag.Text = "";
            gvCobroAgente.DataBind();
            gvpagos.DataBind();


            eliminarreg.Visible = false;
            registrook.Visible = false;
            sinpermisos.Visible = false;
            Alertaok.Visible = true;
            Alertanook.Visible = false;
            noexiste.Visible = false;

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


            if (dr["VDocumento"].ToString() == "")
            {
                Session["VDocumento"] = "0";
                Session["VPagado"] = "0";
            }
            else
            {
                Session["VDocumento"] = dr["VDocumento"].ToString();
                Session["VPagado"] = dr["VPagado"].ToString();
            }

            Conn.Close();


        }



        protected void BuscarPagos()
        {

            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT sum(Valor_Pago) as Pagos  FROM PagoCobrosAgentes where N_Documento = '" + Session["BuscarPagos"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();


            if (dr["Pagos"].ToString() == "")
            {

                Session["Valor_Encontrado"] = "0";

            }
            else
            {

                Session["Valor_Encontrado"] = dr["Pagos"].ToString();
            }

            Conn.Close();

        }



        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string val = ddlFiltro.SelectedValue.ToString(); 
            
            if (val== "Estado") {

                panel_Doc.Visible = false;
                panel_agente.Visible = false;
                panel_tipo.Visible = false;
                panel_estado.Visible = true;
                panel_OP.Visible = false;

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;


            } else if (val == "Agente"){
                
                panel_agente.Visible = true;
                panel_estado.Visible = true;
                panel_tipo.Visible = false;
                panel_Doc.Visible = false;
                panel_OP.Visible = false;

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;

            } else if (val == "Tipo"){
                
                panel_agente.Visible = false;
                panel_tipo.Visible = true;
                panel_estado.Visible = true;
                panel_Doc.Visible = false;
                panel_OP.Visible = false;

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;


            } else if (val == "Documento"){

                panel_Doc.Visible = true;
                panel_agente.Visible = false;
                panel_tipo.Visible = false;
                panel_estado.Visible = false;
                panel_OP.Visible = false;

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;

            }
            else if (val == "Todo")
            {

                panel_Doc.Visible = false;
                panel_agente.Visible = false;
                panel_tipo.Visible = false;
                panel_estado.Visible = false;
                panel_OP.Visible = false;

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;

            }
            else if (val == "Operacion")
            {

                panel_Doc.Visible = false;
                panel_agente.Visible = false;
                panel_tipo.Visible = false;
                panel_estado.Visible = false;
                panel_OP.Visible = true;

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;

            }

        }

        protected void btnFiltrar_ServerClick(object sender, EventArgs e)
        {


            string val = ddlFiltro.SelectedValue.ToString();

            if (val == "Estado")
            {

               panel_estado.Visible = true;
     
                CobroCheques.SelectCommand = "SELECT * FROM CobranzaAgentes where EstadoDocumento = '"+ ddlestado.SelectedValue +"'";
                gvCobroAgente.DataBind();

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;
                
            }
            else if (val == "Agente")
            {

                panel_agente.Visible = true;
                panel_estado.Visible = true;

               CobroCheques.SelectCommand = "SELECT * FROM CobranzaAgentes where Agente = '"+ ddlagente.SelectedValue + "' and EstadoDocumento = '"+ ddlestado.SelectedValue + "'";
               gvCobroAgente.DataBind();

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;



            }
            else if (val == "Tipo")
            {
                panel_tipo.Visible = true;
                panel_estado.Visible = true;
                CobroCheques.SelectCommand = "SELECT* FROM CobranzaAgentes where TDocumento = '"+ ddlTipo.SelectedValue +"' and EstadoDocumento = '"+ ddlestado.SelectedValue +"'";
                gvCobroAgente.DataBind();
                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;




            }
            else if (val == "Documento")
            {
                panel_Doc.Visible = true;
                
                CobroCheques.SelectCommand = "SELECT * FROM CobranzaAgentes where NDocumento = '"+ txtDocumento.Text + "'";
                gvCobroAgente.DataBind();

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;


            }
            else if (val == "Todo")
            {

                CobroCheques.SelectCommand = "SELECT * FROM [CobranzaAgentes] ORDER BY [ID_Cobro] DESC";
                gvCobroAgente.DataBind();

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;
            }
            else if (val == "Operacion")
            {

                CobroCheques.SelectCommand = "SELECT * FROM CobranzaAgentes where Operacion  = '"+ txtoperacion.Text +"'";
                gvCobroAgente.DataBind();

                registrook.Visible = false;
                sinpermisos.Visible = false;
                eliminarreg.Visible = false;
                Alertaok.Visible = false;
                Alertanook.Visible = false;
                noexiste.Visible = false;
            }






        }
    }
}