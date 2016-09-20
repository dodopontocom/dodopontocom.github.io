using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        string username = CreateUserWizard1.UserName;
        FormsAuthentication.SetAuthCookie(username, false);

        string retornar = Request.QueryString["returnUrl"];
        if (String.IsNullOrEmpty(retornar))
            retornar = "~/Default.aspx";
        Response.Redirect(retornar);
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {

    }
}