using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace GESTION.PagoFacturas
{
    public partial class BuscarFacturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnActualizar_Click1(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "UPDATE Facturas SET Fecha_Recepcion = '" + txtFRecepcion.Text + "', Fecha_Emision = '" + txtFEmision.Text + "', Customer ='" + ddlcustomers.SelectedValue + "', Nombre_Agente ='" + ddlNombreagente.SelectedValue + "', NOperacion = '" + txtNOperacion.Text + "', Empresa ='" + ddlEmpresa.SelectedValue + "', Moneda ='" + ddlMoneda.SelectedValue + "', Importe_Factura ='" + txtImporte.Text + "',Estado ='" + ddlestadof.SelectedValue + "', Condicion ='" + txtCondicion.Text + "', Comentario ='" + txtComentario.Text + "', Detalle ='" + txtDetalle.Text + "', Fecha_Pago ='" + txtFechaPago.Text + "', id_Usuario ='" + Session["id_Usuario"] + "', Fecha ='" + DateTime.Today  + "' WHERE NInvoice = '" + txtNInvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();

            lblmensaje.Text = "Los Datos se Actualizaron Correctamente ....";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;
            Conn.Close();

           
            txtComentario.Enabled = false;
            txtCondicion.Enabled = false;
            txtDetalle.Enabled = false;
            txtFechaPago.Enabled = false;
            txtFEmision.Enabled = false;
            txtFRecepcion.Enabled = false;
            txtImporte.Enabled = false;
            txtNInvoice.Enabled = true;
            txtNOperacion.Enabled = false;
            ddlcustomers.Enabled = false;
            ddlEmpresa.Enabled = false;
            ddlestadof.Enabled = false;
            ddlMoneda.Enabled = false;
            ddlNombreagente.Enabled = false;

            btnActualizar.Visible = false;
            btnModificar.Visible = false;

        }

        protected void btnbuscar_Click1(object sender, EventArgs e)
        {
            SqlConnection cOnn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

           
            cOnn.Open();
            cmd.Connection = cOnn;
            cmd.CommandText = " SELECT Facturas.id_Factura,Facturas.Fecha_Recepcion,Facturas.Fecha_Emision,Facturas.Customer,Facturas.Nombre_Agente,Facturas.NOperacion,Facturas.Empresa,Facturas.Moneda,Facturas.Importe_Factura,Facturas.Condicion,Facturas.Estado,Facturas.Comentario,Facturas.Detalle,Facturas.Fecha_Pago FROM Facturas WHERE Facturas.NInvoice = '" + txtNInvoice.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                txtFRecepcion.Text = dr["Fecha_Recepcion"].ToString();
                txtFEmision.Text = dr["Fecha_Emision"].ToString();
                ddlcustomers.SelectedValue = dr["Customer"].ToString();
                ddlNombreagente.SelectedValue = dr["Nombre_Agente"].ToString();
                txtNOperacion.Text = dr["NOperacion"].ToString();
                ddlEmpresa.SelectedValue = dr["Empresa"].ToString();
                ddlMoneda.SelectedValue = dr["Moneda"].ToString();
                txtImporte.Text = dr["Importe_Factura"].ToString();
                txtCondicion.Text = dr["Condicion"].ToString();
                txtComentario.Text = dr["Comentario"].ToString();
                txtDetalle.Text = dr["Detalle"].ToString();
                txtFechaPago.Text = dr["Fecha_Pago"].ToString();
                ddlestadof.SelectedValue = dr["Estado"].ToString();
                lblmensaje.Text = "Nº de Invoice Existe ";
                this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                lblmensaje.Visible = true;
                btnModificar.Enabled = true;
                btnModificar.Visible = true;
            }
            else
            {
                lblmensaje.Text = "Nº de Invoice no Existe ";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
                btnModificar.Enabled = false;

            }

            cOnn.Close();

            





        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            btnActualizar.Visible = true;
            btnModificar.Visible = false;
            txtComentario.Enabled = true;
            txtCondicion.Enabled = true;
            txtDetalle.Enabled = true;
            txtFechaPago.Enabled = true;
            txtFEmision.Enabled = true;
            txtFRecepcion.Enabled = true;
            txtImporte.Enabled = true;
            txtNInvoice.Enabled = true;
            txtNOperacion.Enabled = true;
            ddlcustomers.Enabled = true;
            ddlEmpresa.Enabled = true;
            ddlestadof.Enabled = true;
            ddlMoneda.Enabled = true;
            ddlNombreagente.Enabled = true; 



        }

        protected void ddlcustomers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}