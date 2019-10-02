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
    public partial class finalizarNC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            String link;
          

            if (IsPostBack)
            {
                Boolean fileOK = false;
                String  path = Server.MapPath("/Gestion2/Otros/PDF/");
                if (FileUpload1.HasFile)
                {
                    String fileExtension =
                        System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                    String[] allowedExtensions =
                        {".PDF", ".pdf"};
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                            if (fileExtension == allowedExtensions[i])
                             {
                            fileOK = true;
                            } else {

                            lblmensaje.Text = "El Formato debe ser en PDF";
                            }
                      }

                if (fileOK)
                {

                    FileUpload1.PostedFile.SaveAs(path
                        + FileUpload1.FileName);
                    lblmensaje.Text = "File uploaded!";

                    link = "/Gestion2/Otros/PDF/" + FileUpload1.FileName + "";



                    SqlConnection Conn = new SqlConnection("Data Source=LocalHost;Initial Catalog=DBGestion;Persist Security Info=True;User ID=DBGestion;Password=123456");
                    SqlCommand cmd = new SqlCommand();
                    SqlDataReader dr;
                    Conn.Open();
                    cmd.Connection = Conn;
                    cmd.CommandText = "UPDATE NotaCreditos  SET NNC ='" + txtnc.Text + "',linkpdf ='" + link + "'  WHERE id_NC = '" + txtid.Text + "' ";
                    dr = cmd.ExecuteReader();

                    dr.Read();

                    lblmensaje.Text = "Los Datos se Actualizaron Correctamente en la solicitud Nota Credito ID: "+ txtid.Text  + "";
                    this.lblmensaje.ForeColor = System.Drawing.Color.Green;
                    lblmensaje.Visible = true;
                    Conn.Close();

                        txtid.Text = "";
                        txtnc.Text = "";

                        }
                        else
                        {
                    lblmensaje.Text = "Cannot accept files of this type.";
                        }
            }

      


        }
        }
    }
}