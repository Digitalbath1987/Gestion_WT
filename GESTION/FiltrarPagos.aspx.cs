using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Entidades.Gestion;
using Gestion.CapadeDatos;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;

namespace GESTION.PagoFacturas
{
    public partial class FiltrarPagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                string valor = ddlfiltro.SelectedValue.ToString();
            if (valor == "0")
            {

                txtfiltro.Enabled = false;
                RBFecha.SelectedValue = "SI";
                    fechadesde.Visible = true;
                    FechaHasta.Visible = true;
                    txtFechaDesde.Visible = true;
                    txtFechaHasta.Visible = true;
                    tipofecha.Visible = true;
                    ddltipofecha.Visible = true;

                }
            else
            {

                txtfiltro.Enabled = true;


            }


            }

        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            int num;
            int tipofecha = int.Parse(ddltipofecha.SelectedValue.ToString());
            string rangofecha = RBFecha.SelectedValue.ToString();
            if (rangofecha =="SI"){
             num = int.Parse(ddlfiltro.SelectedValue.ToString()) + tipofecha;
            }else{
            num = int.Parse(ddlfiltro.SelectedValue.ToString());
            }
            switch (num){
                case 1:
                    //buscar facturas por Nº factura
                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND Facturas2.ninvoice ='" + txtfiltro.Text + "'";
                    gvfiltro.DataBind();
                    break;
                case 2:
                    break;
                case 3:
                    //buscar facturas por Id Factura

                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND  Facturas2.id_factura ='" + txtfiltro.Text + "'";
                    gvfiltro.DataBind();
                    break;
                case 11:
                    //buscar Nº factura + fecha invoice
                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND Facturas2.ninvoice ='" + txtfiltro.Text + "' and  Facturas2.FINVOICE BETWEEN '" + txtFechaDesde.Text + "' AND '" + txtFechaHasta.Text + "'";
                    gvfiltro.DataBind();
                    break;
                case 12:
                    break;
                case 13:
                    //buscar Id Factura + fecha invoice
                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND  WHERE Facturas2.id_factura ='" + txtfiltro.Text + "' and  Facturas2.FINVOICE BETWEEN '" + txtFechaDesde.Text + "' AND '" + txtFechaHasta.Text + "'";
                    gvfiltro.DataBind();
                    break;
                case 16:
                    //buscar Nº factura + fecha Registro
                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND  Facturas2.FINVOICE ='" + txtfiltro.Text + "' and  Facturas2.fechaingreso BETWEEN '" + txtFechaDesde.Text + "' AND '" + txtFechaHasta.Text + "'";
                    gvfiltro.DataBind();
                break;
                case 17:
                    //buscar Nº Operacion + fecha Registro  aqui hay que hacer el webo pal javi



                    break;
                case 18:
                    //buscar Id Factura + fecha Registro
                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND Facturas2.id_factura ='" + txtfiltro.Text + "' and  Facturas2.fechaingreso BETWEEN '" + txtFechaDesde.Text + "' AND '" + txtFechaHasta.Text + "'";
                    gvfiltro.DataBind();
                    break;
                case 21://buscar Nº factura + fecha Pago
                    filtropagos.SelectCommand = "SELECT DISTINCT id_factura, empresa, agente, ninvoice, FINVOICE, nnc, vnc, fnc, moneda, tc, condicion, observ, detalle, usuario, fechaingreso, estado, fechapago FROM Facturas2 WHERE ninvoice ='" + txtfiltro.Text + "' and  fechapago BETWEEN '" + txtFechaDesde.Text + "' AND '" + txtFechaHasta.Text + "'";
                    gvfiltro.DataBind();
                    break;
                case 22:
                    //buscar Nº Operacion + fecha Pago  qui hay que hacer el webo pal javi
                   break;
                case 23:
                    //buscar Id Factura + fecha Pago
                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND Facturas2.id_factura ='" + txtfiltro.Text + "' and  fechapago BETWEEN '" + txtFechaDesde.Text + "' AND '" + txtFechaHasta.Text + "'";
                    gvfiltro.DataBind();

                    break;

                case 10:
                    //buscar solo fecha invoice

                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND   Facturas2.FINVOICE BETWEEN '" + txtFechaDesde.Text + "' AND '" + txtFechaHasta.Text + "'";
                    gvfiltro.DataBind();


                    break;
                case 15:
                    //buscar solo fecha registro

                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND  Facturas2.fechaingreso BETWEEN '" + txtFechaDesde.Text + "' AND '" + txtFechaHasta.Text + "'";
                    gvfiltro.DataBind();
                    break;
                case 20:
                    //buscar solo fecha pago

                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice AND Facturas2.fechapago BETWEEN '" + txtFechaDesde.Text + "' AND '" + txtFechaHasta.Text + "'";
                    gvfiltro.DataBind();
                    break;
                case 50:
                    //buscar solo fecha pago

                    filtropagos.SelectCommand = "SELECT DISTINCT Facturas2.id_factura, Facturas2.empresa, Facturas2.agente, Facturas2.ninvoice, Facturas2.FINVOICE, Facturas2.nnc, Facturas2.vnc, Facturas2.fnc, Facturas2.moneda, Facturas2.tc, (select SUM(Operaciones.monto) from Operaciones where Operaciones.ninvoice = Facturas2.ninvoice ) as Monto, Facturas2.condicion, Facturas2.observ, Facturas2.detalle, Facturas2.usuario, Facturas2.fechaingreso, Facturas2.estado, Facturas2.fechapago FROM Facturas2 , Operaciones where Facturas2.ninvoice = Operaciones.ninvoice";
                    gvfiltro.DataBind();
                    break;

            }// cierre del switch
           }


        

     
        protected void RBFecha_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RBFecha.SelectedValue =="SI"){
                fechadesde.Visible = true;
                FechaHasta.Visible = true;
                txtFechaDesde.Visible = true;
                txtFechaHasta.Visible = true;
                tipofecha.Visible = true;
                ddltipofecha.Visible = true;
                }else{
                fechadesde.Visible = false;
                FechaHasta.Visible = false;
                txtFechaDesde.Visible = false;
                txtFechaHasta.Visible = false;
                tipofecha.Visible = false;
                ddltipofecha.Visible = false;
            }
           }

        protected void ddlfiltro_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string valor = ddlfiltro.SelectedValue.ToString();
            if (valor == "0"){

                txtfiltro.Enabled = false;
                RBFecha.SelectedValue = "SI";
                fechadesde.Visible = true;
                FechaHasta.Visible = true;
                txtFechaDesde.Visible = true;
                txtFechaHasta.Visible = true;
                tipofecha.Visible = true;
                ddltipofecha.Visible = true;
                }else if(valor == "50"){
                txtfiltro.Enabled = false;
                RBFecha.SelectedValue = "NO";
                fechadesde.Visible = false;
                FechaHasta.Visible = false;
                txtFechaDesde.Visible = false;
                txtFechaHasta.Visible = false;
                tipofecha.Visible = false;
                ddltipofecha.Visible = false;


            }
            else {

                txtfiltro.Enabled = true;


            }





        }

        protected void btnexpexcel_Click(object sender, ImageClickEventArgs e)
        {
            ExportToExcel("PagoAgentes.xls", gvfiltro);

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



    }
}