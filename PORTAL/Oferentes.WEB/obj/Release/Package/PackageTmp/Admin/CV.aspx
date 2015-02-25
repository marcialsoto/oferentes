<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CV.aspx.cs" Inherits="Oferentes.WEB.Admin.CV" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Currículum Vitae</h1>

        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

        <asp:TextBox ID="txtDNI" runat="server" Visible="False"></asp:TextBox>

        <rsweb:ReportViewer ID="rvCV" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="480px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="993px">
            <LocalReport ReportEmbeddedResource="Oferentes.WEB.Reportes.CV.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet2" />
                </DataSources>
            </LocalReport>

        </rsweb:ReportViewer>

        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Talento_cv_search_dniTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtDNI" Name="dni" PropertyName="Text" Type="Decimal" />
            </SelectParameters>


        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Oferentes.WEB.dsDirectorioTableAdapters.sp_Experiencia_search_dniTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtDNI" Name="num_dni" PropertyName="Text" Type="Decimal" />
            </SelectParameters>


        </asp:ObjectDataSource>

    </div>
    </form>
</body>
</html>
