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
    public partial class Editar_Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                    conn.Open();

                    String select_usuario = "select * from Usuario where nombre = '" + Iniciar_sesion.usuario + "'";
                    SqlCommand command = new SqlCommand(select_usuario, conn);

                    SqlDataReader reader = command.ExecuteReader();
                    reader.Read();

                    String fecha, fecha_final;
                    LabelNombre.Text = reader["nombre"].ToString();
                    LabelID.Text = reader["id_usuario"].ToString();
                    TextBoxAvatar.Text = reader["avatar_url"].ToString();
                    fecha = reader["fecha_nacimiento"].ToString().Remove(10);


                    fecha_final = fecha.Remove(0, 6) + "-" + fecha.Remove(0, 3).Remove(2) + "-" + fecha.Remove(2);
                    TextBoxFecha.Text = fecha_final;



                    conn.Close();
                }
                catch (Exception ex)
                {
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();

                String update_usuario = "update Usuario set avatar_url = '" + TextBoxAvatar.Text + "', contraseña = '" + TextBoxNPass.Text + "', fecha_nacimiento = '" + TextBoxFecha.Text + "' where nombre = '" + Iniciar_sesion.usuario + "'";
                SqlCommand command = new SqlCommand(update_usuario, conn);
                command.ExecuteNonQuery();
                
                conn.Close();
               
            }
            catch (Exception ex)
            {
                Response.Write("ERROR");
            }
        }

       
    }
}