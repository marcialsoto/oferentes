using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oferentes.DAL;

namespace Oferentes.BOL
{
    public class Actividad
    {
        private string nombre;

        public string _nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public static void insertar_Actividad(Actividad act)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@nombre", act._nombre);

            oDb.ExecuteNonQuery("sp_Actividad_insert");
        }

        public static DataSet listar_Actividad()
        {

            DBAccess oDb = new DBAccess();

            return oDb.ExecuteDataSet("sp_Actividad_read");

        }

        public static DataSet buscar_Actividad_nombre(Actividad act)
        {

            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@nombre", act._nombre);

            return oDb.ExecuteDataSet("sp_Actividad_search");

        }
    }
}
