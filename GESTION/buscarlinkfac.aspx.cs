using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;


namespace GESTION.PagoFacturas
{
    public partial class buscarlinkfac : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
if (!IsPostBack){
             lblid.Text = Session["Selectedmodificar2"].ToString();
                SqlConnection cOnn1 = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                SqlCommand cmd1 = new SqlCommand();
                SqlDataReader dr1;
                cOnn1.Open();
                cmd1.Connection = cOnn1;
                cmd1.CommandText = " SELECT Facturas.id_Factura,Facturas.Fecha_Recepcion,Facturas.Fecha_Emision,Facturas.Customer,Facturas.Nombre_Agente,Facturas.NOperacion,Facturas.Empresa,Facturas.Moneda,Facturas.Importe_Factura,Facturas.Condicion,Facturas.Estado,Facturas.Comentario,Facturas.Detalle,Facturas.Fecha_Pago,Facturas.NInvoice  ,Facturas.TipoCambio ,Facturas.Pesos FROM Facturas WHERE Facturas.id_Factura = '" + lblid.Text + "'";
                dr1 = cmd1.ExecuteReader();
                dr1.Read();
                if (dr1.HasRows){
                    txtNInvoice2.Text = dr1["NInvoice"].ToString();
                    txtFRecepcion2.Text = dr1["Fecha_Recepcion"].ToString();
                    txtFEmision2.Text = dr1["Fecha_Emision"].ToString();
                    ddlcustomers2.SelectedValue = dr1["Customer"].ToString();
                    ddlNombreagente2.SelectedValue = dr1["Nombre_Agente"].ToString();
                    txtNOperacion2.Text = dr1["NOperacion"].ToString();
                    ddlEmpresa2.SelectedValue = dr1["Empresa"].ToString();
                    ddlMoneda2.SelectedValue = dr1["Moneda"].ToString();
                    txtImporte2.Text = dr1["Importe_Factura"].ToString();
                    txtCondicion2.Text = dr1["Condicion"].ToString();
                    txtComentario2.Text = dr1["Comentario"].ToString();
                    txtDetalle2.Text = dr1["Detalle"].ToString();
                    txtFechaPago2.Text = dr1["Fecha_Pago"].ToString();
                    ddlestadof2.SelectedValue = dr1["Estado"].ToString();
                    txttipocambio.Text= dr1["TipoCambio"].ToString();
                    txtpesos.Text = dr1["Pesos"].ToString();

                    lblmensaje2.Text = "Nº de Invoice Existe ";
                    this.lblmensaje2.ForeColor = System.Drawing.Color.Green;
                    lblmensaje2.Visible = true;
                    btnModificar2.Enabled = true;
                    btnModificar2.Visible = true;
                }else{
                    lblmensaje2.Text = "Nº de Invoice no Existe ";
                    this.lblmensaje2.ForeColor = System.Drawing.Color.Red;
                    lblmensaje2.Visible = true;
                    btnModificar2.Enabled = false;
                    }

                cOnn1.Close();




                Validate();
            }




        }


        protected void btnModificar_Click(object sender, EventArgs e)
        {
            btnActualizar.Visible = true;
            btnModificar2.Visible = false;
            txtComentario2.Enabled = true;
            txtCondicion2.Enabled = true;
            txtDetalle2.Enabled = true;
            txtFechaPago2.Enabled = true;
            txtFEmision2.Enabled = true;
            txtFRecepcion2.Enabled = true;
            txtImporte2.Enabled = true;
            txtNInvoice2.Enabled = true;
            txtNOperacion2.Enabled = true;
            ddlcustomers2.Enabled = true;
            ddlEmpresa2.Enabled = true;
            ddlestadof2.Enabled = true;
            ddlMoneda2.Enabled = true;
            ddlNombreagente2.Enabled = true;
            txtpesos.Enabled = true;
            txttipocambio.Enabled = true;


        }

    

        protected void txtNInvoice2_TextChanged(object sender, EventArgs e)
        {
          




        }

        protected void txtFEmision2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnActualizar_Click1(object sender, EventArgs e)
        {


        


            SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr2;

            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "UPDATE Facturas   SET Fecha_Recepcion = '" + txtFRecepcion2.Text + "'  ,Fecha_Emision = '" + txtFEmision2.Text + "', Customer = '" + ddlcustomers2.SelectedValue + "',      Nombre_Agente = '" + ddlNombreagente2.SelectedValue + "',       NInvoice = '" + txtNInvoice2.Text + "'  , NOperacion = '" + txtNOperacion2.Text + "',  Empresa = '" + ddlEmpresa2.SelectedValue + "',  Moneda = '" + ddlMoneda2.SelectedValue + "',      Importe_Factura = '" + txtImporte2.Text + "',      Condicion = '" + txtCondicion2.Text + "',      Comentario = '" + txtComentario2.Text + "',      Detalle = '" + txtDetalle2.Text + "',       Fecha_Pago = '" + txtFechaPago2.Text + "',       Fecha = '" + DateTime.Today + "' ,      Estado = '" + ddlestadof2.SelectedValue + "', Facturas.TipoCambio = '" + txttipocambio.Text + "', Facturas.Pesos = '" + txtpesos.Text + "' WHERE id_Factura = '" + Session["auxiliar"]  + "' ";
            dr2 = cmd.ExecuteReader();
            dr2.Read();

            lblmensaje2.Text = "Los Datos se Actualizaron Correctamente ....";
            this.lblmensaje2.ForeColor = System.Drawing.Color.Green;
            lblmensaje2.Visible = true;
            Conn.Close();


            txtComentario2.Enabled = false;
            txtCondicion2.Enabled = false;
            txtDetalle2.Enabled = false;
            txtFechaPago2.Enabled = false;
            txtFEmision2.Enabled = false;
            txtFRecepcion2.Enabled = false;
            txtImporte2.Enabled = false;
            txtNInvoice2.Enabled = true;
            txtNOperacion2.Enabled = false;
            ddlcustomers2.Enabled = false;
            ddlEmpresa2.Enabled = false;
            ddlestadof2.Enabled = false;
            ddlMoneda2.Enabled = false;
            ddlNombreagente2.Enabled = false;
            txtNInvoice2.Enabled = false;
            txtpesos.Enabled = false;
            txtpesos.Enabled = false;
            btnActualizar.Visible = false;
            btnModificar2.Visible = false;
        }

        protected void btnEliminar_Click(object sender, ImageClickEventArgs e)
        {

            if (Session["Perfil"].ToString() == "Administrador")
            {


                SqlConnection Conn3 = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr3;

                Conn3.Open();
                cmd.Connection = Conn3;
                cmd.CommandText = "  DELETE FROM Facturas WHERE id_Factura = '" + Session["Selectedmodificar2"] + "' ";
                dr3 = cmd.ExecuteReader();
                dr3.Read();

             
               



                lblmensaje2.Text = "Registro Eliminado";
                this.lblmensaje2.ForeColor = System.Drawing.Color.Green;
                lblmensaje2.Visible = true;
                Conn3.Close();


            }
            else
            {

                lblmensaje2.Text = "No Posee Permisos Necesarios,Contacte al Administrador";
                this.lblmensaje2.ForeColor = System.Drawing.Color.Red;
                lblmensaje2.Visible = true;



            }














        }

        protected void txtImporte2_TextChanged(object sender, EventArgs e)
        {
            calcular();
            txtpesos.Focus();
        }

        private void calcular()
        {
            double value;
            value = Convert.ToDouble(Convert.ToDouble(txttipocambio.Text) * Convert.ToDouble(txtImporte2.Text));
            CultureInfo elGR = CultureInfo.CreateSpecificCulture("el-GR");
            Console.WriteLine(value.ToString("0,0", elGR));
            txtpesos.Text = String.Format(elGR, "{0:0,0}", value);
            
        }

        protected void txtPesos_TextChanged(object sender, EventArgs e)
        {
            calcular();
            ddlestadof2.Focus();
        }

      

        protected void ddlMoneda2_SelectedIndexChanged(object sender, EventArgs e)
        {
            txttipocambio.Focus();

            if (ddlMoneda2.SelectedItem.ToString() == "CLP")
            {
                txttipocambio.Text = "000,00";
                txtpesos.Text = txtImporte2.Text;
                txttipocambio.Enabled = false;

            }
            else
            {

                txttipocambio.Enabled = true;

            }

        }

        protected void txttipocambio_TextChanged(object sender, EventArgs e)
        {
            calcular();
            txtpesos.Focus();
        }
    }
}