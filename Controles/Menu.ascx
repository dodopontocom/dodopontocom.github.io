<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Controles_Menu" %>

<%@ OutputCache Duration="99999" Shared="true" VaryByParam="cat_id" SqlDependency="Ecommerce:Categorias" %>

<asp:Repeater ID="rpCategoria" runat="server" DataSourceID="CategoriaDS">

    <ItemTemplate>
        
        <ul>
            <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("cat_id", @"~/Produtos.aspx?id={0}") %>'
                    Text='<%# Eval("cat_titulo") %>' /></li>
        </ul>

    </ItemTemplate>

</asp:Repeater>

<asp:ObjectDataSource ID="CategoriaDS" runat="server" SelectMethod="SelecionarTodasCategoria" TypeName="tvieira.Ecommerce.Categoria"></asp:ObjectDataSource>

