using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oferentes.DAL;

namespace Oferentes.BOL
{
    public class Idioma
    {
        public static DataSet listar_idioma()
        {

            DBAccess oDb = new DBAccess();

            return oDb.ExecuteDataSet("sp_Idioma_read");

        }

    }
}
