using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Tarea2_10
{
    public partial class IngresoSistema : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
            conn.Open();
            String str = "select nombre, descripcion from Categoria where publico = 'True'";
            SqlCommand command = new SqlCommand(str, conn);
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read()){
                ListBox1.Items.Add(reader["nombre"].ToString());
                ListBox2.Items.Add(reader["descripcion"].ToString());
            }

            conn.Close();

            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
            conn.Open();
            str = "SELECT COUNT(Tema.id_tema) AS nTemas FROM Categoria, Tema WHERE Categoria.id_categoria=Tema.id_categoria AND Categoria.publico='True'";
            command = new SqlCommand(str, conn);
            reader = command.ExecuteReader();

            while (reader.Read())
            {
                ListBox3.Items.Add(reader["nTemas"].ToString());
            }

            conn.Close();

            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
            conn.Open();
            str = "SELECT COUNT(Comentario.id_comentario) AS nComentarios FROM Categoria, Tema, Comentario WHERE Categoria.id_categoria=Tema.id_categoria AND Categoria.publico='True' AND Tema.id_tema=Comentario.id_tema";
            command = new SqlCommand(str, conn);
            reader = command.ExecuteReader();

            while (reader.Read())
            {
                ListBox4.Items.Add(reader["nComentarios"].ToString());
            }

            conn.Close();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Iniciar_sesion.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }
    }
}