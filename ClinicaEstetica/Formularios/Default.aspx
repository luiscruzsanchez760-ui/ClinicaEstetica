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
            --bg-light: #f8fafb;
            --bg-pattern: rgba(69, 157, 191, 0.08);
            --bg-accent-pattern: rgba(155, 184, 203, 0.06);
            --whatsapp: #25D366;
            --instagram: #E4405F;
            --facebook: #1877F2;
        }

        * { box-sizing: border-box; margin:0; padding:0; }
        html, body { height:100%; width:100%; font-family:"Segoe UI", Roboto, Arial, sans-serif; color:var(--text-dark); overflow-x:hidden; scroll-behavior: smooth; }

        a { text-decoration:none; color:inherit; }

        /* FONDO PRINCIPAL - Más visible */
        body {
            background: linear-gradient(135deg, #f8fafb 0%, #ffffff 50%, #f0f7fa 100%);
            position: relative;
            min-height: 100vh;
        }

        /* Patrón de puntos médicos - Más visible */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(circle at 20% 30%, var(--bg-pattern) 0%, transparent 50%),
                radial-gradient(circle at 80% 70%, var(--bg-accent-pattern) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, var(--bg-pattern) 0%, transparent 40%),
                radial-gradient(circle at 90% 20%, var(--bg-accent-pattern) 0%, transparent 45%);
            background-size: 600px 600px, 500px 500px, 550px 550px, 700px 700px;
            background-position: 0% 0%, 100% 100%, 50% 50%, 0% 100%;
            background-repeat: repeat;
            pointer-events: none;
            z-index: -1;
        }

        /* Formas orgánicas - Más visibles */
        .organic-shape {
            position: fixed;
            border-radius: 50%;
            pointer-events: none;
            z-index: -1;
        }

        .shape-1 {
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(69, 157, 191, 0.1) 0%, rgba(69, 157, 191, 0.02) 70%, transparent 100%);
            top: -150px;
            right: -150px;
            filter: blur(60px);
        }

        .shape-2 {
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(155, 184, 203, 0.08) 0%, rgba(155, 184, 203, 0.02) 70%, transparent 100%);
            bottom: -100px;
            left: -100px;
            filter: blur(50px);
        }

        .shape-3 {
            width: 350px;
            height: 350px;
            background: radial-gradient(circle, rgba(69, 157, 191, 0.06) 0%, rgba(69, 157, 191, 0.01) 70%, transparent 100%);
            top: 40%;
            left: 5%;
            filter: blur(40px);
        }

        /* Patrón de puntos - Más visible */
        .medical-dots {
            position: fixed;
            width: 100%;
            height: 100%;
            background-image: radial-gradient(var(--color-accent) 1.5px, transparent 1.5px);
            background-size: 30px 30px;
            opacity: 0.15;
            pointer-events: none;
            z-index: -1;
        }

        /* Líneas curvas - Más visibles */
        .curved-lines {
            position: fixed;
            width: 100%;
            height: 100%;
            opacity: 0.08;
            pointer-events: none;
            z-index: -1;
            background-image: 
                url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,50 Q25,30 50,50 T100,50' stroke='%23459DBF' stroke-width='1' fill='none'/%3E%3C/svg%3E"),
                url("data:image/svg+xml,%3Csvg width='150' height='150' viewBox='0 0 150 150' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0,75 Q37.5,50 75,75 T150,75' stroke='%239BB8CB' stroke-width='1' fill='none'/%3E%3C/svg%3E");
            background-size: 150px 150px, 200px 200px;
            background-position: 0 0, 75px 75px;
            background-repeat: repeat;
        }

        /* HEADER */
        header.header {
            position: fixed; top:0; left:0; right:0; height:74px;
            display:flex; align-items:center; background:rgba(255,255,255,0.95);
            border-bottom:1px solid rgba(0,0,0,0.08); z-index:90; padding:0 24px;
            backdrop-filter: blur(10px);
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

        /* SECCIONES */
        section {
            min-height:100vh;
            padding:120px 6% 80px;
            display:flex; align-items:center; justify-content:center;
            position: relative;
        }
        .hero { background:linear-gradient(135deg, rgba(255,255,255,0.8) 0%, rgba(248,250,251,0.8) 100%); justify-content:space-between; }
        .sobre-nosotros { background:linear-gradient(135deg, rgba(245,245,245,0.8) 0%, rgba(255,255,255,0.8) 100%); }
        .servicios { background:linear-gradient(135deg, rgba(232,238,245,0.8) 0%, rgba(255,255,255,0.8) 100%); flex-direction:column; text-align:center; }
        .equipos { background:linear-gradient(135deg, rgba(245,250,255,0.8) 0%, rgba(255,255,255,0.8) 100%); flex-direction:column; text-align:center; }
        .catalogo { background:linear-gradient(135deg, rgba(240,248,255,0.8) 0%, rgba(255,255,255,0.8) 100%); flex-direction:column; text-align:center; }
        .mision-vision { background:linear-gradient(135deg, rgba(245,248,250,0.8) 0%, rgba(255,255,255,0.8) 100%); flex-direction:column; text-align:center; }
        .redes-sociales { background:linear-gradient(135deg, rgba(240,245,250,0.8) 0%, rgba(255,255,255,0.8) 100%); flex-direction:column; text-align:center; }
        .contacto { background:linear-gradient(135deg, rgba(240,248,255,0.8) 0%, rgba(255,255,255,0.8) 100%); flex-direction:column; text-align:center; }
        .agendar-cita { background:linear-gradient(135deg, rgba(69, 157, 191, 0.1) 0%, rgba(155, 184, 203, 0.1) 100%); flex-direction:column; text-align:center; }

        /* Decoración adicional para secciones */
        section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: 
                radial-gradient(circle at 10% 20%, rgba(69, 157, 191, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 90% 80%, rgba(155, 184, 203, 0.04) 0%, transparent 50%);
            pointer-events: none;
            z-index: -1;
        }

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
        .image-placeholder { 
            width:480px; 
            max-width:100%; 
            height:620px; 
            background-image:url('Imagenes/doctor.jpg'); 
            background-size:contain; 
            background-repeat:no-repeat; 
            background-position:center; 
            border-radius:28px; 
            box-shadow:0 20px 60px rgba(0,0,0,0.15);
            opacity: 0;
            transform: translateX(40px);
            animation: slideInImage 1s forwards;
            animation-delay: 0.6s;
        }

        @keyframes slideInText {
            0% { opacity:0; transform:translateX(-40px); }
            100% { opacity:1; transform:translateX(0); }
        }

        @keyframes slideInImage {
            0% { opacity:0; transform:translateX(40px); }
            100% { opacity:1; transform:translateX(0); }
        }

        /* ANIMACIONES DE SCROLL - Repetibles */
        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.8s ease, transform 0.8s ease;
        }

        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* SOBRE NOSOTROS */
        .sobre-nosotros .container { display:flex; align-items:center; gap:40px; max-width:1200px; width:100%; }
        .sobre-nosotros .left img { width:100%; max-width:500px; border-radius:20px; object-fit:cover; }
        .sobre-nosotros .right { max-width:600px; }
        .sobre-nosotros h2 { font-size:clamp(2.8rem,5vw,4rem); line-height:1.05; color:var(--color-primary); margin-bottom:16px; }
        .sobre-nosotros p { font-size:clamp(1.4rem,1.5vw,1.6rem); line-height:1.7; margin-bottom:24px; }

        /* =========================
   QUÉ NOS HACE DIFERENTES
========================= */
.diferentes {
    background: linear-gradient(135deg, rgba(255,255,255,0.85) 0%, rgba(248,250,251,0.85) 100%);
    flex-direction: column;
    text-align: center;
    padding: 100px 20px;
    color: var(--text-dark);
}

.diferentes-container {
    max-width:1200px;
    margin:0 auto;
    padding:40px 20px;
}

.diferentes h1 {
    font-size:clamp(2.8rem,5vw,4rem);
    line-height:1.05;
    color:var(--color-primary);
    margin-bottom:10px;
}

.diferentes h2 {
    font-size:clamp(1.4rem,1.5vw,1.6rem);
    font-weight:normal;
    margin-bottom:30px;
    color:var(--color-accent);
}

.diferentes .intro {
    max-width:800px;
    margin:0 auto 60px auto;
    font-size:clamp(1.4rem,1.5vw,1.6rem);
    line-height:1.7;
}

.fila-caracteristicas {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 50px;
    margin-bottom: 50px;
}

.caracteristica {
    flex: 0 1 30%;
    max-width: 320px;
    padding: 25px;
    text-align: center;
    background: rgba(255,255,255,0.7);
    border-radius: 20px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(69, 157, 191, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.caracteristica:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 40px rgba(69, 157, 191, 0.15);
}

.caracteristica i,
.caracteristica img {
    display: block;
    width: 70px !important;
    height: 70px !important;
    margin: 0 auto 15px;
    object-fit: contain;
    font-size: 3rem;
}

.caracteristica strong {
    display:block;
    font-size:1.3rem;
    margin-bottom:12px;
    color:var(--color-primary);
}

.caracteristica p {
    font-size:1.05rem;
    line-height:1.6;
    margin:0;
}

/* Responsive */
@media (max-width:768px) {
    .caracteristicas-fila {
        flex-direction:column;
        align-items:center;
    }
    .caracteristica {
        max-width:90%;
    }
    
    .caracteristica img {
        width: 60px !important;
        height: 60px !important;
    }
    
    .caracteristica strong {
        font-size:1.2rem;
    }
    
    .caracteristica p {
        font-size:1rem;
    }
}

/* SERVICIOS */
.servicios {
    padding: 80px 20px;
    text-align: center;
    color: var(--text-dark);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.servicios-container {
    max-width: 1200px;
    margin: 0 auto;
}

.servicios h1 {
    font-size:clamp(2.8rem,5vw,4rem);
    line-height:1.05;
    color:var(--color-primary);
    margin-bottom: 0.3em;
    font-weight: 800;
}

.servicios h2 {
    font-size:clamp(1.4rem,1.5vw,1.6rem);
    margin-bottom: 1em;
    font-weight: 700;
    color:var(--color-accent);
}

.servicios .intro {
    max-width: 700px;
    margin: 0 auto 50px auto;
    line-height: 1.7;
    font-size:clamp(1.4rem,1.5vw,1.6rem);
}

.grid-servicios {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 30px;
    justify-items: center;
    align-items: start;
    max-width: 1000px;
    margin: 0 auto;
}

.servicio {
    padding: 20px;
    text-align: center;
    width: 100%;
    max-width: 280px;
    background: rgba(255,255,255,0.7);
    border-radius: 20px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(69, 157, 191, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.servicio:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 40px rgba(69, 157, 191, 0.15);
}

.servicio img {
    width: 220px;
    height: 220px;
    object-fit: cover;
    margin-bottom: 15px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.servicio img:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.15);
}

.servicio strong {
    display: block;
    margin-top: 10px;
    font-size: 1.1rem;
    font-weight: 800;
    color:var(--color-primary);
}

/* Botones de acción para servicios */
.servicio-actions {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 15px;
}

.btn-servicio {
    padding: 8px 12px;
    border-radius: 8px;
    font-size: 0.85rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    border: none;
}

.btn-whatsapp {
    background-color: var(--whatsapp);
    color: white;
}

.btn-whatsapp:hover {
    background-color: #128C7E;
    transform: translateY(-2px);
}

.btn-more {
    background-color: var(--color-primary);
    color: white;
}

.btn-more:hover {
    background-color: var(--color-accent);
    transform: translateY(-2px);
}

/* EQUIPOS */
.equipos {
    padding: 80px 20px;
    text-align: center;
    color: var(--text-dark);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.equipos-container {
    max-width: 1200px;
    margin: 0 auto;
}

.equipos h1 {
    font-size:clamp(2.8rem,5vw,4rem);
    line-height:1.05;
    color:var(--color-primary);
    margin-bottom: 0.3em;
    font-weight: 800;
}

.equipos h2 {
    font-size:clamp(1.4rem,1.5vw,1.6rem);
    margin-bottom: 1em;
    font-weight: 700;
    color:var(--color-accent);
}

.equipos .intro {
    max-width: 700px;
    margin: 0 auto 50px auto;
    line-height: 1.7;
    font-size:clamp(1.4rem,1.5vw,1.6rem);
}

.grid-equipos {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 30px;
    justify-items: center;
    align-items: start;
    max-width: 1000px;
    margin: 0 auto;
}

.equipo {
    padding: 20px;
    text-align: center;
    width: 100%;
    max-width: 280px;
    background: rgba(255,255,255,0.7);
    border-radius: 20px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(69, 157, 191, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.equipo:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 40px rgba(69, 157, 191, 0.15);
}

.equipo img {
    width: 220px;
    height: 220px;
    object-fit: cover;
    margin-bottom: 15px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.equipo img:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.15);
}

.equipo strong {
    display: block;
    margin-top: 10px;
    font-size: 1.1rem;
    font-weight: 800;
    color:var(--color-primary);
}

.equipo p {
    font-size: 0.95rem;
    line-height: 1.5;
    margin-top: 10px;
    color: var(--text-dark);
}

/* CATÁLOGO */
.catalogo {
    padding: 80px 20px;
    text-align: center;
    color: var(--text-dark);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.catalogo-container {
    max-width: 1200px;
    margin: 0 auto;
}

.catalogo h1 {
    font-size:clamp(2.8rem,5vw,4rem);
    line-height:1.05;
    color:var(--color-primary);
    margin-bottom: 0.3em;
    font-weight: 800;
}

.catalogo h2 {
    font-size:clamp(1.4rem,1.5vw,1.6rem);
    margin-bottom: 1em;
    font-weight: 700;
    color:var(--color-accent);
}

.catalogo .intro {
    max-width: 700px;
    margin: 0 auto 50px auto;
    line-height: 1.7;
    font-size:clamp(1.4rem,1.5vw,1.6rem);
}

.catalogo-tabs {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 40px;
}

.catalogo-tab {
    padding: 10px 20px;
    background: rgba(255,255,255,0.7);
    border-radius: 30px;
    font-weight: 600;
    color: var(--text-dark);
    cursor: pointer;
    transition: all 0.3s ease;
    border: 2px solid transparent;
}

.catalogo-tab.active {
    background: var(--color-primary);
    color: white;
    border-color: var(--color-accent);
}

.catalogo-tab:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.catalogo-content {
    display: none;
    animation: fadeIn 0.5s ease;
}

.catalogo-content.active {
    display: block;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.tratamiento {
    background: rgba(255,255,255,0.7);
    border-radius: 20px;
    padding: 30px;
    margin-bottom: 30px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(69, 157, 191, 0.1);
    text-align: left;
}

.tratamiento-header {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
    gap: 20px;
}

.tratamiento-img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.tratamiento-title {
    flex: 1;
}

.tratamiento-title h3 {
    font-size: 1.8rem;
    color: var(--color-primary);
    margin-bottom: 5px;
}

.tratamiento-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
}

.tratamiento-section h4 {
    font-size: 1.2rem;
    color: var(--color-accent);
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.tratamiento-section h4::before {
    content: '•';
    color: var(--color-primary);
    font-size: 1.5rem;
}

.tratamiento-section p, .tratamiento-section ul {
    font-size: 1rem;
    line-height: 1.6;
    margin-bottom: 15px;
}

.tratamiento-section ul {
    padding-left: 20px;
}

.tratamiento-section li {
    margin-bottom: 5px;
}

.tratamiento-actions {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 20px;
}

/* MISIÓN Y VISIÓN */
.mision-vision {
    padding: 80px 20px;
    text-align: center;
    color: var(--text-dark);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.mision-vision-container {
    max-width: 1200px;
    margin: 0 auto;
}

.mision-vision h1 {
    font-size:clamp(2.8rem,5vw,4rem);
    line-height:1.05;
    color:var(--color-primary);
    margin-bottom: 0.3em;
    font-weight: 800;
}

.mision-vision h2 {
    font-size:clamp(1.4rem,1.5vw,1.6rem);
    margin-bottom: 1em;
    font-weight: 700;
    color:var(--color-accent);
}

.mision-vision .intro {
    max-width: 700px;
    margin: 0 auto 50px auto;
    line-height: 1.7;
    font-size:clamp(1.4rem,1.5vw,1.6rem);
}

.mision-vision-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
    gap: 40px;
    max-width: 1000px;
    margin: 0 auto;
}

.mision-vision-card {
    background: rgba(255,255,255,0.7);
    border-radius: 20px;
    padding: 40px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(69, 157, 191, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.mision-vision-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 40px rgba(69, 157, 191, 0.15);
}

.mision-vision-card h3 {
    font-size: 1.8rem;
    color: var(--color-primary);
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.mision-vision-card h3::before {
    content: '✨';
    font-size: 1.5rem;
}

.mision-vision-card.vision h3::before {
    content: '🎯';
}

.mision-vision-card p {
    font-size: 1.1rem;
    line-height: 1.7;
    color: var(--text-dark);
}

/* REDES SOCIALES */
.redes-sociales {
    padding: 80px 20px;
    text-align: center;
    color: var(--text-dark);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.redes-sociales-container {
    max-width: 800px;
    margin: 0 auto;
}

.redes-sociales h1 {
    font-size:clamp(2.8rem,5vw,4rem);
    line-height:1.05;
    color:var(--color-primary);
    margin-bottom: 0.3em;
    font-weight: 800;
}

.redes-sociales h2 {
    font-size:clamp(1.4rem,1.5vw,1.6rem);
    margin-bottom: 1em;
    font-weight: 700;
    color:var(--color-accent);
}

.redes-sociales .intro {
    max-width: 700px;
    margin: 0 auto 50px auto;
    line-height: 1.7;
    font-size:clamp(1.4rem,1.5vw,1.6rem);
}

.redes-sociales-grid {
    display: flex;
    justify-content: center;
    gap: 30px;
    flex-wrap: wrap;
}

.social-card {
    background: rgba(255,255,255,0.7);
    border-radius: 20px;
    padding: 30px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(69, 157, 191, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
    min-width: 250px;
}

.social-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 40px rgba(69, 157, 191, 0.15);
}

.social-icon {
    width: 60px;
    height: 60px;
    margin: 0 auto 20px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.8rem;
    color: white;
}

.social-icon.instagram {
    background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
}

.social-icon.facebook {
    background-color: var(--facebook);
}

.social-card h3 {
    font-size: 1.3rem;
    color: var(--color-primary);
    margin-bottom: 15px;
}

.social-card p {
    font-size: 1rem;
    line-height: 1.5;
    margin-bottom: 20px;
    color: var(--text-dark);
}

.social-link {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 20px;
    border-radius: 25px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    color: white;
}

.social-link.instagram {
    background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
}

.social-link.facebook {
    background-color: var(--facebook);
}

.social-link:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

/* AGENDAR CITA */
.agendar-cita {
    padding: 100px 20px;
    text-align: center;
    color: var(--text-dark);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.agendar-cita-container {
    max-width: 800px;
    margin: 0 auto;
}

.agendar-cita h1 {
    font-size:clamp(2.8rem,5vw,4rem);
    line-height:1.05;
    color:var(--color-primary);
    margin-bottom: 0.3em;
    font-weight: 800;
}

.agendar-cita h2 {
    font-size:clamp(1.4rem,1.5vw,1.6rem);
    margin-bottom: 1em;
    font-weight: 700;
    color:var(--color-accent);
}

.agendar-cita .intro {
    max-width: 700px;
    margin: 0 auto 50px auto;
    line-height: 1.7;
    font-size:clamp(1.4rem,1.5vw,1.6rem);
}

.promo-box {
    background: rgba(255,255,255,0.8);
    border-radius: 25px;
    padding: 40px;
    backdrop-filter: blur(10px);
    box-shadow: 0 15px 50px rgba(69, 157, 191, 0.15);
    border: 2px solid var(--color-accent);
    position: relative;
    overflow: hidden;
}

.promo-box::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle, rgba(69, 157, 191, 0.05) 0%, transparent 70%);
    animation: rotate 20s linear infinite;
}

@keyframes rotate {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
}

.promo-content {
    position: relative;
    z-index: 1;
}

.promo-title {
    font-size: 1.8rem;
    color: var(--color-primary);
    margin-bottom: 20px;
    font-weight: 700;
}

.promo-description {
    font-size: 1.1rem;
    line-height: 1.6;
    margin-bottom: 30px;
    color: var(--text-dark);
}

.whatsapp-cita-button {
    display: inline-flex;
    align-items: center;
    gap: 15px;
    background: linear-gradient(135deg, var(--whatsapp) 0%, #128C7E 100%);
    color: white;
    padding: 18px 40px;
    border-radius: 50px;
    font-size: 1.3rem;
    font-weight: 700;
    text-decoration: none;
    transition: all 0.3s ease;
    box-shadow: 0 10px 30px rgba(37, 211, 102, 0.3);
    position: relative;
    overflow: hidden;
}

.whatsapp-cita-button::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    transition: left 0.5s ease;
}

.whatsapp-cita-button:hover::before {
    left: 100%;
}

.whatsapp-cita-button:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 40px rgba(37, 211, 102, 0.4);
}

.whatsapp-cita-icon {
    width: 35px;
    height: 35px;
}

.promo-benefits {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin-top: 30px;
    flex-wrap: wrap;
}

.benefit-item {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 0.95rem;
    color: var(--color-primary);
    font-weight: 600;
}

.benefit-item::before {
    content: '✓';
    color: var(--whatsapp);
    font-weight: 700;
}

/* CONTACTO WHATSAPP */
.contacto {
    padding: 80px 20px;
    text-align: center;
    color: var(--text-dark);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.contacto-container {
    max-width: 800px;
    margin: 0 auto;
}

.contacto h1 {
    font-size:clamp(2.8rem,5vw,4rem);
    line-height:1.05;
    color:var(--color-primary);
    margin-bottom: 0.3em;
    font-weight: 800;
}

.contacto h2 {
    font-size:clamp(1.4rem,1.5vw,1.6rem);
    margin-bottom: 1em;
    font-weight: 700;
    color:var(--color-accent);
}

.contacto .intro {
    max-width: 700px;
    margin: 0 auto 40px auto;
    line-height: 1.7;
    font-size:clamp(1.4rem,1.5vw,1.6rem);
}

.whatsapp-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 30px;
}

.whatsapp-button {
    display: flex;
    align-items: center;
    gap: 15px;
    background-color: var(--whatsapp);
    color: white;
    padding: 15px 30px;
    border-radius: 50px;
    font-size: 1.2rem;
    font-weight: 700;
    text-decoration: none;
    transition: all 0.3s ease;
    box-shadow: 0 5px 15px rgba(37, 211, 102, 0.3);
}

.whatsapp-button:hover {
    background-color: #128C7E;
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(37, 211, 102, 0.4);
}

.whatsapp-icon {
    width: 30px;
    height: 30px;
}

.whatsapp-qr {
    width: 200px;
    height: 200px;
    background-color: white;
    border-radius: 15px;
    padding: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.contact-info {
    margin-top: 30px;
    font-size: 1.1rem;
    line-height: 1.6;
}

.contact-info p {
    margin-bottom: 10px;
}

/* Responsive */
@media (max-width:992px) {
    .grid-servicios, .grid-equipos {
        grid-template-columns: repeat(2, 1fr);
        gap: 25px;
        max-width: 600px;
    }
    
    .servicio img, .equipo img {
        width: 200px;
        height: 200px;
    }
    
    .tratamiento-header {
        flex-direction: column;
        text-align: center;
    }
    
    .tratamiento-content {
        grid-template-columns: 1fr;
    }
    
    .mision-vision-grid {
        grid-template-columns: 1fr;
        gap: 30px;
    }
}

@media (max-width:768px) {
    .grid-servicios, .grid-equipos {
        grid-template-columns: 1fr;
        gap: 20px;
        max-width: 280px;
    }
    
    .servicio img, .equipo img {
        width: 220px;
        height: 220px;
    }
    
    .catalogo-tabs {
        flex-direction: column;
        align-items: center;
    }
    
    .catalogo-tab {
        width: 80%;
        text-align: center;
    }
    
    .redes-sociales-grid {
        flex-direction: column;
        align-items: center;
    }
    
    .social-card {
        width: 100%;
        max-width: 300px;
    }
    
    .promo-benefits {
        flex-direction: column;
        align-items: center;
        gap: 15px;
    }
    
    .whatsapp-cita-button {
        font-size: 1.1rem;
        padding: 15px 30px;
    }
}

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
    <!-- Elementos decorativos de fondo -->
    <div class="organic-shape shape-1"></div>
    <div class="organic-shape shape-2"></div>
    <div class="organic-shape shape-3"></div>
    <div class="medical-dots"></div>
    <div class="curved-lines"></div>

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
                    <asp:HyperLink ID="lnkCatalogo" runat="server" CssClass="menu-link" NavigateUrl="#catalogo">Catálogo</asp:HyperLink>
                   <a href="#hero" class="menu-link">Inicio</a>
                   <a href="#servicios" class="menu-link">Servicios</a>
                    <asp:HyperLink ID="lnkEquipos" runat="server" CssClass="menu-link" NavigateUrl="#equipos">Equipos</asp:HyperLink>
                    <asp:HyperLink ID="lnkMisionVision" runat="server" CssClass="menu-link" NavigateUrl="#mision-vision">Misión y Visión</asp:HyperLink>
                    <asp:HyperLink ID="lnkRedes" runat="server" CssClass="menu-link" NavigateUrl="#redes-sociales">Redes Sociales</asp:HyperLink>
                    <asp:HyperLink ID="lnkAgendar" runat="server" CssClass="menu-link" NavigateUrl="#agendar-cita">Agendar Cita</asp:HyperLink>
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
            <div class="container fade-in">
                <div class="left fade-in">
                    <img src="Imagenes/estetica.png" alt="Sobre Nosotros" />
                </div>
                <div class="right fade-in">
                    <h2>Sobre Nosotros</h2>
                    <p>
                        En <strong>Clínica Médica y Estética</strong> nos dedicamos a brindar un entorno profesional
                        que combina tecnología avanzada y un equipo altamente calificado para cuidar tu salud y belleza.
                    </p>
                 
                </div>
            </div>
        </section>

       <!-- SECCIÓN: QUÉ NOS HACE DIFERENTES -->
<section class="diferentes">
    <div class="diferentes-container">
        <h1 class="fade-in">Qué nos hace Diferentes</h1>
        <h2 class="fade-in">Nuestra excelencia se refleja en cada detalle</h2>
        <p class="intro fade-in">
            En Medical Spa Nicaragua, cada aspecto de nuestro servicio ha sido diseñado para brindarte bienestar, confianza y resultados visibles. 
            Nos destacamos por nuestra dedicación, profesionalismo y atención humana en cada tratamiento.
        </p>

        <!-- Fila 1 -->
        <div class="fila-caracteristicas">
            <div class="caracteristica fade-in">
                <img src="Imagenes/puntualidad.png" alt="Puntualidad" />
                <strong>Puntualidad</strong>
                <p>Respetamos tu tiempo con un servicio eficiente y bien organizado, valorando cada minuto de tu visita.</p>
            </div>
            <div class="caracteristica fade-in">
                <img src="Imagenes/higiene.png" alt="Higiene" />
                <strong>Higiene</strong>
                <p>Mantenemos estrictos estándares de limpieza en todas nuestras áreas y equipos para tu seguridad.</p>
            </div>
            <div class="caracteristica fade-in">
                <img src="Imagenes/candles.png" alt="Ambientación" />
                <strong>Ambientación</strong>
                <p>Un entorno relajante que promueve la calma, el confort y la renovación durante tu tratamiento.</p>
            </div>
        </div>

        <!-- Fila 2 -->
        <div class="fila-caracteristicas">
            <div class="caracteristica fade-in">
                <img src="Imagenes/especialista.png" alt="Especialistas" />
                <strong>Especialistas</strong>
                <p>Contamos con un equipo médico altamente capacitado y con amplia experiencia en tratamientos estéticos.</p>
            </div>
            <div class="caracteristica fade-in">
                <img src="Imagenes/atencion.png" alt="Atención Personalizada" />
                <strong>Atención Personalizada</strong>
                <p>Diseñamos tratamientos adaptados a tus necesidades y objetivos específicos para resultados óptimos.</p>
            </div>
            <div class="caracteristica fade-in">
                <img src="Imagenes/tecnologia.png" alt="Tecnología Avanzada" />
                <strong>Tecnología Avanzada</strong>
                <p>Utilizamos equipos modernos para garantizar resultados seguros, efectivos y duraderos en cada sesión.</p>
            </div>
        </div>
    </div>
</section>


 <!-- SERVICIOS Y TRATAMIENTOS-->
<section class="servicios">
    <div class="servicios-container">
        <h1 class="fade-in">Servicios y Tratamientos</h1>
        <h2 class="fade-in">Que realzan tu belleza natural</h2>
        <p class="intro fade-in">
            Descubre nuestra amplia gama de tratamientos diseñados para tu cuidado, bienestar y resultados visibles.
        </p>

        <div class="grid-servicios">
            <div class="servicio fade-in">
                <img src="Imagenes/consulta.jpg" alt="Consulta Dermatológica" />
                <strong>Consulta Dermatológica</strong>
                <div class="servicio-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20una%20consulta%20dermatol%C3%B3gica', '_blank')">Estoy Interesado</button>
                    <!-- CAMBIO AQUÍ -->
                    <button type="button" class="btn-servicio btn-more" onclick="showTratamiento('consulta'); return false;">Leer más</button>
                </div>
            </div>
            <div class="servicio fade-in">
                <img src="Imagenes/limpieza_facial.jpg" alt="Limpieza Facial" />
                <strong>Limpieza Facial</strong>
                <div class="servicio-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20una%20limpieza%20facial', '_blank')">Estoy Interesado</button>
                    <!-- CAMBIO AQUÍ -->
                    <button type="button" class="btn-servicio btn-more" onclick="showTratamiento('limpieza'); return false;">Leer más</button>
                </div>
            </div>
            <div class="servicio fade-in">
                <img src="Imagenes/dermapen.png" alt="Dermapen" />
                <strong>Dermapen</strong>
                <div class="servicio-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20un%20tratamiento%20con%20Dermapen', '_blank')">Estoy Interesado</button>
                    <!-- CAMBIO AQUÍ -->
                    <button type="button" class="btn-servicio btn-more" onclick="showTratamiento('dermapen'); return false;">Leer más</button>
                </div>
            </div>
            <div class="servicio fade-in">
                <img src="Imagenes/peeling_quimico.jpg" alt="Peeling Químico" />
                <strong>Peeling Químico</strong>
                <div class="servicio-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20un%20peeling%20qu%C3%ADmico', '_blank')">Estoy Interesado</button>
                    <!-- CAMBIO AQUÍ -->
                    <button type="button" class="btn-servicio btn-more" onclick="showTratamiento('peeling'); return false;">Leer más</button>
                </div>
            </div>
            <div class="servicio fade-in">
                <img src="Imagenes/rellenos_faciales.jpg" alt="Rellenos Faciales" />
                <strong>Rellenos Faciales</strong>
                <div class="servicio-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20rellenos%20faciales', '_blank')">Estoy Interesado</button>
                    <!-- CAMBIO AQUÍ -->
                    <button type="button" class="btn-servicio btn-more" onclick="showTratamiento('acido'); return false;">Leer más</button>
                </div>
            </div>
            <div class="servicio fade-in">
                <img src="Imagenes/lipo_enzimas.png" alt="Lipo Enzimas" />
                <strong>Lipo Enzimas</strong>
                <div class="servicio-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20tratamiento%20con%20lipoenzimas', '_blank')">Estoy Interesado</button>
                    <!-- CAMBIO AQUÍ -->
                    <button type="button" class="btn-servicio btn-more" onclick="showTratamiento('lipo'); return false;">Leer más</button>
                </div>
            </div>
            <div class="servicio fade-in">
                <img src="Imagenes/restauramos_cabello.png" alt="Restauramos Cabello" />
                <strong>Restauramos Cabello</strong>
                <div class="servicio-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20tratamiento%20para%20restaurar%20mi%20cabello', '_blank')">Estoy Interesado</button>
                    <!-- CAMBIO AQUÍ -->
                    <button type="button" class="btn-servicio btn-more" onclick="showTratamiento('cabello'); return false;">Leer más</button>
                </div>
            </div>
            <div class="servicio fade-in">
                <img src="Imagenes/revitalizamos_piel.png" alt="Revitalizamos tu Piel" />
                <strong>Revitalizamos tu Piel</strong>
                <div class="servicio-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20revitalizar%20mi%20piel', '_blank')">Estoy Interesado</button>
                    <!-- CAMBIO AQUÍ -->
                    <button type="button" class="btn-servicio btn-more" onclick="showTratamiento('revitalizar'); return false;">Leer más</button>
                </div>
            </div>
            <div class="servicio fade-in">
                <img src="Imagenes/laseres.png" alt="Laseres" />
                <strong>Laseres</strong>
                <div class="servicio-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20tratamientos%20con%20l%C3%A1ser', '_blank')">Estoy Interesado</button>
                    <!-- CAMBIO AQUÍ -->
                    <button type="button" class="btn-servicio btn-more" onclick="showTratamiento('laser'); return false;">Leer más</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- NUEVA SECCIÓN: EQUIPOS MÉDICOS -->
<section id="equipos" class="equipos">
    <div class="equipos-container">
        <h1 class="fade-in">Equipos de Última Generación</h1>
        <h2 class="fade-in">Tecnología avanzada para resultados excepcionales</h2>
        <p class="intro fade-in">
            Contamos con equipos médicos de vanguardia que garantizan tratamientos seguros, efectivos y con resultados visibles desde la primera sesión.
        </p>

        <div class="grid-equipos">
            <!-- Fila 1 -->
            <div class="equipo fade-in">
                <img src="Imagenes/hydrafacial.jpg" alt="Hydrafacial" />
                <strong>Hydrafacial</strong>
                <p>Sistema de hidrodermoabrasión que limpia, exfolia e hidrata la piel simultáneamente para un rostro radiante.</p>
            </div>
            <div class="equipo fade-in">
                <img src="Imagenes/nd-yag.jpg" alt="Nd-YAG" />
                <strong>Láser Nd-YAG</strong>
                <p>Tecnología láser versátil para tratamientos de rejuvenecimiento, eliminación de tatuajes y lesiones vasculares.</p>
            </div>
            <div class="equipo fade-in">
                <img src="Imagenes/ipl.jpg" alt="IPL" />
                <strong>Fototerapia IPL</strong>
                <p>Luz pulsada intensa para tratar manchas, rosácea, vello no deseado y mejorar la textura general de la piel.</p>
            </div>
            
            <!-- Fila 2 -->
            <div class="equipo fade-in">
                <img src="Imagenes/microdermoabrasion.jpg" alt="Microdermoabrasión" />
                <strong>Microdermoabrasión</strong>
                <p>Exfoliación no invasiva que elimina células muertas, estimula el colágeno y mejora la apariencia de cicatrices.</p>
            </div>
            <div class="equipo fade-in">
                <img src="Imagenes/dermapen-a7.jpg" alt="Dermapen A7" />
                <strong>Dermapen A7</strong>
                <p>Sistema de microneedling de última generación que estimula la producción de colágeno para una piel más firme y joven.</p>
            </div>
            <div class="equipo fade-in">
                <img src="Imagenes/diodo-laser.jpg" alt="Diodo Láser" />
                <strong>Diodo Láser</strong>
                <p>Tecnología láser de alta precisión para eliminación permanente de vello en todas las áreas del cuerpo.</p>
            </div>
        </div>
    </div>
</section>

<!-- NUEVA SECCIÓN: CATÁLOGO DE TRATAMIENTOS -->
<section id="catalogo" class="catalogo">
    <div class="catalogo-container">
        <h1 class="fade-in">Catálogo de Tratamientos</h1>
        <h2 class="fade-in">Conoce en detalle nuestros procedimientos</h2>
        <p class="intro fade-in">
            Explora nuestra completa gama de tratamientos estéticos diseñados para realzar tu belleza natural y mejorar tu bienestar.
        </p>

        <div class="catalogo-tabs fade-in">
            <div class="catalogo-tab active" onclick="showTratamiento('consulta')">Consulta Dermatológica</div>
            <div class="catalogo-tab" onclick="showTratamiento('limpieza')">Limpieza Facial</div>
            <div class="catalogo-tab" onclick="showTratamiento('microdermo')">Microdermoabrasión</div>
            <div class="catalogo-tab" onclick="showTratamiento('hydrafacial')">Hydrafacial</div>
            <div class="catalogo-tab" onclick="showTratamiento('dermapen')">Dermapen</div>
            <div class="catalogo-tab" onclick="showTratamiento('peeling')">Peeling Químico</div>
            <div class="catalogo-tab" onclick="showTratamiento('toxina')">Toxina Botulínica</div>
            <div class="catalogo-tab" onclick="showTratamiento('acido')">Ácido Hialurónico</div>
            <div class="catalogo-tab" onclick="showTratamiento('cabello')">Restauramos Cabello</div>
            <div class="catalogo-tab" onclick="showTratamiento('mesoterapia')">Mesoterapia Capilar</div>
            <div class="catalogo-tab" onclick="showTratamiento('lipo')">Lipoenzimas</div>
            <div class="catalogo-tab" onclick="showTratamiento('laser')">IPL y Nd-YAG</div>
            <div class="catalogo-tab" onclick="showTratamiento('revitalizar')">Revitalizamos Piel</div>
            <div class="catalogo-tab" onclick="showTratamiento('bioestimuladores')">Bioestimuladores de Colágeno</div>
        </div>

        <!-- CONSULTA DERMATOLÓGICA -->
        <div id="consulta" class="catalogo-content active fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/consulta.jpg" alt="Consulta Dermatológica" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Consulta Dermatológica</h3>
                        <p>Evaluación profesional para diagnosticar y tratar condiciones de la piel</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>La consulta dermatológica es una evaluación completa de la piel, cabello y uñas realizada por un especialista para diagnosticar condiciones dermatológicas y diseñar un plan de tratamiento personalizado.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con problemas de piel como acné, rosácea o dermatitis</li>
                            <li>Quienes desean prevenir o tratar signos de envejecimiento</li>
                            <li>Personas con manchas, lunos o lesiones cutáneas</li>
                            <li>Quienes buscan mejorar la salud general de su piel</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Diagnóstico preciso de condiciones dermatológicas</li>
                            <li>Plan de tratamiento personalizado</li>
                            <li>Detección temprana de problemas cutáneos</li>
                            <li>Asesoramiento profesional para el cuidado de la piel</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>El dermatólogo examinará tu piel con luz especial y, si es necesario, con dermatoscopio. Evaluará tu historial médico y estilo de vida para determinar el tratamiento más adecuado para tus necesidades específicas.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20una%20consulta%20dermatol%C3%B3gica', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- LIMPIEZA FACIAL -->
        <div id="limpieza" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/limpieza_facial.jpg" alt="Limpieza Facial" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Limpieza Facial</h3>
                        <p>Tratamiento esencial para mantener la piel sana y radiante</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>La limpieza facial profunda es un tratamiento estético que elimina impurezas, células muertas y exceso de sebo, desobstruyendo los poros y permitiendo que la piel respire correctamente.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Tipos de limpieza facial</h4>
                        <ul>
                            <li>Limpieza facial básica: Eliminación de impurezas superficiales</li>
                            <li>Limpieza facial profunda: Extracción de comedones y puntos negros</li>
                            <li>Limpieza facial con hidratación: Incluye mascarillas nutritivas</li>
                            <li>Limpieza facial con ácidos: Exfoliación química controlada</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Piel más limpia y libre de impurezas</li>
                            <li>Poros desobstruidos y reducidos</li>
                            <li>Mejor absorción de productos cosméticos</li>
                            <li>Rostro más luminoso y saludable</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>El procedimiento incluye desmaquillado, exfoliación, vaporización para abrir poros, extracción de impurezas, aplicación de mascarilla específica según tipo de piel, tónico y protector solar.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20una%20limpieza%20facial', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- MICRODERMOABRASIÓN -->
        <div id="microdermo" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/microdermoabrasion.jpg" alt="Microdermoabrasión" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Microdermoabrasión</h3>
                        <p>Exfoliación avanzada para renovar la piel</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>La microdermoabrasión es un procedimiento no invasivo que utiliza microcristales de diamante para exfoliar la capa superficial de la piel, eliminando células muertas y estimulando la producción de colágeno.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con piel opaca y sin vitalidad</li>
                            <li>Quienes tienen cicatrices superficiales o estrías</li>
                            <li>Personas con poros dilatados o puntos negros</li>
                            <li>Quienes buscan mejorar la textura de la piel</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Piel más suave y luminosa</li>
                            <li>Reducción de líneas finas y arrugas</li>
                            <li>Mejora de cicatrices y manchas</li>
                            <li>Estimulación del colágeno y elastina</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>Se utiliza un dispositivo con una punta de diamante que desliza suavemente sobre la piel, mientras una succión controlada elimina las células muertas. El tratamiento es indoloro y no requiere tiempo de recuperación.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20microdermoabrasi%C3%B3n', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- HYDRAFACIAL -->
        <div id="hydrafacial" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/hydrafacial.jpg" alt="Hydrafacial" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Hydrafacial</h3>
                        <p>Hidrodermoabrasión para una piel hidratada y revitalizada</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>Hydrafacial es un tratamiento revolucionario que combina limpieza, exfoliación, extracción e hidratación en un solo procedimiento. Utiliza tecnología Vortex para infundir sueros nutritivos en la piel.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con piel deshidratada o opaca</li>
                            <li>Quienes tienen poros obstruidos o puntos negros</li>
                            <li>Personas con signos de envejecimiento prematuro</li>
                            <li>Quienes buscan un tratamiento rápido y efectivo</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Piel inmediatamente más hidratada y luminosa</li>
                            <li>Reducción de líneas finas y arrugas</li>
                            <li>Poros limpios y reducidos</li>
                            <li>Mejora de la elasticidad y firmeza</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>El tratamiento consta de varios pasos: limpieza y exfoliación, extracción suave de impurezas mediante succión, e hidratación con sueros personalizados que contienen antioxidantes, péptidos y ácido hialurónico.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20un%20tratamiento%20Hydrafacial', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- DERMAPEN -->
        <div id="dermapen" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/dermapen.png" alt="Dermapen" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Dermapen</h3>
                        <p>Microneedling para rejuvenecer y regenerar la piel</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>El Dermapen es un dispositivo de microneedling que crea microperforaciones controladas en la piel, estimulando la producción natural de colágeno y elastina para regenerar y rejuvenecer el tejido cutáneo.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con cicatrices de acné o quirúrgicas</li>
                            <li>Quienes tienen arrugas y líneas de expresión</li>
                            <li>Personas con poros dilatados o textura irregular</li>
                            <li>Quienes buscan mejorar la firmeza de la piel</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Reducción significativa de cicatrices</li>
                            <li>Disminución de arrugas y líneas finas</li>
                            <li>Mejora de la textura y firmeza de la piel</li>
                            <li>Poros más pequeños y piel más uniforme</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>Se aplica un anestésico tópico, luego el especialista desliza el Dermapen sobre la piel creando microperforaciones. Estas estimulan la respuesta de curación natural del cuerpo, produciendo colágeno y elastina. El tratamiento dura aproximadamente 30-60 minutos.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20un%20tratamiento%20con%20Dermapen', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- PEELING QUÍMICO -->
        <div id="peeling" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/peeling_quimico.jpg" alt="Peeling Químico" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Peeling Químico</h3>
                        <p>Exfoliación controlada para renovar la piel</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>El peeling químico es un tratamiento que utiliza soluciones ácidas para exfoliar las capas superficiales de la piel, eliminando células muertas y estimulando la regeneración celular para una piel más suave y luminosa.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Tipos de peeling</h4>
                        <ul>
                            <li>Peeling superficial: Ácidos suaves para renovación ligera</li>
                            <li>Peeling medio: Ácidos más concentrados para problemas moderados</li>
                            <li>Peeling profundo: Soluciones potentes para casos severos</li>
                            <li>Peeling personalizado: Combinación según necesidades específicas</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Reducción de manchas y pigmentación</li>
                            <li>Disminución de arrugas y líneas finas</li>
                            <li>Mejora de acné y cicatrices</li>
                            <li>Piel más suave, uniforme y luminosa</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>Se limpia la piel, se aplica el ácido seleccionado durante un tiempo determinado según el tipo de peeling, luego se neutraliza y se aplica una crema calmante. El especialista determinará el tipo y concentración adecuados para tu tipo de piel.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20un%20peeling%20qu%C3%ADmico', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- TOXINA BOTULÍNICA -->
        <div id="toxina" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/toxina_botulinica.jpg" alt="Toxina Botulínica" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Toxina Botulínica</h3>
                        <p>Suaviza arrugas y líneas de expresión</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>La toxina botulínica es un tratamiento estético que relaja los músculos faciales responsables de las arrugas dinámicas, suavizando líneas de expresión como las del entrecejo, patas de gallo y frente.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con arrugas dinámicas (entrecejo, frente, patas de gallo)</li>
                            <li>Quienes buscan prevenir la formación de nuevas arrugas</li>
                            <li>Personas que desean un aspecto más descansado y juvenil</li>
                            <li>Quienes prefieren tratamientos no invasivos</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Reducción inmediata de arrugas dinámicas</li>
                            <li>Aspecto más descansado y juvenil</li>
                            <li>Prevención de nuevas líneas de expresión</li>
                            <li>Resultados naturales sin cambiar la expresión facial</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>Se aplica una crema anestésica, luego se realizan pequeñas inyecciones en los músculos faciales seleccionados. El procedimiento dura aproximadamente 15-20 minutos y los resultados comienzan a verse a los 3-5 días.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20tratamiento%20con%20toxina%20botul%C3%ADnica', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- ÁCIDO HIALURÓNICO -->
        <div id="acido" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/acido_hialuronico.png" alt="Ácido Hialurónico" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Ácido Hialurónico</h3>
                        <p>Rellenos faciales para volumen e hidratación</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>El ácido hialurónico es una sustancia natural presente en nuestro organismo que se utiliza como relleno facial para restaurar volumen, suavizar arrugas e hidratar profundamente la piel.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con pérdida de volumen facial</li>
                            <li>Quienes tienen arrugas estáticas y surcos profundos</li>
                            <li>Personas con labios delgados o asimétricos</li>
                            <li>Quienes buscan redefinir contornos faciales</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Restauración inmediata del volumen perdido</li>
                            <li>Suavizado de arrugas y líneas de expresión</li>
                            <li>Hidratación profunda y duradera</li>
                            <li>Resultados naturales y progresivos</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>Se aplica una crema anestésica, luego se inyecta el ácido hialurónico en las áreas a tratar mediante pequeñas punciones. El procedimiento dura entre 30-45 minutos y los resultados son visibles inmediatamente.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20tratamiento%20con%20%C3%A1cido%20hialur%C3%B3nico', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- RESTAURAMOS CABELLO -->
        <div id="cabello" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/restauramos_cabello.jpg" alt="Restauramos Cabello" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Restauramos Cabello</h3>
                        <p>Tratamientos avanzados para la salud capilar</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>Nuestros tratamientos capilares combinan tecnología avanzada y productos especializados para estimular el crecimiento del cabello, fortalecer los folículos y mejorar la salud general del cuero cabelludo.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con caída del cabello</li>
                            <li>Quienes tienen cabello débil o dañado</li>
                            <li>Personas con cuero cabelludo sensible o irritado</li>
                            <li>Quienes buscan mejorar la densidad y volumen del cabello</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Reducción de la caída del cabello</li>
                            <li>Estimulación del crecimiento de nuevo cabello</li>
                            <li>Fortalecimiento de los folículos pilosos</li>
                            <li>Mejora de la salud y apariencia del cabello</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>El tratamiento incluye evaluación del cuero cabelludo, aplicación de productos específicos, masajes estimulantes y, según el caso, terapia con láser de baja frecuencia o microagujas capilares para mejorar la absorción de los nutrientes.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20tratamiento%20para%20restaurar%20mi%20cabello', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- MESOTERAPIA CAPILAR -->
        <div id="mesoterapia" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/mesoterapia_capilar.jpg" alt="Mesoterapia Capilar" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Mesoterapia Capilar</h3>
                        <p>Nutrición directa para fortalecer el cabello</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>La mesoterapia capilar es un tratamiento que consiste en la microinyección de un cóctel de vitaminas, minerales y otros nutrientes directamente en el cuero cabelludo para nutrir los folículos y estimular el crecimiento del cabello.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con caída intensa de cabello</li>
                            <li>Quienes tienen cabello débil o sin vitalidad</li>
                            <li>Personas con alopecia o adelgazamiento del cabello</li>
                            <li>Quienes buscan un tratamiento intensivo para el cuero cabelludo</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Estimulación directa del crecimiento del cabello</li>
                            <li>Fortalecimiento de los folículos pilosos</li>
                            <li>Mejora de la circulación en el cuero cabelludo</li>
                            <li>Aumento del grosor y densidad del cabello</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>Se prepara un cóctel personalizado según las necesidades específicas, luego se aplican pequeñas inyecciones directamente en el cuero cabelludo. El tratamiento se realiza en sesiones periódicas para mantener los resultados.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20mesoterapia%20capilar', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- LIPOENZIMAS -->
        <div id="lipo" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/lipo_enzimas.jpg" alt="Lipoenzimas" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Lipoenzimas</h3>
                        <p>Adquiere una figura esvelta de forma no invasiva</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>Las lipoenzimas son un tratamiento estético no invasivo que utiliza enzimas naturales para disolver y eliminar la grasa localizada, moldeando el cuerpo sin cirugía ni tiempo de recuperación.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con grasa localizada resistente al ejercicio</li>
                            <li>Quienes buscan reducir medidas sin cirugía</li>
                            <li>Personas que desean moldear áreas específicas del cuerpo</li>
                            <li>Quienes prefieren tratamientos no invasivos</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Reducción de grasa localizada</li>
                            <li>Moldeamiento de la figura</li>
                            <li>Mejora de la textura de la piel</li>
                            <li>Resultados progresivos y naturales</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>Se aplican inyecciones con la solución enzimática directamente en las áreas a tratar. Las enzimas actúan disolviendo las células grasas, que son eliminadas naturalmente por el cuerpo. El tratamiento requiere varias sesiones para resultados óptimos.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20tratamiento%20con%20lipoenzimas', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- IPL Y ND-YAG -->
        <div id="laser" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/laserr.jpg" alt="IPL y Nd-YAG" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>IPL y Nd-YAG</h3>
                        <p>Tecnología láser para tratamientos faciales y corporales</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>La tecnología IPL (Luz Pulsada Intensa) y Nd-YAG son sistemas láser avanzados que tratan múltiples condiciones de la piel como manchas, vello no deseado, lesiones vasculares y signos de envejecimiento.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con manchas o pigmentación irregular</li>
                            <li>Quienes desean eliminar vello no deseado</li>
                            <li>Personas con lesiones vasculares o arañas vasculares</li>
                            <li>Quienes buscan rejuvenecer y mejorar la piel</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Eliminación de manchas y pigmentación</li>
                            <li>Reducción permanente del vello</li>
                            <li>Mejora de lesiones vasculares</li>
                            <li>Rejuvenecimiento general de la piel</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>Se aplica un gel frío en la zona a tratar, luego se desliza el dispositivo emitiendo pulsos de luz o láser. El tratamiento es personalizado según el tipo de piel y la condición a tratar. Se requieren varias sesiones para resultados óptimos.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20tratamientos%20con%20l%C3%A1ser%20IPL%20y%20Nd-YAG', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- REVITALIZAMOS PIEL -->
        <div id="revitalizar" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/revitalizamos_piel.jpg" alt="Revitalizamos Piel" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Revitalizamos Piel</h3>
                        <p>Tratamientos integrales para una piel radiante</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>Nuestros tratamientos de revitalización combinan múltiples tecnologías y productos de alta calidad para restaurar la vitalidad de la piel, mejorando su textura, tono y luminosidad de forma integral.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con piel opaca y sin vitalidad</li>
                            <li>Quienes tienen signos de envejecimiento prematuro</li>
                            <li>Personas con piel deshidratada o estresada</li>
                            <li>Quienes buscan un tratamiento completo de rejuvenecimiento</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Piel más luminosa y saludable</li>
                            <li>Reducción de signos de envejecimiento</li>
                            <li>Mejora de la textura y elasticidad</li>
                            <li>Hidratación profunda y duradera</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>El tratamiento se personaliza según las necesidades específicas de cada persona, combinando tecnologías como láser, radiofrecuencia, mesoterapia y productos específicos para lograr resultados óptimos.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20revitalizar%20mi%20piel', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>

        <!-- BIOESTIMULADORES DE COLÁGENO -->
        <div id="bioestimuladores" class="catalogo-content fade-in">
            <div class="tratamiento">
                <div class="tratamiento-header">
                    <img src="Imagenes/bioestimuladores_colageno.jpg" alt="Bioestimuladores de Colágeno" class="tratamiento-img">
                    <div class="tratamiento-title">
                        <h3>Bioestimuladores de Colágeno</h3>
                        <p>Rejuvenece tu piel desde dentro</p>
                    </div>
                </div>
                <div class="tratamiento-content">
                    <div class="tratamiento-section">
                        <h4>¿Qué es?</h4>
                        <p>Los bioestimuladores de colágeno son sustancias inyectables que estimulan la producción natural de colágeno en el cuerpo, restaurando el volumen, mejorando la elasticidad y redefiniendo los contornos faciales de forma progresiva.</p>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Para quién es ideal?</h4>
                        <ul>
                            <li>Personas con flacidez cutánea</li>
                            <li>Quienes han perdido volumen facial</li>
                            <li>Personas con arrugas y surcos marcados</li>
                            <li>Quienes buscan resultados naturales y duraderos</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>Beneficios</h4>
                        <ul>
                            <li>Estimulación natural del colágeno</li>
                            <li>Mejora progresiva y duradera</li>
                            <li>Redefinición de contornos faciales</li>
                            <li>Resultados naturales sin cambios drásticos</li>
                        </ul>
                    </div>
                    <div class="tratamiento-section">
                        <h4>¿Cómo se realiza?</h4>
                        <p>Se aplica una crema anestésica, luego se inyecta el bioestimulador en las áreas a tratar mediante pequeñas punciones. Los resultados comienzan a notarse a las pocas semanas y mejoran progresivamente durante varios meses.</p>
                    </div>
                </div>
                <div class="tratamiento-actions">
                    <button class="btn-servicio btn-whatsapp" onclick="window.open('https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20bioestimuladores%20de%20col%C3%A1geno', '_blank')">Consultar por WhatsApp</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- NUEVA SECCIÓN: MISIÓN Y VISIÓN -->
<section id="mision-vision" class="mision-vision">
    <div class="mision-vision-container">
        <h1 class="fade-in">Misión y Visión</h1>
        <h2 class="fade-in">Nuestros valores y compromiso con tu belleza</h2>
        <p class="intro fade-in">
            En la Clínica Médica Estética del Dr. Jorge Ibarra, estamos dedicados a proporcionar tratamientos de la más alta calidad con un enfoque centrado en el paciente.
        </p>

        <div class="mision-vision-grid fade-in">
            <div class="mision-vision-card fade-in">
                <h3>Misión</h3>
                <p>
                    Brindar servicios médicos estéticos de excelencia, combinando tecnología avanzada, tratamientos innovadores y un equipo de profesionales altamente calificados para realzar la belleza natural de cada paciente, garantizando resultados seguros y satisfactorios en un ambiente de confianza y bienestar.
                </p>
            </div>
            <div class="mision-vision-card vision fade-in">
                <h3>Visión</h3>
                <p>
                    Convertirnos en la clínica de referencia en medicina estética de Nicaragua, reconocida por nuestra excelencia profesional, tecnología de vanguardia y resultados excepcionales, transformando vidas a través de tratamientos personalizados que superen las expectativas de nuestros pacientes.
                </p>
            </div>
        </div>
    </div>
</section>

<!-- NUEVA SECCIÓN: REDES SOCIALES -->
<section id="redes-sociales" class="redes-sociales">
    <div class="redes-sociales-container">
        <h1 class="fade-in">Síguenos en Redes Sociales</h1>
        <h2 class="fade-in">Mantente conectado con nuestras novedades y promociones</h2>
        <p class="intro fade-in">
            Únete a nuestra comunidad digital y descubre consejos de belleza, testimonios de pacientes y las últimas tendencias en tratamientos estéticos.
        </p>

        <div class="redes-sociales-grid fade-in">
            <div class="social-card fade-in">
                <div class="social-icon instagram">
                    <svg width="30" height="30" viewBox="0 0 24 24" fill="white">
                        <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948.073zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948.073zM5.838 12a6.162 6.162 0 1 1 12.324 0 6.162 6.162 0 0 1-12.324 0zM12 16a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm4.965-10.405a1.44 1.44 0 1 1 2.881.001 1.44 1.44 0 0 1-2.881-.001z"/>
                    </svg>
                </div>
                <h3>Instagram</h3>
                <p>Descubre nuestros tratamientos, casos de éxito y consejos de belleza</p>
                <a href="https://www.instagram.com/dr.jorgeibarraclinica/" target="_blank" class="social-link instagram">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="white">
                        <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948.073zM5.838 12a6.162 6.162 0 1 1 12.324 0 6.162 6.162 0 0 1-12.324 0zM12 16a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm4.965-10.405a1.44 1.44 0 1 1 2.881.001 1.44 1.44 0 0 1-2.881-.001z"/>
                    </svg>
                    Seguir en Instagram
                </a>
            </div>
            <div class="social-card fade-in">
                <div class="social-icon facebook">
                    <svg width="30" height="30" viewBox="0 0 24 24" fill="white">
                        <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                    </svg>
                </div>
                <h3>Facebook</h3>
                <p>Conecta con nuestra comunidad y comparte tus experiencias</p>
                <a href="https://www.facebook.com/share/16W8F82YTt/" target="_blank" class="social-link facebook">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="white">
                        <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                    </svg>
                    Seguir en Facebook
                </a>
            </div>
        </div>
    </div>
</section>

<!-- SECCIÓN DE CONTACTO WHATSAPP -->
<section id="contacto" class="contacto">
    <div class="contacto-container">
        <h1 class="fade-in">Contacto Directo</h1>
        <h2 class="fade-in">Comunícate con nosotros para una consulta personalizada</h2>
        <p class="intro fade-in">
            Estamos aquí para responder tus preguntas y ayudarte a encontrar el tratamiento perfecto para tus necesidades.
        </p>

        <div class="whatsapp-container fade-in">
            <a href="https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20conocer%20m%C3%A1s%20sobre%20los%20tratamientos%20de%20la%20cl%C3%ADnica" class="whatsapp-button" target="_blank">
                <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp" class="whatsapp-icon">
                Chatear por WhatsApp
            </a>
            
            <div class="whatsapp-qr">
                <!-- Aquí puedes agregar un código QR que redirija a tu WhatsApp -->
                <img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=https://wa.me/50584888868?text=Hola%2C%20estoy%20interesado%20en%20conocer%20m%C3%A1s%20sobre%20los%20tratamientos%20de%20la%20cl%C3%ADnica" alt="Código QR WhatsApp">
            </div>
        </div>

        <div class="contact-info fade-in">
            <p><strong>Teléfono:</strong> +505 8488 8868</p>
            <p><strong>Horario de atención:</strong> Lunes a Viernes de 9:00 AM a 6:00 PM</p>
            <p><strong>Ubicación:</strong> Managua, Nicaragua</p>
        </div>
    </div>
</section>

<!-- SECCIÓN FINAL: AGENDAR CITA -->
<section id="agendar-cita" class="agendar-cita">
    <div class="agendar-cita-container">
        <h1 class="fade-in">Agendar cita</h1>
        <h2 class="fade-in">Estás a un paso de agendar tu cita en nuestro SPA con las mejores promociones</h2>
        <p class="intro fade-in">
            Solo debes presionar el siguiente botón para iniciar tu transformación hacia una versión más radiante y segura de ti misma.
        </p>

        <div class="promo-box fade-in">
            <div class="promo-content">
                <h3 class="promo-title">🌟 ¡Promociones Exclusivas por Tiempo Limitado! 🌟</h3>
                <p class="promo-description">
                    Agenda tu cita hoy y obtén un <strong>20% de descuento</strong> en tu primer tratamiento. 
                    Además, recibe una <strong>consulta dermatológica gratuita</strong> con la compra de cualquier paquete de servicios.
                </p>
                
                <a href="https://wa.me/50584888868?text=Hola%2C%20deseo%20agendar%20una%20cita%20y%20conocer%20las%20promociones%20disponibles" class="whatsapp-cita-button" target="_blank">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp" class="whatsapp-cita-icon">
                    Agendar cita por WhatsApp
                </a>

                <div class="promo-benefits">
                    <div class="benefit-item">✓ Atención inmediata</div>
                    <div class="benefit-item">✓ Asesoramiento personalizado</div>
                    <div class="benefit-item">✓ Promociones exclusivas</div>
                    <div class="benefit-item">✓ Confirmación instantánea</div>
                </div>
            </div>
        </div>
    </div>
</section>

    </form>

    <script>
        // Animaciones hero
        document.addEventListener("DOMContentLoaded", () => {
            document.querySelectorAll('.hero .kicker, .hero .title, .hero .lead, .hero-ctas').forEach(el => {
                el.style.opacity = '1';
            });

            // Configurar Intersection Observer para animaciones repetibles al hacer scroll
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach((entry) => {
                    if (entry.isIntersecting) {
                        // Elemento entra en vista - agregar clase visible
                        setTimeout(() => {
                            entry.target.classList.add('visible');
                        }, 50); // Pequeño retraso para suavidad
                    } else {
                        // Elemento sale de vista - quitar clase visible para reiniciar animación
                        entry.target.classList.remove('visible');
                    }
                });
            }, observerOptions);

            // Observar todos los elementos con clase fade-in
            document.querySelectorAll('.fade-in').forEach(el => {
                observer.observe(el);
            });

            // Reiniciar animación del hero cuando se vuelve a la parte superior
            const heroSection = document.querySelector('.hero');
            const heroObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        // Reiniciar animaciones del hero
                        const heroElements = document.querySelectorAll('.hero .kicker, .hero .title, .hero .lead, .hero-ctas, .image-placeholder');
                        heroElements.forEach((el, index) => {
                            // Reiniciar las animaciones CSS
                            el.style.animation = 'none';
                            el.offsetHeight; // Forzar reflow
                            el.style.animation = null;
                        });
                    }
                });
            }, { threshold: 0.5 });

            heroObserver.observe(heroSection);
        });

        // Función para mostrar tratamientos específicos
        function showTratamiento(tratamientoId) {
            // Ocultar todos los contenidos
            document.querySelectorAll('.catalogo-content').forEach(content => {
                content.classList.remove('active');
            });

            // Quitar clase active de todas las pestañas
            document.querySelectorAll('.catalogo-tab').forEach(tab => {
                tab.classList.remove('active');
            });

            // Mostrar el contenido seleccionado
            document.getElementById(tratamientoId).classList.add('active');

            // Agregar clase active a la pestaña correspondiente
            const tab = document.querySelector(`.catalogo-tab[onclick="showTratamiento('${tratamientoId}')"]`);
            if (tab) {
                tab.classList.add('active');
            }

            // Desplazarse a la sección del catálogo
            document.getElementById('catalogo').scrollIntoView({ behavior: 'smooth' });
        }
    </script>
</body>
</html>