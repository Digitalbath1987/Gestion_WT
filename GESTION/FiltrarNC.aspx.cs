using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Otros
{
    public partial class FiltrarNC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string val = ddlFiltro.SelectedValue.ToString();

           if (val == "Empresa")
            {

                Panel_Empresa.Visible = true;

                panel_tipo.Visible = false;
                panel_Doc.Visible = false;
                panel_OP.Visible = false;

              

            }
            else if (val == "Tipo")
            {

                Panel_Empresa.Visible = false;
                             panel_tipo.Visible = true;
           
                panel_Doc.Visible = false;
                panel_OP.Visible = false;

              


            }
            else if (val == "Factura")
            {

                Panel_Empresa.Visible = false;
                panel_Doc.Visible = true;
  
                panel_tipo.Visible = false;
          
                panel_OP.Visible = false;

             

            }
            else if (val == "Todo")
            {

                Panel_Empresa.Visible = false;
                panel_Doc.Visible = false;

                panel_tipo.Visible = false;
  
                panel_OP.Visible = false;

         
            }
            else if (val == "Operacion")
            {

                Panel_Empresa.Visible = false;
                panel_Doc.Visible = false;

                panel_tipo.Visible = false;
       
                panel_OP.Visible = true;

           

            }

        }



        protected void btnFiltrar_ServerClick(object sender, EventArgs e)
        {


            string val = ddlFiltro.SelectedValue.ToString();

           if (val == "Empresa")
            {


                Panel_Empresa.Visible = true;
                
                NotasdeNC.SelectCommand = "SELECT id_NC,Empresas.RazonSocial as Empresa,NOperación,NFactura,TotalNC,NNC,tiponota  FROM NotaCreditos , Empresas where NotaCreditos.Empresa = Empresas.id_Empresa and Empresas.RazonSocial='" + ddlempresa.SelectedValue + "' order by id_NC Desc";
                NotasdeNC.DataBind();






            }
            else if (val == "Tipo")
            {
                panel_tipo.Visible = true;


                NotasdeNC.SelectCommand = "SELECT id_NC,Empresas.RazonSocial as Empresa,NOperación,NFactura,TotalNC,NNC,tiponota  FROM NotaCreditos , Empresas where NotaCreditos.Empresa = Empresas.id_Empresa and tiponota='" + ddlTipo.SelectedValue + "' order by id_NC Desc";
                NotasdeNC.DataBind();

                
            }
            else if (val == "Factura")
            {
                panel_Doc.Visible = true;

                NotasdeNC.SelectCommand = "SELECT id_NC,Empresas.RazonSocial as Empresa,NOperación,NFactura,TotalNC,NNC,tiponota  FROM NotaCreditos , Empresas where NotaCreditos.Empresa = Empresas.id_Empresa and NFactura='" + txtDocumento.Text + "' order by id_NC Desc";
                NotasdeNC.DataBind();




            }
            else if (val == "Todo")
            {
                Panel_Empresa.Visible = false;
                panel_Doc.Visible = false;

                panel_tipo.Visible = false;

                panel_OP.Visible = false;

                NotasdeNC.SelectCommand = "SELECT id_NC,Empresas.RazonSocial as Empresa,NOperación,NFactura,TotalNC,NNC,tiponota FROM NotaCreditos , Empresas where NotaCreditos.Empresa = Empresas.id_Empresa Order BY id_NC DESC";
                NotasdeNC.DataBind();


            }
            else if (val == "Operacion")
            {

                panel_OP.Visible = true;


                NotasdeNC.SelectCommand = "SELECT id_NC,Empresas.RazonSocial as Empresa,NOperación,NFactura,TotalNC,NNC,tiponota  FROM NotaCreditos , Empresas where NotaCreditos.Empresa = Empresas.id_Empresa and NOperación='" + txtoperacion.Text + "' order by id_NC Desc";
                NotasdeNC.DataBind();



        
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
                str = "window.open('/Gestion2/ImprimirNC.aspx','Nota de Creditos','width=980px,height=980px,sc rollbars=no,resizable=no')";
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
                if (dr.HasRows)
                {
                    if (dr["linkpdf"].ToString() == "")
                    {
                        SinNC.Visible = true;
                
                    }
                    else
                    {
                        System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
                        response.ClearContent();
                        response.Clear();
                        response.ContentType = "text/plain";
                        response.AddHeader("Content-Disposition", "attachment; filename=Nota de Credito " + dr["NNC"] + ".pdf;");
                        response.TransmitFile(Server.MapPath("" + dr["linkpdf"] + ""));
                        response.Flush();
                        response.End();
                    }
                }
                else
                {
                    SinNC.Visible = true;
                }
                Conn.Close();
            }
        }


    }
}