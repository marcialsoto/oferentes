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
    public partial class Mantener : System.Web.UI.Page
    {
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

                ddlDNI.DataSource = Talento.listar_Talento_combo_mant();
                ddlDNI.DataBind();
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
        }

        protected void dlDistAct_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void ddlDNI_SelectedIndexChanged(object sender, EventArgs e)
        {
            limpiar_talento();
            limpiar_experiencia();
            txtDNI.Text = ddlDNI.SelectedValue;

            btnBuscar_Click(null, null);
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                Talento tal = new Talento();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                string ubigeonac, ubigeo, sexo, estudio, estado;

                tal._num_dni = Convert.ToInt32(txtDNI.Text);

                ds = Talento.listar_Talento_dni(tal);

                txtNomb.Text = (ds.Tables[0].Rows[0][2]).ToString();
                txtApell.Text = (ds.Tables[0].Rows[0][1]).ToString();
                txtFechanac.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][3]).ToShortDateString();

                ubigeonac = (ds.Tables[0].Rows[0][4]).ToString();
                dlDep.SelectedIndex = Convert.ToInt16(ubigeonac.Substring(0, 2)) - 1;

                dlDep_SelectedIndexChanged(null, null);

                dlProv.SelectedIndex = Convert.ToInt16(ubigeonac.Substring(2, 2)) - 1;

                dlProv_SelectedIndexChanged(null, null);

                dlDist.SelectedIndex = Convert.ToInt16(ubigeonac.Substring(4, 2)) - 1;

                sexo = (ds.Tables[0].Rows[0][5]).ToString();

                if (sexo == "Masculino")
                {
                    rbtnMale.Checked = true;
                    rbtnFemale.Checked = false;
                }
                else
                {
                    rbtnMale.Checked = false;
                    rbtnFemale.Checked = true;
                }

                dlEstCivil.SelectedIndex = Convert.ToInt16(ds.Tables[0].Rows[0][6]) - 1;

                dlResid.SelectedIndex = Convert.ToInt16(ds.Tables[0].Rows[0][7]) - 1;

                txtDir.Text = (ds.Tables[0].Rows[0][8]).ToString();


                ubigeo = (ds.Tables[0].Rows[0][9]).ToString();
                dlDepRes.SelectedIndex = Convert.ToInt16(ubigeo.Substring(0, 2)) - 1;

                dlDepRes_SelectedIndexChanged(null, null);

                dlProvRes.SelectedIndex = Convert.ToInt16(ubigeo.Substring(2, 2)) - 1;

                dlProvRes_SelectedIndexChanged(null, null);

                dlDistRes.SelectedIndex = Convert.ToInt16(ubigeo.Substring(4, 2)) - 1;


                txtFijo.Text = (ds.Tables[0].Rows[0][10]).ToString();

                txtCell.Text = (ds.Tables[0].Rows[0][11]).ToString();

                txtCorreo.Text = (ds.Tables[0].Rows[0][12]).ToString();

                estudio = (ds.Tables[0].Rows[0][13]).ToString();

                if (estudio == "00")
                {
                    rbLectura.Enabled = true;
                    rbEscritura.Enabled = true;
                    rbAmbos.Enabled = true;

                    switch ((ds.Tables[0].Rows[0][14]).ToString())
                    {
                        case "Lectura":
                            {
                                rbLectura.Checked = true;
                                rbEscritura.Checked = false;
                                rbAmbos.Checked = false;
                            }; break;
                        case "Escritura":
                            {
                                rbLectura.Checked = false;
                                rbEscritura.Checked = true;
                                rbAmbos.Checked = false;
                            }; break;
                        case "Ambos":
                            {
                                rbLectura.Checked = false;
                                rbEscritura.Checked = false;
                                rbAmbos.Checked = true;
                            }; break;

                    }
                }
                else
                {
                    rbLectura.Enabled = false;
                    rbEscritura.Enabled = false;
                    rbAmbos.Enabled = false;

                    dlNivel.SelectedIndex = Convert.ToInt16(estudio.Substring(0, 1));

                    dlNivel_SelectedIndexChanged(null, null);

                    dlGrado.SelectedIndex = Convert.ToInt16(estudio.Substring(1, 1)) - 1;
                }


                dlIdioma.SelectedIndex = Convert.ToInt16(ds.Tables[0].Rows[0][15]) - 1;

                estado = (ds.Tables[0].Rows[0][17]).ToString();

                if (estado == "1")
                {
                    lbEstado.Text = "Habilitado";
                    btnHabilitar.Enabled = false;
                }
                else
                {
                    lbEstado.Text = "Inhabilitado";
                    btnHabilitar.Enabled = true;
                }

                cargarExperiencia();


            }
            catch (Exception ex)
            {

            }


        }

        protected void cargarExperiencia()
        {
            try
            {
                Experiencia exp = new Experiencia();
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();

                exp._num_dni = Convert.ToInt32(txtDNI.Text);

                ds = Experiencia.listar_Experiencia_dni(exp);

                gdvExp.DataSource = ds;

                gdvExp.DataBind();

                dt = ds.Tables[0];

                Session["datos"] = dt;
            }
            catch (Exception ex)
            {

            }

        }


        protected void btnActualizar_Click(object sender, EventArgs e)
        {

            try
            {
                Talento tal = new Talento();


                tal._nombres = txtNomb.Text;
                tal._apellidos = txtApell.Text;
                tal._num_dni = Convert.ToInt32(txtDNI.Text);
                tal._fecha_nac = Convert.ToDateTime(txtFechanac.Text);
                tal._lugar_nac = dlDist.SelectedValue;
                //tal._sexo = txtSexo.Text;

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

                Talento.actualizar_Talento(tal);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "alert('Se actualizó el Talento correctamente')", true);

                limpiar_talento();
                limpiar_experiencia();

                gdvExp.DataSource = null;
                gdvExp.DataBind();

                ddlDNI_SelectedIndexChanged(null, null);

                //ddlDNI.DataSource = Talento.listar_Talento_combo_mant();
                //ddlDNI.DataBind();



            }
            catch (Exception ex)
            {

            }

        }


        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                Talento tal = new Talento();

                tal._num_dni = Convert.ToInt32(txtDNI.Text);

                Talento.eliminar_Talento(tal);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "alert('Se eliminó el Talento correctamente')", true);

                limpiar_talento();
                limpiar_experiencia();

                gdvExp.DataSource = null;
                gdvExp.DataBind();

                ddlDNI_SelectedIndexChanged(null, null);



            }
            catch (Exception ex)
            {

            }
        }

        protected void btnHabilitar_Click(object sender, EventArgs e)
        {
            try
            {
                Talento tal = new Talento();

                tal._num_dni = Convert.ToInt32(txtDNI.Text);

                Talento.habilitar_Talento(tal);

                limpiar_talento();
                limpiar_experiencia();

                gdvExp.DataSource = null;
                gdvExp.DataBind();

                ddlDNI_SelectedIndexChanged(null, null);
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar_experiencia();
        }



        protected void gdvExp_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                DataTable dt = Session["datos"] as DataTable;

                string ubigeo;
                int fila, num;

                fila = e.RowIndex;

                num = Convert.ToInt32(dt.Rows[fila][0]);

                //txtActiv.Text = (dt.Rows[fila][2]).ToString();

                dlActiv.SelectedValue = (dt.Rows[fila][2]).ToString();

                dlRango.SelectedValue = (dt.Rows[fila][4]).ToString();

                txtCertif.Text = (dt.Rows[fila][5]).ToString();

                if (txtCertif.Text == "No cuenta con uno")
                {
                    rbCertNo.Checked = true;
                    rbCertSi.Checked = false;
                    txtCertif.Enabled = false;
                }
                else
                {
                    rbCertNo.Checked = false;
                    rbCertSi.Checked = true;
                    txtCertif.Enabled = true;
                }

                ubigeo = (dt.Rows[fila][6]).ToString();

                dlDepAct.SelectedIndex = Convert.ToInt16(ubigeo.Substring(0, 2)) - 1;

                dlDepAct_SelectedIndexChanged(null, null);

                dlProvAct.SelectedIndex = Convert.ToInt16(ubigeo.Substring(2, 2)) - 1;

                dlProvAct_SelectedIndexChanged(null, null);

                dlDistAct.SelectedIndex = Convert.ToInt16(ubigeo.Substring(4, 2)) - 1;


                dlOrg.SelectedValue = (dt.Rows[fila][7]).ToString();

                txtRefer.Text = (dt.Rows[fila][9]).ToString();

                txtRecon.Text = (dt.Rows[fila][10]).ToString();

                //dt.Rows[fila].Delete();

                //gdvExp.DataSource = dt;
                //gdvExp.DataBind();
                Session["num"] = num;
            }
            catch (Exception ex)
            {

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

            lbEstado.Text = string.Empty;

            //carga_datatable();
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

            txtActiv.Text = string.Empty;
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

        protected void btnActualExp_Click(object sender, EventArgs e)
        {
            try
            {
                int num = Convert.ToInt32(Session["num"]);
                int codActiv, codOrg;

                Experiencia exp = new Experiencia();
                DataSet ds = new DataSet();

                Actividad act = new Actividad();

                OrgAtendida org = new OrgAtendida();



                exp._num = num;
                exp._num_dni = Convert.ToInt32(txtDNI.Text);



                if (chbOtraActiv.Checked)
                {
                    act._nombre = txtActiv.Text;

                    Actividad.insertar_Actividad(act);

                    codActiv = Convert.ToInt16((Actividad.buscar_Actividad_nombre(act)).Tables[0].Rows[0][0]);

                    exp._actividad = codActiv;
                }

                else
                    exp._actividad = Convert.ToInt16(dlActiv.SelectedValue);

                exp._duracion = dlRango.SelectedValue;
                exp._certificado = txtCertif.Text;
                exp._lugar_activ = dlDistAct.SelectedValue;

                if (chbOtraOrg.Checked)
                {
                    org._nombre = txtOrg.Text;

                    OrgAtendida.insertar_OrgAtendida(org);

                    codOrg = Convert.ToInt16((OrgAtendida.buscar_OrgAtendida_nombre(org)).Tables[0].Rows[0][0]);

                    exp._organizacion_atendida = codOrg;
                }
                else
                {
                    exp._organizacion_atendida = Convert.ToInt16(dlOrg.SelectedValue);
                }


                exp._referente = txtRefer.Text;
                exp._reconocimientos = txtRecon.Text;

                Experiencia.actualizar_Experiencia(exp);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "alert('Se actualizó la experiencia correctamente')", true);

                cargarExperiencia();

                limpiar_experiencia();


            }
            catch (Exception ex)
            {

            }

        }

        protected void btnInsertarExp_Click(object sender, EventArgs e)
        {
            try
            {
                int codActiv, codOrg;

                Experiencia exp = new Experiencia();
                DataSet ds = new DataSet();

                Actividad act = new Actividad();

                OrgAtendida org = new OrgAtendida();


                exp._num_dni = Convert.ToInt32(txtDNI.Text);



                if (chbOtraActiv.Checked)
                {
                    act._nombre = txtActiv.Text;

                    Actividad.insertar_Actividad(act);

                    codActiv = Convert.ToInt16((Actividad.buscar_Actividad_nombre(act)).Tables[0].Rows[0][0]);

                    exp._actividad = codActiv;
                }

                else
                    exp._actividad = Convert.ToInt16(dlActiv.SelectedValue);

                exp._duracion = dlRango.SelectedValue;
                exp._certificado = txtCertif.Text;
                exp._lugar_activ = dlDistAct.SelectedValue;

                if (chbOtraOrg.Checked)
                {
                    org._nombre = txtOrg.Text;

                    OrgAtendida.insertar_OrgAtendida(org);

                    codOrg = Convert.ToInt16((OrgAtendida.buscar_OrgAtendida_nombre(org)).Tables[0].Rows[0][0]);

                    exp._organizacion_atendida = codOrg;
                }
                else
                {
                    exp._organizacion_atendida = Convert.ToInt16(dlOrg.SelectedValue);
                }


                exp._referente = txtRefer.Text;
                exp._reconocimientos = txtRecon.Text;

                Experiencia.insertar_Experiencia(exp);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "alert('Se insertó la experiencia correctamente')", true);

                cargarExperiencia();


                //dlActiv.DataSource = Actividad.listar_Actividad();
                //dlActiv.DataBind();

                //dlActiv.Enabled = true;
                //chbOtraActiv.Checked = false;
                //txtActiv.Enabled = false;

                //dlOrg.DataSource = OrgAtendida.listar_OrgAtendida();
                //dlOrg.DataBind();

                //dlOrg.Enabled = true;
                //chbOtraOrg.Checked = false;
                //txtOrg.Enabled = false;

                //txtActiv.Text = string.Empty;
                //txtOrg.Text = string.Empty;
                //txtRefer.Text = string.Empty;
                //txtRecon.Text = string.Empty;

                limpiar_experiencia();


            }
            catch (Exception ex)
            {

            }

        }

        protected void btnEliminarExp_Click(object sender, EventArgs e)
        {
            try
            {
                int num = Convert.ToInt32(Session["num"]);

                Experiencia exp = new Experiencia();

                exp._num = num;
                exp._num_dni = Convert.ToInt32(txtDNI.Text);

                Experiencia.eliminar_Experiencia(exp);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msg", "alert('Se eliminó la experiencia correctamente')", true);

                cargarExperiencia();

                limpiar_experiencia();
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

        protected void chbTodosDist_CheckedChanged(object sender, EventArgs e)
        {
            if (chbTodosDist.Checked)
                dlDistAct.Enabled = false;
            else
                dlDistAct.Enabled = true;
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

    }
}