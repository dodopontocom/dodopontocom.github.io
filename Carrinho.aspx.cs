using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tvieira.Ecommerce;

public partial class Carrinho : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Profile.Carrinho == null)
        {
            Profile.Carrinho = new tvieira.Ecommerce.Carrinho();
        }

        if (Profile.Carrinho.Itens.Count == 0)
        {
            lblTotal.Visible = false;
            imbConfirmarCompra.Visible = false;
            btnAtualizarCarrinho.Visible = false;
        }

        if (!Page.IsPostBack)
        {
            BindGrid();
            AtualizarTotal();
        }
    }

    protected void grvCarrinho_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Profile.Carrinho.Itens.RemoveAt(e.RowIndex);
        BindGrid();
    }

    private void BindGrid()
    {
        grvCarrinho.DataSource = Profile.Carrinho.Itens;
        DataBind();
        lblTotal.Text = String.Format("Total: {0:c}", Profile.Carrinho.Total);
    }

    protected void btnAtualizarCarrinho_Click(object sender, EventArgs e)
    {
        AtualizarTotal();
    }

    protected void AtualizarTotal()
    {
        foreach (GridViewRow row in grvCarrinho.Rows)
        {
            int quantidade = Convert.ToInt32((row.FindControl("txtQuantidade") as TextBox).Text);
            if (quantidade == 0)
            {
                Profile.Carrinho.Itens.RemoveAt(row.RowIndex);
            }
            else
            {
                Profile.Carrinho.Itens[row.RowIndex].Quantidade = quantidade;
            }

            grvCarrinho.EditIndex = -1;
            BindGrid();
        }
    }

}