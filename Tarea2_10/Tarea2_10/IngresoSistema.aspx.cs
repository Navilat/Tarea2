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
        private void actualizarListas()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
            conn.Open();
            String str = "select nombre, descripcion from Categoria where publico = 'True'";
            SqlCommand command = new SqlCommand(str, conn);
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
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

        protected void Page_Load(object sender, EventArgs e)
        {
            actualizarListas();
        }

        //BOTON: Iniciar Sesion
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Iniciar_sesion.aspx");
        }

        //BOTON: Registrarse
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }

        //BOTON: IR_Categoria
        protected void Button3_Click(object sender, EventArgs e)
        {

            if (ListBox1.SelectedValue != "")
            {
                //TextBox1.Text = ListBox1.SelectedItem.Value.ToString();
                TextBox1.Text = ListBox1.SelectedValue; //Para ver si lo que estoy leyendo es correcto. (Borrar luego)

                lbTemas_1.Visible = true;
                lbTemas_2.Visible = true;
                lbTemas_3.Visible = true;
                lbTemas_4.Visible = true;
                Button4.Visible = true;
                Button5.Visible = true;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                String str = "select Tema.nombre AS temaNombre, Tema.descripcion AS temaDescripcion, Usuario.nombre AS usuarioNombre from Tema, Usuario where Tema.publico = 'True' AND Tema.id_usuario=Usuario.id_usuario";
                SqlCommand command = new SqlCommand(str, conn);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    lbTemas_1.Items.Add(reader["temaNombre"].ToString());
                    lbTemas_2.Items.Add(reader["usuarioNombre"].ToString());
                    lbTemas_3.Items.Add(reader["temaDescripcion"].ToString());
                }
                conn.Close();

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                str = "SELECT COUNT(Comentario.id_comentario) AS nComentarios FROM Tema, Comentario WHERE Tema.publico='True' AND Tema.id_tema=Comentario.id_tema";
                command = new SqlCommand(str, conn);
                reader = command.ExecuteReader();

                while (reader.Read())
                {
                    lbTemas_4.Items.Add(reader["nComentarios"].ToString());
                }

                conn.Close();
            }

            ListBox1.Items.Clear();
            ListBox2.Items.Clear();
            ListBox3.Items.Clear();
            ListBox4.Items.Clear();
            ListBox5.Items.Clear();
            actualizarListas();
        }

        //BOTON: IR a Comentarios
        protected void Button4_Click(object sender, EventArgs e)
        {

            if (lbTemas_1.SelectedValue != "")
            {

                string nombreTema = lbTemas_1.SelectedValue;

                tbMensaje.Visible = true;
                DropDownList1.Visible = true;
                ImageAvatar.Visible = true;
                tbComentario.Visible = true;
                nomUsuario.Visible = true;
                DropDownList1.Items.Add("-");



                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                String str = "SELECT mensaje FROM Tema WHERE nombre='" + nombreTema + "'";
                SqlCommand command = new SqlCommand(str, conn);
                SqlDataReader reader = command.ExecuteReader();

                reader.Read();
                tbMensaje.Text = reader["mensaje"].ToString();
                conn.Close();

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                str = "SELECT id_comentario FROM Tema, Comentario WHERE Tema.nombre='" + nombreTema + "' AND Tema.id_tema=Comentario.id_tema";
                command = new SqlCommand(str, conn);
                reader = command.ExecuteReader();

                while (reader.Read())
                {
                    DropDownList1.Items.Add(reader["id_comentario"].ToString());
                }

                conn.Close();
            }

            ListBox1.Items.Clear();
            ListBox2.Items.Clear();
            ListBox3.Items.Clear();
            ListBox4.Items.Clear();
            ListBox5.Items.Clear();
            actualizarListas();
        }
        //BOTON:VOLVER (a Categorias - Esconder temas)
        protected void Button5_Click(object sender, EventArgs e)
        {
            lbTemas_1.Visible = false;
            lbTemas_2.Visible = false;
            lbTemas_3.Visible = false;
            lbTemas_4.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;
            tbMensaje.Visible = false;
            DropDownList1.Visible = false;
            ImageAvatar.Visible = false;
            tbComentario.Visible = false;
            nomUsuario.Visible = false;

            ListBox1.Items.Clear();
            ListBox2.Items.Clear();
            ListBox3.Items.Clear();
            ListBox4.Items.Clear();
            ListBox5.Items.Clear();
            actualizarListas();

            lbTemas_1.Items.Clear();
            lbTemas_2.Items.Clear();
            lbTemas_3.Items.Clear();
            lbTemas_4.Items.Clear();

            DropDownList1.Items.Clear();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id_com = DropDownList1.SelectedValue;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
            conn.Open();
            String str = "SELECT mensaje FROM Comentario WHERE id_comentario='" + id_com + "'";
            SqlCommand command = new SqlCommand(str, conn);
            SqlDataReader reader = command.ExecuteReader();

            reader.Read();
            tbComentario.Text = reader["mensaje"].ToString();
            conn.Close();
            //----
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
            conn.Open();
            str = "SELECT avatar_url, nombre FROM Usuario, Comentario WHERE id_comentario='" + id_com + "' AND Usuario.id_usuario=Comentario.id_usuario";
            command = new SqlCommand(str, conn);
            reader = command.ExecuteReader();

            reader.Read();
            //DropDownList1.Items.Add(reader["id_comentario"].ToString());
            nomUsuario.Text = reader["nombre"].ToString();
            ImageAvatar.ImageUrl = reader["avatar_url"].ToString();
            conn.Close();
        }
    }
}