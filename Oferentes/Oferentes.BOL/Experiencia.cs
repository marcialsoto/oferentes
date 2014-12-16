using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oferentes.DAL;

namespace Oferentes.BOL
{
    public class Experiencia
    {
        Int32 num, num_dni;
        string actividad, duracion, certificado, lugar_activ, organizacion_atendida, referente, reconocimientos;


        public Int32 _num
        {
            get { return num; }
            set { num = value; }
        }
        public string _certificado
        {
            get { return certificado; }
            set { certificado = value; }
        }

        public string _reconocimientos
        {
            get { return reconocimientos; }
            set { reconocimientos = value; }
        }

        public string _referente
        {
            get { return referente; }
            set { referente = value; }
        }

        public string _organizacion_atendida
        {
            get { return organizacion_atendida; }
            set { organizacion_atendida = value; }
        }

        public string _lugar_activ
        {
            get { return lugar_activ; }
            set { lugar_activ = value; }
        }

        public string _duracion
        {
            get { return duracion; }
            set { duracion = value; }
        }

        public string _actividad
        {
            get { return actividad; }
            set { actividad = value; }
        }

        public Int32 _num_dni
        {
            get { return num_dni; }
            set { num_dni = value; }
        }

        public static void insertar_Experiencia(Experiencia exp)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@num_dni", exp._num_dni);
            oDb.AddParameter("@activ", exp._actividad);
            oDb.AddParameter("@duracion", exp._duracion);
            oDb.AddParameter("@certif", exp._certificado);
            oDb.AddParameter("@lugar_act", exp._lugar_activ);
            oDb.AddParameter("@org", exp._organizacion_atendida);
            oDb.AddParameter("@refer", exp._referente);
            oDb.AddParameter("@recon", exp._reconocimientos);
         
            oDb.ExecuteNonQuery("sp_Experiencia_insert");

        }

        public static DataSet listar_Experiencia()
        {

            DBAccess oDb = new DBAccess();

            return oDb.ExecuteDataSet("sp_Experiencia_read");


        }

        public static DataSet listar_Experiencia_Actividad()
        {

            DBAccess oDb = new DBAccess();

            return oDb.ExecuteDataSet("sp_Experiencia_read_actividad");


        }

        public static DataSet listar_Experiencia_dni(Experiencia exp)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@num_dni", exp._num_dni);

            return oDb.ExecuteDataSet("sp_Experiencia_search_dni");

        }

        public static DataSet listar_Experiencia_lugarAct(Experiencia exp)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@lugar_act", exp._lugar_activ);

            return oDb.ExecuteDataSet("sp_Experiencia_search_lugar_actv");

        }

        public static void actualizar_Experiencia(Experiencia exp)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@num", exp._num);
            oDb.AddParameter("@num_dni", exp._num_dni);
            oDb.AddParameter("@activ", exp._actividad);
            oDb.AddParameter("@duracion", exp._duracion);
            oDb.AddParameter("@certif", exp._certificado);
            oDb.AddParameter("@lugar_act", exp._lugar_activ);
            oDb.AddParameter("@org", exp._organizacion_atendida);
            oDb.AddParameter("@refer", exp._referente);
            oDb.AddParameter("@recon", exp._reconocimientos);

            oDb.ExecuteNonQuery("sp_Experiencia_update");

        }

        public static void eliminar_Experiencia(Experiencia exp)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@num", exp._num);
            oDb.AddParameter("@num_dni", exp._num_dni);

            oDb.ExecuteNonQuery("sp_Experiencia_delete");

        }
    }
}
