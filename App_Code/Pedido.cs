using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using tvieira.ECommerce;

namespace tvieira.Ecommerce
{
    public class Pedido
    {
        private static readonly string connectionString;

        private int ped_id;
        private string ped_nomeusuario;
        private string ped_cart_nome;
        private TipoCartaoCredito ped_cart_tipo;
        private string ped_cart_numero;
        private int ped_cart_exp_mes;
        private int ped_cart_exp_ano;
        private string ped_endereco;
        private string ped_cidade;
        private string ped_estado;
        private string ped_cep;
        private string ped_pais;
        private string ped_email;
        private string ped_ent_endereco;
        private string ped_ent_cidade;
        private string ped_ent_estado;
        private string ped_ent_cep;
        private string ped_ent_pais;
        private DateTime ped_data;

        public static List<Pedido> SelecionarTodosPedidos()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SelecionarTodosPedidos", con);
            cmd.CommandType = CommandType.StoredProcedure;

            List<Pedido> resultados = new List<Pedido>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    resultados.Add(new Pedido(reader));
            }
            return resultados;
        }

        public static Pedido Selecionar(int ped_id)
        {

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SelecionarPedido", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ped_id", ped_id);

            Pedido resultado = null;
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                    resultado = new Pedido(reader);
            }
            return resultado;
        }

        public static List<ItensPedido> SelecionarItensPorPedido(int ped_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SelecionarItensPorPedido", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ped_id", ped_id);

            List<ItensPedido> resultados = new List<ItensPedido>();
            using (con)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    resultados.Add(new ItensPedido(reader));
            }
            return resultados;
        }

        public int CadastrarPedido()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("CadastrarPedido", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ped_nomeusuario", ped_nomeusuario);
            cmd.Parameters.AddWithValue("@ped_cart_nome", ped_cart_nome);
            cmd.Parameters.AddWithValue("@ped_cart_tipo", ped_cart_tipo);
            cmd.Parameters.AddWithValue("@ped_cart_numero", Criptografia.Encrypt(ped_cart_numero));
            cmd.Parameters.AddWithValue("@ped_cart_exp_mes", ped_cart_exp_mes);
            cmd.Parameters.AddWithValue("@ped_cart_exp_ano", ped_cart_exp_ano);

            cmd.Parameters.AddWithValue("@ped_endereco", ped_endereco);
            cmd.Parameters.AddWithValue("@ped_cidade", ped_cidade);
            cmd.Parameters.AddWithValue("@ped_estado", ped_estado);
            cmd.Parameters.AddWithValue("@ped_cep", ped_cep);
            cmd.Parameters.AddWithValue("@ped_pais", ped_pais);
            cmd.Parameters.AddWithValue("@ped_email", ped_email);

            cmd.Parameters.AddWithValue("@ped_ent_endereco", ped_ent_endereco);
            cmd.Parameters.AddWithValue("@ped_ent_cidade", ped_ent_cidade);
            cmd.Parameters.AddWithValue("@ped_ent_estado", ped_ent_estado);
            cmd.Parameters.AddWithValue("@ped_ent_cep", ped_ent_cep);
            cmd.Parameters.AddWithValue("@ped_ent_pais", ped_ent_pais);

            int resultado;
            using (con)
            {
                con.Open();
                resultado = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            return resultado;
        }

        public static void CadastrarItensPedido(int iped_pedidoid, int iped_produtoid, double iped_preco, int iped_quantidade)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("CadastrarItensPedido", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@iped_pedidoid", iped_pedidoid);
            cmd.Parameters.AddWithValue("@iped_produtoid", iped_produtoid);
            cmd.Parameters.AddWithValue("@iped_preco", iped_preco);
            cmd.Parameters.AddWithValue("@iped_quantidade", iped_quantidade);

            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public Pedido(SqlDataReader reader)
        {
            ped_id = (int)reader["ped_id"];
            ped_nomeusuario = (string)reader["ped_nomeusuario"];
            ped_cart_nome = (string)reader["ped_cart_nome"];
            ped_cart_tipo = (TipoCartaoCredito)reader["ped_cart_tipo"];
            ped_cart_numero = Criptografia.Decrypt((byte[]) reader["ped_cart_numero"]);
            ped_cart_exp_mes = (int)reader["ped_cart_exp_mes"];
            ped_cart_exp_ano = (int)reader["ped_cart_exp_ano"];
            ped_endereco = (string)reader["ped_endereco"];
            ped_cidade = (string)reader["ped_cidade"];
            ped_estado = (string)reader["ped_estado"];
            ped_cep = (string)reader["ped_cep"];
            ped_pais = (string)reader["ped_pais"];
            ped_email = (string)reader["ped_email"];
            ped_ent_endereco = (string)reader["ped_ent_endereco"];
            ped_ent_cidade = (string)reader["ped_ent_cidade"];
            ped_ent_estado = (string)reader["ped_ent_estado"];
            ped_ent_cep = (string)reader["ped_ent_cep"];
            ped_ent_pais = (string)reader["ped_ent_pais"];
            ped_data = (DateTime)reader["ped_data"];
        }

        public Pedido()
        {
        }

        static Pedido()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["EcommerceString"].ConnectionString;
        }

        public class ItensPedido
        {
            private int id;
            private string nome;
            private decimal preco;
            private int quantidade;

            public int Id
            {
                get { return id; }
                set { id = value; }
            }

            public string Nome
            {
                get { return nome; }
                set { nome = value; }
            }

            public decimal Preco
            {
                get { return preco; }
                set { preco = value; }
            }

            public int Quantidade
            {
                get { return quantidade; }
                set { quantidade = value; }
            }

            public ItensPedido(SqlDataReader reader)
            {
                id = (int)reader["iped_id"];
                nome = (string) reader["prod_titulo"];
                preco = (decimal) reader["iped_preco"];
                quantidade = (int) reader["iped_quantidade"];
            }
        }

        #region Get e Set dos campos da tabela Pedido
        public int Ped_id
        {
            get { return ped_id; }
            set { ped_id = value; }
        }

        public string Ped_nomeusuario
        {
            get { return ped_nomeusuario; }
            set { ped_nomeusuario = value; }
        }

        public string Ped_cart_nome
        {
            get { return ped_cart_nome; }
            set { ped_cart_nome = value; }
        }

        public TipoCartaoCredito Ped_cart_tipo
        {
            get { return ped_cart_tipo; }
            set { ped_cart_tipo = value; }
        }

        public string Ped_cart_numero
        {
            get { return ped_cart_numero; }
            set { ped_cart_numero = value; }
        }

        public int Ped_cart_exp_mes
        {
            get { return ped_cart_exp_mes; }
            set { ped_cart_exp_mes = value; }
        }

        public int Ped_cart_exp_ano
        {
            get { return ped_cart_exp_ano; }
            set { ped_cart_exp_ano = value; }
        }

        public string Ped_endereco
        {
            get { return ped_endereco; }
            set { ped_endereco = value; }
        }

        public string Ped_cidade
        {
            get { return ped_cidade; }
            set { ped_cidade = value; }
        }

        public string Ped_estado
        {
            get { return ped_estado; }
            set { ped_estado = value; }
        }

        public string Ped_cep
        {
            get { return ped_cep; }
            set { ped_cep = value; }
        }

        public string Ped_pais
        {
            get { return ped_pais; }
            set { ped_pais = value; }
        }

        public string Ped_email
        {
            get { return ped_email; }
            set { ped_email = value; }
        }

        public string Ped_ent_endereco
        {
            get { return ped_ent_endereco; }
            set { ped_ent_endereco = value; }
        }

        public string Ped_ent_cidade
        {
            get { return ped_ent_cidade; }
            set { ped_ent_cidade = value; }
        }

        public string Ped_ent_estado
        {
            get { return ped_ent_estado; }
            set { ped_ent_estado = value; }
        }

        public string Ped_ent_cep
        {
            get { return ped_ent_cep; }
            set { ped_ent_cep = value; }
        }

        public string Ped_ent_pais
        {
            get { return ped_ent_pais; }
            set { ped_ent_pais = value; }
        }

        public DateTime Ped_data
        {
            get { return ped_data; }
            set { ped_data = value; }
        }
        #endregion
    }
}