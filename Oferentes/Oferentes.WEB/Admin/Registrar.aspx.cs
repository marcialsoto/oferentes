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

                dlDepAct.DataSource = Ubigeo.listar_dept();
                dlDepAct.DataBind();


                dlDepAct_SelectedIndexChanged(null, null);

                dlProvAct_SelectedIndexChanged(null, null);

                //------------------------------------

                carga_datatable();
            }
        }

        protected void carga_datatable()
        {

            DataTable dt = new DataTable();

            dt.Columns.Add("Actividad");
            dt.Columns.Add("Duración");
            dt.Columns.Add("Certificado");
            dt.Columns.Add("Lugar Actividad");
            dt.Columns.Add("Ubigeo");
            dt.Columns.Add("Organización Atendida");
            dt.Columns.Add("Referente");
            dt.Columns.Add("Reconocimientos");

            //dt.Rows.Add("", "");

            gdvExp.DataSource = null;
            gdvExp.DataSource = dt;
            gdvExp.DataBind();

            Session["datos"] = dt;
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
            cod_nivel = dlNivel.SelectedValue;

            dlGrado.DataSource = Estudio.listar_grado(cod_nivel);

            dlGrado.DataBind();

            dlGrado_SelectedIndexChanged(null, null);
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
            prov = dlProvAct.SelectedValue;

            dlDistAct.DataSource = Ubigeo.listar_dist(prov.ToString());

            dlDistAct.DataBind();
        }

        protected void dlDistAct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DataTable dt = Session["datos"] as DataTable;

            string lugar, ubigeo;

            lugar = dlDistAct.SelectedItem + ", " + dlProvAct.SelectedItem + ", " + dlDepAct.SelectedItem;
            ubigeo = dlDistAct.SelectedValue;

            dt.Rows.Add(txtActiv.Text, txtDuracion.Text, txtCertif.Text, lugar, ubigeo, txtOrg.Text, txtRefer.Text, txtRecon.Text);

            //DataRow dtRegistro2 = dt.NewRow();
            //dtRegistro2["Actividad"] = txtActiv.Text;
            //dt.Rows.Add(dtRegistro2);


            gdvExp.DataSource = dt;
            gdvExp.DataBind();
            Session["datos"] = dt;

            limpiar_experiencia();
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            Talento tal = new Talento();
            Experiencia exp = new Experiencia();

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

            Talento.insertar_Talento(tal);

            DataTable dt = Session["datos"] as DataTable;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                exp._num_dni = Convert.ToInt32(txtDNI.Text);
                exp._actividad = dt.Rows[i][0].ToString();
                exp._duracion = dt.Rows[i][1].ToString();
                exp._certificado = dt.Rows[i][2].ToString();
                exp._lugar_activ = dt.Rows[i][4].ToString();
                exp._organizacion_atendida = dt.Rows[i][5].ToString();
                exp._referente = dt.Rows[i][6].ToString();
                exp._reconocimientos = dt.Rows[i][7].ToString();

                Experiencia.insertar_Experiencia(exp);
            }

            limpiar_talento();

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

            carga_datatable();
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
            DataTable dt = Session["datos"] as DataTable;

            int fila = e.RowIndex;

            dt.Rows[fila].Delete();

            gdvExp.DataSource = dt;
            gdvExp.DataBind();
            Session["datos"] = dt;
        }

       
    }
}