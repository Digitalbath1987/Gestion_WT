using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Data.SqlClient;
using Gestion.CapadeDatos;
using System.Net;
using System.Globalization;

using System.Data;

namespace GESTION.Otros
{
    public partial class IngresarNotaCreditos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

         




            
        }

        protected void txtMontoNetoFact_TextChanged(object sender, EventArgs e)
        {
            if (ddlTipoFact.SelectedItem.ToString() == "AFECTA")
            {


                double value7;
                value7 = Convert.ToDouble(Convert.ToDouble(txtMontoNetoFact.Text) * 0.19);
                CultureInfo elGR7 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value7.ToString("0,0", elGR7));
                txtMontoIVAFact.Text = String.Format(elGR7, "{0:0,0}", value7);

                txtMontoIVANC.Text = txtMontoIVAFact.Text;

                txtMontoExentoFact.Text = "0";
                txtMontoExentoNC.Text = "0";


                double value6;
                value6 = Convert.ToDouble(txtMontoNetoFact.Text);
                CultureInfo elGR6 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value6.ToString("0,0", elGR6));
                txtMontoNetoNC.Text = String.Format(elGR6, "{0:0,0}", value6);

                double value2;
                value2 = (Convert.ToDouble(txtMontoNetoFact.Text) + Convert.ToDouble(txtMontoIVAFact.Text));
                CultureInfo elGR = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value2.ToString("0,0", elGR));
                txtTotalFact.Text = String.Format(elGR, "{0:0,0}", value2);

                double value1;
                value1 = Convert.ToDouble(txtTotalFact.Text);
                CultureInfo elGR1 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value1.ToString("0,0", elGR1));
                txtTotalNC.Text = String.Format(elGR1, "{0:0,0}", value1);

            }
            else if (ddlTipoFact.SelectedItem.ToString() == "EXENTA")
            {


                txtMontoIVAFact.Text = "0";
                txtMontoIVANC.Text = "0";

                double value3;
                value3 = Convert.ToDouble(txtMontoNetoFact.Text);
                CultureInfo elGR1 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value3.ToString("0,0", elGR1));
                txtMontoExentoFact.Text = String.Format(elGR1, "{0:0,0}", value3);

                double value4;
                value4 = Convert.ToDouble(txtMontoNetoFact.Text);
                CultureInfo elGR4 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value4.ToString("0,0", elGR4));
                txtMontoExentoNC.Text = String.Format(elGR4, "{0:0,0}", value4);

                double value5;
                value5 = Convert.ToDouble(txtMontoNetoFact.Text);
                CultureInfo elGR5 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value5.ToString("0,0", elGR5));
                txtMontoNetoNC.Text = String.Format(elGR5, "{0:0,0}", value5);

                double value1;
                value1 = Convert.ToDouble(txtMontoNetoFact.Text);
                CultureInfo elGR3 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value1.ToString("0,0", elGR3));
                txtTotalFact.Text = String.Format(elGR3, "{0:0,0}", value1);

                double value;
                value = Convert.ToDouble(txtMontoNetoFact.Text);
                CultureInfo elGR = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value.ToString("0,0", elGR));
                txtTotalNC.Text = String.Format(elGR, "{0:0,0}", value);

            }
        }

        protected void txtMontoNetoNC_TextChanged(object sender, EventArgs e)
        {
            if (ddlTipoFact.SelectedItem.ToString() == "AFECTA")
            {

                double value8;
                value8 = (Convert.ToDouble(txtMontoNetoNC.Text) * 0.19);
                CultureInfo elGR8 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value8.ToString("0,0", elGR8));
                txtMontoIVANC.Text = String.Format(elGR8, "{0:0,0}", value8);

                double value1;
                value1 = (Convert.ToDouble(txtMontoIVANC.Text) + Convert.ToDouble(txtMontoNetoNC.Text));
                CultureInfo elGR1 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value1.ToString("0,0", elGR1));
                txtTotalNC.Text = String.Format(elGR1, "{0:0,0}", value1);

            }
            else if (ddlTipoFact.SelectedItem.ToString() == "EXENTA")
            {
                double value1;
                double value2;
                txtMontoIVANC.Text = "0";


                value2 = Convert.ToDouble(txtMontoNetoNC.Text);
                CultureInfo elGR2 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value2.ToString("0,0", elGR2));
                txtMontoExentoNC.Text = String.Format(elGR2, "{0:0,0}", value2);

                value1 = Convert.ToDouble(txtMontoNetoNC.Text);

                CultureInfo elGR1 = CultureInfo.CreateSpecificCulture("el-GR");
                Console.WriteLine(value1.ToString("0,0", elGR1));
                txtTotalNC.Text = String.Format(elGR1, "{0:0,0}", value1);

            }





        }

        protected void ddlTipoFact_TextChanged(object sender, EventArgs e)
        {

            if (ddlTipoFact.SelectedItem.ToString() == "EXENTA")
            {

                txtMontoIVAFact.Text = "0";
                txtMontoIVANC.Text = "0";


            }
        }

        protected void btnRegistrar_ServerClick(object sender, EventArgs e) {
            int usuario;
            usuario = (Convert.ToInt32(Session["id_Usuario"]));
            Entidades.Gestion.IngresarNC ingresarnc = new Entidades.Gestion.IngresarNC();
            try {
                           
                ingresarnc.Empresa = int.Parse(ddlEmpresa.SelectedValue.ToString());
                ingresarnc.Cliente = txtCliente.Text;
                ingresarnc.RUT = txtRut.Text;
                ingresarnc.Motivo = ddlmotivo.SelectedItem.ToString();
                ingresarnc.Detalle = txtDetallemotivo.Text;
                ingresarnc.NOperación = txtNOperacion.Text;
                ingresarnc.NFactura = int.Parse(txtNFactura.Text);
                ingresarnc.FechaFactura = DateTime.Parse(txtFechaFactura.Text);
                ingresarnc.idTipoFactura = int.Parse(ddlTipoFact.SelectedValue.ToString());
                ingresarnc.MontoNetoFact = txtMontoNetoFact.Text;
                ingresarnc.MontoIVAFact = txtMontoIVAFact.Text;
                ingresarnc.MontoExentoFact = txtMontoExentoFact.Text;
                ingresarnc.TotalFact = txtTotalFact.Text;
                ingresarnc.MontoNetoNC = txtMontoNetoNC.Text;
                ingresarnc.MontoIVANC = txtMontoIVANC.Text;
                ingresarnc.MontoExentoNC = txtMontoExentoNC.Text;
                ingresarnc.TotalNC = txtTotalNC.Text;
                ingresarnc.id_Usuario = usuario;
                ingresarnc.FechaRegistro = DateTime.Today;
                ingresarnc.Vendedor = txtNombreVendedor.Text;
                ingresarnc.FacturaReemplazante = txtnfacReemplazante.Text;
                ingresarnc.tiponota = ddltiponota.SelectedValue.ToString();
                ingresarnc.fecha = DateTime.Today.ToString();//revisa
                GestorGestion gestorgestion = new GestorGestion();
                bool result = gestorgestion.IngresarNC(ingresarnc);
                if (result == true)  {
                    Alertaok.Visible = true;
                    NOOK.Visible = false;
                    SinNC.Visible = false;
                    gvnotacreditos.DataBind();
                    txtCliente.Text = "";
                    txtDetallemotivo.Text = "";
                    txtFechaFactura.Text = "";
                    txtMontoExentoFact.Text = "";
                    txtMontoExentoNC.Text = "";
                    txtMontoIVAFact.Text = "";
                    txtMontoIVANC.Text = "";
                    txtMontoNetoFact.Text = "";
                    txtMontoNetoNC.Text = "";
                    txtNFactura.Text = "";
                    txtNOperacion.Text = "";
                    txtRut.Text = "";
                    txtTotalFact.Text = "";
                    txtTotalNC.Text = "";
                    txtNombreVendedor.Text = "";
                    txtnfacReemplazante.Text = "";
                    DateTime fecha = DateTime.Now;

                } else {
                    NOOK.Visible = true;
                    SinNC.Visible = false;
                    NOOK.Visible = false;
                }
            }
            catch (Exception)
            {

                NOOK.Visible = true;
                SinNC.Visible = false;
                NOOK.Visible = false;

            }
        }

        protected void gvnotacreditos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int num = Convert.ToInt32(e.CommandArgument);
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            if (e.CommandName == "Imprimir")
            {
                Session["Selectedvernc"] = e.CommandArgument.ToString();
                string str;
                str = "window.open('ImprimirNC.aspx','Nota de Creditos','width=980px,height=980px,sc rollbars=no,resizable=no')";
                Response.Write("<script languaje=javascript>" + str + "</script>");

            }
            if (e.CommandName == "NotaCD")
            {

                    Session["Selectedvernc"] = e.CommandArgument.ToString();
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "SELECT linkpdf,NNC FROM NotaCreditos where id_NC = '" + Session["Selectedvernc"] + "' ";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                       if (dr.HasRows){
                                if (dr["linkpdf"].ToString() == ""){
                        SinNC.Visible = true;
                        NOOK.Visible = false;
                    }
                    else {
                                 System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
                                 response.ClearContent();
                                 response.Clear();
                                 response.ContentType = "text/plain";
                                 response.AddHeader("Content-Disposition","attachment; filename=Nota de Credito " + dr["NNC"] + ".pdf;");
                                 response.TransmitFile(Server.MapPath("" + dr["linkpdf"] + ""));
                                 response.Flush();
                                 response.End();
                                }
                       }else{
                          SinNC.Visible = true;
                }
                    Conn.Close();
            }
        }

        protected void btnCargarNC_ServerClick(object sender, EventArgs e){

            if (Session["Perfil"].ToString() == "Administrador"){
                string str;
                str = "window.open('finalizarNC.aspx','Buscar Debit Note','width=450px,height=200px,sc rollbars=no,resizable=no')";
                Response.Write("<script languaje=javascript>" + str + "</script>");
            }else if (Session["Perfil"].ToString() == "Contabilidad"){
                string str;
                str = "window.open('finalizarNC.aspx','Buscar Debit Note','width=450px,height=200px,sc rollbars=no,resizable=no')";
                Response.Write("<script languaje=javascript>" + str + "</script>");
            }else{

                sinper.Visible = true;
                SinNC.Visible = false;
                Alertaok.Visible = false;
                NOOK.Visible = false;
            }

        }

        protected void btnModReg_ServerClick(object sender, EventArgs e)
        {

            if (Session["Modificar"].ToString() == "SI"){
                string str;
                str = "window.open('ModificarNC.aspx','Modificar','width=450px,height=600px,sc rollbars=no,resizable=no')";
                Response.Write("<script languaje=javascript>" + str + "</script>");
            }
            else
            {
                sinper.Visible = true;
                SinNC.Visible = false;
                Alertaok.Visible = false;
                NOOK.Visible = false;
            }

        }
    }
    
}