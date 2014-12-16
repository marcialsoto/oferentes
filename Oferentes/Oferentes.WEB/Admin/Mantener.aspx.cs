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

                dlDepAct.DataSource = Ubigeo.listar_dept();
                dlDepAct.DataBind();


                dlDepAct_SelectedIndexChanged(null, null);

                dlProvAct_SelectedIndexChanged(null, null);

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
            cod_nivel = dlNivel.SelectedValue;

            dlGrado.DataSource = Estudio.listar_grado(cod_nivel);

            dlGrado.DataBind();

            dlGrado_SelectedIndexChanged(null, null);
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

                dlNivel.SelectedIndex = Convert.ToInt16(estudio.Substring(0, 1)) - 1;

                dlNivel_SelectedIndexChanged(null, null);

                dlGrado.SelectedIndex = Convert.ToInt16(estudio.Substring(1, 1)) - 1;

                estado = (ds.Tables[0].Rows[0][15]).ToString();

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
                tal._estudio = dlGrado.SelectedValue;

                Talento.actualizar_Talento(tal);


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


        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                Talento tal = new Talento();

                tal._num_dni = Convert.ToInt32(txtDNI.Text);

                Talento.eliminar_Talento(tal);

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
            DataTable dt = Session["datos"] as DataTable;

            string ubigeo;
            int fila, num;

            fila = e.RowIndex;

            num = Convert.ToInt32(dt.Rows[fila][0]);

            txtActiv.Text = (dt.Rows[fila][2]).ToString();

            txtDuracion.Text = (dt.Rows[fila][3]).ToString();

            txtCertif.Text = (dt.Rows[fila][4]).ToString();

            ubigeo = (dt.Rows[fila][5]).ToString();

            dlDepAct.SelectedIndex = Convert.ToInt16(ubigeo.Substring(0, 2)) - 1;

            dlDepAct_SelectedIndexChanged(null, null);

            dlProvAct.SelectedIndex = Convert.ToInt16(ubigeo.Substring(2, 2)) - 1;

            dlProvAct_SelectedIndexChanged(null, null);

            dlDistAct.SelectedIndex = Convert.ToInt16(ubigeo.Substring(4, 2)) - 1;


            txtOrg.Text = (dt.Rows[fila][6]).ToString();

            txtRefer.Text = (dt.Rows[fila][7]).ToString();

            txtRecon.Text = (dt.Rows[fila][8]).ToString();

            //dt.Rows[fila].Delete();

            //gdvExp.DataSource = dt;
            //gdvExp.DataBind();
            Session["num"] = num;
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

            dlEstCivil.DataSource = Estado_Civil.listar_estcivil();
            dlEstCivil.DataBind();

            dlResid.DataSource = Residencia.listar_residencia();
            dlResid.DataBind();

            //------------------------------

            lbEstado.Text = string.Empty;

            //carga_datatable();
        }



        protected void limpiar_experiencia()
        {

            txtActiv.Text = string.Empty;
            txtDuracion.Text = string.Empty;
            txtCertif.Text = string.Empty;

            dlDepAct.DataSource = Ubigeo.listar_dept();
            dlDepAct.DataBind();

            dlDepAct_SelectedIndexChanged(null, null);
            dlProvAct_SelectedIndexChanged(null, null);

            txtOrg.Text = string.Empty;
            txtRefer.Text = string.Empty;
            txtRecon.Text = string.Empty;

        }

        protected void btnActualExp_Click(object sender, EventArgs e)
        {
            try
            {
                int num = Convert.ToInt32(Session["num"]);

                Experiencia exp = new Experiencia();

                exp._num = num;
                exp._num_dni = Convert.ToInt32(txtDNI.Text);
                exp._actividad = txtActiv.Text;
                exp._duracion = txtDuracion.Text;
                exp._certificado = txtCertif.Text;
                exp._lugar_activ = dlDistAct.SelectedValue;
                exp._organizacion_atendida = txtOrg.Text;
                exp._referente = txtRefer.Text;
                exp._reconocimientos = txtRecon.Text;

                Experiencia.actualizar_Experiencia(exp);

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
                Experiencia exp = new Experiencia();

                exp._num_dni = Convert.ToInt32(txtDNI.Text);
                exp._actividad = txtActiv.Text;
                exp._duracion = txtDuracion.Text;
                exp._certificado = txtCertif.Text;
                exp._lugar_activ = dlDistAct.SelectedValue;
                exp._organizacion_atendida = txtOrg.Text;
                exp._referente = txtRefer.Text;
                exp._reconocimientos = txtRecon.Text;

                Experiencia.insertar_Experiencia(exp);

                cargarExperiencia();

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

                cargarExperiencia();

                limpiar_experiencia();
            }
            catch (Exception ex)
            {

            }
        }

       
    }
}