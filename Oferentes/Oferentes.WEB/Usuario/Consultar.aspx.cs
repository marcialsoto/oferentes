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


                dlActividad.DataSource = Actividad.listar_Actividad();
                dlActividad.DataBind();

                dlOrganizacion.DataSource = OrgAtendida.listar_OrgAtendida();
                dlOrganizacion.DataBind();

                rvReporteTalento.LocalReport.ReportPath = "Reportes/ReporteTalento.rdlc";

                rvReportExp.LocalReport.ReportPath = "Reportes/ReportExp.rdlc";

                rvGrafico.LocalReport.ReportPath = "Reportes/Graficos.rdlc";

                rvTalentoporActiv.LocalReport.ReportPath = "Reportes/TalentoporActiv.rdlc";

                rvTalentoporOrg.LocalReport.ReportPath = "Reportes/TalentoporOrg.rdlc";

                rvActivporOrg.LocalReport.ReportPath = "Reportes/ActivporOrg.rdlc";


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
            dlOrganizacion.Enabled = false;

            btnBuscar.Enabled = true;
            btnOk.Enabled = false;
            btnIr.Enabled = false;

            txtUbigeo.Text = dlDist.SelectedValue;

            txtDNI.Text = string.Empty;
            txtDNI.Enabled = false;
            txtLugarActv.Text = string.Empty;
            txtActividad.Text = string.Empty;
            txtOrg.Text = string.Empty;

            chbTodosDept.Enabled = true;
            chbTodosProv.Enabled = true;
            chbTodosDist.Enabled = true;

            chbTodosDeptlugaractiv.Enabled = false;
            chbTodosProvlugaractiv.Enabled = false;
            chbTodosDistlugaractiv.Enabled = false;

            chbTodosActiv.Enabled = false;
            chbTodasOrg.Enabled = false;

            quitarcheck();
        }

        protected void rbDNI_CheckedChanged(object sender, EventArgs e)
        {
            txtUbigeo.Text = string.Empty;
            txtDNI.Text = string.Empty;
            txtDNI.Enabled = true;
            txtLugarActv.Text = string.Empty;
            txtActividad.Text = string.Empty;
            txtOrg.Text = string.Empty;

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
            dlOrganizacion.Enabled = false;

            btnBuscar.Enabled = false;
            btnOk.Enabled = true;
            btnIr.Enabled = false;

            chbTodosDept.Enabled = false;
            chbTodosProv.Enabled = false;
            chbTodosDist.Enabled = false;

            chbTodosDeptlugaractiv.Enabled = false;
            chbTodosProvlugaractiv.Enabled = false;
            chbTodosDistlugaractiv.Enabled = false;

            chbTodosActiv.Enabled = false;
            chbTodasOrg.Enabled = false;

            quitarcheck();
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
            dlActividad.Enabled = true;
            dlOrganizacion.Enabled = true;

            txtLugarActv.Text = dlDistAct.SelectedValue;

            txtUbigeo.Text = string.Empty;
            txtDNI.Text = string.Empty;
            txtDNI.Enabled = false;
            txtActividad.Text = string.Empty;
            txtOrg.Text = string.Empty;

            chbTodosDept.Enabled = false;
            chbTodosProv.Enabled = false;
            chbTodosDist.Enabled = false;

            chbTodosDeptlugaractiv.Enabled = true;
            chbTodosProvlugaractiv.Enabled = true;
            chbTodosDistlugaractiv.Enabled = true;

            chbTodosActiv.Enabled = true;
            chbTodasOrg.Enabled = true;

            quitarcheck();
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


            if (chbTodosActiv.Checked)
                txtActividad.Text = string.Empty;
            else
                txtActividad.Text = dlActividad.SelectedValue;

            if (chbTodasOrg.Checked)
                txtOrg.Text = string.Empty;
            else
                txtOrg.Text = dlOrganizacion.SelectedValue;

            refrescarInformes();
        }

        protected void refrescarInformes()
        {
            rvReporteTalento.LocalReport.Refresh();
            rvReportExp.LocalReport.Refresh();
            rvGrafico.LocalReport.Refresh();
            rvTalentoporActiv.LocalReport.Refresh();
            rvTalentoporOrg.LocalReport.Refresh();
            rvActivporOrg.LocalReport.Refresh();
        }

        protected void quitarcheck()
        {
            chbTodosDept.Checked = false;
            chbTodosProv.Checked = false;
            chbTodosDist.Checked = false;

            chbTodosDeptlugaractiv.Checked = false;
            chbTodosProvlugaractiv.Checked = false;
            chbTodosDistlugaractiv.Checked = false;

            chbTodosActiv.Checked = false;
            chbTodasOrg.Checked = false;
        }

        protected void dlActividad_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtActividad.Text = dlActividad.SelectedValue;
            //refrescarInformes();
        }

        protected void chbTodosDept_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodosDept.Checked)
            {
                chbTodosProv.Enabled = false;
                chbTodosDist.Enabled = false;

                dlDep.Enabled = false;
                dlProv.Enabled = false;
                dlDist.Enabled = false;
                txtUbigeo.Text = "______";
            }
            else
            {
                chbTodosProv.Enabled = true;
                chbTodosDist.Enabled = true;

                dlDep.Enabled = true;
                dlProv.Enabled = true;
                dlDist.Enabled = true;
                txtUbigeo.Text = dlDist.SelectedValue;
            }

        }

        protected void chbTodosProv_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodosProv.Checked)
            {
                chbTodosDept.Enabled = false;
                chbTodosDist.Enabled = false;


                dlProv.Enabled = false;
                dlDist.Enabled = false;
                txtUbigeo.Text = dlDep.SelectedValue + "____";
            }
            else
            {
                chbTodosDept.Enabled = true;
                chbTodosDist.Enabled = true;


                dlProv.Enabled = true;
                dlDist.Enabled = true;
                txtUbigeo.Text = dlDist.SelectedValue;
            }
        }

        protected void chbTodosDist_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodosDist.Checked)
            {
                chbTodosDept.Enabled = false;
                chbTodosProv.Enabled = false;



                dlDist.Enabled = false;
                txtUbigeo.Text = dlProv.SelectedValue + "__";
            }
            else
            {
                chbTodosDept.Enabled = true;
                chbTodosProv.Enabled = true;



                dlDist.Enabled = true;
                txtUbigeo.Text = dlDist.SelectedValue;
            }
        }

        protected void chbTodosDeptlugaractiv_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodosDeptlugaractiv.Checked)
            {
                chbTodosProvlugaractiv.Enabled = false;
                chbTodosDistlugaractiv.Enabled = false;

                dlDepAct.Enabled = false;
                dlProvAct.Enabled = false;
                dlDistAct.Enabled = false;

                txtLugarActv.Text = "______";
            }
            else
            {
                chbTodosProvlugaractiv.Enabled = true;
                chbTodosDistlugaractiv.Enabled = true;

                dlDepAct.Enabled = true;
                dlProvAct.Enabled = true;
                dlDistAct.Enabled = true;

                txtLugarActv.Text = dlDistAct.SelectedValue;
            }
        }

        protected void chbTodosProvlugaractiv_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodosProvlugaractiv.Checked)
            {
                chbTodosDeptlugaractiv.Enabled = false;
                chbTodosDistlugaractiv.Enabled = false;


                dlProvAct.Enabled = false;
                dlDistAct.Enabled = false;

                txtLugarActv.Text = dlDepAct.SelectedValue + "____";
            }
            else
            {
                chbTodosDeptlugaractiv.Enabled = true;
                chbTodosDistlugaractiv.Enabled = true;


                dlProvAct.Enabled = true;
                dlDistAct.Enabled = true;

                txtLugarActv.Text = dlDistAct.SelectedValue;
            }
        }

        protected void chbTodosDistlugaractiv_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodosDistlugaractiv.Checked)
            {
                chbTodosDeptlugaractiv.Enabled = false;
                chbTodosProvlugaractiv.Enabled = false;



                dlDistAct.Enabled = false;

                txtLugarActv.Text = dlProvAct.SelectedValue + "__";
            }
            else
            {
                chbTodosDeptlugaractiv.Enabled = true;
                chbTodosProvlugaractiv.Enabled = true;



                dlDistAct.Enabled = true;

                txtLugarActv.Text = dlDistAct.SelectedValue;
            }
        }

        protected void chbTodosActiv_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodosActiv.Checked)
                dlActividad.Enabled = false;
            else
                dlActividad.Enabled = true;

        }

        protected void dlOrganizacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtOrg.Text = dlOrganizacion.SelectedValue;
        }

        protected void chbTodasOrg_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodasOrg.Checked)
                dlOrganizacion.Enabled = false;
            else
                dlOrganizacion.Enabled = true;
        }

    }
}