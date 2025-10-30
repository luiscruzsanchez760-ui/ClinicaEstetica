using System;
using System.Web.UI;

namespace ClinicaEstetica
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inicializa el label en blanco
                lblDoctor.Text = "";
            }
        }

        protected void btnContacto_Click(object sender, EventArgs e)
        {
            lblDoctor.Text = "Gracias — en breve nos pondremos en contacto contigo.";
            lblDoctor.Visible = true;
        }

        protected void btnSolicitar_Click(object sender, EventArgs e)
        {
            lblDoctor.Text = "";
            lblDoctor.Visible = true;
        }
    }
}
