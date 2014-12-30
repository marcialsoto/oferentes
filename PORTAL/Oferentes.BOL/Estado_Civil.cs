using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oferentes.DAL;

namespace Oferentes.BOL
{
    public class Estado_Civil
    {
        public static DataSet listar_estcivil()
        {

            DBAccess oDb = new DBAccess();

            return oDb.ExecuteDataSet("sp_EstadoCivil_read");

        }
    }
}
