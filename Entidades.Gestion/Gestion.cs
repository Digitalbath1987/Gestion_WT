using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.Gestion
{
  
    public class INGRESARFACTURA
    {

        public string EMPRESA{ get; set; }
        public string FECHA_EMISION { get; set; }//POR DEFECTO LA DE HOY
        public string AGENTE { get; set; }
        public string NINVOICE { get; set; }
        public string FINVOICE { get; set; }
        public string FPAGO { get; set; }
        //NOTA DE CREDITO
        public string NUMERONC { get; set; }
        public string VALORNC { get; set; }
        public string FECHANC { get; set; }
        //FIN NOTA DE CREDITO
        public string LINKPDF { get; set; }
        public string MONEDA { get; set; }
        public string TC { get; set; }
        public string CONDICION { get; set; }
        public string OBSERVACION { get; set; }
        public string DETALLE { get; set; }
        public string USUARIO { get; set; }        
        public string ESTADO { get; set; }//por defecto pendiente al ingresar
        public string FECHAPAGO { get; set; }//FECHA EN LA QUE SE PAGUE 

    }

    public class IngresarNC
    {

      
        public string fecha { get; set; }
        public int Empresa { get; set; }
        public string Cliente { get; set; }
        public string RUT { get; set; }
        public string Motivo { get; set; }
        public string Detalle { get; set; }
        public string NOperación { get; set; }
        public int NFactura { get; set; }
        public DateTime FechaFactura { get; set; }
        public int idTipoFactura { get; set; }
        public string MontoNetoFact { get; set; }
        public string MontoIVAFact { get; set; }
        public string MontoExentoFact { get; set; }
        public string TotalFact { get; set; }
        public string MontoNetoNC { get; set; }
        public string MontoIVANC { get; set; }
        public string MontoExentoNC { get; set; }
        public string TotalNC { get; set; }
        public int id_Usuario { get; set; }
        public DateTime FechaRegistro { get; set; }

        public string Vendedor { get; set; }
        public string FacturaReemplazante { get; set; }

        public string tiponota { get; set; }


    }

    public class CREARUSUARIO
    {
        public string Usuario { get; set; }
        public string Contraseña { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }      
        public string Rut { get; set; }
        public int id_Perfil { get; set; }
        public string Modificar { get; set; }      
        public string Eliminar { get; set; }
        public string Usuarios { get; set; }
        public string Perfiles { get; set; }
        public string Agentes { get; set; }
        public string Registrar { get; set; }
        

    }


    public class CREARAGENTE
    {
        public string NOMBRE { get; set; }
        public string CORREO { get; set; }
        public string RUT { get; set; }

    }



}
