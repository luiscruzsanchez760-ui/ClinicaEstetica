<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SobreNosotros.ascx.cs" Inherits="ClinicaEstetica.Formularios.UserControls.SobreNosotros" %>

<style>
    .sobre-nosotros {
        min-height: 100vh; /* Pantalla completa */
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 80px 6%;
        scroll-snap-align: start; /* Para scroll tipo diapositiva */
        background: #f5f5f5;
    }

    .sobre-nosotros .container {
        display: flex;
        align-items: center;
        gap: 40px;
        max-width: 1200px;
        width: 100%;
        justify-content: center; /* Centrar contenido horizontalmente */
    }

    .sobre-nosotros .left-img {
    width: 100%;
    max-width: 500px;
    border-radius: 20px;
    object-fit: cover;
    display: block;
    margin: 0 auto; /* Centra la imagen */
}

    .sobre-nosotros .right {
        max-width: 600px;
    }

    .sobre-nosotros h2 {
        font-size: 2.5rem;
        color: #459DBF; /* color primary */
        margin-bottom: 16px;
        text-align: center;
    }

    .sobre-nosotros p {
        font-size: 1.2rem;
        line-height: 1.7;
        margin-bottom: 24px;
        text-align: center;
    }

    .btn-primary {
        background:#459DBF;
        color:#fff;
        padding:14px 24px;
        border-radius:14px;
        border:none;
        font-weight:800;
        cursor:pointer;
        font-size:16px;
        display: block;
        margin: 0 auto; /* Centra el botón */
    }
    .btn-primary:hover {
        background:#9BB8CB;
    }

    @media (max-width:980px){
        .sobre-nosotros .container{
            flex-direction: column;
            gap: 24px;
        }
        .sobre-nosotros .right, 
        .sobre-nosotros .left img{
            text-align: center;
            margin: 0 auto;
        }
    }
</style>

<section class="sobre-nosotros">
    <div class="container">
    <!-- Imagen izquierda -->
  <div class="left">
    <asp:Image ID="imgSobreNosotros" runat="server" ImageUrl="~/Imagenes/estetica.png" AlternateText="Sobre Nosotros" CssClass="img-fluid" />
</div>



    <!-- Texto derecha -->
    <div class="right">
        <h2>Sobre Nosotros</h2>
        <p>
            En <strong>Clínica Médica y Estética</strong> nos dedicamos a brindar un entorno profesional
            que combina tecnología avanzada y un equipo altamente calificado para cuidar tu salud y belleza.
        </p>
        <asp:Button ID="btnServicios" runat="server" CssClass="btn-primary" Text="Servicios" OnClick="btnServicios_Click" />
    </div>
</div>

    
</section>
