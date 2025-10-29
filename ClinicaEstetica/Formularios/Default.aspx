<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ClinicaEstetica.Default" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <title>Clínica Estética</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        :root {
            --color-primary: #459DBF;
            --color-accent: #9BB8CB;
            --text-dark: #12202a;
        }

        * { box-sizing: border-box; margin:0; padding:0; }
        html, body { height:100%; width:100%; font-family:"Segoe UI", Roboto, Arial, sans-serif; color:var(--text-dark); overflow-x:hidden; scroll-behavior: smooth; }

        a { text-decoration:none; color:inherit; }

        /* HEADER */
        header.header {
            position: fixed; top:0; left:0; right:0; height:74px;
            display:flex; align-items:center; background:rgba(255,255,255,0.9);
            border-bottom:1px solid rgba(0,0,0,0.08); z-index:90; padding:0 24px;
        }
        .nav-inner { display:flex; align-items:center; justify-content:space-between; width:100%; max-width:1200px; margin:0 auto; }
        .logo { display:flex; align-items:center; gap:12px; font-weight:700; }
        .logo img { width:44px; height:44px; border-radius:10px; }
        .logo .text { display:flex; flex-direction:column; color:var(--text-dark); font-size:14px; }
        nav.main-nav { display:flex; gap:18px; align-items:center; }
        .menu-link { padding:8px 10px; color:var(--text-dark); font-weight:600; font-size:15px; }
        .contact-btn {
            padding:12px 20px; border-radius:28px; border:2px solid var(--color-primary);
            background:transparent; color:var(--color-primary); font-weight:700; cursor:pointer; font-size:15px;
        }
        .contact-btn:hover { background:var(--color-primary); color:#fff; transform:translateY(-2px); }

        /* SECCIONES TIPO DIAPOSITIVA */
        section {
            min-height:100vh;
            padding:120px 6% 80px;
            display:flex; align-items:center; justify-content:center;
        }
        .hero { background:#fdfdfd; justify-content:space-between; }
        .sobre-nosotros { background:#f5f5f5; }
        .servicios { background:#e8eef5; flex-direction:column; text-align:center; }

        /* HERO */
        .hero .left { max-width:520px; display:flex; flex-direction:column; gap:16px; }
        .kicker { display:inline-block; padding:8px 14px; border-radius:999px; background:var(--color-accent); color:#fff; font-weight:700; font-size:15px; opacity:0; transform:translateX(-40px); animation: slideInText 1s forwards; }
        .kicker.delay-1 { animation-delay:0.2s; }
        h1.title { font-size:clamp(2.8rem,5vw,4rem); line-height:1.05; color:var(--color-primary); margin:4px 0; opacity:0; transform:translateX(-40px); animation: slideInText 1s forwards; animation-delay:0.4s; }
        h1.title span { color:var(--color-accent); display:block; font-weight:800; }
        p.lead { font-size:clamp(1.4rem,1.5vw,1.6rem); line-height:1.7; opacity:0; transform:translateX(-40px); animation: slideInText 1s forwards; animation-delay:0.6s; }

        .hero-ctas { display:flex; gap:16px; margin-top:12px; opacity:0; transform:translateX(-40px); animation: slideInText 1s forwards; animation-delay:0.8s; }
        .btn-primary { background:var(--color-primary); color:#fff; padding:14px 24px; border-radius:14px; border:none; font-weight:800; cursor:pointer; font-size:16px; }
        .btn-primary:hover { background:var(--color-accent); }
        .btn-secondary { background:transparent; border:1px solid rgba(0,0,0,0.1); padding:12px 18px; border-radius:12px; font-weight:700; font-size:16px; }

        .hero .right { min-width:360px; display:flex; justify-content:center; }
        .image-placeholder { width:480px; max-width:100%; height:620px; background-image:url('Imagenes/doctor.jpg'); background-size:contain; background-repeat:no-repeat; background-position:center; border-radius:28px; box-shadow:0 20px 60px rgba(0,0,0,0.15); }

        @keyframes slideInText {
            0% { opacity:0; transform:translateX(-40px); }
            100% { opacity:1; transform:translateX(0); }
        }

        /* SOBRE NOSOTROS */
        .sobre-nosotros .container { display:flex; align-items:center; gap:40px; max-width:1200px; width:100%; }
        .sobre-nosotros .left img { width:100%; max-width:500px; border-radius:20px; object-fit:cover; }
        .sobre-nosotros .right { max-width:600px; }
        .sobre-nosotros h2 { font-size:2.5rem; color:var(--color-primary); margin-bottom:16px; }
        .sobre-nosotros p { font-size:1.2rem; line-height:1.7; margin-bottom:24px; }

        /* SERVICIOS */
        .servicios h2 { font-size:2.5rem; margin-bottom:16px; }
        .servicios p { font-size:1.2rem; line-height:1.7; margin-bottom:24px; }

        @media (max-width:980px){
            .hero{flex-direction:column; gap:36px;}
            .hero .left{text-align:center; align-items:center;}
            .hero .right{order:-1;}
            .sobre-nosotros .container{flex-direction:column; text-align:center; gap:24px;}
        }
        @media (max-width:560px){
            header.header{height:64px;}
            .nav-inner{padding:0 12px;}
            h1.title{ font-size:1.8rem;}
            p.lead{ font-size:1.2rem;}
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- HEADER -->
        <header class="header">
            <div class="nav-inner container">
                <div class="logo">
                    <img src="Imagenes/logo.png" alt="Logo Dr. Jorge Ibarra" />
                    <div class="text">
                        <div>Dr. Jorge Ibarra</div>
                        <div style="font-size:12px;">Clínica Médica Estética</div>
                    </div>
                </div>
                <nav class="main-nav">
                    <asp:HyperLink ID="lnkInicio" runat="server" CssClass="menu-link" NavigateUrl="#hero">Inicio</asp:HyperLink>
                    <asp:HyperLink ID="lnkServicios" runat="server" CssClass="menu-link" NavigateUrl="#servicios">Servicios</asp:HyperLink>
                </nav>
            </div>
        </header>

   <section class="hero">
    <div class="left">
        <span class="kicker">Belleza &amp; Medicina</span>
        <h1 class="title">Resalta tu <span>Belleza Natural</span></h1>
        <p class="lead">
            En <strong>Clínica Médica y Estética</strong> encontrarás un entorno profesional que te ofrece un destino acogedor para tu bienestar físico y mental.
        </p>
        <div class="hero-ctas">
            <asp:Button ID="btnSolicitar" runat="server" CssClass="btn-primary" Text="Solicitar cita" OnClick="btnSolicitar_Click" />
            <asp:LinkButton ID="lnkConoce" runat="server" CssClass="btn-secondary" OnClientClick="return false;">Conoce más</asp:LinkButton>
        </div>

        <!-- 🟢 Aquí agregamos el Label para mostrar mensajes -->
        <asp:Label ID="lblDoctor" runat="server" Text="" Visible="false" CssClass="mensaje-doctor"></asp:Label>
    </div>

    <div class="right">
        <div class="image-placeholder"></div>
    </div>
</section>


        <!-- SOBRE NOSOTROS -->
        <section id="sobre-nosotros" class="sobre-nosotros">
            <div class="container">
                <div class="left">
                    <img src="Imagenes/estetica.png" alt="Sobre Nosotros" />
                </div>
                <div class="right">
                    <h2>Sobre Nosotros</h2>
                    <p>
                        En <strong>Clínica Médica y Estética</strong> nos dedicamos a brindar un entorno profesional
                        que combina tecnología avanzada y un equipo altamente calificado para cuidar tu salud y belleza.
                    </p>
                    <asp:Button ID="btnServicios" runat="server" CssClass="btn-primary"
                        OnClientClick="document.querySelector('#servicios').scrollIntoView({ behavior: 'smooth' }); return false;"
                        Text="Servicios" />
                </div>
            </div>
        </section>

        <!-- SERVICIOS -->
        <section id="servicios" class="servicios">
            <h2>Servicios</h2>
            <p>Aquí irán los servicios de la clínica...</p>
        </section>

    </form>

    <script>
        // Animaciones hero
        document.addEventListener("DOMContentLoaded", () => {
            document.querySelectorAll('.hero .kicker, .hero .title, .hero .lead, .hero-ctas').forEach(el => {
                el.style.opacity = '1';
            });
        });
    </script>
</body>
</html>
