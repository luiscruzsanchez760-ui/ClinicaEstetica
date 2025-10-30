<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SobreNosotros.ascx.cs" Inherits="ClinicaEstetica.Formularios.UserControls.SobreNosotros" %>


<section class="sobre-nosotros">
    <div class="container">
        <!-- Imagen izquierda -->
        <div class="left">
            <asp:Image ID="imgSobreNosotros" runat="server" 
                       ImageUrl="~/Imagenes/estetica.png" 
                       AlternateText="Sobre Nosotros" 
                       CssClass="img-fluid" />
        </div>

        <!-- Texto derecha -->
        <div class="right">
            <h2>Sobre Nosotros</h2>
            <p>
                En <strong>Clínica Médica y Estética</strong> nos dedicamos a brindar un entorno profesional
                que combina tecnología avanzada y un equipo altamente calificado para cuidar tu salud y belleza.
            </p>
            <asp:Button ID="btnServicios" runat="server" 
                        CssClass="btn-primary" 
                        Text="Servicios" 
                        OnClick="btnServicios_Click" />
        </div>
    </div>
</section>