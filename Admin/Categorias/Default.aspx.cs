using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Categorias_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void frmEditar_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        grdCategorias.DataBind();
    }
    protected void grdCategorias_SelectedIndexChanged(object sender, EventArgs e)
    {
        winEditar.Hide = false;
    }
    protected void frmEditar_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        winEditar.Hide = true;
    }
    protected void frmAdicionar_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        grdCategorias.DataBind();
    }
}