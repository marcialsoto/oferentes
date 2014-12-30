using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oferentes.DAL;

namespace Oferentes.BOL
{
    public class Estudio
    {
        public static DataSet listar_nivel()
        {

            DBAccess oDb = new DBAccess();
            //oDb.AddParameter("@cod_ubigeo", oUbigeo._codubigeo);

            return oDb.ExecuteDataSet("sp_Estudio_read");

        }

        public static DataSet listar_grado(string cod_grado)
        {

            DBAccess oDb = new DBAccess();
            oDb.AddParameter("@cod", cod_grado);

            return oDb.ExecuteDataSet("sp_Estudio_search");

        }
    }
}
