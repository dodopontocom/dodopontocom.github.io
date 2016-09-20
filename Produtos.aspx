<%@ Page Title="" Language="C#" MasterPageFile="~/Ecommerce.master" AutoEventWireup="true" CodeFile="Produtos.aspx.cs" Inherits="Produtos" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPrincipal" Runat="Server">
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="dsDetalhesProduto" 
        RepeatColumns="3" RepeatDirection="Horizontal">
        <ItemTemplate>
            <a href="<%# Eval("prod_id","Item.aspx?id={0}") %>" style="text-decoration: none;">
            <div class="produtosPrincipal">
                <span class="principalImagem"><asp:ImageButton ID="ImagemProduto" runat="server" ImageUrl= '<%# Eval("prod_imagemURL", "Imagens\\Thumb65\\{0}") %>' PostBackUrl='<%# Eval("prod_id","Item.aspx?id={0}") %>'/></span>
                <span class="principalNomeProduto"><asp:Label ID="lblTitulo" runat="server" Text='<%# Eval("prod_titulo") %>'></asp:Label></span>
                <span class="principalPreco"><asp:Label ID="lblPreco" runat="server" Text='<%# Eval("prod_preco", "{0:C}") %>'></asp:Label></span>
            </div>
            </a>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:ObjectDataSource ID="dsDetalhesProduto" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="SelecionarProdutoPorIdCategoria" 
        TypeName="tvieira.Ecommerce.Produto">
        <SelectParameters>
            <asp:QueryStringParameter Name="cat_id" QueryStringField="id" Type="Int32" 
                DefaultValue="7" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br /><br />

</asp:Content>

