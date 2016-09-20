<%@ Page Title="" Language="C#" MasterPageFile="~/Ecommerce.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Pedido_Default" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPrincipal" Runat="Server">

<asp:GridView ID="grvCarrinho" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ProdutoNome" HeaderText="Produto" />
            <asp:BoundField DataField="Quantidade" HeaderText="Qtd." />
            <asp:BoundField DataField="Preco" DataFormatString="{0:c}" HeaderText="Preço" 
                HtmlEncode="False" />
            <asp:BoundField DataField="TotalDaLinha" DataFormatString="{0:c}" 
                HeaderText="Total" HtmlEncode="False" />
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

    <asp:Label ID="lblTotal" runat="server"></asp:Label>
    
    <br /><br />

    <fieldset>
<legend>Informações de Pagamento</legend>
<div class="instrucoes">
Digite as informações de seu cartão de crédito
</div>
<br /><br />
<asp:Label
    id="lblNome"
    Text="Seu nome como esta no cartão de crédito:"
    AssociatedControlID="txtCartNome"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqName"
    ControlToValidate="txtCartNome"
    Text="(Obrigatório)"
    Runat="server" />
    
<br />
<asp:TextBox
    id="txtCartNome"
    Runat="server" />
<br /><br />
<asp:Label
    id="lblCartTipo"
    Text="Bandeira do Cartão:"
    AssociatedControlID="dropCartTipo"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCartTipo"
    ControlToValidate="dropCartTipo"
    InitialValue="-1"
    Text="(Obrigatório)"
    Runat="server" />

<br />
<asp:DropDownList
    id="dropCartTipo"
    Runat="server">
    <asp:ListItem Text="Selecione Bandeira" Value="-1" />
</asp:DropDownList>
<br /><br />
<asp:Label
    id="lblCartNumero"
    Text="Número do Cartão de Crédito:"
    AssociatedControlID="txtCartNumero"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCartNumero"
    ControlToValidate="txtCartNumero"
    Text="(Obrigatório)"
    Runat="server" />
    
<br />
<asp:TextBox
    id="txtCartNumero"
    Runat="server" />
<br /><br />
<asp:Label
    id="lblCartExp"
    Text="Validade do cartão de Crédito:"
    AssociatedControlID="dropCartExpMes"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCartExpMes"
    ControlToValidate="dropCartExpMes"
    InitialValue="-1"
    Display="Dynamic"
    Text="(Obrigatório)"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCartExpAno"
    ControlToValidate="dropCartExpAno"
    InitialValue="-1"
    Display="Dynamic"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:DropDownList
    id="dropCartExpMes"
    ToolTip="Mês de Validade"
    AppendDataBoundItems="true"
    Runat="server">
    <asp:ListItem Text="Selecione Mês" Value="-1" />
</asp:DropDownList>    
<asp:DropDownList
    id="dropCartExpAno"
    ToolTip="Ano de Validade"
    AppendDataBoundItems="true"
    Runat="server">
    <asp:ListItem Text="Selecione Ano" Value="-1" />
</asp:DropDownList>    

</fieldset>

<br />

<fieldset>
<legend>Endereço de Faturamento</legend>
<div class="instrucoes">
Digite o seu endereço associado ao Cartão de Crédito.
</div>

<asp:Label
    id="lblEndereco"
    Text="Endereço:"
    AssociatedControlId="txtEndereco"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqEndereco"
    ControlToValidate="txtEndereco"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtEndereco"
    AutoCompleteType="HomeStreetAddress"
    TextMode="MultiLine"
    Columns="40"
    Rows="2"
    Runat="server" />
<br /><br />
<div style="float:left;width:200px">
<asp:Label
    id="lblCidade"
    Text="Cidade:"
    AssociatedControlId="txtCidade"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCidade"
    ControlToValidate="txtCidade"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtCidade"
    AutoCompleteType="homecity"
    Columns="20"
    Runat="server" />
</div>
<div style="float:left;width">
<asp:Label
    id="lblEstado"
    Text="Estado:"
    AssociatedControlId="txtEstado"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqEstado"
    ControlToValidate="txtEstado"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtEstado"
    AutoCompleteType="HomeState"
    Columns="4"
    Runat="server" />
</div>
<br style="clear:both" /><br />


<div style="float:left;width:200px">
<asp:Label
    id="lblCep"
    Text="Cep:"
    AssociatedControlId="txtCep"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqCep"
    ControlToValidate="txtCep"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtCep"
    AutoCompleteType="homezipcode"
    Columns="10"
    Runat="server" />
</div>

<div style="float:left">
<asp:Label
    id="lblPais"
    Text="País:"
    AssociatedControlId="txtPais"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqPais"
    ControlToValidate="txtPais"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtPais"    
    Text="Brasil"
    Columns="20"
    Runat="server" />
</div>
    <br />
    <br />

<br />
<div style="float:left;width:200px">
<asp:Label
    id="lblEmaill"
    Text="E-mail:"
    AssociatedControlId="txtEmail"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqEmail"
    ControlToValidate="txtEmail"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtEmail"
    AutoCompleteType="email"
    Columns="20"
    Runat="server" />
</div>


</fieldset>

<br />

<fieldset>


<legend>Endereço de Entrega</legend>
<div class="instrucoes">
Digite o endereço que você quer que o seu pedido seja entregue.
</div>

<asp:CheckBox
    id="chkCopiar"
    AutoPostBack="true"
    CausesValidation="false" 
    Runat="server" Text="O mesmo endereço de faturamento?" 
        oncheckedchanged="chkCopiar_CheckedChanged" />
    <br /><br />


<asp:Label
    id="lblEntEndereco"
    Text="Endereço:"
    AssociatedControlId="txtEntEndereco"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqEntEndereco"
    ControlToValidate="txtEntEndereco"
    Text="(Obrigatório)"
    Runat="server" />
    <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">E-mail inválido</asp:RegularExpressionValidator><br />
<asp:TextBox
    id="txtEntEndereco"
    AutoCompleteType="HomeStreetAddress"
    TextMode="MultiLine"
    Columns="40"
    Rows="2"
    Runat="server" />
<br /><br />
<div style="float:left;width:200px">
<asp:Label
    id="lblEntCidade"
    Text="Cidade:"
    AssociatedControlId="txtEntCidade"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqEntCidade"
    ControlToValidate="txtCidade"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtEntCidade"
    AutoCompleteType="homecity"
    Columns="20"
    Runat="server" />
</div>
<div style="float:left;width">
<asp:Label
    id="lblEntEstado"
    Text="Estado:"
    AssociatedControlId="txtEntEstado"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqEntEstado"
    ControlToValidate="txtEstado"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtEntEstado"
    AutoCompleteType="HomeState"
    Columns="4"
    Runat="server" />
</div>
<br style="clear:both" /><br />


<div style="float:left;width:200px">
<asp:Label
    id="lblEntCep"
    Text="Cep:"
    AssociatedControlId="txtEntCep"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqEntCep"
    ControlToValidate="txtCep"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtEntCep"
    AutoCompleteType="homezipcode"
    Columns="10"
    Runat="server" />
</div>

<div style="float:left">
<asp:Label
    id="lblEntPais"
    Text="País:"
    AssociatedControlId="txtEntPais"
    Runat="server" />
<asp:RequiredFieldValidator
    id="reqEntPais"
    ControlToValidate="txtPais"
    Text="(Obrigatório)"
    Runat="server" />
<br />
<asp:TextBox
    id="txtEntPais"
    AutoCompleteType="homecountryregion"
    Text="Brasil"
    Columns="20"
    Runat="server" />
</div>

</fieldset>

<br /><br />

<asp:Button id="btnEnviar" Text="Confirmar Compra" Runat="server" 
        onclick="btnEnviar_Click" />

</asp:Content>

