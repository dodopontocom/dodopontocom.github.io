<%@ Page Title="" Language="C#" MasterPageFile="~/Ecommerce.master" AutoEventWireup="true" CodeFile="Carrinho.aspx.cs" Inherits="Carrinho" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPrincipal" Runat="Server">

    <br />
    <asp:GridView ID="grvCarrinho" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" 
        GridLines="None" onrowdeleting="grvCarrinho_RowDeleting" Width="700px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Imagem" runat="server" 
                        ImageUrl='<%# Eval("ProdutoImagemURL") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProdutoNome" HeaderText="Produto" />
            <asp:TemplateField HeaderText="Qtd.">
                <ItemTemplate>
                    <asp:TextBox ID="txtQuantidade" runat="server" Width="30px" Text='<%# Bind("Quantidade") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Preco" DataFormatString="{0:c}" HeaderText="Preço" 
                HtmlEncode="False" />
            <asp:BoundField DataField="TotalDaLinha" DataFormatString="{0:c}" 
                HeaderText="Total" HtmlEncode="False" />
            <asp:CommandField CancelText="Cancelar" DeleteText="Deletar" EditText="Editar" 
                InsertText="Inserir" NewText="Novo" SelectText="Selecionar" 
                ShowDeleteButton="True" UpdateText="Atualizar" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataTemplate>
            Ainda não tem nenhum produto em seu carrinho.
        </EmptyDataTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    
    <br />
    <asp:Label ID="lblTotal" runat="server" Font-Bold="True"></asp:Label>
    <br /><br />
    <asp:Button ID="btnAtualizarCarrinho" runat="server" 
        Text="Atualizar Carrinho" onclick="btnAtualizarCarrinho_Click" />
    
    <br /><br />

    <div align=right style="margin-bottom: 10px;">
    <asp:ImageButton ID="imbConfirmarCompra" runat="server" 
        ImageUrl="~/Imagens/confirmarcompra.jpg" PostBackUrl="~/Pedido/Default.aspx" />
    </div>
    
    

</asp:Content>

