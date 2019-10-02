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
    public partial class totalPagos : System.Web.UI.Page
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
                    SqlDataAdapter da = new SqlDataAdapter("EXPORTAR_REGISTROS_TOTAL_PAGOS", conexion);
                    DataSet dt = new DataSet();
                    string delimitador = ";";
                    StringBuilder sb = new StringBuilder();
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.Fill(dt);

                    dt.Tables[0].TableName = "REPORTES";


                    sb.Append("Id_Pago" + delimitador);
                    sb.Append("User_Pago" + delimitador);
                    sb.Append("Fecha_Pago" + delimitador);
                    sb.Append("Banco" + delimitador);
                    sb.Append("moneda" + delimitador);
                    sb.Append("Monto_Pago" + delimitador);
                    sb.Append("DETALLE_PAGO" + delimitador);
                    sb.Append("NInvoice" + delimitador);
                    sb.Append("operaciones" + delimitador);
                    sb.Append("\r\n");

                    foreach (DataRow data in dt.Tables["REPORTES"].Rows)
                    {

                        sb.Append(data["Id_Pago"].ToString() + delimitador);
                        sb.Append(data["User_Pago"].ToString() + delimitador);
                        sb.Append(data["Fecha_Pago"].ToString() + delimitador);
                        sb.Append(data["Banco"].ToString() + delimitador);
                        sb.Append(data["moneda"].ToString() + delimitador);
                        sb.Append(data["Monto_Pago"].ToString() + delimitador);
                        sb.Append(data["DETALLE_PAGO"].ToString() + delimitador);
                        sb.Append(data["NInvoice"].ToString() + delimitador);
                        sb.Append(data["operaciones"].ToString() + delimitador);
                        sb.Append("\r\n");
                    }

                    string VALOR = DateTime.Now.ToString("yyyyMMddHHmmss");
                    string RUTA = @"C:\inetpub\wwwroot\Gestion2\Archivos\EXPORTAR_REGISTROS_TOTAL_PAGOS_" + VALOR + ".csv";
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