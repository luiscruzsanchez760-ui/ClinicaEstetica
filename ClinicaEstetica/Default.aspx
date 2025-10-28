<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MedicalSpaNicaragua.Default" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <title>Medical Spa Nicaragua - Inicio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        /* =========================
           VARIABLES DE COLOR
           ========================= */
        :root{
            --teal-shape: #5dc4c2; /* color forma geométrica detrás de la modelo */
            --button-border: #5a458b; /* borde del botón contacto */
            --leaf-green: #3f7a2b; /* hoja decorativa */
            --bg: #fafafa;
            --text-dark: #12202a;
        }

        /* =========================
           RESET Y BASE
           ========================= */
        *{box-sizing:border-box;margin:0;padding:0;}
        html,body{height:100%;font-family:"Segoe UI",Roboto,Arial,sans-serif;background:var(--bg);color:var(--text-dark);}
        a{text-decoration:none;color:inherit;}
        .container{max-width:1200px;margin:0 auto;padding:0 24px;}

        /* =========================
           HEADER / NAV
           ========================= */
        header.header{
            position:fixed; top:0; left:0; right:0; height:74px;
            display:flex; align-items:center;
            background:rgba(255,255,255,0.85);
            backdrop-filter:blur(6px);
            border-bottom:1px solid rgba(0,0,0,0.04);
            z-index:60;
        }
        .nav-inner{display:flex;align-items:center;justify-content:space-between;width:100%;max-width:1200px;margin:0 auto;padding:0 20px;}
        .logo{display:flex;align-items:center;gap:12px;font-weight:700;letter-spacing:0.2px;}
        .logo img{
            width:44px;
            height:44px;
            border-radius:10px;
        }
        nav.main-nav{display:flex;gap:18px;align-items:center;}
        .menu-link{padding:8px 10px;color:#24343a;font-weight:600;}
        .menu-link:hover{opacity:0.85;}
        .contact-btn{
            padding:10px 18px;border-radius:28px;border:2px solid var(--button-border);
            background:transparent;color:var(--button-border);
            font-weight:700;cursor:pointer;transition:all .18s ease;
        }
        .contact-btn:hover{background:var(--button-border);color:white;transform:translateY(-2px);}

        /* =========================
           HERO SECTION
           ========================= */
        .hero{
            display:grid;
            grid-template-columns:1fr 1fr;
            align-items:center;
            gap:30px;
            min-height:100vh;
            padding-top:120px; /* espacio para header fijo */
            position:relative;
            overflow:hidden;
        }

        /* HERO IZQUIERDO - TEXTO */
        .left{padding:36px 12px;z-index:10;max-width:620px;}
        .kicker{display:inline-block;padding:6px 12px;border-radius:999px;
                background:rgba(93,196,194,0.12);color:var(--teal-shape);
                font-weight:700;margin-bottom:18px;font-size:13px;}
        h1.title{font-size:48px;line-height:1.02;margin-bottom:18px;color:#0f2a2b;}
        p.lead{font-size:18px;color:#3a4a50;margin-bottom:26px;}
        .hero-ctas{display:flex;gap:14px;align-items:center;}
        .btn-primary{background:linear-gradient(90deg,var(--teal-shape),#3bb5b2);border:none;
                     color:white;padding:12px 20px;border-radius:12px;font-weight:800;cursor:pointer;}
        .btn-secondary{background:transparent;border:1px solid rgba(18,32,42,0.08);
                       color:#223;padding:10px 16px;border-radius:10px;font-weight:700;cursor:pointer;}

        /* HERO DERECHO - IMAGEN + MÁSCARA + HOJA */
        .right{position:relative;height:640px;display:flex;align-items:center;justify-content:center;min-width:360px;}
        .shape-teal{
            position:absolute;right:-8%;width:720px;height:720px;
            background:linear-gradient(180deg,var(--teal-shape),#3bb5b2);
            border-radius:50%;transform:translateY(-10%);z-index:2;
            filter:drop-shadow(0 30px 50px rgba(45,112,110,0.12));
        }
        .image-wrap{position:relative;width:520px;height:620px;max-width:86%;z-index:8;}
        .photo{
            width:100%;height:100%;background-size:cover;background-position:center;
            border-radius:22px;
            clip-path:path('M520 0 H150 C110 0 40 60 20 140 C0 220 -10 360 60 420 C140 480 40 620 0 620 H520 Z');
            box-shadow:0 30px 80px rgba(20,40,50,0.12);
        }
        @supports not (clip-path: path('M0 0')){
            .photo{clip-path:circle(60% at 70% 40%);}
        }
        .leaf{position:absolute;z-index:10;right:12%;top:46%;width:260px;height:320px;
              transform:translate(20%,-18%) rotate(-8deg);}
        .decor-dots{position:absolute;top:16%;left:8%;width:90px;height:90px;
                    background:radial-gradient(circle at 30% 30%,rgba(255,255,255,0.14),transparent 40%);
                    border-radius:50%;z-index:3;opacity:0.9;}
        .hero-foot{position:relative;z-index:1;width:100%;height:80px;margin-top:-20px;
                   background:linear-gradient(180deg,transparent,rgba(250,250,250,0.9));}

        /* =========================
           RESPONSIVE
           ========================= */
        @media(max-width:980px){
            .hero{grid-template-columns:1fr;padding-top:100px;gap:18px;}
            .right{order:-1;height:520px;margin-top:-36px;}
            .image-wrap{width:86%;height:460px;}
            h1.title{font-size:36px;}
        }
        @media(max-width:560px){
            header.header{height:64px;}
            .logo .text{display:none;}
            .nav-inner{padding:0 14px;}
            .hero{padding-top:86px;}
            h1.title{font-size:28px;}
            .image-wrap{height:360px;}
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- =========================
     HEADER / LOGO
     ========================= -->
<header class="header">
    <div class="nav-inner container">

        <!-- LOGO COMO IMAGEN -->
        <div class="logo" runat="server" id="pnlLogo">
            <!-- Reemplaza la URL con tu imagen de logo -->
            <img src="Imagenes/logo.png" alt="Logo Dr. Jorge Ibarra" />

            <!-- Texto al lado del logo -->
            <div class="text">
                <div style="font-size:14px;color:#567171;line-height:1;">Dr. Jorge Ibarra</div>
                <div style="font-size:12px;color:#5b6b6c;margin-top:2px;">Clinica Medica Estetica</div>
            </div>
        </div>

        <!-- MENÚ DE NAVEGACIÓN -->
        <nav class="main-nav" runat="server" id="pnlNav">
            <asp:HyperLink ID="lnkInicio" runat="server" CssClass="menu-link" NavigateUrl="~/">Inicio</asp:HyperLink>
            <asp:HyperLink ID="lnkSpa" runat="server" CssClass="menu-link" NavigateUrl="~/spa">Spa</asp:HyperLink>
            <asp:HyperLink ID="lnkMedicos" runat="server" CssClass="menu-link" NavigateUrl="~/servicios-medicos">Servicios Médicos</asp:HyperLink>
            <asp:HyperLink ID="lnkBlog" runat="server" CssClass="menu-link" NavigateUrl="~/blog">Blog</asp:HyperLink>
            &nbsp;&nbsp;
            <!-- Botón Contacto -->
            <asp:Button ID="btnContacto" runat="server" Text="Contacto" CssClass="contact-btn" OnClick="btnContacto_Click" />
        </nav>
    </div>
</header>


        <!-- =========================
             HERO SECTION
             ========================= -->
        <main class="hero container" runat="server" id="pnlHero">
            <!-- HERO IZQUIERDO: TEXTO -->
            <section class="left" runat="server">
                <span class="kicker">Belleza &amp; Medicina</span>
                <h1 class="title">Renueva tu piel<br />y tu confianza</h1>
                <p class="lead">
                    Tratamientos médicos estéticos con tecnología avanzada y un equipo profesional que cuida tu salud y belleza.
                </p>
                <div class="hero-ctas">
                    <asp:Button ID="btnSolicitar" runat="server" CssClass="btn-primary" Text="Solicitar cita" OnClick="btnSolicitar_Click" />
                    <asp:LinkButton ID="lnkConoce" runat="server" CssClass="btn-secondary" OnClientClick="return false;">Conoce más</asp:LinkButton>
                </div>
            </section>

            <!-- HERO DERECHO: IMAGEN + MÁSCARA + HOJA -->
            <aside class="right">
                <div class="shape-teal"></div>
                <div class="image-wrap">
                    <!-- IMAGEN MODELO: reemplaza URL según tu carpeta "imagenes" -->
                    <div class="photo" style="background-image:url('Imagenes/clinica.png');"></div>
                    <!-- SVG hoja decorativa -->
                    <svg class="leaf" viewBox="0 0 200 300" xmlns="http://www.w3.org/2000/svg">
                        <path d="M40 260 C38 210 80 170 102 140" stroke="#2f5b20" stroke-width="3" fill="none" opacity="0.9"/>
                        <g transform="translate(40,20)">
                            <path d="M80 20 C40 30 10 90 40 140 C70 190 140 210 160 180 C180 150 120 80 80 20Z" fill="var(--leaf-green)" opacity="0.95"/>
                            <path d="M120 10 C80 40 90 110 80 140 C70 170 120 200 150 180 C175 164 160 120 120 10Z" fill="#2f7a2a" opacity="0.55"/>
                            <path d="M90 30 C85 70 85 100 85 140" stroke="#2b5e1e" stroke-width="2" fill="none" opacity="0.6"/>
                        </g>
                    </svg>
                    <div class="decor-dots"></div>
                </div>
            </aside>
            <div class="hero-foot"></div>
        </main>

        <!-- LABEL FEEDBACK -->
        <asp:Label ID="lblFeedback" runat="server" Text="" Visible="false"
            style="position:fixed;bottom:18px;left:18px;background:#fff;padding:12px;
            border-radius:8px;box-shadow:0 8px 30px rgba(0,0,0,0.08);"></asp:Label>

    </form>
</body>
</html>
