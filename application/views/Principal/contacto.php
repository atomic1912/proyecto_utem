<style>
  /* Estilos para la clase 'contacto' */
  .contacto {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px; /* Espaciado entre las tarjetas */
  }

  .contacto .card {
    padding: 20px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border: 1px solid #ddd;
    border-radius: 10px;
    width: 30%; /* Ancho por defecto */
    margin-bottom: 10px;
  }

  .contacto .card-header h5 {
    font-size: 18px;
  }

  .contacto .card-body p {
    font-size: 14px;
    line-height: 1.6;
  }

  /* Responsividad para pantallas medianas */
  @media (max-width: 1024px) {
    .contacto .card {
      width: 45%; /* 45% en pantallas medianas */
    }
  }

  /* Responsividad para pantallas pequeñas */
  @media (max-width: 768px) {
    .contacto .card {
      width: 90%; /* 90% en pantallas pequeñas */
      margin: 10px 0;
    }

    .contacto .card-header h5 {
      font-size: 16px; /* Ajustar tamaño del título en pantallas pequeñas */
    }

    .contacto .card-body p {
      font-size: 13px; /* Ajustar tamaño del texto en pantallas pequeñas */
    }
  }
</style>

<div class="contacto">
  <!-- Tarjeta 1 -->
  <div class="card p-2 shadow border rounded-4 m-2 pt-3">
    <div class="card-header bg-light">
      <h5 class="text-center">¿Tienes alguna duda?</h5>
    </div>
    <div class="card-body">
      <p class="txt">
        No dudes en contactarnos. Estamos aquí para ayudarte con cualquier pregunta o inquietud que tengas.
      </p>
    </div>
    <div class="card-footer">
      <button type="button" class="btn btn-outline-info">Buzón</button>
    </div>
  </div>

  <!-- Tarjeta 2 -->
  <div class="card p-2 shadow border rounded-4 m-2 pt-3">
    <div class="card-header bg-light">
      <h5 class="text-center">Horarios de atención</h5>
    </div>
    <div class="card-body">
      <p class="txt">
        Estamos disponibles de lunes a viernes, de 7:30 a.m. a 7:30 p.m. para responder tus consultas y brindarte asistencia.
      </p>
    </div>
    <div class="card-footer text-center">
      <button type="button" class="btn btn-outline-info">Horarios</button>
    </div>
  </div>

  <!-- Tarjeta 3 -->
  <div class="card p-2 shadow border rounded-4 m-2 pt-3">
    <div class="card-header bg-light">
      <h5 class="text-center">Información de contacto</h5>
    </div>
    <div class="card-body">
      <p class="txt">
        Puedes comunicarte con nosotros al correo electrónico laboratorios_ti@utem.edu.mx, además de nuestro <strong>Buzón</strong> para responder tus consultas y brindarte asistencia.
      </p>
    </div>
    <div class="card-footer">
      <button type="button" class="btn btn-outline-info">Buzón</button>
    </div>
  </div>
</div>
