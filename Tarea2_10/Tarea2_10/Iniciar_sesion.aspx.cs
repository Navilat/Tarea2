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
    public partial class Iniciar_sesion : System.Web.UI.Page
    {
        public static string usuario;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonIniciar_sesion_Click(object sender, EventArgs e)
        {
            try
            {
                usuario = TextBoxUN.Text;
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistroConnectionString"].ConnectionString);
                conn.Open();
                int contador;
                String validar = "Select count(*) from Usuario where nombre = '"+TextBoxUN.Text+"' and contraseña = '"+TextBoxPASS.Text+"'";
                SqlCommand command = new SqlCommand(validar, conn);
                contador = Convert.ToInt32(command.ExecuteScalar().ToString());

                conn.Close();

                if(contador == 0)
                {
                    Response.Write("Nombre de usuario no existente!\n");
                }
                else if(contador == 1)
                {
                    Response.Redirect("Pagina_principal.aspx"); 
                }

            }
            catch(Exception ex){

            }
        }
    }
}