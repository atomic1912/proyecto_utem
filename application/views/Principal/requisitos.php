
  <style>
    /* Estilos específicos para la sección de credenciales y normas */
    .credenciales-normas {
      display: flex;
      flex-wrap: wrap; /* Para que los elementos se acomoden en varias filas */
      justify-content: center; /* Centra los elementos */
    }

    .credenciales-normas .p-2 {
      padding: 20px;
      margin: 15px;
      width: 30%; /* Ancho de los elementos */
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .credenciales-normas h4 {
      text-align: center;
    }

    .credenciales-normas .txt-justify {
      text-align: justify;
    }

    /* Estilo para pantallas pequeñas */
    @media (max-width: 768px) {
      .credenciales-normas .p-2 {
        width: 100%; /* Los elementos ocuparán todo el ancho en pantallas pequeñas */
        margin: 10px 0; /* Reducir el margen para que no se superpongan */
      }
    }

    /* Estilo para pantallas medianas */
    @media (max-width: 1024px) and (min-width: 769px) {
      .credenciales-normas .p-2 {
        width: 45%; /* 2 elementos por fila en pantallas medianas */
      }
    }
  </style>

  <div class="credenciales-normas">
    <!-- Credencial de estudiante -->
    <div class="p-2 shadow border rounded-4 m-2">
      <h4 class="text-center">Credencial de estudiante</h4>
      <p class="txt txt-justify" id="cambio-color">
        Debes presentar tu credencial estudiantil para verificar tu condición de alumno de la universidad.
      </p>
    </div>

    <!-- Respetar normas de uso -->
    <div class="p-2 shadow border rounded-4 m-2">
      <h4 class="text-center">Respetar normas de uso</h4>
      <p class="txt txt-justify" id="cambio-color">
        Debes comprometerte a cumplir con las normas y políticas de uso del laboratorio durante el tiempo de préstamo.
      </p>
      <a href="#normas" class="btn btn-outline-success"> Ver Normas</a>
    </div>
  </div>

