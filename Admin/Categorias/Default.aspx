<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Categorias_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="padding: 15px;">

        Esta página é para gerenciar as categorias, você pode inserir novas categorias, deletar e atualizar as categorias existentes.<br />
        <br />
        <div style="width: 100%;">
    
        <div style="margin-right: 10px; padding: 10px; border-left: 1px solid #000;">
        
            
        
            
        
            
        
            <asp:GridView ID="grdCategorias" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="cat_id" DataSourceID="dsCategoria" CellPadding="4" 
                ForeColor="#333333" GridLines="None" 
                onselectedindexchanged="grdCategorias_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="cat_titulo" HeaderText="Título Categoria" 
                        SortExpression="cat_titulo" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditar" runat="server" CommandName="Select">Editar</asp:LinkButton>
                            &nbsp; /&nbsp;
                            <asp:LinkButton ID="lnkDeletar" runat="server" CommandName="Delete" 
                                onclientclick="return confirm('Você tem certeza que deseja deletar essa categoria?')">Deletar</asp:LinkButton>
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

            <custom:WebWindow ID="winEditar" Hide="true" WindowTitleText="Editar Categoria" runat="server">

             <asp:FormView ID="frmEditar" runat="server" DataSourceID="dsAtualizarCategoria" 
                DefaultMode="Edit" onitemupdated="frmEditar_ItemUpdated" 
                onitemcommand="frmEditar_ItemCommand">
                <EditItemTemplate>
                    Título:
                    <asp:TextBox ID="txtTitulo" runat="server" Text='<%# Bind("cat_titulo") %>' 
                        ValidationGroup="Editar" />
                    <br />
                    <asp:RequiredFieldValidator ID="redTitulo" runat="server" 
                        ControlToValidate="txtTitulo" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#FF3300" ValidationGroup="Editar">(Obrigatório)</asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" ValidationGroup="Editar" />
&nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" ValidationGroup="Editar" />
                </EditItemTemplate>
            </asp:FormView>
            
            </custom:WebWindow>

            
                   
           

            <asp:ObjectDataSource ID="dsAtualizarCategoria" runat="server" 
                SelectMethod="SelecionarCategoriaPorId" TypeName="tvieira.Ecommerce.Categoria" 
                UpdateMethod="AtualizarCategoria">
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdCategorias" Name="cat_id" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="grdCategorias" Name="cat_id" />
                </UpdateParameters>
            </asp:ObjectDataSource>

            <asp:ObjectDataSource ID="dsCategoria" runat="server" 
                SelectMethod="SelecionarTodasCategoria" 
                TypeName="tvieira.Ecommerce.Categoria" 
                DeleteMethod="DeletarCategoria" UpdateMethod="AtualizarCategoria" 
                InsertMethod="InserirCategoria">
                <DeleteParameters>
                    <asp:Parameter Name="cat_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="cat_titulo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="cat_id" Type="Int32" />
                    <asp:Parameter Name="cat_titulo" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
                   
        
            <br />


            <custom:OpenWebWindow ID="lnkAdicionar" runat="server" Text="Adicionar Categoria" WebWindowID="winAdicionar" />

            <custom:WebWindow ID="winAdicionar" runat="server" Hide="true" ShowCloseButton="true" Style="left: 23px; top: 459px;" 
            WindowTitleText="Adicionar Categoria">
            
                <asp:FormView ID="frmAdicionar" runat="server" DefaultMode="Insert" 
                DataSourceID="dsCategoria" oniteminserted="frmAdicionar_ItemInserted">
                <InsertItemTemplate>
                    Título da Categoria:
                    <asp:TextBox ID="txtTitulo" runat="server" Text='<%# Bind("cat_titulo") %>' 
                        ValidationGroup="Adicionar" />
                    <br />
                    <asp:RequiredFieldValidator ID="reqTitulo" runat="server" 
                        ControlToValidate="txtTitulo" ErrorMessage="(Obrigatório)" Font-Bold="True" 
                        ForeColor="#FF3300" ValidationGroup="Adicionar"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Button ID="btnInsInserir" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Inserir" ValidationGroup="Adicionar" />
&nbsp;<asp:Button ID="btnInsCancelar" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancelar" ValidationGroup="Adicionar" />
                </InsertItemTemplate>
            </asp:FormView>
            
            </custom:WebWindow>

               
        </div>
    
    </div>

    </div>

    </asp:Content>

