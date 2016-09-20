using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;


namespace tvieira.Ecommerce
{
    // <summary>
    // Representa a categoria do produto e tem métodos que trabalha com a categoria, como incluir, excluir e alterar.
    // </summary>
    [System.ComponentModel.DataObject]
    public class Categoria
    {
        private static readonly string connectionString;
        private int id;
        private string titulo;

        #region Métodos Construtores
        static Categoria()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["EcommerceString"].ConnectionString;
        }

        public Categoria(SqlDataReader reader)
        {
            id = (int)reader["cat_id"];
            titulo = (string)reader["cat_titulo"];
        }
        #endregion

        #region Método Selecionar Todas as Categorias
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static List<Categoria> SelecionarTodasCategoria()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SelecionarTodasCategorias", con);
            cmd.CommandType = CommandType.StoredProcedure;
            List<Categoria> resultados = new List<Categoria>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    resultados.Add(new Categoria(reader));
                }

                con.Close();

                return resultados;
            }
        }
        #endregion

        #region Método Selecionar Categoria por ID
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public static Categoria SelecionarCategoriaPorId(int cat_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SelecionarCategoria", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cat_id", cat_id);

            Categoria resultado = null;

            using (con)
            {
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                    resultado = new Categoria(reader);              
            }

            con.Close();

            return resultado;
        }
        #endregion

        #region Método Atualizar Categoria
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public static void AtualizarCategoria(int cat_id, string cat_titulo)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("AtualizarCategoria", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cat_id", cat_id);
            cmd.Parameters.AddWithValue("@cat_titulo", cat_titulo);

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        #endregion

        #region Método Inserir a Categoria
        public static void InserirCategoria(string cat_titulo)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("InserirCategoria", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cat_titulo", cat_titulo);

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        #endregion

        #region Método Deletar Categoria
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public static void DeletarCategoria(int cat_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("DeletarCategoria", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cat_id", cat_id);

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        #endregion

        #region Get e Set da tabela Categoria
        public int cat_id
        {
            get { return id; }
            set { id = value; }
        }

        public string cat_titulo
        {
            get { return titulo; }
            set { titulo = value; }
        }
        #endregion
    }

}