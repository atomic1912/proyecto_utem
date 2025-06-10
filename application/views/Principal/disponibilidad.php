<style>
  /* Estilos para la clase 'laboratorios' */
  .laboratorios {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    gap: 15px; /* Espaciado entre las tarjetas */
  }

  .laboratorios .card {
    padding: 20px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border: 1px solid #ddd;
    border-radius: 10px;
    width: 45%; /* Ancho por defecto */
    margin-bottom: 15px;
  }

  .laboratorios .card-header h5 {
    font-size: 18px;
  }

  .laboratorios .card-body p {
    font-size: 14px;
    line-height: 1.6;
  }

  /* Responsividad para pantallas medianas */
  @media (max-width: 1024px) {
    .laboratorios .card {
      width: 45%; /* 45% en pantallas medianas */
    }
  }

  /* Responsividad para pantallas pequeñas */
  @media (max-width: 768px) {
    .laboratorios .card {
      width: 90%; /* 90% en pantallas pequeñas */
      margin: 10px 0;
    }

    .laboratorios .card-header h5 {
      font-size: 16px; /* Ajustar tamaño del título en pantallas pequeñas */
    }

    .laboratorios .card-body p {
      font-size: 13px; /* Ajustar tamaño del texto en pantallas pequeñas */
    }
  }
</style>

<div class="laboratorios">
  <!-- Laboratorio 1 -->
  <div class="card p-2 shadow border rounded-4 m-2 pt-3">
    <div class="card-header bg-success">
      <h5 class="text-center text-white">Laboratorio de Desarrollo</h5>
    </div>
    <div class="card-body">
      <p class="txt" id="cambio-color">
        Descripción del laboratorio...
      </p>
    </div>
    <div class="card-footer">
      <button type="button" class="btn btn-outline-warning">Ver disponibilidad</button>
    </div>
  </div>

  <!-- Laboratorio 2 -->
  <div class="card p-2 shadow border rounded-4 m-2 pt-3">
    <div class="card-header bg-success">
      <h5 class="text-center text-white">Laboratorio de Soporte</h5>
    </div>
    <div class="card-body">
      <p class="txt" id="cambio-color">
        Descripción del laboratorio...
      </p>
    </div>
    <div class="card-footer">
      <button type="button" class="btn btn-outline-warning">Ver disponibilidad</button>
    </div>
  </div>

  <!-- Laboratorio 3 -->
  <div class="card p-2 shadow border rounded-4 m-2 pt-3">
    <div class="card-header bg-success">
      <h5 class="text-center text-white">Laboratorio de IoT</h5>
    </div>
    <div class="card-body">
      <p class="txt" id="cambio-color">
        Descripción del laboratorio...
      </p>
    </div>
    <div class="card-footer">
      <button type="button" class="btn btn-outline-warning">Ver disponibilidad</button>
    </div>
  </div>

  <!-- Laboratorio 4 -->
  <div class="card p-2 shadow border rounded-4 m-2 pt-3">
    <div class="card-header bg-success">
      <h5 class="text-center text-white">Herramientas para laboratorios</h5>
    </div>
    <div class="card-body">
      <p class="txt" id="cambio-color">
        Descripción del módulo...
      </p>
    </div>
    <div class="card-footer">
      <button type="button" class="btn btn-outline-warning">Ver disponibilidad</button>
    </div>
  </div>

</div>
