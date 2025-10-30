<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Servicios.ascx.cs" Inherits="ClinicaEstetica.Servicios" %>

<section class="servicios">
    <div class="servicios-container">
        <h1>Servicios y Tratamientos</h1>
        <h2>Que realzan tu belleza natural</h2>
        <p class="intro">
            Descubre nuestra amplia gama de tratamientos diseñados para tu cuidado, bienestar y resultados visibles.
        </p>

        <div class="grid-servicios">
            <div class="servicio">
                <img src="Imagenes/consulta.jpg" alt="Consulta Dermatológica" />
                <strong>Consulta Dermatológica</strong>
            </div>
            <div class="servicio">
                <img src="Imagenes/limpieza_facial.jpg" alt="Limpieza Facial" />
                <strong>Limpieza Facial</strong>
            </div>
            <div class="servicio">
                <img src="Imagenes/dermapen.png" alt="Dermapen" />
                <strong>Dermapen</strong>
            </div>
            <div class="servicio fondo-solido">
                <img src="Imagenes/peeling_quimico.jpg" alt="Peeling Químico" />
                <strong>Peeling Químico</strong>
            </div>
            <div class="servicio fondo-solido">
                <img src="Imagenes/rellenos_faciales.jpg" alt="Rellenos Faciales" />
                <strong>Rellenos Faciales</strong>
            </div>
            <div class="servicio fondo-solido">
                <img src="Imagenes/lipo_enzimas.png" alt="Lipo Enzimas" />
                <strong>Lipo Enzimas</strong>
            </div>
            <div class="servicio">
                <img src="Imagenes/restauramos_cabello.png" alt="Restauramos Cabello" />
                <strong>Restauramos Cabello</strong>
            </div>
            <div class="servicio">
                <img src="Imagenes/revitalizamos_piel.png" alt="Revitalizamos tu Piel" />
                <strong>Revitalizamos tu Piel</strong>
            </div>
            <div class="servicio">
                <img src="Imagenes/laseres.png" alt="Laseres" />
                <strong>Laseres</strong>
            </div>
        </div>
    </div>
</section>


<style>
/* =========================
   SERVICIOS Y TRATAMIENTOS
========================= */
.servicios {
    padding: 80px 20px;
    text-align: center;
    background: #fff; /* Fondo blanco predominante */
    color: #12202a;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.servicios-container {
    max-width: 1200px;
    margin: 0 auto;
}

.servicios h1 {
    font-size: 2.5rem;
    margin-bottom: 0.3em;
    font-weight: 900; /* Segoe UI Black */
}

.servicios h2 {
    font-size: 1.5rem;
    margin-bottom: 1em;
    font-weight: 700; /* Segoe UI Bold */
}

.servicios .intro {
    max-width: 700px;
    margin: 0 auto 50px auto;
    line-height: 1.6;
    font-size: 1.05rem;
}

.grid-servicios {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* Siempre 3 columnas en escritorio */
    gap: 40px;
    justify-items: center;
    align-items: start;
}

.servicio {
    padding: 20px;
    text-align: center;
}

.servicio img {
    width: 150px;  /* Tamaño más grande para destacar */
    height: 150px;
    object-fit: cover; /* Mantiene proporción de la imagen */
    margin-bottom: 15px;
    border-radius: 8px; /* Opcional: bordes redondeados */
}

.servicio strong {
    display: block;
    margin-top: 10px;
    font-size: 1.1rem;
    font-weight: 900; /* Segoe UI Black */
}

/* Responsive */
@media (max-width:992px) {
    .grid-servicios {
        grid-template-columns: repeat(2, 1fr); /* 2 columnas en tablet */
    }
}

@media (max-width:768px) {
    .grid-servicios {
        grid-template-columns: 1fr; /* 1 columna en móvil */
    }
}

</style>
