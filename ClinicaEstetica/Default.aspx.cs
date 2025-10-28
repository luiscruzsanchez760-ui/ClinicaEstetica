using System;
using System.Web.UI;

namespace MedicalSpaNicaragua
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Si quieres insertar contenido dinámico inicial, hazlo aquí.
            if (!IsPostBack)
            {
                // Ejemplo: establecer texto inicial (opcional)
                lblFeedback.Text = "";
            }
        }

        protected void btnContacto_Click(object sender, EventArgs e)
        {
            // Evento de ejemplo para el botón "Contacto".
            // Aquí simplemente mostramos un mensaje sencillo en la etiqueta lblFeedback.
            lblFeedback.Text = "Gracias — en breve nos pondremos en contacto contigo.";
            lblFeedback.Visible = true;

            // Alternativamente podrías redirigir a una página de contacto:
            // Response.Redirect("~/Contacto.aspx");
        }

        protected void btnSolicitar_Click(object sender, EventArgs e)
        {
            // Evento de ejemplo para solicitar cita.
            lblFeedback.Text = "Solicitud de cita enviada (ejemplo).";
            lblFeedback.Visible = true;
        }
    }
}
