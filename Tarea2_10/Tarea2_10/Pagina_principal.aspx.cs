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
    public partial class Pagina_principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserLink.Text = Iniciar_sesion.usuario;
            
        }
    }
}