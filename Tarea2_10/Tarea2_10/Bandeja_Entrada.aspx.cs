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
    public partial class Bandeja_Entrada : System.Web.UI.Page
    {
        static string id_usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();

                String select_id_usuario = "select * from Usuario where nombre = '"+Iniciar_sesion.usuario+"'";
                SqlCommand command = new SqlCommand(select_id_usuario,conn);

                SqlDataReader reader = command.ExecuteReader();
                reader.Read();

                id_usuario = reader["id_usuario"].ToString();

                conn.Close();

            }
            catch (Exception ex)
            {
            }


            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();

                String contar_mensajes = "select * from Buzon_Entrada where id_usuario = '"+id_usuario+"'";
                SqlCommand command = new SqlCommand(contar_mensajes, conn);

                SqlDataReader reader = command.ExecuteReader();
                reader.Read();

                LabelN_mensajes.Text = reader["mensajes"].ToString();
                LabelMensajes_SL.Text = reader["mensajes_sin_leer"].ToString();

                conn.Close();

            }
            catch (Exception ex)
            {
            }
        }
    }
}