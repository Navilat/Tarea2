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
    public partial class Perfil_Otro : System.Web.UI.Page
    {
        public String tipo;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();

                String leer_usuario = "select * from Usuario where id_usuario = "+Convert.ToInt32(Bandeja_Entrada.id_otro)+"";
                SqlCommand command = new SqlCommand(leer_usuario, conn);
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();

                LabelID.Text = Bandeja_Entrada.id_otro;
                LabelNombre.Text = reader["nombre"].ToString();
                LabelFechaNacimiento.Text = reader["fecha_nacimiento"].ToString().Remove(10);
                LabelFechaRegistro.Text = reader["fecha_registro"].ToString().Remove(10);
                LabelSexo.Text = reader["sexo"].ToString();
                ImageAvatar.ImageUrl = reader["avatar_url"].ToString();
                LabelNComentarios.Text = reader["cantidad_comentarios"].ToString();
                

                if (reader["id_grupo"].ToString() == "0")
                {
                    LabelTipoUsuario.Text = "Administrador";
                }
                else if (reader["id_grupo"].ToString() == "1")
                {
                    LabelTipoUsuario.Text = "Moderador";
                }
                else if (reader["id_grupo"].ToString() == "2")
                {
                    LabelTipoUsuario.Text = "Usuario regular";
                }

                conn.Close();

            }
            catch (Exception ex)
            {
            }
        }

        protected void ButtonEditarUsuario_Click(object sender, EventArgs e)
        {
            PanelCambios.Visible = true;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (DropDownListTipo.SelectedItem.Text == "Ususario común")
            {
                tipo = "2";
            }
            else if (DropDownListTipo.SelectedItem.Text == "Moderador")
            {
                tipo = "1";
            }
            else if (DropDownListTipo.SelectedItem.Text == "Administrador")
            {
                tipo = "0";
            }

            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                String update_user = "update Usuario set avatar_url = '" + TextBoxAvatar.Text + "', contraseña = '" + TextBoxPass.Text + "', fecha_nacimiento = '" + TextBoxFecha.Text + "', id_grupo = "+tipo+"  where id_usuario = " + LabelID.Text + "";
                SqlCommand command = new SqlCommand(update_user, conn);
                command.ExecuteNonQuery();

                conn.Close();
                Response.Write("Datos guardados!");

            }
            catch (Exception ex)
            {
            }
        }
    }
}