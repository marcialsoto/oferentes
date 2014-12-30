using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oferentes.DAL;

namespace Oferentes.BOL
{
    public class Residencia
    {
        public static DataSet listar_residencia()
        {

            DBAccess oDb = new DBAccess();

            return oDb.ExecuteDataSet("sp_Residencia_read");

        }
    }
}
