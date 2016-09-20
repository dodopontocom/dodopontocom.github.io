<%@ Page Title="" Language="C#" MasterPageFile="~/Ecommerce.master" AutoEventWireup="true" CodeFile="Confirmacao.aspx.cs" Inherits="Pedido_Confirmacao" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPrincipal" Runat="Server">

    Obrigado por Comprar na Ecommerce!
    <br /><br />
    Seu número do pedido é 
    <asp:Label id="lblNumeroConfirmacao" Runat="server" />.

    <br /><br />

    <asp:HyperLink id="lnkContinuar" Text="Continuar na Loja" NavigateUrl="~/Default.aspx" Runat="server" />

</asp:Content>

