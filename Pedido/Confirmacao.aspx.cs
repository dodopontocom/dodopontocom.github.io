using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Pedido_Confirmacao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblNumeroConfirmacao.Text = Context.Items["cn"].ToString();
    }
}