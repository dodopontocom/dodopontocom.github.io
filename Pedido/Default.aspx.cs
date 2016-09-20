using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tvieira;
using System.Globalization;
using tvieira.Ecommerce;

public partial class Pedido_Default : System.Web.UI.Page
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
        }

        if (!Page.IsPostBack)
        {
            txtCartNome.Focus();

            dropCartTipo.DataSource = Enum.GetNames(typeof(TipoCartaoCredito));
            dropCartTipo.DataBind();

            DateTimeFormatInfo datas = CultureInfo.CurrentCulture.DateTimeFormat;
            for (int i = 1; i < 13; i++)
            {
                ListItem mes = new ListItem(datas.GetMonthName(i), i.ToString());
                dropCartExpMes.Items.Add(mes);
            }

            int anoInicial = DateTime.Now.Year;
            for (int i = anoInicial; i < anoInicial + 10; i++)
            {
                ListItem ano = new ListItem(i.ToString(), i.ToString());
                dropCartExpAno.Items.Add(ano);
            }

            BindGrid();
            BindProfile();
        }
    }

    private void BindGrid()
    {
        grvCarrinho.DataSource = Profile.Carrinho.Itens;
        DataBind();
        lblTotal.Text = String.Format("Total: {0:c}", Profile.Carrinho.Total);
    }

    private void BindProfile()
    {
        txtCartNome.Text = Profile.NomeMembro;
        txtEndereco.Text = Profile.Endereco;
        txtCidade.Text = Profile.Cidade;
        txtEstado.Text = Profile.Estado;
        txtCep.Text = Profile.Cep;
        txtEmail.Text = Profile.Email;
        txtPais.Text = Profile.Pais;
    }
    protected void chkCopiar_CheckedChanged(object sender, EventArgs e)
    {
        txtEntEndereco.Text = txtEndereco.Text;
        txtEntCidade.Text = txtCidade.Text;
        txtEntEstado.Text = txtEstado.Text;
        txtEntCep.Text = txtCep.Text;
        txtEntPais.Text = txtPais.Text;
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        SalvarProfile();
        SalvarPedido();
    }

    private void SalvarProfile()
    {
        Profile.Nome = txtCartNome.Text;
        Profile.Endereco = txtEndereco.Text;
        Profile.Cidade = txtCidade.Text;
        Profile.Estado = txtEstado.Text;
        Profile.Cep = txtCep.Text;
        Profile.Email = txtEmail.Text;
        Profile.Pais = txtPais.Text;
    }

    private void SalvarPedido()
    {
        if (Page.IsValid)
        {
            Pedido novoPedido = new Pedido();

            // Cartão de Crédito
            novoPedido.Ped_nomeusuario = User.Identity.Name;
            novoPedido.Ped_cart_nome = txtCartNome.Text;
            novoPedido.Ped_cart_numero = txtCartNumero.Text;
            novoPedido.Ped_cart_tipo = (TipoCartaoCredito)Enum.Parse(typeof(TipoCartaoCredito), dropCartTipo.SelectedValue);
            novoPedido.Ped_cart_exp_mes = Int32.Parse(dropCartExpMes.SelectedValue);
            novoPedido.Ped_cart_exp_ano = Int32.Parse(dropCartExpAno.SelectedValue);

            // Endereço de Faturamento
            novoPedido.Ped_endereco = txtEndereco.Text;
            novoPedido.Ped_cidade = txtCidade.Text;
            novoPedido.Ped_estado = txtEstado.Text;
            novoPedido.Ped_cep = txtCep.Text;
            novoPedido.Ped_pais = txtPais.Text;
            novoPedido.Ped_email = txtEmail.Text;

            // Shipping address
            novoPedido.Ped_ent_endereco = txtEntEndereco.Text;
            novoPedido.Ped_ent_cidade = txtEntCidade.Text;
            novoPedido.Ped_ent_estado = txtEntEstado.Text;
            novoPedido.Ped_ent_cep = txtEntCep.Text;
            novoPedido.Ped_ent_pais = txtEntPais.Text;

            // Enviar o Pedido
            int confirmaNumero = novoPedido.CadastrarPedido();

            SalvarItemPedido(confirmaNumero);


            Context.Items.Add("cn", confirmaNumero);

            // Redirecionar para a página de confirmação
            Server.Transfer("Confirmacao.aspx");
        }
    }

    private void SalvarItemPedido(int id)
    {
        foreach (ItemCarrinho item in Profile.Carrinho.Itens)
        {
            int produtoId = item.ProdutoId;
            double preco = item.Preco;
            int quantidade = item.Quantidade;
            Pedido.CadastrarItensPedido(id, produtoId, preco, quantidade);
        }
        Profile.Carrinho.Itens.Clear();
    }
}