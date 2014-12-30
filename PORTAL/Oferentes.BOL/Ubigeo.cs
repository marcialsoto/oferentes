using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Oferentes.DAL;

namespace Oferentes.BOL
{
    public class Ubigeo
    {
        private string codubigeo;
        private string departamento;
        private string provincia;
        private string distrito;

        public string _codubigeo
        {
            get { return codubigeo; }
            set { codubigeo = value; }
        }
        

        public string _departamento
        {
            get { return departamento; }
            set { departamento = value; }
        }
        

        public string _provincia
        {
            get { return provincia; }
            set { provincia = value; }
        }
        

        public string _distrito
        {
            get { return distrito; }
            set { distrito = value; }
        }

        public static DataSet listar_dept()
        {

            DBAccess oDb = new DBAccess();
            //oDb.AddParameter("@cod_ubigeo", oUbigeo._codubigeo);

            return oDb.ExecuteDataSet("sp_Ubigeo_Dept");
            
        }

        public static DataSet listar_prov(string cod_dep)
        {

            DBAccess oDb = new DBAccess();
            oDb.AddParameter("@cod_dept", cod_dep);

            return oDb.ExecuteDataSet("sp_Ubigeo_prov");

        }

        public static DataSet listar_dist(string cod_prov)
        {

            DBAccess oDb = new DBAccess();
            oDb.AddParameter("@cod_prov", cod_prov);

            return oDb.ExecuteDataSet("sp_Ubigeo_dist");

        }
    }
}
