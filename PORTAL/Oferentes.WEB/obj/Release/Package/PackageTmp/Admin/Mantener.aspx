<%@ Page Title="" Language="C#" MasterPageFile="~/Oferentes.Master" AutoEventWireup="true" CodeBehind="Mantener.aspx.cs" Inherits="Oferentes.WEB.Admin.Mantener" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Mantenimiento</title>
    <script type="text/javascript" src="../Scripts/Bloqueo.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <h3>Mantenimiento Talento</h3>
    </div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="row no-gutter">
        <div class="col-sm-4 col-sm-offset-4 form-group">
            <label for="ddlDNI">Datos Personales</label>
            <asp:UpdatePanel ID="UpdatePanel34" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="ddlDNI" runat="server" CssClass="form-control" AutoPostBack="True" DataTextField="ident" DataValueField="num_dni" OnSelectedIndexChanged="ddlDNI_SelectedIndexChanged">
                    </asp:DropDownList>


                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <fieldset>
        <legend>Datos Personales</legend>
        <div class="row no-gutter">
            <h4>Ficha Personal</h4>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtDNI">DNI</label>
                <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" ClientIDMode="Static" MaxLength="8" onkeypress="return numeros(event);" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ErrorMessage="Ingrese DNI" ValidationGroup="ValidarDNI" ControlToValidate="txtDNI">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ErrorMessage="DNI: Ingrese 8 dígitos" ValidationExpression="\d{8}" ControlToValidate="txtDNI" ValidationGroup="ValidarDNI">*</asp:RegularExpressionValidator>
                        <asp:Button ID="btnBuscar" runat="server" Text="OK" OnClick="btnBuscar_Click" ValidationGroup="ValidarDNI" Visible="False" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtNomb">Nombre(s)</label>
                <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtNomb" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return texto(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNomb" ErrorMessage="Ingrese Nombre" ValidationGroup="ValidarTalento" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtApell">Apellidos</label>
                <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtApell" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return texto(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtApell" ErrorMessage="Ingrese Apellidos" ValidationGroup="ValidarTalento">*</asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtFechanac">Fecha de Nacimiento</label>
                <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                    <ContentTemplate>

                        <asp:TextBox ID="txtFechanac" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>

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
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlEstCivil" runat="server" CssClass="form-control" ClientIDMode="Static"
                            DataTextField="nombre" DataValueField="cod_estcivil">
                        </asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtFijo">Teléfono Fijo</label>
                <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtFijo" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return numeros(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFijo" runat="server" ErrorMessage="Ingrese Teléfono Fijo" ValidationGroup="ValidarTalento" ControlToValidate="txtFijo">*</asp:RequiredFieldValidator>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtCell">Teléfono Celular</label>
                <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtCell" runat="server" CssClass="form-control" ClientIDMode="Static" onkeypress="return numeros(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCell" runat="server" ErrorMessage="Ingrese Teléfono celular" ValidationGroup="ValidarTalento" ControlToValidate="txtCell">*</asp:RequiredFieldValidator>
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
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de correo no válido" ControlToValidate="txtCorreo" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ValidationGroup="ValidarTalento">*</asp:RegularExpressionValidator>
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
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDir" ErrorMessage="Ingrese Dirección" ValidationGroup="ValidarTalento">*</asp:RequiredFieldValidator>
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
                <label for="dlDistRes">Distrito</label>
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
                        <asp:DropDownList ID="dlGrado" runat="server" CssClass="form-control" DataTextField="grado" DataValueField="cod_estudio"
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
                    <asp:UpdatePanel ID="UpdatePanel39" runat="server">
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
                <asp:UpdatePanel ID="UpdatePanel40" runat="server">
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
                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlActiv" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="nombre" DataValueField="cod_activ"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <asp:UpdatePanel ID="UpdatePanel37" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="chbOtraActiv" runat="server" Text="Otra Actividad" AutoPostBack="True" OnCheckedChanged="chbOtraActiv_CheckedChanged" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel38" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtActiv" runat="server" CssClass="form-control" ClientIDMode="Static" Enabled="False"></asp:TextBox>
                        <% if (chbOtraActiv.Checked)
                           {%>
                        <asp:RequiredFieldValidator ID="rfvActv" runat="server" ControlToValidate="txtActiv" ErrorMessage="Ingrese Actividad" ValidationGroup="ValidarExp">*</asp:RequiredFieldValidator>
                        <% } %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlRango">Experiencia</label>
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                       <div class="form-inline row">
                         <div class="form-group col-sm-6">
                                <label>Inicio</label>
                                <asp:TextBox ID="txtInicio" runat="server"  CssClass="form-control" onkeypress="return numeros(event);" MaxLength="7"></asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtInicio" Format="MM/yyyy" DefaultView="Years"></asp:CalendarExtender>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInicio" ErrorMessage="Ingrese Año inicial" ValidationGroup="ValidarExp" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Año inicio: Ingrese 7 dígitos" ValidationExpression="\d{7}" ControlToValidate="txtInicio" ValidationGroup="ValidarExp" Display="Dynamic">*</asp:RegularExpressionValidator>--%>
                             </div>
                            <div class="form-group col-sm-6">
                                <label>Fin</label>                       
                                <asp:TextBox ID="txtFin" runat="server"  CssClass="form-control" onkeypress="return numeros(event);" MaxLength="7"></asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtFin" Format="MM/yyyy" DefaultView="Years"></asp:CalendarExtender>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFin" ErrorMessage="Ingrese Año final" ValidationGroup="ValidarExp" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Año fin: Ingrese 7 dígitos" ValidationExpression="\d{7}" ControlToValidate="txtFin" ValidationGroup="ValidarExp" Display="Dynamic">*</asp:RegularExpressionValidator>--%>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="rbCertNo">Certificado</label>
                <div class="radio-inline">
                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                        <ContentTemplate>
                            <asp:RadioButton ID="rbCertNo" runat="server" Text="No" AutoPostBack="True" Checked="True" OnCheckedChanged="rbCertNo_CheckedChanged" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:UpdatePanel ID="UpdatePanel41" runat="server">
                        <ContentTemplate>
                            <asp:RadioButton ID="rbCertSi" runat="server" Text="Si" AutoPostBack="True" OnCheckedChanged="rbCertSi_CheckedChanged" />
                            <asp:TextBox ID="txtCertif" runat="server" CssClass="form-control" Enabled="False">No cuenta con uno</asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCertf" runat="server" ControlToValidate="txtCertif" ErrorMessage="Ingrese si cuenta con Certificado" ValidationGroup="ValidarExp">*</asp:RequiredFieldValidator>
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
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
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
                <asp:UpdatePanel ID="UpdatePanel12" runat="server">
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
                <asp:UpdatePanel ID="UpdatePanel42" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="chbTodosDist" runat="server" Text="Todos los Distritos" AutoPostBack="True" OnCheckedChanged="chbTodosDist_CheckedChanged" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row no-gutter">
            <div class="form-group col-sm-3 col-xs-6">
                <label for="dlOrg">Organización Atendida</label>
                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="dlOrg" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="nombre" DataValueField="cod_orgatend"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="chbOtraOrg" runat="server" Text="Otra Organización" AutoPostBack="True" OnCheckedChanged="chbOtraOrg_CheckedChanged" />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtOrg" runat="server" BorderStyle="Solid" CssClass="form-control" ClientIDMode="Static" Enabled="False"></asp:TextBox>
                        <% if (chbOtraOrg.Checked)
                           {%>
                        <asp:RequiredFieldValidator ID="rfvOrg" runat="server" ControlToValidate="txtOrg" ErrorMessage="Ingrese organización atendida" ValidationGroup="ValidarExp">*</asp:RequiredFieldValidator>
                        <% } %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtRefer">Persona de Contacto</label>
                <asp:UpdatePanel ID="UpdatePanel43" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtRefer" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="rfvRefer" runat="server" ErrorMessage="Ingrese Persona de contacto" ControlToValidate="txtRefer" ValidationGroup="ValidarExp">*</asp:RequiredFieldValidator>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="form-group col-sm-3 col-xs-6">
                <label for="txtRecon">Reconocimientos</label>
                <asp:UpdatePanel ID="UpdatePanel44" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtRecon" runat="server" TextMode="MultiLine" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRecon" ErrorMessage="Ingrese sus reconocimientos" ValidationGroup="Validar">*</asp:RequiredFieldValidator>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="row no-gutter">
            <div class="col-sm-3">
                <asp:UpdatePanel ID="UpdatePanel25" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnLimpiar" CssClass="btn-default" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-sm-3">
                <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnActualExp" CssClass="btn-default" runat="server" Text="Actualizar Experiencia" ValidationGroup="ValidarExp" OnClick="btnActualExp_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-sm-3">
                <asp:UpdatePanel ID="UpdatePanel30" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnInsertarExp" CssClass="btn-add" runat="server" Text="Insertar Experiencia" ValidationGroup="ValidarExp" OnClick="btnInsertarExp_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-sm-3">
                <asp:UpdatePanel ID="UpdatePanel33" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnEliminarExp" CssClass="btn-del" runat="server" Text="Eliminar Experiencia" ValidationGroup="ValidarExp" OnClick="btnEliminarExp_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <hr />

    </fieldset>






    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gdvExp" CssClass="table" runat="server" OnRowDeleting="gdvExp_RowDeleting" AutoGenerateColumns="False" AllowSorting="True">
                <Columns>
                    <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn-link" ShowDeleteButton="True" DeleteText="Editar" >
                    <ControlStyle CssClass="btn-link" />
                    </asp:CommandField>
                    <asp:BoundField DataField="num" HeaderText="Número" Visible="False" />
                    <asp:BoundField DataField="dni" HeaderText="DNI" Visible="False" />
                    <asp:BoundField DataField="cod_act" HeaderText="cod_act" Visible="False" />
                    <asp:BoundField DataField="actividad" HeaderText="Actividad" />
                    <asp:BoundField DataField="cod_lugar_activ" HeaderText="Ubigeo Lugar" Visible="False" />
                    <asp:BoundField DataField="lugar_activ" HeaderText="Lugar Actividad" />
                    <asp:BoundField DataField="duracion" HeaderText="Duración" />
                    <asp:BoundField DataField="cod_org" HeaderText="cod Org" Visible="False" />
                    <asp:BoundField DataField="organizacion" HeaderText="Organización Atendida" />
                    <asp:BoundField DataField="certificado" HeaderText="Certificado" />
                    <asp:BoundField DataField="referente" HeaderText="Referente" />
                    <asp:BoundField DataField="reconocimientos" HeaderText="Reconocimientos" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <div class="row no-gutter">
        <div class="col-sm-4">
            <label>Estado</label>
            <asp:UpdatePanel ID="UpdatePanel35" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lbEstado" runat="server" Text=""></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel36" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnHabilitar" CssClass="btn-default" runat="server" Text="Habilitar" Enabled="False" OnClick="btnHabilitar_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="col-sm-4">
            <label>&nbsp;</label>
            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnActualizar" CssClass="btn btn-success pull-right" runat="server" Text="Actualizar Talento" ValidationGroup="ValidarTalento" OnClick="btnActualizar_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="col-sm-4">
            <label>&nbsp;</label>
            <asp:UpdatePanel ID="UpdatePanel32" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-danger" Text="Eliminar Talento" ValidationGroup="ValidarTalento" OnClick="btnEliminar_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="col-sm-4">
            <asp:UpdatePanel ID="UpdatePanel45" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnCV" runat="server" CssClass="btn btn-success" Text="CV" OnClick="btnCV_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


    <br />
    <br />
    <asp:ValidationSummary ID="vsValidarTalento" runat="server"
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="ValidarTalento" />

    <asp:ValidationSummary ID="vsValidarDNI" runat="server"
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="ValidarDNI" />

    <asp:ValidationSummary ID="vsValidarExperiencia" runat="server"
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="ValidarExp" />


</asp:Content>
