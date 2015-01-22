<%@ Page Title="" Language="C#" MasterPageFile="~/Oferentes.Master" AutoEventWireup="true" CodeBehind="Consultar.aspx.cs" Inherits="Oferentes.WEB.Usuario.Consultar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reportes</title>
    <script type="text/javascript" src="../Scripts/Bloqueo.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:RadioButton ID="rbTotal" runat="server" Checked="True" Text="Seleccionar Todos los Departamentos" AutoPostBack="True" OnCheckedChanged="rbTotal_CheckedChanged" Visible="False" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:RadioButton ID="rbUbigeo" runat="server" AutoPostBack="True" OnCheckedChanged="rbUbigeo_CheckedChanged" Text="Seleccionar por Ubigeo Talentos" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                <ContentTemplate>
                    <label>Departamento</label>
                    <asp:CheckBox ID="chbTodosDept" runat="server" Text="Todos" AutoPostBack="True" Enabled="False" OnCheckedChanged="chbTodosDept_CheckedChanged" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="dlDep" runat="server" CssClass="form-control"
                        DataTextField="departamento" DataValueField="cod_dep"
                        OnSelectedIndexChanged="dlDep_SelectedIndexChanged" AutoPostBack="True" Enabled="False">
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                <ContentTemplate>
                    <label>Provincia</label>
                    <asp:CheckBox ID="chbTodosProv" runat="server" Text="Todos" AutoPostBack="True" Enabled="False" OnCheckedChanged="chbTodosProv_CheckedChanged" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="upProvincia" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="dlProv" runat="server" CssClass="form-control"
                        DataTextField="provincia" DataValueField="cod_prov"
                        OnSelectedIndexChanged="dlProv_SelectedIndexChanged" AutoPostBack="True" Enabled="False">
                    </asp:DropDownList>
                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="dlDep" EventName="SelectedIndexChanged" />
                </Triggers>


            </asp:UpdatePanel>
        </div>
        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                <ContentTemplate>
                    <label>Distrito</label>
                    <asp:CheckBox ID="chbTodosDist" runat="server" Text="Todos" AutoPostBack="True" Enabled="False" OnCheckedChanged="chbTodosDist_CheckedChanged" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="upDistrito" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="dlDist" runat="server" CssClass="form-control"
                        DataTextField="distrito" DataValueField="cod_dist"
                        OnSelectedIndexChanged="dlDist_SelectedIndexChanged" AutoPostBack="True" Enabled="False">
                    </asp:DropDownList>
                </ContentTemplate>


                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="dlProv" EventName="SelectedIndexChanged" />
                </Triggers>


            </asp:UpdatePanel>
        </div>
        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtUbigeo" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="dlDist" EventName="SelectedIndexChanged" />
                </Triggers>

            </asp:UpdatePanel>
        </div>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnBuscar" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="btnBuscar_Click" Enabled="False" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <hr />

        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
            <ContentTemplate>
                <asp:RadioButton ID="rbDNI" runat="server" Text="Búsqueda por DNI" AutoPostBack="True" OnCheckedChanged="rbDNI_CheckedChanged" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txtDNI" runat="server" AutoPostBack="True" onkeypress="return numeros(event);" MaxLength="8" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ErrorMessage="Ingrese DNI" ValidationGroup="ValidarDNI" ControlToValidate="txtDNI">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="DNI: Ingrese 8 dígitos" ValidationExpression="\d{8}" ControlToValidate="txtDNI" ValidationGroup="ValidarDNI">*</asp:RegularExpressionValidator>
                <asp:Button ID="btnOk" runat="server" Text="OK" ValidationGroup="ValidarDNI" OnClick="btnOk_Click" Enabled="False" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <hr />
        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
            <ContentTemplate>
                <asp:RadioButton ID="rbLugarActv" runat="server" Text="Búsqueda por Lugar y Actividad" AutoPostBack="True" OnCheckedChanged="rbLugarActv_CheckedChanged" />
            </ContentTemplate>
        </asp:UpdatePanel>


        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                <ContentTemplate>

                    <label>Departamento</label>
                    <asp:CheckBox ID="chbTodosDeptlugaractiv" runat="server" Text="Todos" AutoPostBack="True" Enabled="False" OnCheckedChanged="chbTodosDeptlugaractiv_CheckedChanged" />


                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="dlDepAct" runat="server" CssClass="form-control"
                        DataTextField="departamento" DataValueField="cod_dep"
                        OnSelectedIndexChanged="dlDepAct_SelectedIndexChanged" AutoPostBack="True" Enabled="False">
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                <ContentTemplate>
                    <label>Provincia</label>
                    <asp:CheckBox ID="chbTodosProvlugaractiv" runat="server" Text="Todos" AutoPostBack="True" Enabled="False" OnCheckedChanged="chbTodosProvlugaractiv_CheckedChanged" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="dlProvAct" runat="server" CssClass="form-control"
                        DataTextField="provincia" DataValueField="cod_prov"
                        OnSelectedIndexChanged="dlProvAct_SelectedIndexChanged" AutoPostBack="True" Enabled="False">
                    </asp:DropDownList>
                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="dlDepAct" EventName="SelectedIndexChanged" />
                </Triggers>


            </asp:UpdatePanel>

        </div>
        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                <ContentTemplate>
                    <label>Distrito</label>
                    <asp:CheckBox ID="chbTodosDistlugaractiv" runat="server" Text="Todos" AutoPostBack="True" Enabled="False" OnCheckedChanged="chbTodosDistlugaractiv_CheckedChanged" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="dlDistAct" runat="server" CssClass="form-control"
                    DataTextField="distrito" DataValueField="cod_dist"
                    OnSelectedIndexChanged="dlDistAct_SelectedIndexChanged" AutoPostBack="True" Enabled="False">
                </asp:DropDownList>
            </ContentTemplate>


            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dlProvAct" EventName="SelectedIndexChanged" />
            </Triggers>


        </asp:UpdatePanel>

        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txtLugarActv" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dlDistAct" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>


        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnIr" runat="server" Text="Ir" ValidationGroup="ValidarActividad" OnClick="btnIr_Click" Enabled="False" />
            </ContentTemplate>
        </asp:UpdatePanel>


        <asp:UpdatePanel ID="UpdatePanel12" runat="server">
            <ContentTemplate>
                <asp:RadioButton ID="rbActiv" runat="server" Text="Búsqueda por Actividad" AutoPostBack="True" OnCheckedChanged="rbActiv_CheckedChanged" Visible="False" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <hr />
        <asp:UpdatePanel ID="UpdatePanel23" runat="server">
            <ContentTemplate>
                <label>Actividad</label>
                <asp:CheckBox ID="chbTodosActiv" runat="server" Text="Todas" AutoPostBack="True" Enabled="False" OnCheckedChanged="chbTodosActiv_CheckedChanged" />
            </ContentTemplate>
        </asp:UpdatePanel>



        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="dlActividad" runat="server" CssClass="form-control" AutoPostBack="True" DataTextField="nombre" DataValueField="cod_activ" Enabled="False" OnSelectedIndexChanged="dlActividad_SelectedIndexChanged"></asp:DropDownList>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>



        <asp:UpdatePanel ID="UpdatePanel14" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txtActividad" runat="server" Visible="False"></asp:TextBox>
            </ContentTemplate>
        </asp:UpdatePanel>



        <asp:UpdatePanel ID="UpdatePanel24" runat="server">
            <ContentTemplate>
                <label>Organización Atendida</label>

                <asp:CheckBox ID="chbTodasOrg" runat="server" Text="Todas" AutoPostBack="True" Enabled="False" OnCheckedChanged="chbTodasOrg_CheckedChanged" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="form-group">
            <asp:UpdatePanel ID="UpdatePanel25" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="dlOrganizacion" runat="server" CssClass="form-control" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="dlOrganizacion_SelectedIndexChanged" DataTextField="nombre" DataValueField="cod_orgatend"></asp:DropDownList>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>



        <asp:UpdatePanel ID="UpdatePanel26" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txtOrg" runat="server" Visible="False"></asp:TextBox>
            </ContentTemplate>
        </asp:UpdatePanel>



        <asp:ValidationSummary ID="vsValidarDNI" runat="server"
            ShowMessageBox="True" ShowSummary="False" ValidationGroup="ValidarDNI" />
    </div>
    <div class="col-sm-9 col-xs-12">

        <p class="pull-left visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
        </p>

        <asp:TabContainer ID="Talento" runat="server" ActiveTabIndex="0" Height="555px" Style="margin-top: 0px">        
            <asp:TabPanel runat="server" HeaderText="Talentos" ID="tpTalentos">
                <HeaderTemplate>
                    Talentos
               
                </HeaderTemplate>
                <ContentTemplate>


                    <rsweb:ReportViewer ID="rvReporteTalento" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="988px" Height="459px">
                        <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.ReporteTalento.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Talento_search_dni_ubigeo_activ_lugar_activ_orgTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>


                </ContentTemplate>
            </asp:TabPanel>



            <asp:TabPanel ID="tpExp" runat="server" HeaderText="Experiencias">

                <HeaderTemplate>
                    Experiencias
               
                </HeaderTemplate>

                <ContentTemplate>
                    <rsweb:ReportViewer ID="rvReportExp" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="990px" Height="477px">
                        <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.ReportExp.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>

                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Experiencia_search_activ_lugaractv_dni_ubigeo_orgTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>

                    </asp:ObjectDataSource>

                </ContentTemplate>



            </asp:TabPanel>







            <asp:TabPanel ID="tdTalentoporActiv" runat="server" HeaderText="Talento por Actividad">
                <ContentTemplate>
                    <rsweb:ReportViewer ID="rvTalentoporActiv" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="988px" Height="478px">
                        <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.TalentoporActiv.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>

                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Experiencia_search_activ_lugaractv_dni_ubigeo_orgTableAdapter">

                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>

                    </asp:ObjectDataSource>

                </ContentTemplate>
            </asp:TabPanel>

            <asp:TabPanel ID="tpTalentoporOrg" runat="server" HeaderText="Talento por Organización">

                <ContentTemplate>
                    <rsweb:ReportViewer ID="rvTalentoporOrg" runat="server" Width="987px" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="483px">
                        <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.TalentoporOrg.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>

                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Experiencia_search_activ_lugaractv_dni_ubigeo_orgTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </ContentTemplate>

            </asp:TabPanel>

            <asp:TabPanel ID="tpActivporOrg" runat="server" HeaderText="Actividades por Organización">
                <ContentTemplate>
                    <rsweb:ReportViewer ID="rvActivporOrg" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="991px" Height="485px">
                        <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.ActivporOrg.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>

                    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Experiencia_search_activ_lugaractv_dni_ubigeo_orgTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </ContentTemplate>
            </asp:TabPanel>



            <asp:TabPanel ID="tpGraficos" runat="server" HeaderText="Gráficos">

                <ContentTemplate>
                    <rsweb:ReportViewer ID="rvGrafico" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="447px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="988px">
                        <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.Graficos.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource7" Name="DataSet1" />
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource8" Name="DataSet2" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>

                    <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Experiencia_search_activ_lugaractv_dni_ubigeo_orgTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                    <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Talento_search_dni_ubigeo_activ_lugar_activ_orgTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </ContentTemplate>

            </asp:TabPanel>



            <asp:TabPanel ID="tpActivAnio" runat="server" HeaderText="Actividades por Año">

                <ContentTemplate>
                    <rsweb:ReportViewer ID="rvActivporAnio" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="990px" Height="483px">
                        <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.ActivporAnio.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource6" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>

                    <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Experiencia_search_activ_lugaractv_dni_ubigeo_orgTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </ContentTemplate>

            </asp:TabPanel>


            <asp:TabPanel ID="tpOrgporAnio" runat="server" HeaderText="Organización por Año">
                <ContentTemplate>
                    <rsweb:ReportViewer ID="rvOrgporAnio" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="988px" Height="477px">
                        <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.OrgporAnio.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource9" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Experiencia_search_activ_lugaractv_dni_ubigeo_orgTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </asp:TabPanel>



            <asp:TabPanel ID="tpDeptporAnio" runat="server" HeaderText="Departamentos por Año">
                <ContentTemplate>
                    <rsweb:ReportViewer ID="rvDeptporAnio" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="988px" Height="477px">
                        <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.DeptporAnio.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource10" Name="DataSet1" />

                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Experiencia_search_activ_lugaractv_dni_ubigeo_orgTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtActividad" DefaultValue="0" Name="activ" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLugarActv" DefaultValue=" " Name="lugar_act" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtUbigeo" DefaultValue=" " Name="ubigeo" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDNI" DefaultValue="0" Name="dni" PropertyName="Text" Type="Decimal" />
                            <asp:ControlParameter ControlID="txtOrg" DefaultValue="0" Name="org" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>


                </ContentTemplate>

            </asp:TabPanel>



        </asp:TabContainer>
    </div>





</asp:Content>
