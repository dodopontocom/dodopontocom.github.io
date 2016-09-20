<%@ Page Title="" Language="C#" MasterPageFile="~/Ecommerce.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentEsquerda" Runat="Server">

    <div class="Menu">
        <userControl:Menu ID="Menu1" runat="server" />
    </div>    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPrincipal" Runat="Server">

    
    <asp:ObjectDataSource ID="dsAleatorio" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="SelecionarProdutoAleatorio" 
        TypeName="tvieira.Ecommerce.Produto">
    </asp:ObjectDataSource>
    <asp:DataList ID="dtListaAleatoria" runat="server" RepeatColumns="3" 
        RepeatDirection="Horizontal" DataSourceID="dsAleatorio">
        <ItemTemplate>
           <a href="<%# Eval("prod_id","Item.aspx?id={0}") %>" style="text-decoration: none;">
           <div class="produtosPrincipal">
                <span class="principalImagem"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl= '<%# Eval("prod_imagemURL", "Imagens\\Thumb65\\{0}") %>' /></span>
                 
                <span class="principalNomeProduto"><asp:Label ID="lblTitulo" runat="server" Text='<%# Eval("prod_titulo") %>'></asp:Label></span>
                 
                <span class="principalPreco"><asp:Label ID="lblPreco" runat="server" Text='<%# Eval("prod_preco", "{0:C}") %>'></asp:Label></span>
             </div>
             </a>
        </ItemTemplate>
    </asp:DataList>
    

</asp:Content>

