using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace GESTION.NotaCobro
{
    public partial class ImpNotaCob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT NotadeCobro.Vendedor,NotadeCobro.Id_NotaCobro,NotadeCobro.Rut,NotadeCobro.Señores,NotadeCobro.Direccion,NotadeCobro.Comuna,NotadeCobro.Ciudad,NotadeCobro.Telefono,NotadeCobro.Giro,NotadeCobro.Fecha_Emision,NotadeCobro.Fecha_Vencimiento,NotadeCobro.Descripcion1,NotadeCobro.Descripcion2,NotadeCobro.Descripcion3,NotadeCobro.Descripcion4,NotadeCobro.Descripcion5,NotadeCobro.Descripcion6,NotadeCobro.Cantidad1,NotadeCobro.Cantidad2,NotadeCobro.Cantidad3,NotadeCobro.Cantidad4,NotadeCobro.Cantidad5,NotadeCobro.Cantidad6,NotadeCobro.Precio1,NotadeCobro.Precio2,NotadeCobro.Precio3,NotadeCobro.Precio4,NotadeCobro.Precio5,NotadeCobro.Precio6,NotadeCobro.Observacion,NotadeCobro.NdeCobro,Sol_Cheques.Embarque,Sol_Cheques.Operacion,Sol_Cheques.Empresa  FROM NotadeCobro , Sol_Cheques where  NotadeCobro.NdeCobro = Sol_Cheques.Ncorrelativo and NotadeCobro.NdeCobro = '" + Session["SolCheque"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();

            lblncobro.Text = dr["NdeCobro"].ToString();
            lblseñores.Text = dr["Señores"].ToString();
            lblrut.Text = dr["Rut"].ToString();
            lblfechaemi.Text = dr["Fecha_Emision"].ToString();
            fechavencimiento.Text = dr["Fecha_Vencimiento"].ToString();
            lbldirecion.Text = dr["Direccion"].ToString();
            lblciudad.Text = dr["Ciudad"].ToString();
            lblcomuna.Text = dr["Comuna"].ToString();
            lblgiro.Text = dr["Giro"].ToString();
            lbltelefono.Text = dr["Telefono"].ToString();
            lblfechaemision.Text = dr["Fecha_Emision"].ToString();
            lblfechavencimiento.Text = dr["Fecha_Vencimiento"].ToString();
            lblnoperacion.Text = dr["Operacion"].ToString();
            lbldocumento.Text = dr["Embarque"].ToString();
            lblcondpago.Text = "5 Dias Contado";
            lbldocumento.Text = dr["Embarque"].ToString();
            lblnoperacion.Text = dr["Operacion"].ToString();

            Descr1.Text = dr["Descripcion1"].ToString();
            Descr2.Text = dr["Descripcion2"].ToString();
            Descr3.Text = dr["Descripcion3"].ToString();
            Descr4.Text = dr["Descripcion4"].ToString();
            Descr5.Text = dr["Descripcion5"].ToString();
            Descr6.Text = dr["Descripcion6"].ToString();

            cant1.Text = dr["Cantidad1"].ToString();
            cant2.Text = dr["Cantidad2"].ToString();
            cant3.Text = dr["Cantidad3"].ToString();
            cant4.Text = dr["Cantidad4"].ToString();
            cant5.Text = dr["Cantidad5"].ToString();
            cant6.Text = dr["Cantidad6"].ToString();

            Total1.Text = dr["Precio1"].ToString();
            Total2.Text = dr["Precio2"].ToString();
            Total3.Text = dr["Precio3"].ToString();
            Total4.Text = dr["Precio4"].ToString();
            Total5.Text = dr["Precio5"].ToString();
            Total6.Text = dr["Precio6"].ToString();
            lblvendedor.Text = dr["Vendedor"].ToString();
             lblobservacion.Text = dr["Observacion"].ToString();



            string empr = dr["Empresa"].ToString();

            if (empr=="World Transport Int. Ltda")
            {

                Image1.ImageUrl = "~/Gestion2/Imagenes/LOGO-WT-BLUE.png";


                lblempresa.Text = "WORLD TRANSPORT INTERNATIONAL LIMITADA";

                
            }
            else if(empr == "Tres Vias Ltda ")
            {
                
                Image1.ImageUrl = "~/Gestion2/Imagenes/logo-2.png";
                lblempresa.Text = "SERVICIOS DE TRANSPORTE Y COMERCIO INTERNACIONALTR3S VIAS LIMITADA";

            }
            else
            {
                Image1.ImageUrl = "~/Gestion2/Imagenes/Courier.png";
                lblempresa.Text = "WORLD TRANSPORT COURIER LIMITADA";
               
            }
            Conn.Close();
            Calcular();



        }


        public void Calcular()
        {

            
         int suma  = int.Parse(Total1.Text) + int.Parse(Total2.Text) + int.Parse(Total3.Text) + int.Parse(Total4.Text) + int.Parse(Total5.Text) + int.Parse(Total6.Text);
         lblsubtotal.Text = suma.ToString();
         lblson.Text = toText(suma).ToString();
         lblNeto.Text = suma.ToString();
            txtiva.Text = "0";
            lblexento.Text = suma.ToString();
            lbltotal.Text = suma.ToString();


        }










        public string toText(double value)
        {
            string Num2Text = "";
            value = Math.Truncate(value);
            if (value == 0) Num2Text = "CERO";
            else if (value == 1) Num2Text = "UNO";
            else if (value == 2) Num2Text = "DOS";
            else if (value == 3) Num2Text = "TRES";
            else if (value == 4) Num2Text = "CUATRO";
            else if (value == 5) Num2Text = "CINCO";
            else if (value == 6) Num2Text = "SEIS";
            else if (value == 7) Num2Text = "SIETE";
            else if (value == 8) Num2Text = "OCHO";
            else if (value == 9) Num2Text = "NUEVE";
            else if (value == 10) Num2Text = "DIEZ";
            else if (value == 11) Num2Text = "ONCE";
            else if (value == 12) Num2Text = "DOCE";
            else if (value == 13) Num2Text = "TRECE";
            else if (value == 14) Num2Text = "CATORCE";
            else if (value == 15) Num2Text = "QUINCE";
            else if (value < 20) Num2Text = "DIECI" + toText(value - 10);
            else if (value == 20) Num2Text = "VEINTE";
            else if (value < 30) Num2Text = "VEINTI" + toText(value - 20);
            else if (value == 30) Num2Text = "TREINTA";
            else if (value == 40) Num2Text = "CUARENTA";
            else if (value == 50) Num2Text = "CINCUENTA";
            else if (value == 60) Num2Text = "SESENTA";
            else if (value == 70) Num2Text = "SETENTA";
            else if (value == 80) Num2Text = "OCHENTA";
            else if (value == 90) Num2Text = "NOVENTA";
            else if (value < 100) Num2Text = toText(Math.Truncate(value / 10) * 10) + " Y " + toText(value % 10);
            else if (value == 100) Num2Text = "CIEN";
            else if (value < 200) Num2Text = "CIENTO " + toText(value - 100);
            else if ((value == 200) || (value == 300) || (value == 400) || (value == 600) || (value == 800)) Num2Text = toText(Math.Truncate(value / 100)) + "CIENTOS";
            else if (value == 500) Num2Text = "QUINIENTOS";
            else if (value == 700) Num2Text = "SETECIENTOS";
            else if (value == 900) Num2Text = "NOVECIENTOS";
            else if (value < 1000) Num2Text = toText(Math.Truncate(value / 100) * 100) + " " + toText(value % 100);
            else if (value == 1000) Num2Text = "MIL";
            else if (value < 2000) Num2Text = "MIL " + toText(value % 1000);
            else if (value < 1000000)
            {
                Num2Text = toText(Math.Truncate(value / 1000)) + " MIL";
                if ((value % 1000) > 0) Num2Text = Num2Text + " " + toText(value % 1000);
            }

            else if (value == 1000000) Num2Text = "UN MILLON";
            else if (value < 2000000) Num2Text = "UN MILLON " + toText(value % 1000000);
            else if (value < 1000000000000)
            {
                Num2Text = toText(Math.Truncate(value / 1000000)) + " MILLONES ";
                if ((value - Math.Truncate(value / 1000000) * 1000000) > 0) Num2Text = Num2Text + " " + toText(value - Math.Truncate(value / 1000000) * 1000000);
            }

            else if (value == 1000000000000) Num2Text = "UN BILLON";
            else if (value < 2000000000000) Num2Text = "UN BILLON " + toText(value - Math.Truncate(value / 1000000000000) * 1000000000000);

            else
            {
                Num2Text = toText(Math.Truncate(value / 1000000000000)) + " BILLONES";
                if ((value - Math.Truncate(value / 1000000000000) * 1000000000000) > 0) Num2Text = Num2Text + " " + toText(value - Math.Truncate(value / 1000000000000) * 1000000000000);
            }
            return Num2Text;
            


        }

    }

}










