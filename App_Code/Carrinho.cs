using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace tvieira.Ecommerce
{
    [Serializable]
    public class ItemCarrinho
    {

        private int produtoId;
        private string produtoNome;
        private string produtoImagemURL;
        private int quantidade;
        private double preco;

        public ItemCarrinho()
        {
        }
        
        public ItemCarrinho(int ProdutoId, string ProdutoNome, string ProdutoImagemURL, int Quantidade, double Preco)
        {
            produtoId = ProdutoId;
            produtoNome = ProdutoNome;
            produtoImagemURL = ProdutoImagemURL;
            quantidade = Quantidade;
            preco = Preco;
        }

        public int ProdutoId
        {
            get { return produtoId; }
            set { produtoId = value; }
        }

        public string ProdutoNome
        {
            get { return produtoNome; }
            set { produtoNome = value; }
        }

        public string ProdutoImagemURL
        {
            get { return produtoImagemURL; }
            set { produtoImagemURL = value; }
        }

        public int Quantidade
        {
            get { return quantidade; }
            set { quantidade = value; }
        }

        public double Preco
        {
            get { return preco; }
            set { preco = value; }
        }

        public double TotalDaLinha
        {
            get { return quantidade * preco; }
        }
    }

    [Serializable]
    public class Carrinho
    {
        private DateTime dataCriacao;
        private DateTime dataAtualizacao;
        private List<ItemCarrinho> itens;

        public Carrinho()
        {
            if (itens == null)
            {
                itens = new List<ItemCarrinho>();
                dataCriacao = DateTime.Now;
            }
        }

        public List<ItemCarrinho> Itens
        {
            get { return itens; }
            set { itens = value; }
        }

        public void InserirCarrinho(int ProdutoId, double Preco, int Quantidade, string ProdutoNome, string ProdutoImagemURL)
        {
            int indiceItem = IndiceItemPorId(ProdutoId);
            if (indiceItem == -1)
            {
                ItemCarrinho novoItem = new ItemCarrinho();
                novoItem.ProdutoId = ProdutoId;
                novoItem.Quantidade = Quantidade;
                novoItem.Preco = Preco;
                novoItem.ProdutoNome = ProdutoNome;
                novoItem.ProdutoImagemURL = ProdutoImagemURL;
                itens.Add(novoItem);
            }
            else
            {
                itens[indiceItem].Quantidade += 1;
            }

            dataAtualizacao = DateTime.Now;
        }

        public void AtualizarCarrinho(int ID, int ProdutoId, int Quantidade, double Preco)
        {
            ItemCarrinho Item = itens[ID];
            Item.ProdutoId = ProdutoId;
            Item.Quantidade = Quantidade;
            Item.Preco = Preco;
            dataAtualizacao = DateTime.Now;
        }

        public void DeletarItemCarrinho(int ID)
        {
            itens.RemoveAt(ID);
            dataAtualizacao = DateTime.Now;
        }

        private int IndiceItemPorId(int ProdutoId)
        {
            int indice = 0;
            foreach (ItemCarrinho item in itens)
            {
                if (item.ProdutoId == ProdutoId)
                {
                    return indice;
                }
                indice += 1;
            }
            return -1;
        }

        public double Total
        {
            get
            {
                double t = 0;

                if (itens == null)
                {
                    return 0;
                }

                foreach (ItemCarrinho Item in itens)
                {
                    t += Item.TotalDaLinha;
                }

                return t;
            }
        }
    }
}