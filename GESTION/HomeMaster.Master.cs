using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Script.Serialization;


namespace GESTION
{
    public partial class HomeMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e){



            lblNombre.Text = Session["Nombre"].ToString();
            lblApellido.Text = Session["Apellido"].ToString();
            lblPerfil.Text = Session["Perfil"].ToString();
            lblUsuario.Text = Session["Usuario"].ToString();
           DateTime thisDay = DateTime.Today;
              lblfecha.Text = thisDay.ToString("D");

            try { 

             string apiUrl = "http://www.mindicador.cl/api";
                 string jsonString = "{}";
                 WebClient http = new WebClient();
                 JavaScriptSerializer jss = new JavaScriptSerializer();
                 http.Headers.Add(HttpRequestHeader.Accept, "application/json");
                 jsonString = http.DownloadString(apiUrl);
                 var indicatorsObject = jss.Deserialize<Dictionary<string, object>>(jsonString);
                 Dictionary<string, Dictionary<string, string>> dailyIndicators = new Dictionary<string, Dictionary<string, string>>();
                 int i = 0;
                 foreach (var key in indicatorsObject.Keys.ToArray())
                 {
                  var item = indicatorsObject[key];
                 if (item.GetType().FullName.Contains("System.Collections.Generic.Dictionary"))
                 {
                 Dictionary<string, object> itemObject = (Dictionary<string, object>)item;
                 Dictionary<string, string> indicatorProp = new Dictionary<string, string>();
                 int j = 0;
                 foreach (var key2 in itemObject.Keys.ToArray())
                 {
                 indicatorProp.Add(key2, itemObject[key2].ToString());
                 j++;
                 }
                 dailyIndicators.Add(key, indicatorProp);
                 }
                 i++;
                 }
                 lbluf.Text = "" + dailyIndicators["uf"]["valor"];
                 USD.Text = "" + dailyIndicators["dolar"]["valor"];
                 dolacuer.Text = (double.Parse(USD.Text) + 20).ToString();
                 EUR.Text = "" + dailyIndicators["euro"]["valor"];
                 Decimal paridad;
                 paridad = Decimal.Parse(EUR.Text) / Decimal.Parse(USD.Text);
                 IPC.Text = decimal.Round(paridad, 4).ToString();
                 Session["dolar"] = "" + dailyIndicators["dolar"]["valor"];
                 Session["euro"] = "" + dailyIndicators["euro"]["valor"];

            }
            catch {

                lbluf.Text = "0";
                USD.Text = "0";
                dolacuer.Text = "0";
                EUR.Text = "0";
                IPC.Text = "0";
                Session["dolar"] = "0";
                Session["euro"] = "0";

            }



        }

        protected void cerrarsesion_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
         }
}
}