<%@ Page Title="" Language="C#" MasterPageFile="~/Oferentes.Master" AutoEventWireup="true" CodeBehind="Mantener.aspx.cs" Inherits="Oferentes.WEB.Admin.Mantener" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Mantenimiento</title>

    <link href="../CSS/Estilos.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../Scripts/Bloqueo.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 217px;
        }
        .auto-style2 {
            height: 31px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div>
    
        <h1 align =center>Mantenimiento Talento</h1>

         <table cellpadding=1 cellspacing= 10 align=center border=0>
            <tr>
                <td colspan="8">

                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

                    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager> --%>
                <td>
             </tr>
             <tr>
                 <td colspan="2" class="auto-style2">
                    <h3>Datos Personales:</h3>
                 </td>
                 <td colspan="2" class="auto-style2">
                     <asp:UpdatePanel ID="UpdatePanel34" runat="server">
                         <ContentTemplate>
                             <asp:DropDownList ID="ddlDNI" runat="server" Height="28px" Width="270px" AutoPostBack="True" DataTextField="ident" DataValueField="num_dni" OnSelectedIndexChanged="ddlDNI_SelectedIndexChanged">
                                 <asp:ListItem></asp:ListItem>
                             </asp:DropDownList>
                         </ContentTemplate>
                     </asp:UpdatePanel>
                     
                </td>
             </tr>
            <tr>
                <td  colspan="8">
                    <hr />
                </td>
            </tr>
            <tr>

                <td  width ="180px" >DNI:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtDNI" runat="server"  Width = 100px BorderStyle="Solid" MaxLength="8"  onkeypress="return numeros(event);" Enabled="False" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ErrorMessage="Ingrese DNI" ValidationGroup="ValidarDNI" ControlToValidate="txtDNI">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="DNI: Ingrese 8 dígitos" ValidationExpression="\d{8}" ControlToValidate="txtDNI" ValidationGroup="ValidarDNI">*</asp:RegularExpressionValidator>
                            <asp:Button ID="btnBuscar" runat="server" Text="OK" OnClick="btnBuscar_Click" ValidationGroup="ValidarDNI" Visible="False" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                                                            
                </td>

                <td  width ="40px" >

                    
                    Nombres:</td>
                <td class="auto-style1"  width ="180px"  >
                    <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtNomb" runat="server" Width = 177px BorderStyle="Solid"  onkeypress="return texto(event);"  ></asp:TextBox> 
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNomb" ErrorMessage="Ingrese Nombre" ValidationGroup="ValidarTalento">*</asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                   
                </td>
                <td width ="100px">Apellidos:</td>
                <td width ="220px">
                    <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtApell" runat="server" Width = 166px BorderStyle="Solid"  onkeypress="return texto(event);" Height="16px"  ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtApell" ErrorMessage="Ingrese Apellidos" ValidationGroup="ValidarTalento">*</asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
               
                <td width ="30px">Fecha de Nacimiento:</td>
                <td >
                    <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                        <ContentTemplate>

                            <asp:TextBox ID="txtFechanac" runat="server"  Width = 100px BorderStyle="Solid"></asp:TextBox>

                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFechanac" Format="dd/MM/yyyy"></asp:CalendarExtender>

                            <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ErrorMessage="Ingrese Fecha" ValidationGroup="ValidarTalento" ControlToValidate="txtFechanac">*</asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                                                                               
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    
                    Lugar de Nacimiento:
                </td>
           
                <td>Departamento:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel28" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlDep" runat="server" Width = 177px 
                                DataTextField="departamento" DataValueField="cod_dep" 
                                onselectedindexchanged="dlDep_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

                <td>Provincia:</td>
                <td>
                    <asp:UpdatePanel ID="upProvincia" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlProv" runat="server"  Width = 177px 
                                DataTextField="provincia" DataValueField="cod_prov" 
                                onselectedindexchanged="dlProv_SelectedIndexChanged" AutoPostBack="True" >
                            </asp:DropDownList>
                        </ContentTemplate>
                        
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlDep" EventName="SelectedIndexChanged" />
                        </Triggers>


                    </asp:UpdatePanel>
                </td>

                <td>Distrito:</td>
                <td>
                    <asp:UpdatePanel ID="upDistrito" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlDist" runat="server" Width=177px 
                                DataTextField="distrito" DataValueField="cod_dist" 
                                onselectedindexchanged="dlDist_SelectedIndexChanged">
                            </asp:DropDownList>
                        </ContentTemplate>


                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlProv" EventName="SelectedIndexChanged" />
                        </Triggers>


                    </asp:UpdatePanel>
                    
                </td>
                
           </tr>
           <tr>
                <td>Sexo:</td>
                <td class="auto-style1">
                    <%--<asp:TextBox ID="txtSexo" runat="server" BorderStyle="Solid"></asp:TextBox>--%>

                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            
                            <asp:RadioButton ID="rbtnMale" runat="server" Text="Masculino" AutoPostBack="True" Checked="True" OnCheckedChanged="rbtnMale_CheckedChanged" />

                            <asp:RadioButton ID="rbtnFemale" runat="server" Text="Femenino" AutoPostBack="True" OnCheckedChanged="rbtnFemale_CheckedChanged" />
                            
                        </ContentTemplate>

                    </asp:UpdatePanel>

                    
                </td>

                <td>Estado Civil:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlEstCivil" runat="server"  Width=177px 
                                DataTextField="nombre" DataValueField="cod_estcivil" >
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
           
               <td>Residencia:</td>
               <td>
                   <asp:UpdatePanel ID="UpdatePanel29" runat="server">
                       <ContentTemplate>
                           <asp:DropDownList ID="dlResid" runat="server"   Width=177px 
                               DataTextField="nombre" DataValueField="cod_resid" >
                           </asp:DropDownList>
                       </ContentTemplate>
                   </asp:UpdatePanel>
                   
               </td>

               <td>Dirección:</td>
               <td colspan="2" width ="225px">
                   <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtDir" runat="server" Width=205px BorderStyle="Solid" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDir" ErrorMessage="Ingrese Dirección" ValidationGroup="ValidarTalento">*</asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                   
               </td>

           </tr>
           <tr>
                <td colspan="2">
                   
                    Lugar de Residencia:
                </td>
           
                <td>Departamento:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel27" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlDepRes" runat="server" Width = 177px 
                                DataTextField="departamento" DataValueField="cod_dep" 
                                onselectedindexchanged="dlDepRes_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

                <td>Provincia:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlProvRes" runat="server"  Width = 177px 
                                DataTextField="provincia" DataValueField="cod_prov" 
                                onselectedindexchanged="dlProvRes_SelectedIndexChanged" AutoPostBack="True" >
                            </asp:DropDownList>
                        </ContentTemplate>
                        
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlDepRes" EventName="SelectedIndexChanged" />
                        </Triggers>


                    </asp:UpdatePanel>
                </td>

                <td>Distrito:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlDistRes" runat="server" Width=177px 
                                DataTextField="distrito" DataValueField="cod_dist" 
                                onselectedindexchanged="dlDistRes_SelectedIndexChanged">
                            </asp:DropDownList>
                        </ContentTemplate>


                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlProvRes" EventName="SelectedIndexChanged" />
                        </Triggers>


                    </asp:UpdatePanel>
                    
                </td>
                
           </tr>

           <tr>
                <td>Teléfono Fijo:</td>
                <td class="auto-style1">
                    <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtFijo" runat="server" BorderStyle="Solid"  onkeypress="return numeros(event);"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFijo" runat="server" ErrorMessage="Ingrese Teléfono Fijo" ValidationGroup="ValidarTalento" ControlToValidate="txtFijo">*</asp:RequiredFieldValidator>
                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

                <td>Teléfono Celular:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtCell" runat="server" BorderStyle="Solid"  onkeypress="return numeros(event);"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCell" runat="server" ErrorMessage="Ingrese Teléfono celular" ValidationGroup="ValidarTalento" ControlToValidate="txtCell">*</asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

                <td>Correo:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel24" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtCorreo" runat="server" BorderStyle="Solid"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ErrorMessage="Ingrese Correo" ControlToValidate="txtCorreo" ValidationGroup="ValidarTalento">*</asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de correo no válido" ControlToValidate="txtCorreo" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ValidationGroup="ValidarTalento">*</asp:RegularExpressionValidator>                
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
               <td></td>
              

           </tr>

           <tr>
                <td colspan="2">
                    <h3>Nivel Educacional:</h3>
                </td>

                <td>Nivel:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel26" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlNivel" runat="server"  Width = 177px 
                                DataTextField="nivel" DataValueField="cod_estudio" 
                                onselectedindexchanged="dlNivel_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

               <td rowspan="2">
                   <asp:UpdatePanel ID="UpdatePanel39" runat="server">
                       <ContentTemplate>
                           <asp:RadioButton ID="rbLectura" runat="server" Text="Lectura" AutoPostBack="True" Checked="True" OnCheckedChanged="rbLectura_CheckedChanged" />
                           <br />
                           <asp:RadioButton ID="rbEscritura" runat="server" Text="Escritura" AutoPostBack="True" OnCheckedChanged="rbEscritura_CheckedChanged" />
                           <br />
                           <asp:RadioButton ID="rbAmbos" runat="server" Text="Ambos" AutoPostBack="True" OnCheckedChanged="rbAmbos_CheckedChanged" />
                       </ContentTemplate>
                   </asp:UpdatePanel>
                   
               </td>
                
               <td></td>
                <td>Idioma:</td>
              <td>
                  <asp:UpdatePanel ID="UpdatePanel40" runat="server">
                      <ContentTemplate>
                          <asp:DropDownList ID="dlIdioma" runat="server"  Width="170px" DataTextField="nombre" DataValueField="cod_Idioma"></asp:DropDownList>
                      </ContentTemplate>
                  </asp:UpdatePanel>
              </td>

               

                
              
             </tr>

             <tr>
                <td></td>
                <td></td>
                 <td>Grado:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlGrado" runat="server" Width = 177px 
                                DataTextField="grado" DataValueField="cod_estudio" 
                                onselectedindexchanged="dlGrado_SelectedIndexChanged" AutoPostBack="True" Enabled="False">
                            </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlNivel" 
                                EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    
                    
                </td>
                <td></td>
                 <td></td>
                  <td  align="center">
                    <asp:UpdatePanel ID="UpdatePanel32" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar Talento" ValidationGroup="ValidarTalento" OnClick="btnEliminar_Click"  />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

                
            </tr>
             <tr>
                 <td colspan="2"></td>
                 <td><h3>Estado:</h3></td>
                 <td>
                     <asp:UpdatePanel ID="UpdatePanel35" runat="server">
                         <ContentTemplate>
                             <asp:Label ID="lbEstado" runat="server" Text=""></asp:Label>
                         </ContentTemplate>
                     </asp:UpdatePanel>
                     
                 </td>

                 <td>
                     <asp:UpdatePanel ID="UpdatePanel36" runat="server">
                         <ContentTemplate>
                             <asp:Button ID="btnHabilitar" runat="server" Text="Habilitar" Enabled="False" OnClick="btnHabilitar_Click" />
                         </ContentTemplate>
                     </asp:UpdatePanel>
                     
                 </td>

                 <td></td>
                 <td></td>
                  <td align="center">
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Talento" ValidationGroup="ValidarTalento" OnClick="btnActualizar_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

             </tr>

             <tr>
                 <td colspan="8">
                    <h3>Experiencia Laboral:</h3>
                     <hr />
                </td>
            </tr>
            <tr>
               

                <td>Actividad:</td>
                 <td>
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlActiv" runat="server" Height="16px" Width="180px" DataTextField="nombre" DataValueField="cod_activ"></asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel37" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="chbOtraActiv" runat="server" Text="Otra Actividad" AutoPostBack="True" OnCheckedChanged="chbOtraActiv_CheckedChanged" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel38" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtActiv" runat="server" Width="150px" BorderStyle="Solid" Enabled="False"></asp:TextBox>
                            <% if (chbOtraActiv.Checked) {%>
                                <asp:RequiredFieldValidator ID="rfvActv" runat="server" ControlToValidate="txtActiv" ErrorMessage="Ingrese Actividad" ValidationGroup="ValidarExp">*</asp:RequiredFieldValidator>
                            <% } %>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

                <td>Rango:</td>
                <td>
                    <%--<asp:UpdatePanel ID="UpdatePanel10" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtDuracion" runat="server" BorderStyle="Solid"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDuracion" runat="server" ControlToValidate="txtDuracion" ErrorMessage="Ingrese Duración" ValidationGroup="ValidarExp">*</asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>--%>

                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                        <ContentTemplate>
                             <asp:DropDownList ID="dlRango" runat="server" Height="17px" Width="149px" AutoPostBack="True">
                                <asp:ListItem Selected="True" Value="3 - 5">3 - 5 años</asp:ListItem>
                                <asp:ListItem Value="5 - 8">5 - 8 años</asp:ListItem>
                                <asp:ListItem Value="8">más de 8</asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                   
                </td>

               <td>Certificado:</td>
               <td>
                   <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                       <ContentTemplate>
                           <asp:RadioButton ID="rbCertNo" runat="server" Text="No" AutoPostBack="True" Checked="True" OnCheckedChanged="rbCertNo_CheckedChanged" />  
                       </ContentTemplate>
                   </asp:UpdatePanel>                                    

                   <asp:UpdatePanel ID="UpdatePanel41" runat="server">
                       <ContentTemplate>
                           <asp:RadioButton ID="rbCertSi" runat="server" Text="Si" AutoPostBack="True" OnCheckedChanged="rbCertSi_CheckedChanged" />
                           <asp:TextBox ID="txtCertif" runat="server" BorderStyle="Solid" Enabled="False">No cuenta con uno</asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfvCertf" runat="server" ControlToValidate="txtCertif" ErrorMessage="Ingrese si cuenta con Certificado" ValidationGroup="ValidarExp">*</asp:RequiredFieldValidator>
                       </ContentTemplate>
                   </asp:UpdatePanel>
                   
               </td>
            </tr>
            
             <tr>
                <td colspan="2">Lugar donde realizó actividad:</td>           
                
            </tr>
            
            <tr>
                <td>Departamento:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlDepAct" runat="server" Width = 177px 
                                DataTextField="departamento" DataValueField="cod_dep" 
                                onselectedindexchanged="dlDepAct_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

                <td>Provincia:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlProvAct" runat="server"  Width = 177px 
                                DataTextField="provincia" DataValueField="cod_prov" 
                                onselectedindexchanged="dlProvAct_SelectedIndexChanged" AutoPostBack="True" >
                            </asp:DropDownList>
                        </ContentTemplate>
                        
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlDepAct" EventName="SelectedIndexChanged" />
                        </Triggers>


                    </asp:UpdatePanel>
                </td>

                <td>Distrito:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlDistAct" runat="server" Width=177px 
                                DataTextField="distrito" DataValueField="cod_dist" 
                                onselectedindexchanged="dlDistAct_SelectedIndexChanged">
                            </asp:DropDownList>
                        </ContentTemplate>


                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlProvAct" EventName="SelectedIndexChanged" />
                        </Triggers>                        

                    </asp:UpdatePanel>
                    
                    
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel42" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="chbTodosDist" runat="server" Text="Todos los Distritos" AutoPostBack="True" OnCheckedChanged="chbTodosDist_CheckedChanged" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
            </tr>

            <tr>

                <td>Organización Atendida</td>
                <td class="auto-style1">
                    <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="dlOrg" runat="server" Height="20px" Width="170px" DataTextField="nombre" DataValueField="cod_orgatend"></asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

               <td>
                    <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="chbOtraOrg" runat="server" Text="Otra Organización" AutoPostBack="True" OnCheckedChanged="chbOtraOrg_CheckedChanged"  />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtOrg" runat="server" BorderStyle="Solid" Height="16px" Width="152px" Enabled="False"></asp:TextBox>                                                   
                            <% if (chbOtraOrg.Checked) {%>
                                <asp:RequiredFieldValidator ID="rfvOrg" runat="server" ControlToValidate="txtOrg" ErrorMessage="Ingrese organización atendida" ValidationGroup="ValidarExp">*</asp:RequiredFieldValidator>
                            <% } %>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

            </tr>

            <tr>
                 <td>Persona de contacto:</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel43" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtRefer" runat="server" BorderStyle="Solid" Width="168px"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="rfvRefer" runat="server" ErrorMessage="Ingrese Referente" ControlToValidate="txtRefer" ValidationGroup="ValidarExp">*</asp:RequiredFieldValidator>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    

                    
                    
                   
                </td>

                <td>Reconocimientos:</td>
                <td colspan="3">
                    <asp:UpdatePanel ID="UpdatePanel44" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtRecon" runat="server" TextMode="MultiLine" Width="463px" BorderStyle="Solid"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRecon" ErrorMessage="Ingrese sus reconocimientos" ValidationGroup="Validar">*</asp:RequiredFieldValidator>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
            </tr>

            <tr align="center">
                <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel25" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

                 

                 <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnActualExp" runat="server" Text="Actualizar Experiencia"  ValidationGroup="ValidarExp" OnClick="btnActualExp_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

                <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel30" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnInsertarExp" runat="server" Text="Insertar Experiencia"  ValidationGroup="ValidarExp" OnClick="btnInsertarExp_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
                
               <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel33" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnEliminarExp" runat="server" Text="Eliminar Experiencia"  ValidationGroup="ValidarExp" OnClick="btnEliminarExp_Click"  />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>

            </tr>


             <tr>
                 <td colspan ="8" align="center">
                     <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                         <ContentTemplate>
                            <asp:GridView ID="gdvExp" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDeleting="gdvExp_RowDeleting" AutoGenerateColumns="False" AllowSorting="True" >
                                <Columns>
                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" DeleteText="Editar" />
                                    <asp:BoundField DataField="num" HeaderText="Número" Visible="False" />
                                    <asp:BoundField DataField="dni" HeaderText="DNI" Visible="False" />
                                    <asp:BoundField DataField="cod_act" HeaderText="cod_act" Visible="False" />
                                    <asp:BoundField DataField="actividad" HeaderText="Actividad" />
                                    <asp:BoundField DataField="duracion" HeaderText="Duración" />
                                    <asp:BoundField DataField="certificado" HeaderText="Certificado" />
                                    <asp:BoundField DataField="cod_lugar_activ" HeaderText="Ubigeo Lugar" />
                                    <asp:BoundField DataField="lugar_activ" HeaderText="Lugar" />
                                    <asp:BoundField DataField="cod_org" HeaderText="cod Org" Visible="False" />
                                    <asp:BoundField DataField="organizacion" HeaderText="Organización Atendida" />
                                    <asp:BoundField DataField="referente" HeaderText="Referente" />
                                    <asp:BoundField DataField="reconocimientos" HeaderText="Reconocimientos" />
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#000066" HorizontalAlign="Left" BackColor="White" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                         </ContentTemplate>
                     </asp:UpdatePanel>
                 </td>
             </tr>
    </table>

        <asp:ValidationSummary ID="vsValidarTalento" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="ValidarTalento" />

        <asp:ValidationSummary ID="vsValidarDNI" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="ValidarDNI" />

        <asp:ValidationSummary ID="vsValidarExperiencia" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="ValidarExp" />

    </div>
</asp:Content>
