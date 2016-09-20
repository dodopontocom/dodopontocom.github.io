using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace tvieira.Ecommerce
{
    /// <summary>
    /// Todos os métodos para administração e exibição dos produtos
    /// </summary>
    [System.ComponentModel.DataObject]
    public class Produto
    {
        private static readonly string connectionString;
        private int prod_id;
        private int cat_id;
        private string prod_titulo;
        private string prod_descricao;
        private decimal prod_preco;
        private string prod_imagemURL;
        private string tituloCategoria;

        static Produto()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["EcommerceString"].ConnectionString;
        }

        public Produto(SqlDataReader reader)
        {
            prod_id = (int)reader["prod_id"];
            if (reader["cat_id"] != DBNull.Value)
                cat_id = (int)reader["cat_id"];
            if (reader["TituloCategoria"] != DBNull.Value)
                tituloCategoria = (string)reader["TituloCategoria"];
            prod_titulo = (string)reader["prod_titulo"];
            prod_descricao = (string)reader["prod_descricao"];
            prod_preco = (decimal)reader["prod_preco"];
            prod_imagemURL = (string)reader["prod_imagemURL"];
        }

        #region Inserir Produto
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public static void InserirProduto(int cat_id, string prod_titulo, string prod_descricao, decimal prod_preco, string prod_imagemURL)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("InserirProduto", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cat_id", cat_id);
            cmd.Parameters.AddWithValue("@prod_titulo", prod_titulo);
            cmd.Parameters.AddWithValue("@prod_descricao", prod_descricao);
            cmd.Parameters.AddWithValue("@prod_preco", prod_preco);
            cmd.Parameters.AddWithValue("@prod_imagemURL", prod_imagemURL);


            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }

        }
        #endregion

        #region Deletar Produto
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public static void DeletarProduto(int prod_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("DeletarProduto", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@prod_id", prod_id);

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        #endregion

        #region Atualizar Produto
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public static void AtualizarProduto(int prod_id, int cat_id, string prod_titulo, decimal prod_preco, string prod_descricao, string prod_imagemURL)
        {
            Convert.ToDecimal(prod_preco);
            
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("AtualizarProduto", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@prod_id", prod_id);
            cmd.Parameters.AddWithValue("@cat_id", cat_id);
            cmd.Parameters.AddWithValue("@prod_titulo", prod_titulo);
            cmd.Parameters.AddWithValue("@prod_preco", prod_preco);
            cmd.Parameters.AddWithValue("@prod_descricao", prod_descricao);
            cmd.Parameters.AddWithValue("@prod_imagemURL", prod_imagemURL);

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        #endregion

        #region Selecionar Todos os Produtos
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static List<Produto> SelecionarTodosProdutos()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SelecionarTodosProdutos", con);
            cmd.CommandType = CommandType.StoredProcedure;

            List<Produto> results = new List<Produto>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    results.Add(new Produto(reader));
            }
            return results;
        }
        #endregion

        #region Selecionar Produto por ID da Categoria
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public static List<Produto> SelecionarProdutoPorIdCategoria(int cat_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SelecionarProdutoPorIdCategoria", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cat_id", cat_id);

            List<Produto> results = new List<Produto>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    results.Add(new Produto(reader));
            }
            return results;
        }
        #endregion

        #region Selecionar Produto por ID
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static Produto SelecionarProdutoPorId(int prod_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SelecionarProdutoPorId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@prod_id", prod_id);

            Produto result = null;
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                    result = new Produto(reader);
            }
            return result;
        }
        #endregion

        #region Selecionar Produto Aleatoriamente
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public static List<Produto> SelecionarProdutoAleatorio()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("ProdutoAleatorio", con);
            cmd.CommandType = CommandType.StoredProcedure;

            List<Produto> resultados = new List<Produto>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    resultados.Add(new Produto(reader));
            }
            return resultados;
        }
        #endregion

        #region Get e Set dos campos da Tabela
        public int Prod_id
       {
           get { return prod_id; }
           set { prod_id = value; }
       }

       public int Cat_id
       {
           get { return cat_id; }
           set { cat_id = value; }
       }

       public string Prod_titulo
       {
           get { return prod_titulo; }
           set { prod_titulo = value; }
       }

       public string Prod_descricao
       {
           get { return prod_descricao; }
           set { prod_descricao = value; }
       }

       public decimal Prod_preco
       {
           get { return prod_preco; }
           set { prod_preco = value; }
       }

       public string Prod_imagemURL
       {
           get { return prod_imagemURL; }
           set { prod_imagemURL = value; }
       }

       public string TituloCategoria
       {
           get { return tituloCategoria; }
           set { tituloCategoria = value; }
       }
        #endregion
    }
}