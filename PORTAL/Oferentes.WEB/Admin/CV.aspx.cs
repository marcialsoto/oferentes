using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Oferentes.WEB.Admin
{
    public partial class CV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtDNI.Text = Session["DNI"].ToString();

            if (!IsPostBack)
            {
                rvCV.LocalReport.ReportPath = "Reportes/CV.rdlc";
            }
            
        }
    }
}