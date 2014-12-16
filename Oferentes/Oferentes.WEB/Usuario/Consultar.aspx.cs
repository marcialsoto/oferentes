using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oferentes.BOL;

namespace Oferentes.WEB.Usuario
{
    public partial class Consultar : System.Web.UI.Page
    {
        string dep, prov;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //------------------------------------

                dlDep.DataSource = Ubigeo.listar_dept();
                dlDep.DataBind();



                dlDep_SelectedIndexChanged(null, null);

                dlProv_SelectedIndexChanged(null, null);



                //------------------------------------

                dlDepAct.DataSource = Ubigeo.listar_dept();
                dlDepAct.DataBind();


                dlDepAct_SelectedIndexChanged(null, null);

                dlProvAct_SelectedIndexChanged(null, null);


                txtUbigeo.Text = string.Empty;
                txtLugarActv.Text = string.Empty;
                txtDNI.Text = string.Empty;
                txtActividad.Text = string.Empty;


                dlActividad.DataSource = Experiencia.listar_Experiencia_Actividad();
                dlActividad.DataBind();

                rvReporteTalento.LocalReport.ReportPath = "Reportes/ReporteTalento.rdlc";

                rvReportExp.LocalReport.ReportPath = "Reportes/ReportExp.rdlc";

                rvGrafico.LocalReport.ReportPath = "Reportes/Graficos.rdlc";

                refrescarInformes();

                //Oferentes.WEB.dsDirectorioTableAdapters.sp_Talento_search_ubigeoTableAdapter da = new Oferentes.WEB.dsDirectorioTableAdapters.sp_Talento_search_ubigeoTableAdapter();

                //DataTable dt = new DataTable();

                //da.Fill("tablita",dt);

                //txtPruebaDNI.Text = dt.Rows[0][1].ToString();
            }
        }


        protected void dlDep_SelectedIndexChanged(object sender, EventArgs e)
        {
            dep = dlDep.SelectedValue;

            dlProv.DataSource = Ubigeo.listar_prov(dep);

            dlProv.DataBind();

            dlProv_SelectedIndexChanged(null, null);
        }

        protected void dlProv_SelectedIndexChanged(object sender, EventArgs e)
        {
            prov = dlProv.SelectedValue;

            dlDist.DataSource = Ubigeo.listar_dist(prov.ToString());

            dlDist.DataBind();

            dlDist_SelectedIndexChanged(null, null);
        }

        protected void dlDist_SelectedIndexChanged(object sender, EventArgs e)
        {

            txtUbigeo.Text = dlDist.SelectedValue;

        }

        protected void dlDepAct_SelectedIndexChanged(object sender, EventArgs e)
        {
            dep = dlDepAct.SelectedValue;

            dlProvAct.DataSource = Ubigeo.listar_prov(dep);

            dlProvAct.DataBind();

            dlProvAct_SelectedIndexChanged(null, null);
        }

        protected void dlProvAct_SelectedIndexChanged(object sender, EventArgs e)
        {
            prov = dlProvAct.SelectedValue;

            dlDistAct.DataSource = Ubigeo.listar_dist(prov.ToString());

            dlDistAct.DataBind();

            dlDistAct_SelectedIndexChanged(null, null);
        }

        protected void dlDistAct_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtLugarActv.Text = dlDistAct.SelectedValue;
        }

        protected void rbTotal_CheckedChanged(object sender, EventArgs e)
        {
            //int num;
            rbTotal.Checked = true;
            rbUbigeo.Checked = false;
            rbDNI.Checked = false;
            rbLugarActv.Checked = false;
            rbActiv.Checked = false;

            dlDep.Enabled = false;
            dlProv.Enabled = false;
            dlDist.Enabled = false;
            dlDepAct.Enabled = false;
            dlProvAct.Enabled = false;
            dlDistAct.Enabled = false;
            dlActividad.Enabled = false;

            btnBuscar.Enabled = false;
            btnOk.Enabled = false;
            btnIr.Enabled = false;

            refrescarInformes();

            txtUbigeo.Text = string.Empty;
            txtLugarActv.Text = string.Empty;
            txtDNI.Text = string.Empty;
            txtActividad.Text = string.Empty;
            //num = 0;
        }

        protected void rbUbigeo_CheckedChanged(object sender, EventArgs e)
        {
            //int num;
            rbTotal.Checked = false;
            rbUbigeo.Checked = true;
            rbDNI.Checked = false;
            rbLugarActv.Checked = false;
            rbActiv.Checked = false;

            dlDep.Enabled = true;
            dlProv.Enabled = true;
            dlDist.Enabled = true;
            dlDepAct.Enabled = false;
            dlProvAct.Enabled = false;
            dlDistAct.Enabled = false;
            dlActividad.Enabled = false;

            btnBuscar.Enabled = true;
            btnOk.Enabled = false;
            btnIr.Enabled = false;

            txtUbigeo.Text = dlDist.SelectedValue;

            txtDNI.Text = string.Empty;
            txtLugarActv.Text = string.Empty;
            txtActividad.Text = string.Empty;
        }

        protected void rbDNI_CheckedChanged(object sender, EventArgs e)
        {
            txtUbigeo.Text = string.Empty;
            txtDNI.Text = string.Empty;
            txtLugarActv.Text = string.Empty;
            txtActividad.Text = string.Empty;
            rbTotal.Checked = false;
            rbUbigeo.Checked = false;
            rbDNI.Checked = true;
            rbLugarActv.Checked = false;
            rbActiv.Checked = false;

            dlDep.Enabled = false;
            dlProv.Enabled = false;
            dlDist.Enabled = false;
            dlDepAct.Enabled = false;
            dlProvAct.Enabled = false;
            dlDistAct.Enabled = false;
            dlActividad.Enabled = false;

            btnBuscar.Enabled = false;
            btnOk.Enabled = true;
            btnIr.Enabled = false;
        }

        protected void rbLugarActv_CheckedChanged(object sender, EventArgs e)
        {

            txtLugarActv.Text = string.Empty;
            rbTotal.Checked = false;
            rbUbigeo.Checked = false;
            rbDNI.Checked = false;
            rbLugarActv.Checked = true;
            rbActiv.Checked = false;

            btnBuscar.Enabled = false;
            btnOk.Enabled = false;
            btnIr.Enabled = true;

            dlDep.Enabled = false;
            dlProv.Enabled = false;
            dlDist.Enabled = false;
            dlDepAct.Enabled = true;
            dlProvAct.Enabled = true;
            dlDistAct.Enabled = true;
            dlActividad.Enabled = false;

            txtLugarActv.Text = dlDistAct.SelectedValue;

            txtUbigeo.Text = string.Empty;
            txtDNI.Text = string.Empty;
            txtActividad.Text = string.Empty;
        }

        protected void rbActiv_CheckedChanged(object sender, EventArgs e)
        {

            rbTotal.Checked = false;
            rbUbigeo.Checked = false;
            rbDNI.Checked = false;
            rbLugarActv.Checked = false;
            rbActiv.Checked = true;

            dlDep.Enabled = false;
            dlProv.Enabled = false;
            dlDist.Enabled = false;
            dlDepAct.Enabled = false;
            dlProvAct.Enabled = false;
            dlDistAct.Enabled = false;

            txtLugarActv.Text = string.Empty;
            txtUbigeo.Text = string.Empty;
            txtDNI.Text = string.Empty;

            dlActividad.Enabled = true;
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            refrescarInformes();
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            refrescarInformes();
        }

        protected void btnIr_Click(object sender, EventArgs e)
        {
            refrescarInformes();
        }

        protected void refrescarInformes()
        {
            rvReporteTalento.LocalReport.Refresh();
            rvReportExp.LocalReport.Refresh();
            rvGrafico.LocalReport.Refresh();
        }

        protected void dlActividad_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtActividad.Text = dlActividad.SelectedValue;
            refrescarInformes();
        }

    }
}