using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION.Mantenedor
{
    public partial class AgregarCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void CrearAgent_Click(object sender, ImageClickEventArgs e)
        {

            string validar = Session["Registrar"].ToString();



            if (validar == "SI")
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
                    cmd.CommandText = "INSERT INTO Customers(Nombre,Correo) VALUES  ('"+ txtnom.Text +"','"+ txtmail.Text +"')";
                    dr = cmd.ExecuteReader();


                    dr.Read();

                    Conn.Close();

                    Alertaok.Visible = true;
                    Alertanook.Visible = false;
                    gvCustomers.DataBind();
                                    



                }
                catch (Exception ex)
                {
                    Alertanook.Visible = true;
                    Alertaok.Visible = false;
                 
                }


                




            }  else {
                Alertanook.Visible = true;
                Alertaok.Visible = false;
               modificarnook.Visible = true;


            }




        }








    }
}