<%@ Page Title="" Language="C#" MasterPageFile="~/Oferentes.Master" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="Oferentes.WEB.Admin.Registrar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Registro de Oferentes - AGRO RURAL</title>

    <script type="text/javascript" src="../Scripts/Bloqueo.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h3>Ficha de Registro de Datos</h3>
    </div>
    <fieldset>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <legend>Datos Personales</legend>
        <div class="row no-gutter">
            <h4>Ficha Personal</h4>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtDNI">DNI</label>
                <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" MaxLength="8" onkeypress="return numeros(event);" ViewStateMode="Inherit" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ErrorMessage="Ingrese DNI" ValidationGroup="ValidarTalento" ControlToValidate="txtDNI" ViewStateMode="Disabled" Enabled="True" SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="DNI: Ingrese 8 dígitos" ValidationExpression="\d{8}" ControlToValidate="txtDNI" ValidationGroup="ValidarTalento" Display="Dynamic">*</asp:RegularExpressionValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtNomb">Nombre(s)</label>
                <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtNomb" runat="server" CssClass="form-control" onkeypress="return texto(event);" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNomb" ErrorMessage="Ingrese Nombre" ValidationGroup="ValidarTalento" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtApell">Apellidos</label>
                <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtApell" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return texto(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtApell" ErrorMessage="Ingrese Apellidos" ValidationGroup="ValidarTalento" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtFechanac">Fecha de Nacimiento</label>
                <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                    <ContentTemplate>

                        <asp:TextBox ID="txtFechanac" runat="server" CssClass="form-control date" ClientIDMode="Static"></asp:TextBox>

                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFechanac" Format="dd/MM/yyyy"></asp:CalendarExtender>

                        <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ErrorMessage="Ingrese Fecha" ValidationGroup="ValidarTalento" ControlToValidate="txtFechanac" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row no-gutter">
            <div class="form-group col-sm-3 col-xs-6">
                <label for="">Género</label>
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>

                        <asp:RadioButton ID="rbtnMale" runat="server" Text="Masculino" AutoPostBack="True" Checked="True" OnCheckedChanged="rbtnMale_CheckedChanged" />

                        <asp:RadioButton ID="rbtnFemale" runat="server" Text="Femenino" AutoPostBack="True" OnCheckedChanged="rbtnFemale_CheckedChanged" />

                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlEstCivil">Estado Civil</label>
                <asp:DropDownList ID="dlEstCivil" runat="server" CssClass="form-control" ClientIDMode="Static"
                    DataTextField="nombre" DataValueField="cod_estcivil">
                </asp:DropDownList>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtFijo">Teléfono Fijo</label>
                <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtFijo" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return numeros(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFijo" runat="server" ErrorMessage="Ingrese Teléfono Fijo" ValidationGroup="ValidarTalento" ControlToValidate="txtFijo" Display="Dynamic">*</asp:RequiredFieldValidator>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtCell">Teléfono Celular</label>
                <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtCell" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return numeros(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCell" runat="server" ErrorMessage="Ingrese Teléfono celular" ValidationGroup="ValidarTalento" ControlToValidate="txtCell" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row no-gutter">
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtCorreo">Correo</label>
                <asp:UpdatePanel ID="UpdatePanel24" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ErrorMessage="Ingrese Correo" ControlToValidate="txtCorreo" ValidationGroup="ValidarTalento" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de correo no válido" ControlToValidate="txtCorreo" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ValidationGroup="ValidarTalento" Display="Dynamic">*</asp:RegularExpressionValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <div class="row no-gutter">
            <h4>Lugar de Nacimiento</h4>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlDep">Departamento</label>
                <asp:UpdatePanel ID="UpdatePanel28" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlDep" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="departamento" DataValueField="cod_dep"
                            OnSelectedIndexChanged="dlDep_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlProv">Provincia</label>
                <asp:UpdatePanel ID="upProvincia" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlProv" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="provincia" DataValueField="cod_prov"
                            OnSelectedIndexChanged="dlProv_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </ContentTemplate>

                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dlDep" EventName="SelectedIndexChanged" />
                    </Triggers>


                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlDist">Distrito</label>
                <asp:UpdatePanel ID="upDistrito" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlDist" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="distrito" DataValueField="cod_dist"
                            OnSelectedIndexChanged="dlDist_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>


                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dlProv" EventName="SelectedIndexChanged" />
                    </Triggers>


                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row no-gutter">
            <h4>Lugar de Residencia</h4>
            <div class="form-group col-sm-3 col-xs-3">
                <label for="dlResid">Residencia</label>
                <asp:UpdatePanel ID="UpdatePanel29" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlResid" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="nombre" DataValueField="cod_resid">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-9 col-xs-9">
                <label for="txtDir">Dirección</label>
                <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtDir" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDir" ErrorMessage="Ingrese Dirección" ValidationGroup="ValidarTalento" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row no-gutter">
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlDepRes">Departamento</label>
                <asp:UpdatePanel ID="UpdatePanel27" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlDepRes" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="departamento" DataValueField="cod_dep"
                            OnSelectedIndexChanged="dlDepRes_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlProvRes">Provincia</label>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlProvRes" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="provincia" DataValueField="cod_prov"
                            OnSelectedIndexChanged="dlProvRes_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </ContentTemplate>

                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dlDepRes" EventName="SelectedIndexChanged" />
                    </Triggers>


                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlProvDis">Distrito</label>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlDistRes" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="distrito" DataValueField="cod_dist"
                            OnSelectedIndexChanged="dlDistRes_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>


                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dlProvRes" EventName="SelectedIndexChanged" />
                    </Triggers>


                </asp:UpdatePanel>
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>Nivel Educacional</legend>
        <div class="row no-gutter">
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlNivel">Nivel</label>
                <asp:UpdatePanel ID="UpdatePanel26" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlNivel" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="nivel" DataValueField="cod_estudio"
                            OnSelectedIndexChanged="dlNivel_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlGrado">Grado</label>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlGrado" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="grado" DataValueField="cod_estudio"
                            OnSelectedIndexChanged="dlGrado_SelectedIndexChanged" AutoPostBack="True" Enabled="False">
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dlNivel"
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="" class="sr-only">Conocimiento básico</label>
                <div class="radio-inline">
                    <asp:UpdatePanel ID="UpdatePanel32" runat="server">
                        <ContentTemplate>
                            <asp:RadioButton ID="rbLectura" runat="server" Text="Lectura" AutoPostBack="True" Checked="True" OnCheckedChanged="rbLectura_CheckedChanged" />
                            <br />
                            <asp:RadioButton ID="rbEscritura" runat="server" Text="Escritura" AutoPostBack="True" OnCheckedChanged="rbEscritura_CheckedChanged" />
                            <br />
                            <asp:RadioButton ID="rbAmbos" runat="server" Text="Ambos" AutoPostBack="True" OnCheckedChanged="rbAmbos_CheckedChanged" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlIdioma">Idioma</label>
                <asp:UpdatePanel ID="UpdatePanel33" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlIdioma" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="nombre" DataValueField="cod_Idioma"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </fieldset>
    <fieldset>

        <legend>Experiencia Laboral</legend>
        <div class="row no-gutter">
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlActiv">Actividad</label>
                <asp:UpdatePanel ID="UpdatePanel30" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlActiv" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="nombre" DataValueField="cod_activ"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="chbOtraActiv" runat="server" Text="Otra Actividad" AutoPostBack="True" OnCheckedChanged="chbOtraActiv_CheckedChanged" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtActiv" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                        <% if (chbOtraActiv.Checked)
                           {%>
                        <asp:RequiredFieldValidator ID="rfvActv" runat="server" ControlToValidate="txtActiv" ErrorMessage="Ingrese Actividad" ValidationGroup="ValidarExp" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <% } %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlRango">Experiencia</label>
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlRango" runat="server" CssClass="form-control" ClientIDMode="Static" AutoPostBack="True">
                            <asp:ListItem Selected="True" Value="3 - 5">3 - 5 años</asp:ListItem>
                            <asp:ListItem Value="5 - 8">5 - 8 años</asp:ListItem>
                            <asp:ListItem Value="8">más de 8</asp:ListItem>
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="rbCertNo">Certificado</label>
                <div class="radio-inline">
                    <asp:UpdatePanel ID="UpdatePanel37" runat="server">
                        <ContentTemplate>
                            <asp:RadioButton ID="rbCertNo" runat="server" Text="No" AutoPostBack="True" Checked="True" OnCheckedChanged="rbCertNo_CheckedChanged" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                        <ContentTemplate>
                            <asp:RadioButton ID="rbCertSi" runat="server" Text="Si" AutoPostBack="True" OnCheckedChanged="rbCertSi_CheckedChanged" />
                            <asp:TextBox ID="txtCertif" runat="server" CssClass="form-control" Enabled="False">No cuenta con uno</asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCertf" runat="server" ControlToValidate="txtCertif" ErrorMessage="Ingrese si cuenta con Certificado" ValidationGroup="ValidarExp" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <div class="row no-gutter">
            <h4>¿Dónde Realizó la actividad?</h4>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlDepAct">Departamento</label>
                <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlDepAct" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="departamento" DataValueField="cod_dep"
                            OnSelectedIndexChanged="dlDepAct_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlProvAct">Provincia</label>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlProvAct" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="provincia" DataValueField="cod_prov"
                            OnSelectedIndexChanged="dlProvAct_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dlDepAct" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlProvAct">Distrito</label>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlDistAct" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="distrito" DataValueField="cod_dist"
                            OnSelectedIndexChanged="dlDistAct_SelectedIndexChanged">
                        </asp:DropDownList>
                    </ContentTemplate>


                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dlProvAct" EventName="SelectedIndexChanged" />
                    </Triggers>

                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlProvAct" class="sr-only">¿Todos?</label>
                <asp:UpdatePanel ID="UpdatePanel36" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="chbTodosDist" runat="server" Text="Todos los Distritos" AutoPostBack="True" OnCheckedChanged="chbTodosDist_CheckedChanged" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <div class="row no-gutter">
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlOrg">Organización Atendida</label>
                <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlOrg" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="nombre" DataValueField="cod_orgatend"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <asp:UpdatePanel ID="UpdatePanel34" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="chbOtraOrg" runat="server" Text="Otra Organización" AutoPostBack="True" OnCheckedChanged="chbOtraOrg_CheckedChanged" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel35" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtOrg" runat="server" BorderStyle="Solid" CssClass="form-control" Enabled="False"></asp:TextBox>
                        <% if (chbOtraOrg.Checked)
                           {%>
                        <asp:RequiredFieldValidator ID="rfvOrg" runat="server" ControlToValidate="txtOrg" ErrorMessage="Ingrese organización atendida" ValidationGroup="ValidarExp" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <% } %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtRefer">Persona de Contacto</label>
                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtRefer" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="rfvRefer" runat="server" ErrorMessage="Ingrese Referente" ControlToValidate="txtRefer" ValidationGroup="ValidarExp" Display="Dynamic">*</asp:RequiredFieldValidator>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtRecon">Reconocimientos</label>
                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtRecon" runat="server" TextMode="MultiLine" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRecon" ErrorMessage="Ingrese sus reconocimientos" ValidationGroup="Validar">*</asp:RequiredFieldValidator>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <br />
        <div class="row no-gutter">
            <div class="col-sm-12">
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn-add" Text="+ Añadir Experiencia" OnClick="btnAdd_Click" ValidationGroup="ValidarExp" />
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
    </fieldset>

    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
        <ContentTemplate>
            <asp:GridView CssClass="table" ID="gdvExp" runat="server" OnRowDeleting="gdvExp_RowDeleting">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="buttons form-group">
        <asp:UpdatePanel ID="UpdatePanel16" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnLimpiar" runat="server" CssClass="btn btn-default hidden" Text="Limpiar" OnClick="btnLimpiar_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="UpdatePanel25" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnGrabar" runat="server" CssClass="btn btn-success" Text="Grabar Talento" OnClick="btnGrabar_Click" ValidationGroup="ValidarTalento" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>


    <asp:ValidationSummary ID="vsValidarTalento" runat="server"
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="ValidarTalento" />

    <asp:ValidationSummary ID="vsValidarExperiencia" runat="server"
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="ValidarExp" />

</asp:Content>
