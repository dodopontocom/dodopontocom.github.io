using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tvieira.Ecommerce;

public partial class Item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdicionarAoCarrinho_Click(object sender, ImageClickEventArgs e)
    {
        string categoriaId = ((Label)dtItem.Controls[0].FindControl("lblCategoriaId")).Text;
        int produtoId = int.Parse(Request.QueryString["id"]);
        double preco = double.Parse(((Label)dtItem.Controls[0].FindControl("lblPreco")).Text);
        string nomeProduto = ((Label)dtItem.Controls[0].FindControl("lblTitulo")).Text;
        string imagemURL = ((Label)dtItem.Controls[0].FindControl("lblImagemInvisivel")).Text;

        if (Profile.Carrinho == null)
        {
            Profile.Carrinho = new tvieira.Ecommerce.Carrinho();
        }
        
        Profile.Carrinho.InserirCarrinho(produtoId, preco, 1, nomeProduto, imagemURL);

        Server.Transfer("Produtos.aspx?id=" + categoriaId);
    }
}