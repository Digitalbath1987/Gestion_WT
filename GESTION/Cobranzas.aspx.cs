using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Cheques
{
    public partial class Cobranzas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  ORDER BY NdeCobro DESC";
                gvNdCobro.DataBind();
            }

        }




        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

            int value = int.Parse(DDLESTADO.SelectedValue) + int.Parse(ddempresa.SelectedValue);
            
            switch (value)
            {
                case 0: // todos
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();

                    break;
                case 1: // world transport todos
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  And Sol_Cheques.Empresa = 'World Transport Int. Ltda'  ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();
                    break;

                case 2: // tresvias todos
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  And Sol_Cheques.Empresa = 'Tres Vias Ltda '  ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();
                    break;



                  
                case 3: // world courier todos
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  And Sol_Cheques.Empresa = 'World Transport Courier ltda'  ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();
                    break;



                case 11: //Todos pendientes
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  And NotadeCobro.Pagado = 'False' ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();

                    break;

               case 12: // worldtransport pendientes
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  And Sol_Cheques.Empresa = 'World Transport Int. Ltda' AND NotadeCobro.Pagado = 'False' ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();

                    break;
                case 13: // tres vias pendientes
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  And Sol_Cheques.Empresa = 'Tres Vias Ltda ' AND NotadeCobro.Pagado = 'False' ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();
                    break;

                case 14: // world courier pendientes
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  And Sol_Cheques.Empresa = 'World Transport Courier ltda' AND NotadeCobro.Pagado = 'False' ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();
                    break;
                    

                case 22: //todos pagados
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro AND NotadeCobro.Pagado = 'True' ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();
                    break;

                case 23: //worldtransport pagados
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  And Sol_Cheques.Empresa = 'World Transport Int. Ltda' AND NotadeCobro.Pagado = 'True' ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();
                    break;

                case 24: //tresvias pagados
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro And Sol_Cheques.Empresa = 'Tres Vias Ltda ' AND NotadeCobro.Pagado = 'True' ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();
                    break;

                         


                case 25: // world courier Pagados
                    NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  And Sol_Cheques.Empresa = 'World Transport Courier ltda' AND NotadeCobro.Pagado = 'True' ORDER BY NdeCobro DESC";
                    gvNdCobro.DataBind();
                    break;
                                   


            }














        }



       




        protected void gvNdCobro_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Notdecobr"] = int.Parse(gvNdCobro.SelectedValue.ToString());
            Session["SolCheque"] = Session["Notdecobr"].ToString();
            ClientScript.RegisterStartupScript(GetType(), "popuopmodal", "MostrarModalJS();", true);

            cargar();


        }




        protected void cargar()
        {
            lblNdecobro.Text = Session["Notdecobr"].ToString();
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT distinct NotadeCobro.Pagado,NotadeCobro.Fecha_Vencimiento ,NotadeCobro.fecha_de_Pago ,NotadeCobro.Usuario_Pago,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro And NotadeCobro.NdeCobro ='" + lblNdecobro.Text + "'  ORDER BY NdeCobro DESC";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblempresa.Text = dr["Empresa"].ToString();
            string estado = dr["Pagado"].ToString();
            if (estado == "True"){
            lblEstado.Text = "Pagado";
            this.lblEstado.ForeColor = System.Drawing.Color.Green;
                btnpagado.Visible = false;
                lblUsuariopago.Text = dr["Usuario_Pago"].ToString();
                lblfechapago.Text = dr["fecha_de_Pago"].ToString();

            }
            else{
            lblEstado.Text = "Pendiente";
            this.lblEstado.ForeColor = System.Drawing.Color.Red;
                btnpagado.Visible = true;

                lblUsuariopago.Text = "Sin Registrar";
                lblfechapago.Text = "Sin Registrar";


            }

            txtrut.Text = dr["Rut"].ToString();
            txtsr.Text = dr["Señores"].ToString();
            txtgiro.Text = dr["Giro"].ToString();
            txtciudad.Text = dr["Ciudad"].ToString();
            txtcomuna.Text = dr["Comuna"].ToString();
            txttelefono.Text = dr["Telefono"].ToString();
            txtfemision.Text = dr["Fecha_Emision"].ToString();
            txtfechpago.Text = dr["Fecha_Vencimiento"].ToString();
            txtValor.Text = dr["precio"].ToString();

            Conn.Close();

            







        }








        protected void btngrabartodo_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                DateTime Hoy = DateTime.Today;

                cmd.CommandText = "UPDATE NotadeCobro  SET  Pagado ='True', fecha_de_Pago = '" + Hoy.ToString("dd-MM-yyyy") +"' ,Usuario_Pago = '"+ Session["Usuario"] + "'WHERE NdeCobro='"+ Session["Notdecobr"] + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                Conn.Close();


                regok.Visible = true;
                regnook.Visible = false;
                NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  ORDER BY NdeCobro DESC";
                gvNdCobro.DataBind();
            }
            catch (Exception ex){


                regnook.Visible = true;
                regok.Visible = false;
                NotadeCobro.SelectCommand = "SELECT distinct NotadeCobro.Pagado ,Sol_Cheques.Empresa ,NotadeCobro.Rut, NotadeCobro.Señores, NotadeCobro.Comuna, NotadeCobro.Ciudad, NotadeCobro.Telefono, NotadeCobro.Giro, NotadeCobro.Fecha_Emision, NotadeCobro.NdeCobro, NotadeCobro.Vendedor , (select SUM(CAST( NotadeCobro.Precio1 AS int) + CAST( NotadeCobro.Precio2 AS int) +CAST( NotadeCobro.Precio3 AS int) + CAST( NotadeCobro.Precio4 AS int) + CAST( NotadeCobro.Precio5 AS int) + CAST( NotadeCobro.Precio6 AS int))   from NotadeCobro  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  group by NotadeCobro.Precio1 ) as precio FROM NotadeCobro , Sol_Cheques  where Sol_Cheques.Ncorrelativo = NotadeCobro.NdeCobro  ORDER BY NdeCobro DESC";
                gvNdCobro.DataBind();
            }


        }






    }
}