using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Entidades.Gestion;

namespace Gestion.CapadeDatos
{
    public class GestorGestion
    {
         public bool INGRESARFACTURA(INGRESARFACTURA INGRESARFACTURA)
        {
          
          bool response = false;
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.CommandText = "IngresarFacturas2";
                    comm.CommandTimeout = 30000;
                    comm.Parameters.Add("@EMPRESA", SqlDbType.VarChar, 50).Value = INGRESARFACTURA.EMPRESA;
                    comm.Parameters.Add("@FECHA_EMISION", SqlDbType.VarChar, 20).Value = INGRESARFACTURA.FECHA_EMISION;
                    comm.Parameters.Add("@AGENTE", SqlDbType.VarChar, 70).Value = INGRESARFACTURA.AGENTE;
                    comm.Parameters.Add("@NINVOICE", SqlDbType.VarChar, 50).Value = INGRESARFACTURA.NINVOICE;
                    comm.Parameters.Add("@FINVOICE", SqlDbType.VarChar, 20).Value = INGRESARFACTURA.FINVOICE;
                    //NOTA DE CREDITO
                    comm.Parameters.Add("@NUMERONC", SqlDbType.VarChar, 10).Value = INGRESARFACTURA.NUMERONC;
                    comm.Parameters.Add("@VALORNC", SqlDbType.VarChar, 10).Value = INGRESARFACTURA.VALORNC;
                    comm.Parameters.Add("@FECHANC", SqlDbType.VarChar, 20).Value = INGRESARFACTURA.FECHANC;
                    //FIN NOTA DE CREDITO
                    comm.Parameters.Add("@LINKPDF", SqlDbType.VarChar, 200).Value = INGRESARFACTURA.LINKPDF;
                    comm.Parameters.Add("@MONEDA", SqlDbType.VarChar, 10).Value = INGRESARFACTURA.MONEDA;
                    comm.Parameters.Add("@TC", SqlDbType.VarChar, 10).Value =  INGRESARFACTURA.TC;
                    comm.Parameters.Add("@CONDICION", SqlDbType.VarChar, 50).Value = INGRESARFACTURA.CONDICION;
                    comm.Parameters.Add("@OBSERVACION", SqlDbType.VarChar, 200).Value = INGRESARFACTURA.OBSERVACION;
                    comm.Parameters.Add("@DETALLE", SqlDbType.VarChar, 200).Value = INGRESARFACTURA.DETALLE;
                    comm.Parameters.Add("@USUARIO", SqlDbType.VarChar, 20).Value = INGRESARFACTURA.USUARIO;
                    comm.Parameters.Add("@ESTADO", SqlDbType.VarChar, 20).Value = INGRESARFACTURA.ESTADO;
                    comm.Parameters.Add("@FECHAPAGO", SqlDbType.VarChar, 20).Value = INGRESARFACTURA.FECHAPAGO;
                   conn.Open();
                    int result = comm.ExecuteNonQuery();
                   if (result == -1)
                    {
                        response = true;
                    }
                    conn.Close();
                }
                return response;
                  
         }
                   
         }
   

         public bool IngresarNC(IngresarNC ingresarnc)
        {


            bool response = false;
            using (SqlConnection conn = new SqlConnection())
            {

                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();

                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.CommandText = "IngresarNC";
                    comm.CommandTimeout = 30000;

                  
                    comm.Parameters.Add("@fecha", SqlDbType.VarChar, 13).Value = ingresarnc.fecha;
                    comm.Parameters.Add("@Empresa", SqlDbType.Int).Value = ingresarnc.Empresa;
                    comm.Parameters.Add("@Cliente", SqlDbType.VarChar, 50).Value = ingresarnc.Cliente;
                    comm.Parameters.Add("@RUT", SqlDbType.VarChar, 13).Value = ingresarnc.RUT;
                    comm.Parameters.Add("@Motivo", SqlDbType.VarChar, 50).Value = ingresarnc.Motivo;
                    comm.Parameters.Add("@Detalle", SqlDbType.VarChar, 200).Value = ingresarnc.Detalle;
                    comm.Parameters.Add("@NOperación", SqlDbType.VarChar, 20).Value = ingresarnc.NOperación;
                    comm.Parameters.Add("@NFactura", SqlDbType.Int).Value = ingresarnc.NFactura;
                    comm.Parameters.Add("@FechaFactura", SqlDbType.Date).Value = ingresarnc.FechaFactura;
                    comm.Parameters.Add("@idTipoFactura", SqlDbType.Int).Value = ingresarnc.idTipoFactura;
                    comm.Parameters.Add("@MontoNetoFact", SqlDbType.VarChar, 13).Value = ingresarnc.MontoNetoFact;
                    comm.Parameters.Add("@MontoIVAFact", SqlDbType.VarChar, 13).Value = ingresarnc.MontoIVAFact;
                    comm.Parameters.Add("@MontoExentoFact", SqlDbType.VarChar, 13).Value = ingresarnc.MontoExentoFact;
                    comm.Parameters.Add("@TotalFact", SqlDbType.VarChar, 13).Value = ingresarnc.TotalFact;
                    comm.Parameters.Add("@MontoNetoNC", SqlDbType.VarChar, 13).Value = ingresarnc.MontoNetoNC;
                    comm.Parameters.Add("@MontoIVANC", SqlDbType.VarChar, 13).Value = ingresarnc.MontoIVANC;
                    comm.Parameters.Add("@MontoExentoNC", SqlDbType.VarChar, 13).Value = ingresarnc.MontoExentoNC;
                    comm.Parameters.Add("@TotalNC", SqlDbType.VarChar, 13).Value = ingresarnc.TotalNC;
                    comm.Parameters.Add("@id_Usuario", SqlDbType.Int).Value = ingresarnc.id_Usuario;
                    comm.Parameters.Add("@FechaRegistro", SqlDbType.Date).Value = ingresarnc.FechaRegistro;
                    comm.Parameters.Add("@facturareemplazante", SqlDbType.VarChar, 13).Value = ingresarnc.FacturaReemplazante;
                    comm.Parameters.Add("@vendedor", SqlDbType.VarChar, 50).Value = ingresarnc.Vendedor;
                    comm.Parameters.Add("@tiponota", SqlDbType.VarChar, 50).Value = ingresarnc.tiponota;

                    conn.Open();
                    int result = comm.ExecuteNonQuery();

                    if (result == -1)
                    {
                        response = true;
                    }
                    conn.Close();
                }
                return response;

            }

        }

        public bool CREARUSUARIO(CREARUSUARIO CREARUSUARIO)
        {
            
            bool response = false;
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.CommandText = "crearusuario";
                    comm.CommandTimeout = 30000;
                   
                    comm.Parameters.Add("@Usuario", SqlDbType.VarChar, 50).Value = CREARUSUARIO.Usuario;
                    comm.Parameters.Add("@Contraseña", SqlDbType.VarChar, 50).Value = CREARUSUARIO.Contraseña;
                    comm.Parameters.Add("@Nombre", SqlDbType.VarChar, 50).Value = CREARUSUARIO.Nombre;
                    comm.Parameters.Add("@Apellido", SqlDbType.VarChar, 50).Value = CREARUSUARIO.Apellido;
                    comm.Parameters.Add("@Rut", SqlDbType.VarChar, 12).Value = CREARUSUARIO.Rut;
                    comm.Parameters.Add("@id_Perfil", SqlDbType.Int).Value = CREARUSUARIO.id_Perfil;
                    comm.Parameters.Add("@Modificar", SqlDbType.VarChar,2).Value = CREARUSUARIO.Modificar;
                    comm.Parameters.Add("@Eliminar", SqlDbType.VarChar,2).Value = CREARUSUARIO.Eliminar;
                    comm.Parameters.Add("@Usuarios", SqlDbType.VarChar,2).Value = CREARUSUARIO.Usuarios;
                    comm.Parameters.Add("@Perfiles", SqlDbType.VarChar,2).Value = CREARUSUARIO.Perfiles;
                    comm.Parameters.Add("@Agentes", SqlDbType.VarChar,2).Value = CREARUSUARIO.Agentes;
                    comm.Parameters.Add("@Registrar", SqlDbType.VarChar,2).Value = CREARUSUARIO.Registrar;
                    conn.Open();
                    int result = comm.ExecuteNonQuery();
                    if (result == -1)
                    {
                        response = true;
                    }
                    conn.Close();
                }
                return response;
            }
        }

        public bool CREARAGENTE(CREARAGENTE CREARAGENTE)
        {

            bool response = false;
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GESTION.Properties.Settings.CadenadeConeccion"].ToString();
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.StoredProcedure;
                    comm.CommandText = "crearagente";
                    comm.CommandTimeout = 30000;

                    comm.Parameters.Add("@Nombre", SqlDbType.VarChar, 50).Value = CREARAGENTE.NOMBRE;
                    comm.Parameters.Add("@Correo", SqlDbType.VarChar, 50).Value = CREARAGENTE.CORREO;
                    comm.Parameters.Add("@RUT", SqlDbType.VarChar, 50).Value = CREARAGENTE.RUT;

                    conn.Open();
                    int result = comm.ExecuteNonQuery();
                    if (result == -1)
                    {
                        response = true;
                    }
                    conn.Close();
                }
                return response;
            }
        }



    }


}
