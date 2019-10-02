using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GESTION.PagoFacturas
{
    public partial class Registroscompletos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnexportar_Click(object sender, ImageClickEventArgs e)
        {


            try
            {
                using (SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString()))
                {
                    SqlDataAdapter da = new SqlDataAdapter("EXPORTAR_REGISTROS_TOTAL", conexion);
                    DataSet dt = new DataSet();
                    string delimitador = ";";
                    StringBuilder sb = new StringBuilder();
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.Fill(dt);

                    dt.Tables[0].TableName = "REPORTES";

                    sb.Append("id_factura" + delimitador);
                    sb.Append("empresa" + delimitador);
                    sb.Append("agente" + delimitador);
                    sb.Append("ninvoice" + delimitador);
                    sb.Append("FINVOICE" + delimitador);
                    sb.Append("nnc" + delimitador);
                    sb.Append("vnc" + delimitador);
                    sb.Append("fnc" + delimitador);
                    sb.Append("moneda" + delimitador);
                    sb.Append("tc" + delimitador);
                    sb.Append("Monto" + delimitador);
                    sb.Append("condicion" + delimitador);
                    sb.Append("observ" + delimitador);
                    sb.Append("detalle" + delimitador);
                    sb.Append("usuario" + delimitador);
                    sb.Append("fechaingreso" + delimitador);
                    sb.Append("estado" + delimitador);
                    sb.Append("fechapago" + delimitador);
                    sb.Append("operaciones" + delimitador);
                    sb.Append("\r\n");

                    foreach (DataRow data in dt.Tables["REPORTES"].Rows)
                    {
                        sb.Append(data["id_factura"].ToString() + delimitador);
                        sb.Append(data["empresa"].ToString() + delimitador);
                        sb.Append(data["agente"].ToString() + delimitador);
                        sb.Append(data["ninvoice"].ToString() + delimitador);
                        sb.Append(data["FINVOICE"].ToString() + delimitador);
                        sb.Append(data["nnc"].ToString() + delimitador);
                        sb.Append(data["vnc"].ToString() + delimitador);
                        sb.Append(data["fnc"].ToString() + delimitador);
                        sb.Append(data["moneda"].ToString() + delimitador);
                        sb.Append(data["tc"].ToString() + delimitador);
                        sb.Append(data["Monto"].ToString() + delimitador);
                        sb.Append(data["condicion"].ToString() + delimitador);
                        sb.Append(data["observ"].ToString() + delimitador);
                        sb.Append(data["detalle"].ToString() + delimitador);
                        sb.Append(data["usuario"].ToString() + delimitador);
                        sb.Append(data["fechaingreso"].ToString() + delimitador);
                        sb.Append(data["estado"].ToString() + delimitador);
                        sb.Append(data["fechapago"].ToString() + delimitador);
                        sb.Append(data["operaciones"].ToString() + delimitador);
                        sb.Append("\r\n");
                    }

                    string VALOR = DateTime.Now.ToString("yyyyMMddHHmmss");
                    string RUTA = @"C:\inetpub\wwwroot\Gestion2\Archivos\EXPORTAR_REGISTROS_TOTAL_" + VALOR + ".csv";
                    StreamWriter sw = new StreamWriter(RUTA, true, Encoding.UTF8);
                    sw.WriteLine(sb.ToString());
                    sw.Close();

                    Response.Clear();
                    Response.ContentType = "text/csv";
                    Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}", "Reportes_" + VALOR + ".csv"));
                    Response.WriteFile(RUTA);
                    Response.End();
                    File.Delete(RUTA);

                }
            }
            catch (Exception EX)
            {

            }




        }




    }
}