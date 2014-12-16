using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Oferentes.WEB
{
    public partial class Oferentes : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void mnPrincipal_MenuItemClick(object sender, MenuEventArgs e)
        {
            
            switch (e.Item.Value)
            {
                case "Inicio": Response.Redirect("Inicio.aspx"); return;
                case "Registrar": Response.Redirect("Admin/Registrar.aspx"); return;
                case "Mantenimiento": Response.Redirect("Admin/Mantener.aspx"); return;
                case "Reportes": Response.Redirect("Usuario/Consultar.aspx"); return;
            }
        }
    }
}