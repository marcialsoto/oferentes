using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oferentes.DAL;

namespace Oferentes.BOL
{
    public class Talento
    {
        private Int32 num_dni, telefono_fijo, telefono_celular;

        private int estado_civil, residencia, idioma;

        public int _idioma
        {
            get { return idioma; }
            set { idioma = value; }
        }

        private string apellidos, nombres, lugar_nac, sexo, direccion, ubigeo, correo, estudio, lect_esc, estado;        

        private DateTime fecha_nac;

        public string _lect_esc
        {
            get { return lect_esc; }
            set { lect_esc = value; }
        }
       
        public DateTime _fecha_nac
        {
            get { return fecha_nac; }
            set { fecha_nac = value; }
        }

        public string _estado
        {
            get { return estado; }
            set { estado = value; }
        }

        public string _estudio
        {
            get { return estudio; }
            set { estudio = value; }
        }

        public string _correo
        {
            get { return correo; }
            set { correo = value; }
        }

        public string _ubigeo
        {
            get { return ubigeo; }
            set { ubigeo = value; }
        }

        public string _direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        public string _sexo
        {
            get { return sexo; }
            set { sexo = value; }
        }

        public string _lugar_nac
        {
            get { return lugar_nac; }
            set { lugar_nac = value; }
        }

        public string _nombres
        {
            get { return nombres; }
            set { nombres = value; }
        }
        
        public Int32 _telefono_celular
        {
            get { return telefono_celular; }
            set { telefono_celular = value; }
        }

        public Int32 _telefono_fijo
        {
            get { return telefono_fijo; }
            set { telefono_fijo = value; }
        }

        public Int32 _num_dni
        {
            get { return num_dni; }
            set { num_dni = value; }
        }

        public string _apellidos
        {
          get { return apellidos; }
          set { apellidos = value; }
        }
        
        public int _residencia
        {
            get { return residencia; }
            set { residencia = value; }
        }

        public int _estado_civil
        {
            get { return estado_civil; }
            set { estado_civil = value; }
        }

        

        public static void insertar_Talento(Talento tal)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@dni", tal._num_dni);
            oDb.AddParameter("@apell", tal._apellidos);
            oDb.AddParameter("@nombres", tal._nombres);
            oDb.AddParameter("@fecha_nac", tal._fecha_nac);
            oDb.AddParameter("@lugar_nac", tal._lugar_nac);
            oDb.AddParameter("@sexo", tal._sexo);
            oDb.AddParameter("@est_civil", tal._estado_civil);
            oDb.AddParameter("@resid", tal._residencia);
            oDb.AddParameter("@dir", tal._direccion);
            oDb.AddParameter("@ubigeo", tal._ubigeo);
            oDb.AddParameter("@fono_fijo", tal._telefono_fijo);
            oDb.AddParameter("@fono_cell", tal._telefono_celular);
            oDb.AddParameter("@correo", tal._correo);
            oDb.AddParameter("@estudio", tal._estudio);
            oDb.AddParameter("@lect_esc", tal._lect_esc);
            oDb.AddParameter("@idioma", tal._idioma);

            oDb.ExecuteNonQuery("sp_Talento_insert");


        }

        public static DataSet listar_Talento()
        {

            DBAccess oDb = new DBAccess();

            return oDb.ExecuteDataSet("sp_Talento_read");


        }

        public static DataSet listar_Talento_combo_mant()
        {

            DBAccess oDb = new DBAccess();

            return oDb.ExecuteDataSet("sp_Talento_combo_mant");


        }

        public static DataSet listar_Talento_dni(Talento tal)
        {
            DBAccess oDb = new DBAccess();
            
            oDb.AddParameter("@dni", tal._num_dni);

            return oDb.ExecuteDataSet("sp_Talento_search_dni");

        }

        public static DataSet listar_Talento_ubigeo(Talento tal)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@ubigeo", tal._ubigeo);

            return oDb.ExecuteDataSet("sp_Talento_search_ubigeo");

        }

        public static void actualizar_Talento(Talento tal)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@dni", tal._num_dni);
            oDb.AddParameter("@apell", tal._apellidos);
            oDb.AddParameter("@nombres", tal._nombres);
            oDb.AddParameter("@fecha_nac", tal._fecha_nac);
            oDb.AddParameter("@lugar_nac", tal._lugar_nac);
            oDb.AddParameter("@sexo", tal._sexo);
            oDb.AddParameter("@est_civil", tal._estado_civil);
            oDb.AddParameter("@resid", tal._residencia);
            oDb.AddParameter("@dir", tal._direccion);
            oDb.AddParameter("@ubigeo", tal._ubigeo);
            oDb.AddParameter("@fono_fijo", tal._telefono_fijo);
            oDb.AddParameter("@fono_cell", tal._telefono_celular);
            oDb.AddParameter("@correo", tal._correo);
            oDb.AddParameter("@estudio", tal._estudio);
            oDb.AddParameter("@lect_esc", tal._lect_esc);
            oDb.AddParameter("@idioma", tal._idioma);

            oDb.ExecuteNonQuery("sp_Talento_update");


        }

        public static void eliminar_Talento(Talento tal)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@dni", tal._num_dni);


            oDb.ExecuteNonQuery("sp_Talento_delete");

        }

        public static void habilitar_Talento(Talento tal)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@dni", tal._num_dni);


            oDb.ExecuteNonQuery("sp_Talento_habilitar");


        }
    }
}
