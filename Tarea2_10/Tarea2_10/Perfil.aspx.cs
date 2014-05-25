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
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                String select_usuario = "select * from Usuario where nombre = '" + Iniciar_sesion.usuario + "'";
                SqlCommand command = new SqlCommand(select_usuario, conn);

                SqlDataReader reader = command.ExecuteReader();
                reader.Read();
                
                LabelNombre.Text = reader["nombre"].ToString();
                LabelEdad.Text = reader["fecha_nacimiento"].ToString();
                LabelSexo.Text = reader["sexo"].ToString();
                LabelFechaReg.Text = reader["fecha_registro"].ToString();
                LabelNComentarios.Text = reader["cantidad_comentarios"].ToString();

                ImageAvatar.ImageUrl = reader["avatar_url"].ToString();

                if (reader["id_grupo"].ToString() == "0")
                {
                    LabelTipoUser.Text = "Administrador";
                }
                else if (reader["id_grupo"].ToString() == "1")
                {
                    LabelTipoUser.Text = "Moderador";
                }
                else if (reader["id_grupo"].ToString() == "2")
                {
                    LabelTipoUser.Text = "Usuario regular";
                }

                conn.Close();
            }
            catch (Exception ex)
            {

            }
        }

    }
}