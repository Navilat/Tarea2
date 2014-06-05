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
    public partial class Mensaje_privado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelAsunto.Text = Bandeja_Entrada.asunto;
            try
            {

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();

                String nombre_remitente = "select * from Usuario where id_usuario = "+Convert.ToInt32(Bandeja_Entrada.id_destino)+"";
                SqlCommand command = new SqlCommand(nombre_remitente, conn);
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();
                LabelNombre.Text = reader["nombre"].ToString();

                conn.Close();
            }
            catch (Exception ex)
            {
            }

            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();

                String leer_mensaje = "select * from Mensaje_privado where id_remitente = "+Convert.ToInt32(Bandeja_Entrada.id_destino)+" and asunto = '"+Bandeja_Entrada.asunto+"'";
                SqlCommand command = new SqlCommand(leer_mensaje, conn);
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();
                LabelFecha.Text = reader["fecha_de_envio"].ToString();
                TextBoxMensaje.Text = reader["mensaje"].ToString();

                conn.Close();
            }
            catch (Exception ex)
            {
            }
        }

        protected void ButtonResponder_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }
    }
}