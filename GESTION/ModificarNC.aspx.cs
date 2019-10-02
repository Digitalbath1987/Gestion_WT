using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gestion.CapadeDatos;
using Entidades.Gestion;
using System.Data.SqlClient;

namespace GESTION.Otros
{
    public partial class ModificarNC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnguardar.Visible = false;
            btneliminar.Visible = false;
            btnmodificar.Visible = false;
        }

        protected void btnbuscar_Click1(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=164.77.113.94;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT id_NC,fecha,Empresa,Cliente,RUT,Motivo,Detalle,NOperación,NFactura,FechaFactura,idTipoFactura,MontoNetoFact,MontoIVAFact,MontoExentoFact,TotalFact,MontoNetoNC,MontoIVANC,MontoExentoNC,TotalNC,id_Usuario,FechaRegistro  FROM NotaCreditos where id_NC = '" + txtid.Text + "' ";
            dr = cmd.ExecuteReader();
            dr.Read();

            if (dr.HasRows)
            {
                txtFechaSolicitud.Text = dr["fecha"].ToString();

                txtmotivo.SelectedValue = dr["Motivo"].ToString();
                txtcliente.Text = dr["Cliente"].ToString();
                txtdetalle.Text = dr["Detalle"].ToString();
                txtempresa.SelectedValue = dr["Empresa"].ToString();
                txtfaciva.Text = dr["MontoIVAFact"].ToString();
                txtfacneto.Text = dr["MontoNetoFact"].ToString();
                txtfactexent.Text = dr["MontoExentoFact"].ToString();
                txtfechafact.Text = dr["FechaFactura"].ToString();
                txtncexento.Text = dr["MontoExentoNC"].ToString();
                txtnciva.Text = dr["MontoIVANC"].ToString();
                txtncneto.Text = dr["MontoNetoNC"].ToString();
                txtnctotal.Text = dr["TotalNC"].ToString();
                txtnfact.Text = dr["NFactura"].ToString();
                txtnope.Text = dr["NOperación"].ToString();
                txtrut.Text = dr["RUT"].ToString();
                txttipo.SelectedValue = dr["idTipoFactura"].ToString();
                txttotalfact.Text = dr["TotalFact"].ToString();
                
                btneliminar.Visible = true;
                btnmodificar.Visible = true;

            }
            else
            {
                lblmensaje.Text = "Nº de Cheque no Existe ";
                this.lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Visible = true;
                btneliminar.Visible = false;
                btnmodificar.Visible = false;

            }

            conn.Close();
           
        }

        protected void btnmodificar_Click(object sender, EventArgs e)
        {
            btneliminar.Visible = false;
            btnguardar.Visible = true;
            btnmodificar.Visible = false;
            txtmotivo.Enabled = true;
            txtcliente.Enabled = true;
            txtdetalle.Enabled = true;
            txtempresa.Enabled = true;
            txtfaciva.Enabled = true;
            txtfacneto.Enabled = true;
            txtfactexent.Enabled = true;
            txtfechafact.Enabled = true;
            txtFechaSolicitud.Enabled = false;
            txtncexento.Enabled = true;
            txtnciva.Enabled = true;
            txtncneto.Enabled = true;
            txtnctotal.Enabled = true;
            txtnfact.Enabled = true;
            txtnope.Enabled = true;
            txtrut.Enabled = true;
            txttipo.Enabled = true;
            txttotalfact.Enabled = true;
            btneliminar.Visible = false;
      


        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=164.77.113.94;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = "DELETE FROM NotaCreditos WHERE id_NC = '" + txtid.Text + "' ";
            dr = cmd.ExecuteReader();
            dr.Read();

           
                lblmensaje.Text = "Nº de Nota de Credito Se Elimino Correctamente ";
                this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                lblmensaje.Visible = true;

            btneliminar.Visible = false;
            btnguardar.Visible = false;
            btnmodificar.Visible = false;


            conn.Close();
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
           
            int usuario;
            usuario = (Convert.ToInt32(Session["id_Usuario"]));
            SqlConnection Conn = new SqlConnection("Data Source=164.77.113.94;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "UPDATE NotaCreditos  SET fecha ='" + txtFechaSolicitud.Text + "',Empresa ='" + txtempresa.SelectedValue + "',Cliente = '" + txtcliente.Text+"',RUT = '" + txtrut.Text + "',Motivo ='" + txtmotivo.SelectedValue + "' ,Detalle = '" + txtdetalle.Text  + "' ,NOperación ='" +txtnope.Text + "',NFactura = '" + txtnfact.Text + "',FechaFactura = '" + txtfechafact.Text + "', idTipoFactura = '" + txttipo.SelectedValue + "',   MontoNetoFact = '" + txtfacneto.Text + "',MontoIVAFact ='" + txtfaciva.Text + "',MontoExentoFact ='" + txtfactexent.Text  + "',TotalFact = '" + txttotalfact.Text + "',MontoNetoNC = '" + txtncneto.Text + "' ,MontoIVANC ='" + txtnciva.Text + "',MontoExentoNC ='" + txtncexento.Text + "' ,TotalNC ='" + txtnctotal.Text+ "',id_Usuario ='" + usuario + "' ,FechaRegistro ='" + DateTime.Today + "'  WHERE id_NC = '" + txtid.Text + "' ";
            dr = cmd.ExecuteReader();

            dr.Read();

            lblmensaje.Text = "Los Datos se Actualizaron Correctamente ....";
            this.lblmensaje.ForeColor = System.Drawing.Color.Green;
            lblmensaje.Visible = true;
            btnguardar.Visible = false;
            Conn.Close();

        }
    }
}