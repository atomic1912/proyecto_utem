<style>
  /* Estilo individual para esta sección */
  .custom-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px; /* Espaciado entre las tarjetas */
  }

  .custom-card {
    padding: 20px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border: 1px solid #ddd;
    border-radius: 10px;
    width: 25%; /* Ancho por defecto */
    margin-bottom: 10px;
  }

  .custom-card h5 {
    font-size: 18px;
    margin-bottom: 15px;
  }

  .custom-card p {
    font-size: 14px;
    line-height: 1.6;
  }

  /* Responsividad para pantallas medianas */
  @media (max-width: 1024px) {
    .custom-card {
      width: 45%; /* 45% en pantallas medianas */
    }
  }

  /* Responsividad para pantallas pequeñas */
  @media (max-width: 768px) {
    .custom-card {
      width: 90%; /* 90% en pantallas pequeñas */
      margin: 10px 0;
    }

    .custom-card h5 {
      font-size: 16px; /* Ajustar tamaño del título en pantallas pequeñas */
    }

    .custom-card p {
      font-size: 13px; /* Ajustar tamaño del texto en pantallas pequeñas */
    }
  }
</style>

<div class="custom-container">
  <div class="custom-card shadow border rounded-4 p-3">
    <h5 class="text-center">
      <span class="bg-success rounded-3" style="width:20px; height: 20px; padding: 3px; color: white;">1.</span>
      Cuidado del equipo
    </h5>
    <p class="txt txt-justify" id="cambio-color">
      Debes ser responsable en el manejo y cuidado del equipo, evitando daños y asegurando su correcto funcionamiento.
    </p>
  </div>

  <div class="custom-card shadow border rounded-4 p-3">
    <h5 class="text-center">
      <span class="bg-success rounded-3" style="width:20px; height: 20px; padding: 3px; color: white;">2.</span>
      Tiempo de uso
    </h5>
    <p class="txt txt-justify" id="cambio-color">
      Respetar los horarios de préstamo asignados y devolver el equipo a tiempo para que otros estudiantes puedan utilizarlo.
    </p>
  </div>

  <div class="custom-card shadow border rounded-4 p-3">
    <h5 class="text-center">
      <span class="bg-success rounded-3" style="width:20px; height: 20px; padding: 3px; color: white;">3.</span>
      Guardar silencio
    </h5>
    <p class="txt txt-justify" id="cambio-color">
      Mantener un ambiente tranquilo y silencioso en el laboratorio para no interrumpir el estudio de otros usuarios.
    </p>
  </div>
</div>