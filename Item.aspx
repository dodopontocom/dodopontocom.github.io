<%@ Page Title="" Language="C#" MasterPageFile="~/Ecommerce.master" AutoEventWireup="true" CodeFile="Item.aspx.cs" Inherits="Item" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPrincipal" Runat="Server">


    <asp:DataList ID="dtItem" runat="server" DataSourceID="dsItem" 
        RepeatColumns="1" RepeatDirection="Horizontal">
        <ItemTemplate>
            
            <asp:Label ID="lblCategoriaId" runat="server" Text='<%# Eval("cat_id") %>' Visible="false" ></asp:Label>
            <span class="tituloCategoria"><asp:Label ID="lblTitulo" runat="server" Text='<%# Eval("prod_titulo") %>'></asp:Label></span>
            <asp:Image ID="lblImagem" runat="server" ImageUrl='<%# Eval("prod_imagemURL", "Imagens\\Thumb424\\{0}") %>'
                PostBackUrl='<%# Eval("prod_id","Item.aspx?id={0}") %>' ImageAlign="Left" Style="margin-top:30px;"/>

            <span class="descricaoProduto">
            <b>Descrição:</b> <br /><br />
            <asp:Label ID="lblDescricao" runat="server" Text='<%# Eval("prod_descricao") %>'></asp:Label>
            </span>
            
            <span class="descricaoPrecoProduto">Á Vista: <asp:Label ID="lblPrecoVisivel" runat="server" Text='<%# Eval("prod_preco", "{0:C}") %>'></asp:Label></span>
            <asp:Label ID="lblPreco" runat="server" Text='<%# Eval("prod_preco") %>' Visible="False"></asp:Label>
            
            
            <asp:Label ID="lblImagemInvisivel" runat="server" Text='<%# Eval("prod_imagemURL", "Imagens\\Thumb424\\{0}") %>'
                Visible="False"></asp:Label>

        </ItemTemplate>
    </asp:DataList>
    
    <asp:ObjectDataSource ID="dsItem" runat="server" 
        SelectMethod="SelecionarProdutoPorId" TypeName="tvieira.Ecommerce.Produto">
        <SelectParameters>
            <asp:QueryStringParameter Name="prod_id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ImageButton ID="btnAdicionarAoCarrinho" runat="server" 
    ImageUrl="~/Imagens/img_adicionar_carrinho.jpg" 
    onclick="btnAdicionarAoCarrinho_Click" Style="margin-top: 50px; margin-left: 290px;"/><br />

    <br />
    <br />
   <a href="javascript: history.go(-1)">Retornar</a>

</asp:Content>

