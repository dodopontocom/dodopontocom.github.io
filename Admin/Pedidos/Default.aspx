<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Pedidos_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

Essa página mostra todos os pedidos feitos e podemos ver os detalhes de cada um. <br /><br />

<br />
    <asp:GridView ID="grvTodosPedidos" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ped_id" DataSourceID="dsTodosPedidos" 
        ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="grvTodosPedidos_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Ped_id" HeaderText="N. Pedido" 
                SortExpression="Ped_id" />
            <asp:BoundField DataField="Ped_cart_nome" HeaderText="Nome do Comprador" 
                SortExpression="Ped_cart_nome">
            <HeaderStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="Ped_email" HeaderText="E-mail" 
                SortExpression="Ped_email">
            <HeaderStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Ped_data" HeaderText="Data da Compra" 
                SortExpression="Ped_data" />
            <asp:CommandField CancelText="Cancelar" DeleteText="Deletar" EditText="Editar" 
                InsertText="Inserir" NewText="Novo" SelectText="Selecionar" 
                ShowSelectButton="True" UpdateText="Atualizar" />
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
    <asp:ObjectDataSource ID="dsTodosPedidos" runat="server" 
        SelectMethod="SelecionarTodosPedidos" TypeName="tvieira.Ecommerce.Pedido">
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="dsSelecionarItemPedido" runat="server" 
        SelectMethod="SelecionarItensPorPedido" TypeName="tvieira.Ecommerce.Pedido">
        <SelectParameters>
            <asp:ControlParameter ControlID="grvTodosPedidos" Name="ped_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <br />

    <asp:ObjectDataSource ID="dsSelecionarPorId" runat="server" 
        SelectMethod="Selecionar" TypeName="tvieira.Ecommerce.Pedido">
        <SelectParameters>
            <asp:ControlParameter ControlID="grvTodosPedidos" Name="ped_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <custom:WebWindow id="winDetalhes" WindowTitleText="Detalhes do Pedido" ShowCloseButton="true" Runat="server"
    OnClosed="winDetalhes_Closed" Width="550px">

    <asp:FormView
        id="frmPedido"
        DataSourceID="dsSelecionarPorId"
        Runat="server" Width="500px">
        <ItemTemplate>
        <div class="scrollBox" style="height:500px; width: 500px;">    
      
        <fieldset>
        <legend>Informações de Pagamento</legend>
        
        <div class="leftForm">
        ID do Pedido:
        <br />
        Nome do Comprador:
        <br />
        E-mail:
        <br />
        N. do Cartão:
        <br />
        Bandeira do Cartão:
        </div>
        
        <div class="rightForm">
        <%# Eval("ped_id") %>
        <br />
        <%# Eval("ped_cart_nome") %>
        <br />
         <%# Eval("ped_email") %>
        <br />
        <%# Eval("ped_cart_numero") %>
        <br />
        <%# Eval("ped_cart_tipo") %>
        </div>
        <br style="clear:both" />
        </fieldset>
        <br />
        
        <fieldset>
        <legend>Informações de Fatura</legend>
        
        <div class="leftForm">
        Endereço:
        <br />
        Cidade:
        <br />
        Estado:
        <br />
        Cep:
        <br />
        País:
        </div>
        
        <div class="rightForm">
        <%# Eval("ped_endereco") %>
        <br />
        <%# Eval("ped_cidade") %>
        <br />
        <%# Eval("ped_estado") %>
        <br />
        <%# Eval("ped_cep") %>
        <br />
        <%# Eval("ped_pais") %>

        </div>
        <br style="clear:both" />
        </fieldset>
        
        <br />
        
        <fieldset>
        <legend>Informações de Entrega</legend>
        
        <div class="leftForm">
        Endereço:
        <br />
        Cidade:
        <br />
        Estado:
        <br />
        Cep:
        <br />
        País:
        </div>
        
        <div class="rightForm">
        <%# Eval("ped_ent_endereco") %>
        <br />
        <%# Eval("ped_ent_cidade")%>
        <br />
        <%# Eval("ped_ent_estado")%>
        <br />
        <%# Eval("ped_ent_cep")%>
        <br />
        <%# Eval("ped_ent_pais")%>

        </div>
        <br style="clear:both" />
        </fieldset>

        <br />
        
            <asp:GridView ID="grvItensPedido" runat="server" AutoGenerateColumns="False" 
                DataSourceID="dsSelecionarItemPedido" ShowFooter="True" 
                ondatabound="grvItensPedido_DataBound" 
                onrowdatabound="grvItensPedido_RowDataBound" Width="500px">
                
                <Columns>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="Quantidade" HeaderText="Quantidade" 
                        SortExpression="Quantidade" />
                    <asp:TemplateField HeaderText="Preço">
                        <FooterTemplate>
                            <asp:Label id="lblTotal" Runat="server" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <%# Eval("preco","{0:c}") %>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                </Columns>
                
            </asp:GridView>
        <br /><br />
        </div>        
        </ItemTemplate>    
    </asp:FormView>

    </custom:WebWindow>

<br /><br />

</asp:Content>

