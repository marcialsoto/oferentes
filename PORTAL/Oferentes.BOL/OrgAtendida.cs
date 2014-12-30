using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oferentes.DAL;

namespace Oferentes.BOL
{
    public class OrgAtendida
    {
        private string nombre;

        public string _nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public static void insertar_OrgAtendida(OrgAtendida org)
        {
            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@nombre", org._nombre);

            oDb.ExecuteNonQuery("sp_OrgAtendida_insert");
        }

        public static DataSet listar_OrgAtendida()
        {

            DBAccess oDb = new DBAccess();

            return oDb.ExecuteDataSet("sp_OrgAtendida_read");

        }

        public static DataSet buscar_OrgAtendida_nombre(OrgAtendida org)
        {

            DBAccess oDb = new DBAccess();

            oDb.AddParameter("@nombre", org._nombre);

            return oDb.ExecuteDataSet("sp_OrgAtendida_search");

        }
    }
}
