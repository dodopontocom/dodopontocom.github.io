<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Produtos_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: xx-small;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 248px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="padding: 15px;">
    
        Esta página gerencia todos os produtos, onde você pode inserir, atualizar e deletá-los.
    
        <br />
        <br />
        <asp:GridView ID="grdProdutos" runat="server" AutoGenerateColumns="False" 
            DataSourceID="dsProdutos" CellPadding="4" DataKeyNames="Prod_id" 
            ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="grdProdutos_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Prod_id" HeaderText="ID" 
                    SortExpression="Prod_id" />
                <asp:BoundField DataField="Prod_titulo" HeaderText="Nome do Produto" 
                    SortExpression="Prod_titulo" />
                <asp:BoundField DataField="TituloCategoria" HeaderText="Categoria" 
                    SortExpression="TituloCategoria" />
                <asp:BoundField DataField="Prod_preco" HeaderText="Preço" 
                    HtmlEncode="false" DataFormatString="{0:c}" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEditar" runat="server" CommandName="Select">Editar</asp:LinkButton>
                        &nbsp; /&nbsp;
                        <asp:LinkButton ID="lnkDeletar" runat="server" CommandName="Delete" 
                            onclientclick="return confirm('Tem certeza que deseja deletar este produto?')">Deletar</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
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
        <asp:ObjectDataSource ID="dsProdutos" runat="server" 
            SelectMethod="SelecionarTodosProdutos" 
            TypeName="tvieira.Ecommerce.Produto" DeleteMethod="DeletarProduto" 
            UpdateMethod="AtualizarProduto" InsertMethod="InserirProduto">
            <DeleteParameters>
                <asp:Parameter Name="prod_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="cat_id" Type="Int32" />
                <asp:Parameter Name="prod_titulo" Type="String" />
                <asp:Parameter Name="prod_descricao" Type="String" />
                <asp:Parameter Name="prod_preco" Type="Decimal" />
                <asp:Parameter Name="prod_imagemURL" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="prod_id" Type="Int32" />
                <asp:Parameter Name="cat_id" Type="Int32" />
                <asp:Parameter Name="prod_titulo" Type="String" />
                <asp:Parameter Name="prod_preco" Type="Decimal" />
                <asp:Parameter Name="prod_descricao" Type="String" />
                <asp:Parameter Name="prod_imagemURL" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    
        <br />
    
        <custom:OpenWebWindow ID="lnkAdicionar" runat="server" Text="Adicionar Produto" WebWindowID="winAdicionar" />
        
        <br />
        
        <custom:WebWindow ID="winEditar" Hide="true" WindowTitleText="Editar Produto" runat="server" Width="450px">
        
            <asp:FormView ID="frmEditar" runat="server" DataSourceID="dsAtualizarProduto" 
            DefaultMode="Edit" onitemcommand="frmEditar_ItemCommand" 
            onitemupdated="frmEditar_ItemUpdated">
            <EditItemTemplate>
                <strong>Nome:<br style="font-size: xx-small" /> </strong><span class="style1">
                Entre com o nome do produto.</span><br />
                <asp:TextBox ID="txtTitulo" runat="server" Text='<%# Bind("Prod_titulo") %>' 
                    Width="400px" />
                <br />
                <br />
                <table class="style2">
                    <tr>
                        <td class="style3">
                            <strong>Categoria:</strong><br /> <span class="style1">Selecionar a categoria do 
                            produto.</span><br />
                            <asp:DropDownList ID="ddlCategoria" runat="server" 
                                DataSourceID="sqlDsCategoria" DataTextField="cat_titulo" 
                                DataValueField="cat_id" SelectedValue='<%# Bind("cat_id") %>' AppendDataBoundItems="True">
                                <asp:ListItem Selected="True">Escolha uma Categoria</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlDsCategoria" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:EcommerceString %>" 
                                SelectCommand="SELECT [cat_id],[cat_titulo] FROM [Categorias] ORDER BY [cat_titulo]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <strong>Preço:</strong><br /> <span class="style1">Entre com o preço do produto.</span><br />
                            <asp:TextBox ID="txtPreco" runat="server" Text='<%# Bind("Prod_preco") %>' 
                                Width="80px" />
                        </td>
                    </tr>
                </table>
                <br />
                <strong>Descrição:</strong><br /> <span class="style1">Digite a descrição do 
                produto.</span><br />
                <asp:TextBox ID="txtDescricao" runat="server" Columns="47" Rows="3" 
                    Text='<%# Bind("Prod_descricao") %>' TextMode="MultiLine" />
                <br />
                <br />
                <strong>Imagem:</strong><br /> <span class="style1">Faça o upload da imagem.</span><br />
                <asp:FileUpload ID="fuImagem" runat="server" />
                <br />
                <br />
                <asp:Button ID="btnAtualizarProduto" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Atualizar" />
                &nbsp;<asp:Button ID="btnDeletarProduto" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
        </asp:FormView>
        
        </custom:WebWindow>

        
        <asp:ObjectDataSource ID="dsAtualizarProduto" runat="server"  
            SelectMethod="SelecionarProdutoPorId" TypeName="tvieira.Ecommerce.Produto" 
            UpdateMethod="AtualizarProduto">
            <SelectParameters>
                <asp:ControlParameter ControlID="grdProdutos" Name="prod_id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="prod_id" Type="Int32" />
                <asp:Parameter Name="cat_id" Type="Int32" />
                <asp:Parameter Name="prod_titulo" Type="String" />
                <asp:Parameter Name="prod_preco" Type="Decimal" />
                <asp:Parameter Name="prod_descricao" Type="String" />
                <asp:Parameter Name="prod_imagemURL" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>

        <br />

        <custom:WebWindow ID="winAdicionar" runat="server" Hide="true" ShowCloseButton="false" Style="left: 23px; top: 459px;" 
            WindowTitleText="Adicionar Produto" Width="450px">
            
           <asp:FormView ID="frmAdicionar" runat="server" DataSourceID="dsProdutos" 
            DefaultMode="Insert" oniteminserted="frmAdicionar_ItemInserted">
            <InsertItemTemplate>
                <strong>Nome:</strong><br /> <span class="style1">Entre com o nome do produto.</span><br />
                <asp:TextBox ID="txtTitulo" runat="server" 
                    Text='<%# Bind("Prod_titulo") %>' Width="400px" />
                <br />
                <br />
                <strong>Categoria:</strong><br /> <span class="style1">Selecione a categoria do 
                produto.</span><br />
                <asp:DropDownList ID="ddlCategoria" runat="server" 
                                DataSourceID="sqlDsCategoria" DataTextField="cat_titulo" 
                                DataValueField="cat_id" SelectedValue='<%# Bind("cat_id") %>' AppendDataBoundItems="True">
                                <asp:ListItem Selected="True">Escolha uma Categoria</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlDsCategoria" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:EcommerceString %>" 
                                SelectCommand="SELECT [cat_id],[cat_titulo] FROM [Categorias] ORDER BY [cat_titulo]">
                            </asp:SqlDataSource>
                <br />
                <strong>Preço:</strong><br /> <span class="style1">Entre com o preço do produto.</span><br />
                <asp:TextBox ID="txtPreco" runat="server" 
                    Text='<%# Bind("Prod_preco") %>' Width="80px" />
                <br />
                <br />
                <strong>Descrição:</strong><br /> <span class="style1">Escreva a descrição do 
                produto.</span><br />
                <asp:TextBox ID="Prod_descricaoTextBox" runat="server" Columns="47" Rows="3" 
                    Text='<%# Bind("Prod_descricao") %>' TextMode="MultiLine" />
                <br />
                <br />
                <strong>Imagem:</strong><br /> <span class="style1">Escolha uma imagem para o 
                produto.</span><br />&nbsp;<asp:FileUpload ID="fuImagem" runat="server" FileName='<%# Bind("prod_imagemURL") %>' />
                <br />
                <br />
                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Inserir" />
                &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="Cancelar" />
            </InsertItemTemplate>
        </asp:FormView>
            
            </custom:WebWindow>
           
    </div>

</asp:Content>

