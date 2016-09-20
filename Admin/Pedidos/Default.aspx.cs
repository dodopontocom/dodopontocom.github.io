using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Pedidos_Default : System.Web.UI.Page
{

    private decimal total = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grvItensPedido_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            decimal preco = (decimal)DataBinder.Eval(e.Row.DataItem, "preco");
            int quantidade = (int)DataBinder.Eval(e.Row.DataItem, "quantidade");
            total += (preco * quantidade);
        }
    }

    protected void grvItensPedido_DataBound(object sender, EventArgs e)
    {
        GridView grvItensPedido = (GridView)sender;
        Label lblTotal = (Label)grvItensPedido.FooterRow.FindControl("lblTotal");
        lblTotal.Text = total.ToString("c");
    }

    protected void grvTodosPedidos_SelectedIndexChanged(object sender, EventArgs e)
    {
        winDetalhes.Hide = false;
    }

    protected void winDetalhes_Closed(object sender, EventArgs e)
    {
        winDetalhes.Hide = true;
    }
}