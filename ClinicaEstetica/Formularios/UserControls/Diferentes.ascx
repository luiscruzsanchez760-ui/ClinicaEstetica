<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Diferentes.ascx.cs" Inherits="ClinicaEstetica.Diferentes" %>



    <!-- SECCIÓN: QUÉ NOS HACE DIFERENTES -->
<section class="diferentes">
    <div class="diferentes-container">
        <h1>Qué nos hace Diferentes</h1>
        <h2>Nuestra excelencia se refleja en cada detalle</h2>
        <p class="intro">
            En Medical Spa Nicaragua, cada aspecto de nuestro servicio ha sido diseñado para brindarte bienestar, confianza y resultados visibles. 
            Nos destacamos por nuestra dedicación, profesionalismo y atención humana en cada tratamiento.
        </p>

        <!-- Fila 1 -->
        <div class="fila-caracteristicas">
            <div class="caracteristica">
                <img src="Imagenes/puntualidad.png" alt="Puntualidad" />
                <strong>Puntualidad</strong>
                <p>Respetamos tu tiempo con un servicio eficiente y bien organizado.</p>
            </div>
            <div class="caracteristica">
                <img src="Imagenes/higiene.png" alt="Higiene" />
                <strong>Higiene</strong>
                <p>Mantenemos estrictos estándares de limpieza en todas nuestras áreas y equipos.</p>
            </div>
            <div class="caracteristica">
                <img src="Imagenes/candles.png" alt="Ambientación" />
                <strong>Ambientación</strong>
                <p>Un entorno relajante que promueve la calma, el confort y la renovación.</p>
            </div>
        </div>

        <!-- Fila 2 -->
        <div class="fila-caracteristicas">
            <div class="caracteristica">
                <img src="Imagenes/especialistas.png" alt="Especialistas" />
                <strong>Especialistas</strong>
                <p>Contamos con un equipo médico altamente capacitado y con amplia experiencia.</p>
            </div>
            <div class="caracteristica">
                <img src="Imagenes/atencion.png" alt="Atención Personalizada" />
                <strong>Atención Personalizada</strong>
                <p>Diseñamos tratamientos adaptados a tus necesidades y objetivos específicos.</p>
            </div>
            <div class="caracteristica">
                <img src="Imagenes/tecnologia.png" alt="Tecnología Avanzada" />
                <strong>Tecnología Avanzada</strong>
                <p>Utilizamos equipos modernos para garantizar resultados seguros y efectivos.</p>
            </div>
        </div>
    </div>
</section>


<style>
    /* =========================
   QUÉ NOS HACE DIFERENTES
========================= */
.diferentes {
    background: linear-gradient(135deg, #ffffff 0%, #459DBF 10%, #9BB8CB 20%, #ffffff 100%);
    flex-direction: column;
    text-align: center;
    padding: 80px 20px;
    color: var(--text-dark);
}


.diferentes-container {
    max-width: 1200px;
    margin: 0 auto;
}

.diferentes h1 {
    font-size: 2.5rem;
    margin-bottom: 10px;
}

.diferentes h2 {
    font-size: 1.4rem;
    font-weight: normal;
    margin-bottom: 30px;
}

.diferentes .intro {
    max-width: 800px;
    margin: 0 auto 50px auto;
    font-size: 1rem;
    line-height: 1.6;
}

.fila-caracteristicas {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 40px;
    margin-bottom: 40px;
}

.caracteristica {
    flex: 1 1 250px;
    max-width: 300px;
    padding: 20px;
    text-align: center;
}

.caracteristica img {
    width: 50px !important;   /* 🔹 fuerza el tamaño de icono */
    height: 50px !important;
    max-width: 100%;           /* asegura que no se salga del contenedor */
    display: block;
    margin: 0 auto 10px;
    object-fit: contain;       /* mantiene la proporción */
}


.caracteristica strong {
    display: block;
    font-size: 1.1rem;
    margin-bottom: 8px;
}

.caracteristica p {
    font-size: 0.95rem;
    line-height: 1.5;
    margin: 0;
}

/* Responsive */
@media (max-width:768px) {
    .fila-caracteristicas {
        flex-direction: column;
        align-items: center;
    }
    .caracteristica {
        max-width: 90%;
    }
}

</style>
