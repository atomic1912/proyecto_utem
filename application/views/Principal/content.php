<style>
    body {
        font-family: Arial, sans-serif;
        align-items: center; /* Centra verticalmente el contenido */
        background-color: #f8f9fa;
    }

    #main-container {
        max-width: 100%; /* Ancho máximo del contenido */
        padding: 20px;
        border-radius: 10px;
        margin: 0 auto;
    }

    #main-container h1 {
        text-align: center;
        font-size: 2rem;
        margin-bottom: 20px;
    }

    #cambio-color {
        font-size: 1rem;
        line-height: 1.5;
        text-align: justify;
        transition: color 0.3s ease-in-out;
    }

    /* Estilos para pantallas pequeñas */
    @media (max-width: 768px) {
        body {
            padding: 10px;
        }

        #main-container {
            max-width: 95%; /* Ocupa todo el ancho disponible */
            padding: 20px;
        }

        #main-container h1 {
            font-size: 1.5rem; /* Título más pequeño */
        }

        #cambio-color {
            font-size: 3.5vw; /* Escala relativa al ancho de la pantalla */
            line-height: 4vw; /* Espaciado proporcional */
        }
    }
</style>

<div class="content bg-light rounded-4">
    <div id="main-container" class="d-flex flex-column">
        <div class="p-1 text-center d-flex flex-wrap justify-content-center">
            <h1>Control del laboratorio de Tecnologías de la Información de la UTeM<hr></h1>
        </div>
        <div class="m-5 shadow rounded-5 p-2">
            <p id="cambio-color" class="txt txt-justify">
                Bienvenido a UTeMTechLab Control, la plataforma integral diseñada para simplificar la gestión de préstamos de equipos y asignación de laboratorios en el entorno educativo de la UTeM.
                <br>
                Control UTeMTechLab va más allá de ser un sistema de gestión; es la herramienta central que facilita el control total del laboratorio de Tecnologías de la Información en la Universidad Tecnológica Metropolitana. Desde la administración de préstamos de equipos hasta la asignación de laboratorios, este sistema está diseñado para optimizar los procesos y asegurar un entorno de aprendizaje tecnológico fluido y bien organizado. Con este sistema, la UTeM fortalece su compromiso con la excelencia académica en el campo de las tecnologías emergentes.
            </p>
        </div>
    </div>

    <div class="d-flex flex-column text-center">
        <div class="p-1" id="requisitos">
            <div class="p-1 text-center d-flex flex-wrap justify-content-center">
                <h3>Requisitos para solicitar un préstamo <hr></h3>
            </div>
            <?php $this->load->view('Principal/requisitos') ?>
        </div>

        <div class="p-1" id="procedimiento">
            <div class="p-1 text-center d-flex flex-wrap justify-content-center">
                <h3>Procedimiento para solicitar un préstamo<hr></h3>
            </div>
            <?php $this->load->view('Principal/procedimiento') ?>
        </div>

        <div class="p-1" id="responsabilidades">
            <div class="p-1 text-center d-flex flex-wrap justify-content-center">
                <h3>Responsabilidades del estudiante durante el préstamo<hr></h3>
            </div>
            <?php $this->load->view('Principal/responsabilidades') ?>
        </div>

        <div class="p-1" id="disponibilidad">
            <div class="p-1 text-center d-flex flex-wrap justify-content-center">
                <h3>Disponibilidad de equipos y horarios de préstamo<hr></h3>
            </div>
            <?php $this->load->view('Principal/disponibilidad') ?>
        </div>

        <div class="p-1" id="normas">
            <div class="p-1 text-center d-flex flex-wrap justify-content-center">
                <h3>Normas y políticas <strong>generales</strong> de uso del laboratorio<hr></h3>
            </div>
            <?php $this->load->view('Principal/normas') ?>
        </div>

        <div class="p-1" id="contacto">
            <div class="p-1 text-center d-flex flex-wrap justify-content-center">
                <h3>Contacto y preguntas frecuentes<hr></h3>
            </div>
            <?php $this->load->view('Principal/contacto') ?>
        </div>
    </div>
</div>

<script>
    // Agregar script para cambiar el color al pasar el mouse sobre el título
    document.getElementById('cambio-color').addEventListener('mouseover', function() {
        this.style.color = getRandomColor(); // Utiliza una función para obtener un color aleatorio
    });

    // Restablecer el color original al quitar el mouse del título
    document.getElementById('cambio-color').addEventListener('mouseout', function() {
        this.style.color = ''; // Restablece el color original
    });

    // Función para obtener un color hexadecimal aleatorio
    function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    // Responsividad
    document.addEventListener('DOMContentLoaded', () => {
        function adjustResponsiveness() {
            const mainContainer = document.getElementById('main-container');
            const textElement = document.getElementById('cambio-color');

            if (mainContainer && textElement) { // Verifica que existan
                if (window.innerWidth <= 768) { // Dispositivos móviles
                    mainContainer.classList.remove('container');
                    textElement.classList.remove('txt-desktop');
                    textElement.classList.add('txt-mobile');
                } else { // Pantallas grandes
                    mainContainer.classList.add('container');
                    textElement.classList.remove('txt-mobile');
                    textElement.classList.add('txt-desktop');
                }
            }
        }

        // Ajustar la primera vez al cargar la página
        adjustResponsiveness();

        // Escuchar cambios en el tamaño de la ventana
        window.addEventListener('resize', adjustResponsiveness);
    });
</script>
