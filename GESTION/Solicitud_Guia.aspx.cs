using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GESTION.Solicitud_Guia_Despacho
{
    public partial class Solicitud_Guia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Registrar_ServerClick(object sender, EventArgs e)
        {
            try
            {
            asignar_folio();
                SqlConnection Conn = new SqlConnection
                {
                    ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
                };
                SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            DateTime Hoy = DateTime.Today;
            cmd.CommandText = "INSERT INTO Guia_Despachos(Correlativo_Guia_Despacho,Usuario_Solicitante,Fecha_Solicitud,Empresa,Nombre_Cliente,Rut_Cliente,Nombre_Conductor,Patente_Vehiculo,Detalle_guia_Despacho)  VALUES ('" + Session["Correlativo_Guia_Despacho"] + "','" + Session["Usuario"] + "','" + Hoy.ToString("") + "','" + ddlEmpresa.SelectedItem + "','" + txt_Nombre.Text + "','" + txt_Rut.Text + "','" + txt_Conductor.Text + "','" + txt_Patente.Text + "','" + txt_Detalle.Text + "')";
            dr = cmd.ExecuteReader();
            dr.Read();
            lbl_ID.Text = Session["Correlativo_Guia_Despacho"].ToString();
            Registro_OK.Visible = true;
                Registro_NOOK.Visible = false;
                Eliminar_OK.Visible = false;
                Sin_Permisos.Visible = false;

                Conn.Close();
                txt_Conductor.Text = "";
                txt_Detalle.Text = "";
                txt_Nombre.Text = "";
                txt_Patente.Text = "";
                txt_Rut.Text = "";
                GV_Guias_Despachos.DataBind();
            } catch (Exception){
                Registro_OK.Visible = false;
                Registro_NOOK.Visible = true;
                Eliminar_OK.Visible = false;
                Sin_Permisos.Visible = false;
            }

        }

        protected void asignar_folio()
        {
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT TOP 1 Correlativo_Guia_Despacho as contador FROM Guia_Despachos with(nolock) order by Correlativo_Guia_Despacho desc";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
            int contador = int.Parse(dr["contador"].ToString()) + 1;
            Session["Correlativo_Guia_Despacho"] = contador.ToString();
            } else {
            Session["Correlativo_Guia_Despacho"] = "1";
            }
            Conn.Close();

        }

        protected void Btn_Descargar_ServerClick(object sender, EventArgs e)
        {
            gvDescargar.Visible = true;
            ExportToExcel("Guias_de_Despacho.xls", gvDescargar);
            gvDescargar.Visible = false;
        }


        private void ExportToExcel(string nameReport, GridView wControl)
        {
            HttpResponse response = Response;
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Page pageToRender = new Page();
            HtmlForm form = new HtmlForm();
            form.Controls.Add(wControl);
            pageToRender.Controls.Add(form);
            response.Clear();
            response.Buffer = true;
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=" + nameReport);
            response.Charset = "UTF-8";
            response.ContentEncoding = Encoding.Default;
            pageToRender.RenderControl(htw);
            response.Write(sw.ToString());
            response.End();
        }

        protected void GV_Guias_Despachos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int num = Convert.ToInt32(e.CommandArgument);
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            if (e.CommandName == "Imprimir")
            {
                Session["Numero_Guia_Imprimir"] = e.CommandArgument.ToString();
                string str;
                str = "window.open('~/Guia_Despacho.aspx','Guia de Despacho','width=980px,height=980px,sc rollbars=no,resizable=no')";
                Response.Write("<script languaje=javascript>" + str + "</script>");
            } if (e.CommandName == "Detalle"){
                string script = @"window.location.href = '#modalHtml2';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "select * FROM Guia_Despachos with(nolock) WHERE Correlativo_Guia_Despacho='" + num + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                lbl_ID_Mod.Text = dr["Correlativo_Guia_Despacho"].ToString();
                ddl_empresa_mod.Text =  dr["Empresa"].ToString();
                txtconductor_mod.Text = dr["Nombre_Conductor"].ToString();
                txtdetalle_mod.Text = dr["Detalle_guia_Despacho"].ToString();
                txtnombre_mod.Text = dr["Nombre_Conductor"].ToString();
                txtpatente_mod.Text = dr["Patente_Vehiculo"].ToString();
                txtrut_mod.Text = dr["Rut_Cliente"].ToString();
            }if (e.CommandName == "Eliminar"){
                string validar = Session["Eliminar"].ToString();
                if (validar == "SI"){
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "DELETE FROM Guia_Despachos WHERE Correlativo_Guia_Despacho='" + num + "'";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    Conn.Close();
                    GV_Guias_Despachos.DataBind();
                    gvDescargar.DataBind();
                    Eliminar_OK.Visible = true;
                    Registro_OK.Visible = false;
                    Registro_NOOK.Visible = false;
                    Sin_Permisos.Visible = false;
                }else{
                    Sin_Permisos.Visible = true;
                    Eliminar_OK.Visible = false;
                    Registro_OK.Visible = false;
                    Registro_NOOK.Visible = false;
                }
            }

        }

        protected void btn_Modificar_ServerClick(object sender, EventArgs e){
            ddl_empresa_mod.Enabled = true;
            txtconductor_mod.Enabled = true;
            txtdetalle_mod.Enabled = true;
            txtnombre_mod.Enabled = true;
            txtpatente_mod.Enabled = true;
            txtrut_mod.Enabled = true;

            btn_Modificar.Visible = false;
            btn_Grabar.Visible = true;
            string script = @"window.location.href = '#modalHtml2';";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
         }

        protected void btn_Grabar_ServerClick(object sender, EventArgs e){
            SqlConnection Conn = new SqlConnection
            {
                ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()
            };
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = " UPDATE Guia_Despachos  SET Empresa = '"+ ddlEmpresa.Text +"', Nombre_Cliente = '"+ txtnombre_mod.Text +"',Rut_Cliente = '"+ txtrut_mod.Text +"',Nombre_Conductor = '"+ txtconductor_mod.Text +"',Patente_Vehiculo = '"+ txtpatente_mod.Text +"',Detalle_guia_Despacho = '"+ txtdetalle_mod.Text +"' WHERE Correlativo_Guia_Despacho='" + lbl_ID_Mod.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            ddl_empresa_mod.Enabled = false;
            txtconductor_mod.Enabled = false;
            txtdetalle_mod.Enabled = false;
            txtnombre_mod.Enabled = false;
            txtpatente_mod.Enabled = false;
            txtrut_mod.Enabled = false;
            btn_Modificar.Visible = true;
            btn_Grabar.Visible = false;
            string script = @"window.location.href = '#modalHtml2';";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
            Conn.Close();
        }
    }
}