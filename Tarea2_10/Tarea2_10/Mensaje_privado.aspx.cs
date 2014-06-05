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
        int id_mensaje, leido_noleido;
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
                id_mensaje = Convert.ToInt32(reader["id_mensaje"]);
                leido_noleido = Convert.ToInt32(reader["leido"]);

                conn.Close();
            }
            catch (Exception ex)
            {
            }
            if (!IsPostBack)
            {
                try
                {
                    if (leido_noleido == 0)
                    {
                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                        conn.Open();

                        String mensaje_leido = "update Mensaje_privado set leido = 1 where id_mensaje = " + id_mensaje + "";
                        SqlCommand command = new SqlCommand(mensaje_leido, conn);
                        command.ExecuteNonQuery();

                        conn.Close();
                    }

                }
                catch (Exception ex)
                {
                }
            }
        }

        protected void ButtonResponder_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                String contar_mensajes = "select count(*) from Mensaje_privado";
                SqlCommand command = new SqlCommand(contar_mensajes, conn);
                int contador = Convert.ToInt32(command.ExecuteScalar().ToString());
                conn.Close();

                conn.Open();
                String enviar_mensaje = "insert into Mensaje_privado (id_mensaje, id_remitente, id_buzon, leido, mensaje, asunto, fecha_de_envio) values (" + contador + ", " + Bandeja_Entrada.id_usuario + ", " + Bandeja_Entrada.id_destino + ", " + 0 + ", '" + TextBoxEM.Text + "', '" + LabelAsunto.Text + "', CURRENT_TIMESTAMP)";
                command = new SqlCommand(enviar_mensaje, conn);
                command.ExecuteNonQuery();
                Response.Write("Mensaje enviado!");
                Panel1.Visible = false;
                ButtonVolver.Visible = true;

                conn.Close();
            }
            catch (Exception ex)
            {
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bandeja_Entrada.aspx");
        }
    }
}