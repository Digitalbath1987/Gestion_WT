using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Control_Operaciones
{
    public partial class Filtros_Guias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string val = ddlFiltro.SelectedValue.ToString();

            if (val == "Empresa")
            {

                panel_Empresa.Visible = true;
                panel_estado.Visible = false;
                panel_AWB.Visible = false;
      

            }
            else if (val == "Estado")
            {


                panel_Empresa.Visible = false;
                panel_estado.Visible = true;
                panel_AWB.Visible = false;

            }
            else if (val == "AWB_AF")
            {

                panel_Empresa.Visible = false;
                panel_estado.Visible = false;
                panel_AWB.Visible = true;



            }
            else if (val == "Todo")
            {

                panel_Empresa.Visible = false;
                panel_estado.Visible = false;
                panel_AWB.Visible = false;



            }


        }


        protected void gvregistros_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int num = Convert.ToInt32(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            if (e.CommandName == "Pagar")
            {
                string validar = Session["Registrar"].ToString();
                if (validar == "SI")
                {
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "UPDATE Guia SET Estado ='Pagado' WHERE ID='" + num + "'";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    Conn.Close();
                    gvRegistros.DataBind();

                    nook.Visible = false;
                    ok.Visible = false;
                    elinook.Visible = false;
                    eliok.Visible = false;
                    Pagar.Visible = true;

                }
                else
                {
                    nook.Visible = false;
                    ok.Visible = false;
                    elinook.Visible = true;
                    eliok.Visible = false;
                    Pagar.Visible = false;
                }
            }
            if (e.CommandName == "Eliminar")
            {
                string validar = Session["Eliminar"].ToString();
                if (validar == "SI")
                {
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "DELETE FROM Guia  WHERE ID='" + num + "'";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    Conn.Close();
                    gvRegistros.DataBind();
                    //mensaje que se elimino correctamente 
                    nook.Visible = false;
                    ok.Visible = false;
                    elinook.Visible = false;
                    eliok.Visible = true;
                    Pagar.Visible = false;
                }
                else
                {
                    nook.Visible = false;
                    ok.Visible = false;
                    elinook.Visible = true;
                    eliok.Visible = false;
                    Pagar.Visible = false;

                }
            }













        }


        protected void btnFiltrar_ServerClick(object sender, EventArgs e)
        {


            string val = ddlFiltro.SelectedValue.ToString();

            if (val == "Todo"){
            panel_estado.Visible = true;
            Registros.SelectCommand = "SELECT ID,AWBAF,Fecha_Reserva,Destino,Operador,Aerolinea,Operacion,Cliente,Fact_Venta,Moneda,Monto,Estado,CASE When Empresa = 'World Transport Int. Ltda' THEN 'WTI' when  Empresa = 'World Transport Courier ltda' THEN 'WTC' when  Empresa = 'Tres Vias Ltda' THEN 'TR3SV' end as Empresa  ,Fecha_Ingreso,Costo FROM Guia ORDER BY ID DESC";
            gvRegistros.DataBind();
            }else if (val == "AWB_AF"){
            Registros.SelectCommand = "SELECT ID,AWBAF,Fecha_Reserva,Destino,Operador,Aerolinea,Operacion,Cliente,Fact_Venta,Moneda,Monto,Estado,CASE When Empresa = 'World Transport Int. Ltda' THEN 'WTI' when  Empresa = 'World Transport Courier ltda' THEN 'WTC' when  Empresa = 'Tres Vias Ltda' THEN 'TR3SV' end as Empresa  ,Fecha_Ingreso,Costo FROM Guia where AWBAF='"+ txtDocumento.Text +"'   ORDER BY ID DESC";
            gvRegistros.DataBind();
            }else if (val == "Estado"){
            Registros.SelectCommand = "SELECT ID,AWBAF,Fecha_Reserva,Destino,Operador,Aerolinea,Operacion,Cliente,Fact_Venta,Moneda,Monto,Estado,CASE When Empresa = 'World Transport Int. Ltda' THEN 'WTI' when  Empresa = 'World Transport Courier ltda' THEN 'WTC' when  Empresa = 'Tres Vias Ltda' THEN 'TR3SV' end as Empresa  ,Fecha_Ingreso,Costo FROM Guia where Estado ='" + ddlestado.SelectedValue +"'   ORDER BY ID DESC";
            gvRegistros.DataBind();
            }else if (val == "Empresa")
            {
            Registros.SelectCommand = "SELECT ID,AWBAF,Fecha_Reserva,Destino,Operador,Aerolinea,Operacion,Cliente,Fact_Venta,Moneda,Monto,Estado,CASE When Empresa = 'World Transport Int. Ltda' THEN 'WTI' when  Empresa = 'World Transport Courier ltda' THEN 'WTC' when  Empresa = 'Tres Vias Ltda' THEN 'TR3SV' end as Empresa  ,Fecha_Ingreso,Costo FROM Guia where Empresa ='" + ddlempresa.SelectedValue + "'   ORDER BY ID DESC";
            gvRegistros.DataBind();
            }
         




        }



    }
}