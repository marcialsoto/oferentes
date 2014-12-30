using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oferentes.BOL;

namespace Oferentes.WEB.Admin
{
    public partial class Registrar : System.Web.UI.Page
    {
        //Ubigeo oUbi = new Ubigeo();

        string dep, prov, cod_nivel;

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

                dlEstCivil.DataSource = Estado_Civil.listar_estcivil();
                dlEstCivil.DataBind();

                dlResid.DataSource = Residencia.listar_residencia();
                dlResid.DataBind();


                //------------------------------------

                dlDepRes.DataSource = Ubigeo.listar_dept();
                dlDepRes.DataBind();


                dlDepRes_SelectedIndexChanged(null, null);

                dlProvRes_SelectedIndexChanged(null, null);

                //------------------------------------

                dlNivel.DataSource = Estudio.listar_nivel();
                dlNivel.DataBind();


                dlNivel_SelectedIndexChanged(null, null);
                dlGrado_SelectedIndexChanged(null, null);

                //------------------------------------

                dlIdioma.DataSource = Idioma.listar_idioma();
                dlIdioma.DataBind();

                //------------------------------------

                dlDepAct.DataSource = Ubigeo.listar_dept();
                dlDepAct.DataBind();


                dlDepAct_SelectedIndexChanged(null, null);

                dlProvAct_SelectedIndexChanged(null, null);

                //------------------------------------

                dlActiv.DataSource = Actividad.listar_Actividad();
                dlActiv.DataBind();

                //------------------------------------

                dlOrg.DataSource = OrgAtendida.listar_OrgAtendida();
                dlOrg.DataBind();

                //------------------------------------

                carga_datatable();
            }
        }

        protected void carga_datatable()
        {
            try
            {
                DataTable dt = new DataTable();

                dt.Columns.Add("cod Activ");
                dt.Columns.Add("Actividad");
                dt.Columns.Add("Duración");
                dt.Columns.Add("Certificado");
                dt.Columns.Add("Lugar Actividad");
                dt.Columns.Add("Ubigeo");
                dt.Columns.Add("cod Org Atendida");
                dt.Columns.Add("Organización Atendida");
                dt.Columns.Add("Referente");
                dt.Columns.Add("Reconocimientos");

                //dt.Rows.Add("", "");

                gdvExp.DataSource = null;
                gdvExp.DataSource = dt;
                gdvExp.DataBind();

                Session["datos"] = dt;
            }
            catch (Exception ex)
            {

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
        }

        protected void dlDist_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dlDepRes_SelectedIndexChanged(object sender, EventArgs e)
        {
            dep = dlDepRes.SelectedValue;

            dlProvRes.DataSource = Ubigeo.listar_prov(dep);

            dlProvRes.DataBind();

            dlProvRes_SelectedIndexChanged(null, null);
        }

        protected void dlProvRes_SelectedIndexChanged(object sender, EventArgs e)
        {
            prov = dlProvRes.SelectedValue;

            dlDistRes.DataSource = Ubigeo.listar_dist(prov.ToString());

            dlDistRes.DataBind();
        }

        protected void dlDistRes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dlNivel_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string nivel = dlNivel.SelectedItem.ToString();

                if (nivel == "Ninguno")
                {
                    dlGrado.Enabled = false;

                    rbEscritura.Enabled = true;
                    rbLectura.Enabled = true;
                    rbAmbos.Enabled = true;
                }
                else
                {
                    dlGrado.Enabled = true;

                    rbEscritura.Enabled = false;
                    rbLectura.Enabled = false;
                    rbAmbos.Enabled = false;

                    cod_nivel = dlNivel.SelectedValue;

                    dlGrado.DataSource = Estudio.listar_grado(cod_nivel);

                    dlGrado.DataBind();

                    dlGrado_SelectedIndexChanged(null, null);
                }

            }
            catch (Exception ex)
            {

            }

        }

        protected void dlGrado_SelectedIndexChanged(object sender, EventArgs e)
        {

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
            DataTable dtDist = new DataTable();

            prov = dlProvAct.SelectedValue;

            dtDist = (Ubigeo.listar_dist(prov.ToString())).Tables[0];

            dlDistAct.DataSource = dtDist;

            dlDistAct.DataBind();

            Session["distritos"] = dtDist;
        }

        protected void dlDistAct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = Session["datos"] as DataTable;

                DataTable dtDist = Session["distritos"] as DataTable;

                int codActiv, codOrg;
                string lugar, ubigeo, actividad, organizacion;

                if (chbOtraActiv.Checked)
                {
                    codActiv = 0;
                    actividad = txtActiv.Text;
                }
                else
                {
                    codActiv = Convert.ToInt16(dlActiv.SelectedValue);
                    actividad = dlActiv.SelectedItem.ToString();
                }

                lugar = dlDistAct.SelectedItem + ", " + dlProvAct.SelectedItem + ", " + dlDepAct.SelectedItem;
                ubigeo = dlDistAct.SelectedValue;

                if (chbOtraOrg.Checked)
                {
                    codOrg = 0;
                    organizacion = txtOrg.Text;
                }
                else
                {
                    codOrg = Convert.ToInt16(dlOrg.SelectedValue);
                    organizacion = dlOrg.SelectedItem.ToString();
                }

                if (chbTodosDist.Checked)
                {
                    for (int i = 0; i < dtDist.Rows.Count; i++)
                    {
                        lugar = dtDist.Rows[i][1].ToString() + ", " + dlProvAct.SelectedItem + ", " + dlDepAct.SelectedItem;
                        ubigeo = dtDist.Rows[i][0].ToString();
                        dt.Rows.Add(codActiv, actividad, dlRango.SelectedValue, txtCertif.Text, lugar, ubigeo, codOrg, organizacion, txtRefer.Text, txtRecon.Text);
                    }
                }
                else
                    dt.Rows.Add(codActiv, actividad, dlRango.SelectedValue, txtCertif.Text, lugar, ubigeo, codOrg, organizacion, txtRefer.Text, txtRecon.Text);

                gdvExp.DataSource = dt;
                gdvExp.DataBind();
                Session["datos"] = dt;

                txtRefer.Text = string.Empty;
                txtRecon.Text = string.Empty;

                chbTodosDist.Checked = false;
                dlDistAct.Enabled = true;

                //limpiar_experiencia();
            }
            catch (Exception ex)
            {

            }

        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            try
            {
                Talento tal = new Talento();
                Experiencia exp = new Experiencia();

                tal._nombres = txtNomb.Text;
                tal._apellidos = txtApell.Text;
                tal._num_dni = Convert.ToInt32(txtDNI.Text);
                tal._fecha_nac = Convert.ToDateTime(txtFechanac.Text);
                tal._lugar_nac = dlDist.SelectedValue;

                if (rbtnMale.Checked)
                    tal._sexo = rbtnMale.Text;
                else
                    tal._sexo = rbtnFemale.Text;

                tal._estado_civil = Convert.ToInt16(dlEstCivil.SelectedValue);
                tal._residencia = Convert.ToInt16(dlResid.SelectedValue);
                tal._direccion = txtDir.Text;
                tal._ubigeo = dlDistRes.SelectedValue;
                tal._telefono_fijo = Convert.ToInt32(txtFijo.Text);
                tal._telefono_celular = Convert.ToInt32(txtCell.Text);
                tal._correo = txtCorreo.Text;

                if (dlNivel.SelectedItem.ToString() == "Ninguno")
                {
                    tal._estudio = "00";

                    if (rbLectura.Checked)
                        tal._lect_esc = rbLectura.Text;
                    else
                    {
                        if (rbEscritura.Checked)
                            tal._lect_esc = rbEscritura.Text;
                        else
                            tal._lect_esc = rbAmbos.Text;
                    }
                }
                else
                {
                    tal._estudio = dlGrado.SelectedValue;
                    tal._lect_esc = "";
                }

                tal._idioma = Convert.ToInt16(dlIdioma.SelectedValue);

                Talento.insertar_Talento(tal);

                DataTable dt = Session["datos"] as DataTable;

                DataSet ds = new DataSet();

                Actividad act = new Actividad();

                OrgAtendida org = new OrgAtendida();

                int codActiv, codOrg;

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    exp._num_dni = Convert.ToInt32(txtDNI.Text);

                    if (dt.Rows[i][0].ToString() == "0")
                    {
                        act._nombre = dt.Rows[i][1].ToString();

                        ds = Actividad.buscar_Actividad_nombre(act);

                        if (ds.Tables[0].Rows.Count == 0)
                        {
                            Actividad.insertar_Actividad(act);
                            codActiv = Convert.ToInt16((Actividad.buscar_Actividad_nombre(act)).Tables[0].Rows[0][0]);
                        }
                        else
                            codActiv = Convert.ToInt16(ds.Tables[0].Rows[0][0]);

                        exp._actividad = codActiv;
                    }
                    else
                        exp._actividad = Convert.ToInt16(dt.Rows[i][0].ToString());

                    exp._duracion = dt.Rows[i][2].ToString();
                    exp._certificado = dt.Rows[i][3].ToString();
                    exp._lugar_activ = dt.Rows[i][5].ToString();

                    if (dt.Rows[i][6].ToString() == "0")
                    {
                        org._nombre = dt.Rows[i][7].ToString();

                        ds = OrgAtendida.buscar_OrgAtendida_nombre(org);



                        if (ds.Tables[0].Rows.Count == 0)
                        {
                            OrgAtendida.insertar_OrgAtendida(org);

                            codOrg = Convert.ToInt16((OrgAtendida.buscar_OrgAtendida_nombre(org)).Tables[0].Rows[0][0]);
                        }
                        else
                            codOrg = Convert.ToInt16(ds.Tables[0].Rows[0][0]);


                        exp._organizacion_atendida = codOrg;
                    }
                    else
                        exp._organizacion_atendida = Convert.ToInt16(dt.Rows[i][6].ToString());

                    exp._referente = dt.Rows[i][8].ToString();
                    exp._reconocimientos = dt.Rows[i][9].ToString();

                    Experiencia.insertar_Experiencia(exp);
                }

                limpiar_talento();
                limpiar_experiencia();

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "alert('Grabó correctamente')", true);
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "alert('"+ex.Message+"')", true);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "alert('Este Talento ya existe')", true);
            }


        }

        protected void limpiar_talento()
        {
            txtNomb.Text = string.Empty;
            txtApell.Text = string.Empty;
            txtDNI.Text = string.Empty;
            txtFechanac.Text = string.Empty;
            //txtSexo.Text = string.Empty;

            rbtnMale.Checked = true;
            rbtnFemale.Checked = false;

            txtFijo.Text = string.Empty;
            txtCell.Text = string.Empty;
            txtCorreo.Text = string.Empty;
            txtDir.Text = string.Empty;

            //------------------------

            dlDep.DataSource = Ubigeo.listar_dept();
            dlDep.DataBind();

            dlDep_SelectedIndexChanged(null, null);
            dlProv_SelectedIndexChanged(null, null);

            //----------------------------

            dlDepRes.DataSource = Ubigeo.listar_dept();
            dlDepRes.DataBind();

            dlDepRes_SelectedIndexChanged(null, null);
            dlProvRes_SelectedIndexChanged(null, null);

            //----------------------------

            dlNivel.DataSource = Estudio.listar_nivel();
            dlNivel.DataBind();


            dlNivel_SelectedIndexChanged(null, null);
            dlGrado_SelectedIndexChanged(null, null);

            //----------------------------
            dlIdioma.DataSource = Idioma.listar_idioma();
            dlIdioma.DataBind();

            //----------------------------

            dlEstCivil.DataSource = Estado_Civil.listar_estcivil();
            dlEstCivil.DataBind();

            dlResid.DataSource = Residencia.listar_residencia();
            dlResid.DataBind();

            //------------------------------

            rbEscritura.Checked = false;
            rbLectura.Checked = true;
            rbAmbos.Checked = false;

            //------------------------------

            carga_datatable();
        }

        protected void limpiar_experiencia()
        {

            txtActiv.Text = string.Empty;
            //txtDuracion.Text = string.Empty;

            dlRango.SelectedIndex = 0;

            txtCertif.Text = string.Empty;

            dlDepAct.DataSource = Ubigeo.listar_dept();
            dlDepAct.DataBind();

            dlDepAct_SelectedIndexChanged(null, null);
            dlProvAct_SelectedIndexChanged(null, null);

            dlActiv.DataSource = Actividad.listar_Actividad();
            dlActiv.DataBind();

            dlActiv.Enabled = true;
            chbOtraActiv.Checked = false;
            txtActiv.Enabled = false;

            dlOrg.DataSource = OrgAtendida.listar_OrgAtendida();
            dlOrg.DataBind();

            dlOrg.Enabled = true;
            chbOtraOrg.Checked = false;
            txtOrg.Enabled = false;

            txtOrg.Text = string.Empty;
            txtRefer.Text = string.Empty;
            txtRecon.Text = string.Empty;

            rbCertNo.Checked = true;
            rbCertSi.Checked = false;
            txtCertif.Enabled = false;
            txtCertif.Text = "No cuenta con uno";

            chbTodosDist.Checked = false;
            dlDistAct.Enabled = true;

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar_experiencia();
        }

        protected void rbtnMale_CheckedChanged(object sender, EventArgs e)
        {
            rbtnMale.Checked = true;
            rbtnFemale.Checked = false;
        }

        protected void rbtnFemale_CheckedChanged(object sender, EventArgs e)
        {
            rbtnMale.Checked = false;
            rbtnFemale.Checked = true;
        }



        protected void gdvExp_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                DataTable dt = Session["datos"] as DataTable;

                int fila = e.RowIndex;

                dt.Rows[fila].Delete();

                gdvExp.DataSource = dt;
                gdvExp.DataBind();
                Session["datos"] = dt;
            }
            catch (Exception ex)
            {

            }

        }

        protected void chbOtraActiv_CheckedChanged(object sender, EventArgs e)
        {
            if (chbOtraActiv.Checked)
            {
                dlActiv.Enabled = false;
                txtActiv.Enabled = true;
            }
            else
            {
                dlActiv.Enabled = true;
                txtActiv.Enabled = false;
            }
        }

        protected void rbLectura_CheckedChanged(object sender, EventArgs e)
        {
            rbEscritura.Checked = false;
            rbLectura.Checked = true;
            rbAmbos.Checked = false;
        }

        protected void rbEscritura_CheckedChanged(object sender, EventArgs e)
        {
            rbEscritura.Checked = true;
            rbLectura.Checked = false;
            rbAmbos.Checked = false;
        }

        protected void rbAmbos_CheckedChanged(object sender, EventArgs e)
        {
            rbEscritura.Checked = false;
            rbLectura.Checked = false;
            rbAmbos.Checked = true;
        }

        protected void chbOtraOrg_CheckedChanged(object sender, EventArgs e)
        {
            if (chbOtraOrg.Checked)
            {
                dlOrg.Enabled = false;
                txtOrg.Enabled = true;
            }
            else
            {
                dlOrg.Enabled = true;
                txtOrg.Enabled = false;
            }
        }

        protected void chbTodosDist_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodosDist.Checked)
                dlDistAct.Enabled = false;
            else
                dlDistAct.Enabled = true;
        }

        protected void rbCertNo_CheckedChanged(object sender, EventArgs e)
        {
            rbCertNo.Checked = true;
            rbCertSi.Checked = false;
            txtCertif.Enabled = false;
            txtCertif.Text = "No cuenta con uno";
        }

        protected void rbCertSi_CheckedChanged(object sender, EventArgs e)
        {
            rbCertNo.Checked = false;
            rbCertSi.Checked = true;
            txtCertif.Enabled = true;
            txtCertif.Text = string.Empty;
        }




    }
}