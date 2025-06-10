  <style>
    /* Estilos específicos para la sección de pasos */
    .pasos-solicitud {
      display: flex;
      flex-wrap: wrap; /* Para que los elementos se acomoden en varias filas */
      justify-content: center; /* Centra los elementos */
    }

    .pasos-solicitud .card {
      padding: 20px;
      margin: 15px;
      width: 25%; /* Ancho de las tarjetas */
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .pasos-solicitud .card-header {
      background-color: #28a745;
      color: white;
    }

    .pasos-solicitud .card-footer {
      text-align: center;
    }

    .pasos-solicitud .txt-justify {
      text-align: justify;
    }

    /* Estilo para pantallas pequeñas */
    @media (max-width: 768px) {
      .pasos-solicitud .card {
        width: 100%; /* Las tarjetas ocuparán todo el ancho en pantallas pequeñas */
        margin: 10px 0; /* Reducir el margen para que las tarjetas no se superpongan */
      }

      .pasos-solicitud .txt-justify {
        font-size: 4vw; /* Ajustar el tamaño del texto proporcionalmente al ancho de la pantalla */
      }
    }

    /* Estilo para pantallas medianas */
    @media (max-width: 1024px) and (min-width: 769px) {
      .pasos-solicitud .card {
        width: 45%; /* 2 tarjetas por fila en pantallas medianas */
      }
    }
  </style>

  <div class="pasos-solicitud">
    <!-- Paso 1 -->
    <div class="card p-2 shadow border rounded-4 m-2 pt-3">
      <div class="card-header bg-success">
        <h5 class="text-center">Paso 1. Generar la solicitud</h5>
      </div>
      <div class="card-body">
        <p class="txt txt-justify" id="cambio-color">
          Deberas ingresar con tu número de control y password a tu cuenta de UTeMTechLab Control y generar la solicitud.
        </p>
      </div>
      <div class="card-footer text-center">
        <a href="<?php echo site_url('login'); ?>" type="button" class="btn btn-outline-success">Iniciar Sesión</a>
      </div>
    </div>

    <!-- Paso 2 -->
    <div class="card p-2 shadow border rounded-4 m-2 pt-3">
      <div class="card-header bg-success">
        <h5 class="text-center">Paso 2. Escoge el equipo</h5>
      </div>
      <div class="card-body">
        <p class="txt txt-justify" id="cambio-color">
          Elige el equipo de cómputo, redes, electrónica y/o herramientas que necesitas y selecciona el horario de préstamo que mejor se adapte a tus necesidades.
        </p>
      </div>
      <div class="card-footer">
        <a href="<?php echo site_url('inventario'); ?>" type="button" class="btn btn-outline-warning">Equipos y herramientas</a>
      </div>
    </div>

    <!-- Paso 3 -->
    <div class="card p-2 shadow border rounded-4 m-2 pt-3">
      <div class="card-header bg-success">
        <h5 class="text-center">Paso 3.  Confirma tu solicitud</h5>
      </div>
      <div class="card-body">
        <p class="txt txt-justify" id="cambio-color">
          Revisa todos los datos y confirma tu solicitud de préstamo. Recibirás una notificación en tu cuenta de UTeM TechLab Control.
        </p>
      </div>
      <div class="card-footer">
      </div>
    </div>

    <!-- Paso 4 -->
    <div class="card p-2 shadow border rounded-4 m-2 pt-3">
      <div class="card-header bg-success">
        <h5 class="text-center">Paso 4.  Retiro y devolución</h5>
      </div>
      <div class="card-body">
        <p class="txt txt-justify" id="cambio-color">
          Retira el equipo en la fecha y hora establecida y devuélvelo en las mismas condiciones al finalizar el período de préstamo.
        </p>
      </div>
      <div class="card-footer">
        <button type="button" class="btn btn-outline-primary">Info</button>
      </div>
    </div>
  </div>
