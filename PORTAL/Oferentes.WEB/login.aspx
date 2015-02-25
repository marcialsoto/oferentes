<%@ Page Title="" Language="C#" MasterPageFile="~/Oferentes.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Oferentes.WEB.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-4">
            <h3>Bienvenido</h3>
            <hr />
            <p>El Sistema de Oferentes es un software creado para el Proyecto Fortalecimiento del Desarrollo Local en Áreas de Sierra y Selva Alta del Perú.</p>
        </div>
        <div class="col-sm-4">
      <br />
            <p>La finalidad del proyecto Fortalecimiento del Desarrollo Local en Áreas de Sierra y Selva Alta del Perú, es contribuir a la reducción de la pobreza rural en las áreas de intervención. Con este proyecto en particular, se busca poner en práctica el escalonamiento de enfoques y actividades ya probadas con éxito en el país.</p>
        </div>
        <div class="col-sm-4 alert alert-warning">
            <asp:Login ID="Login1" runat="server" CssClass="">
            </asp:Login>
        </div>
    </div>
</asp:Content>
