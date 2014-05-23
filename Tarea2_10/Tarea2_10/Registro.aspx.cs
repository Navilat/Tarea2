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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                /*
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                String validar_user = "select count(*) from Usuario where nombre = '"+TextBoxNombre.Text+"'";
                SqlCommand command = new SqlCommand(validar_user, conn);
                int contador = Convert.ToInt32(command.ExecuteScalar().ToString());
                if(contador == 1)
                {
                    Response.Write("Nombre de usuario ya existe!");
                }

                conn.Close();
                */
            }
        }

        protected void ButtonFinalizar_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                String contar_user = "select count(*) from Usuario";
                SqlCommand command = new SqlCommand(contar_user, conn);
                int contador2 = Convert.ToInt32(command.ExecuteScalar().ToString());

                conn.Close();

                //----nuevo
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                String validar_user = "select count(*) from Usuario where nombre = '"+TextBoxNombre.Text+"'";
                command = new SqlCommand(validar_user, conn);
                int contador = Convert.ToInt32(command.ExecuteScalar().ToString());
                if(contador == 1)
                {
                    Response.Write("Nombre de usuario ya existe!");
                    conn.Close();
                    return;
                }
                conn.Close();
                //------------

                conn.Open();
                String insertar_usuario = "insert into Usuario (id_usuario, id_grupo, nombre, contraseña, cantidad_comentarios, avatar_url, sexo, fecha_nacimiento, fecha_registro) values ("+contador2+","+2+",'"+TextBoxNombre.Text+"','"+TextBoxContra.Text+"',"+0+",'"+TextBoxAvatar.Text+"','"+DropDownListSexo.SelectedItem.ToString()+"', '"+TextBoxFecha.Text+"', CURRENT_TIMESTAMP)";
                SqlCommand command2 = new SqlCommand(insertar_usuario, conn);
                command2.ExecuteNonQuery();
                Response.Write("REGISTRO COMPLETADO CORRECTAMENTE!");
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("ERROR!");
            }

            
        }
    }
}