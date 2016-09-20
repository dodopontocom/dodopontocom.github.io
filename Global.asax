<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Código que é executado na inicialização do aplicativo
        MembershipCreateStatus status = new MembershipCreateStatus();
        if (!Roles.RoleExists("Admin"))
            Roles.CreateRole("Admin");
        if (Membership.GetUser("admin") == null)
            Membership.CreateUser("admin", "vieira", "", "nenhuma", "nenhuma", true, out status);
        if (!Roles.IsUserInRole("admin", "Admin"))
            Roles.AddUserToRole("admin", "Admin");

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Código que é executado no encerramento do aplicativo

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Código que é executado quando um erro sem tratamento ocorre

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Código que é executado quando uma nova sessão é iniciada

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Código que é executado quando uma sessão é encerrada. 
        // Observação: O evento Session_End é gerado apenas quando o modo sessionstate
        // é definido como InProc no arquivo Web.config. Se o modo de sessão é definido como StateServer 
        // ou SQLServer, o evento não é gerado.

    }

    void Profile_OnCreateAnonymous(object sender, ProfileMigrateEventArgs e)
    {
        ProfileCommon anonProfile = Profile.GetProfile(e.AnonymousID);

        if (anonProfile.Carrinho != null)
        {
            if (Profile.Carrinho == null)
            {
                Profile.Carrinho = new tvieira.Ecommerce.Carrinho();
                Profile.Carrinho.Itens.AddRange(anonProfile.Carrinho.Itens);
                anonProfile.Carrinho = null;
            }

            ProfileManager.DeleteProfile(e.AnonymousID);
            AnonymousIdentificationModule.ClearAnonymousIdentifier();
        }
    }
       
</script>
