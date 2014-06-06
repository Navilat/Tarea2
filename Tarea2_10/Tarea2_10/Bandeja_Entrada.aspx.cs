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
        public static string id_usuario, id_destino, asunto, id_otro;
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

                if (!IsPostBack)
                {
                    conn.Open();
                    String mensajes = "select * from Mensaje_privado where id_buzon = " + id_usuario + "";
                    command = new SqlCommand(mensajes, conn);
                    reader = command.ExecuteReader();
                    int leido;
                    while (reader.Read())
                    {

                        ListBoxRemitente.Items.Add(reader["id_remitente"].ToString());
                        ListBoxAsunto.Items.Add(reader["asunto"].ToString());
                        ListBoxFecha.Items.Add(reader["fecha_de_envio"].ToString());
                        leido = Convert.ToInt32(reader["leido"]);
                        if (leido == 0)
                        {
                            ListBoxLeido.Items.Add("NO");
                        }
                        else if (leido == 1)
                        {
                            ListBoxLeido.Items.Add("SI");
                        }

                    }
                    conn.Close();
                }
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
                ListBoxAsunto.Rows = Convert.ToInt32(LabelN_mensajes.Text);
                ListBoxFecha.Rows = Convert.ToInt32(LabelN_mensajes.Text);
                ListBoxRemitente.Rows = Convert.ToInt32(LabelN_mensajes.Text);
                ListBoxLeido.Rows = Convert.ToInt32(LabelN_mensajes.Text);
                ListBoxRemitenteNombre.Rows = Convert.ToInt32(LabelN_mensajes.Text);

                conn.Close();

            }
            catch (Exception ex)
            {
            }

            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                //conn.Open();
                String buscar_nombre;
                SqlCommand command;
                SqlDataReader reader;
                foreach (var i in ListBoxRemitente.Items)
                {
                    conn.Open();
                    buscar_nombre = "select * from Usuario where id_usuario = "+Convert.ToInt32(i)+"";
                    command = new SqlCommand(buscar_nombre, conn);
                    reader = command.ExecuteReader();
                    reader.Read();
                    ListBoxRemitenteNombre.Items.Add(reader["nombre"].ToString());
                    conn.Close();
                }
                //conn.Close();

            }
            catch (Exception ex)
            {
            }
        }

        protected void ButtonRedactar_Click(object sender, EventArgs e)
        {
            PanelMensaje.Visible = true;
        }

        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                String buscar_id_destinatario = "select * from Usuario where nombre = '" + TextBoxPara.Text + "'";
                SqlCommand command = new SqlCommand(buscar_id_destinatario, conn);
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();
                id_destino = reader["id_usuario"].ToString();
                conn.Close();

                conn.Open();
                String contar_mensajes = "select count(*) from Mensaje_privado";
                command = new SqlCommand(contar_mensajes, conn);
                int contador = Convert.ToInt32(command.ExecuteScalar().ToString());
                conn.Close();

                conn.Open();
                String enviar_mensaje = "insert into Mensaje_privado (id_mensaje, id_remitente, id_buzon, leido, mensaje, asunto, fecha_de_envio) values (" + contador + ", " + id_usuario + ", " + id_destino + ", " + 0 + ", '" + TextBoxMensaje.Text + "', '" + TextBoxAsunto.Text + "', CURRENT_TIMESTAMP)";
                command = new SqlCommand(enviar_mensaje, conn);
                command.ExecuteNonQuery();
                Response.Write("Mensaje enviado!");
                PanelMensaje.Visible = false;

                conn.Close();
            }
            catch (Exception ex)
            {
            }
        }

        protected void ButtonVerMensaje_Click(object sender, EventArgs e)
        {
            String indice = ListBoxAsunto.SelectedIndex.ToString();
            asunto = ListBoxAsunto.SelectedItem.ToString();
            int i = 0;
            foreach(var item in ListBoxRemitente.Items){
                
                if (i == Convert.ToInt32(indice))
                {
                    id_destino = item.ToString();
                }
                i++;
            }
            //Response.Write(id_destino);
            Response.Redirect("Mensaje_privado.aspx");
        }

        protected void ButtonVerPerfil_Click(object sender, EventArgs e)
        {
            id_otro = ListBoxRemitente.SelectedItem.Text;
            Response.Redirect("Perfil_Otro.aspx");
        }

       
    }
}