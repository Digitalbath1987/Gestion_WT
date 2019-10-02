using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace GESTION.Control_Operaciones
{
  

    public partial class Guias : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ModMoneyUSD_Click(object sender, EventArgs e)
        {

            lblmoney.Text = "USD";

        }
        protected void ModMoneyCLP_Click(object sender, EventArgs e)
        {
         lblmoney.Text = "CLP";
        }
        protected void ModMoneyEUR_Click(object sender, EventArgs e)
        {

            lblmoney.Text = "EUR";

        }

        protected void BtnRegistrar_Click(object sender, EventArgs e)
        {
            try {

                //aqui un if del duplicado 
              string valor =  Buscar_Duplicado(txtawbaf.Text);


           

                if(valor != "0")
                {
                    ok.Visible = false;
                    nook.Visible = false;
   
                    existe.Visible = true;
                }
                else
                {

               

                    SqlConnection Conn = new SqlConnection();
                    Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                    SqlCommand cmd = new SqlCommand();
                    SqlDataReader dr;
                    Conn.Open();
                    cmd.Connection = Conn;
                    DateTime Hoy = DateTime.Today;
                    cmd.CommandText = "INSERT INTO Guia(AWBAF,Fecha_Reserva,Destino,Operador,Aerolinea,Operacion,Cliente,Fact_Venta,Moneda,Monto,Estado,Empresa,Fecha_Ingreso,Costo) VALUES('"+ txtawbaf.Text + "','"+ txtfreserva.Text +"','"+ txtdestino.Text +"','" + Session["Usuario"] + "','"+ txtAerolinea.Text +"','"+ txtOperacion.Text +"','"+ txtCliente.Text +"','"+ txtfacventa.Text +"','"+ lblmoney.Text +"','"+ txtmonto.Text +"','Pendiente','"+ DdlEmpresa.SelectedValue  +"','"+ Hoy.ToString("yyyy-MM-dd") + "','" + txtCosto.Text + "')";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    Conn.Close();
                    gvRegistros.DataBind();
                    ok.Visible = true;
                    nook.Visible = false;

                    existe.Visible = false;

                }



            } catch (Exception ex){
                nook.Visible = true;
                ok.Visible = false;
            }
            
        }



        static string  Buscar_Duplicado(string txtawbaf)
        {

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT count(AWBAF) as contador FROM Guia WITH(NOLOCK) where AWBAF='" + txtawbaf +"'";
            dr = cmd.ExecuteReader();
            dr.Read();

            string valor = dr["contador"].ToString();
            return valor;
            
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

        
       
        protected void btnExportar_ServerClick(object sender, EventArgs e)
        {
            ExportToExcel("GuiasAereas.xls", gvDescarga);
            gvDescarga.DataBind();
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



            if (e.CommandName == "Modificar")
            {
                string validar = Session["Registrar"].ToString();
                if (validar == "SI")
                {
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "SELECT ID,AWBAF,Fecha_Reserva,Destino,Operador,Aerolinea,Operacion,Cliente,Fact_Venta,Moneda,Monto,Estado,Empresa,Fecha_Ingreso,Costo FROM Guia WITH(NOLOCK)  WHERE ID='" + num + "'";
                    dr = cmd.ExecuteReader();
                    dr.Read();

                 

                    txtawbaf.Text = dr["AWBAF"].ToString();
                    DdlEmpresa.SelectedValue = dr["Empresa"].ToString();
                    txtfreserva.Text = dr["Fecha_Reserva"].ToString();
                    txtdestino.Text = dr["Destino"].ToString();
                    txtAerolinea.Text = dr["Aerolinea"].ToString();
                    txtCliente.Text = dr["Cliente"].ToString();
                    txtOperacion.Text = dr["Operacion"].ToString();
                    txtfacventa.Text = dr["Fact_Venta"].ToString();
                    txtmonto.Text = dr["Monto"].ToString();
                    lblmoney.Text = dr["Moneda"].ToString();
                    txtCosto.Text = dr["Costo"].ToString();
                    BtnCancelMod.Visible = true;
                    BtnMod.Visible = true;

                    btndescargar.Visible = false;
                    btnverreg.Visible = false;
                    btnRegistrar.Visible = false;

                    Conn.Close();
                    gvRegistros.DataBind();
                    nook.Visible = false;
                    ok.Visible = false;
                    elinook.Visible = false;
                    eliok.Visible = false;
                    Pagar.Visible = false;
                    txtawbaf.Enabled = false;
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

        protected void BtnMod_ServerClick(object sender, EventArgs e)
        {
            
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            string validar = Session["Registrar"].ToString();
            if (validar == "SI")
            {

                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = " UPDATE Guia SET Fecha_Reserva = '"+ txtfreserva.Text  +"',Destino = '"+ txtdestino.Text  +"',Aerolinea = '"+ txtAerolinea +"',Operacion = '"+ txtOperacion.Text +"',Cliente = '"+ txtCliente.Text +"',Fact_Venta = '"+ txtfacventa.Text +"',Moneda = '"+ lblmoney.Text  +"',Monto = '"+ txtmonto.Text +"',Empresa = '"+ DdlEmpresa.SelectedValue + "',Costo = '" + txtCosto.Text + "' WHERE AWBAF ='" + txtawbaf.Text + "'";
                dr = cmd.ExecuteReader();
                dr.Read();


                nook.Visible = false;
                ok.Visible = true;
                elinook.Visible = false;
                eliok.Visible = false;
                Pagar.Visible = false;


                BtnCancelMod.Visible = false;
                BtnMod.Visible = false;

                btndescargar.Visible = true;
                btnverreg.Visible = true;
                btnRegistrar.Visible = true;
                txtfreserva.Text = "";
                txtdestino.Text = "";
                txtAerolinea.Text = "";
                txtOperacion.Text = "";
                txtCliente.Text = "";
                txtfacventa.Text = "";
                txtmonto.Text = "";
                txtawbaf.Text = "";
                txtCosto.Text = "";
                txtawbaf.Enabled = true;
                Conn.Close();
                gvRegistros.DataBind();
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

        protected void BtnCancelMod_ServerClick(object sender, EventArgs e)
        {

         

            txtfreserva.Text = "";
            txtdestino.Text = "";
            txtAerolinea.Text = "";
            txtOperacion.Text = "";
            txtCliente.Text = "";
            txtfacventa.Text = "";
            txtmonto.Text = "";
            txtawbaf.Text = "";
            txtCosto.Text = "";
            txtawbaf.Enabled = true;
            BtnCancelMod.Visible = false;
            BtnMod.Visible = false;

            btndescargar.Visible = true;
            btnverreg.Visible = true;
            btnRegistrar.Visible = true;


        }
    }
}




