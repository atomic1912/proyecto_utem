<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    body {
      font-family: 'Open Sans', sans-serif;
    }
    
    .section-title {
      font-size: 1.5rem;
      text-align: center;
      margin: 1rem 0;
    }
    .desc{
      font-size: 0.8rem;
    }
    #cameraCanvas, #cameraView, #previewImage {
      max-width: 100%;
      height: auto;
      margin: 0 auto;
      display: block;
      border: 1px solid #ddd;
      border-radius: 5px;
    }
    @media (max-width: 576px) {
      .section-title {
        font-size: 1.2rem;
      }
    }
    /* Estilo para ajustar el tamaño del modal */
    @media (min-width: 576px) {
      .modal-lg {
        max-width: 80%; /* Ocupa 80% del ancho de la pantalla en tamaños medianos */
      }
    }

    @media (min-width: 992px) {
      .modal-lg {
        max-width: 70%; /* Ocupa 70% en pantallas más grandes */
      }
    }

    /* Ajuste de altura máxima para evitar overflow */
    .modal-content {
      max-height: 90vh;
      overflow-y: auto;
    }
</style>

<!-- Modal HTML -->
<div class="modal fade" id="nwArticle" tabindex="-1" aria-labelledby="nwArticleLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title" id="nwArticleLabel">Registro de Inventario</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <!-- Modal Body -->
      <div class="modal-body">
        <form id="registroForm" action="<?= site_url('newArticle') ?>" method='POST' enctype="multipart/form-data">

          <div class="d-flex justify-content-around">
            <!-- Campos Generales -->
            <div class="mb-2 w-35">
              <label for="nombre" class="form-label">Nombre del Producto:</label>
              <input type="text" id="nombre" name="nombre" class="form-control" required>
            </div>
            <div class="mb-2 w-5">

            </div>
            <div class="mb-2 w-55">
              <label for="categoria" class="form-label">Categoría:</label>
              <select id="categoria" name="categoria" class="form-select" onchange="mostrarDescripcion()">
                <option value="0">Selecciona una categoría</option>
                <?php foreach ($categorias as $categoria) { ?>
                    <option value="<?= $categoria['id_categoria'] ?>" data-descripcion="<?= $categoria['descripcionCategoria'] ?>">
                        <?= $categoria['nombre_categoria'] ?>
                    </option>
                <?php } ?>
              </select>
            </div>
          </div>

          <div class="d-flex justify-content-around">
            <div class="mb-2 w-35">

            </div>
            <div class="mb-2 w-45">
              <label id="descripcionCategoria" class="form-control-plaintext desc"></label>
            </div>
          </div>

          <div class="d-flex justify-content-around">
            <div class="mb-2 w-50">
              <label for="descripcion" class="form-label">Descripción:</label>
              <textarea type="text" id="descripcion" name="descripcion" class="form-control" rows="3"></textarea>
            </div>
            <div class="mb-2 w-25" id="imagenes-container">
              <label for="imagenes" class="form-label">Fotos:</label>
              <input type="file" id="imagenes" name="imagenes[]" class="form-control" accept="image/*" multiple>
            </div>
            <div class="mb-2 w-20" id="cantidadField">
              <label for="cantidad" class="form-label">Cantidad:</label>
              <input type="number" id="cantidad" name="cantidad" class="form-control" value="1">
            </div>
          </div>

          <!-- Sección para tomar foto -->
          <div class="d-flex justify-content-center mt-4">
            <div class="w-100">
              <label for="camera" class="form-label">Tomar Foto:</label>
              <video id="cameraView" width="100%" height="auto" style="border-radius: 5px;"></video>
              <canvas id="cameraCanvas" style="display:none;"></canvas>
              <button type="button" class="btn btn-primary mt-2" onclick="takePhoto()">Tomar Foto</button>
              <br>
              <img id="previewImage" style="display:none; margin-top: 10px; width: 100%;" />
            </div>
          </div>

          <div class="d-flex justify-content-around">
            <div class="mb-2 w-45" id="numeroSerieField">
              <label for="numeroSerie" class="form-label">Número de Serie:</label>
              <input type="text" id="numeroSerie" name="numeroSerie" class="form-control">
            </div>

            <div class="mb-2 w-45" id="numeroInventarioField">
              <label for="numeroInventario" class="form-label">Número de Inventario:</label>
              <input type="text" id="numeroInventario" name="numeroInventario" class="form-control">
            </div>
          </div>

          <div class="d-flex justify-content-around">
            <div class="mb-2 w-45">
              <label for="ubicacion" class="form-label">Ubicación:</label>
              <select id="ubicacion" name="ubicacion" class="form-select" onchange="mostrarDesUbicacion()">
                <option value="0">Seleccione una opción...</option>
                <?php foreach($ubicaciones as $ubicacion) { ?>
                  <option value="<?= $ubicacion['id_ubicacion'] ?>" title="<?= $ubicacion['descripcionUbicacion'] ?>" data-descUbicacion="<?= $ubicacion['descripcionUbicacion'] ?>"><?= $ubicacion['nombreUbicacion'] ?></option>
                <?php } ?>
              </select>
            </div>

            <div class="mb-2 w-45">
              <label for="estado" class="form-label">Estado:</label>
              <select id="estado" name="estado" class="form-select" onchange="mostrarDesEstado()">
                <option value="0">Seleccione una opción...</option>
                <?php foreach($estados as $estado) { ?>
                  <option value="<?= $estado['id_estado'] ?>" title="<?= $estado['descripcionEstado'] ?>" data-descEstado="<?= $estado['descripcionEstado'] ?>"><?= $estado['nombre_estado'] ?></option>
                <?php } ?>
              </select>
            </div>
          </div>

          <div class="d-flex justify-content-around">
            <div class="mb-2 w-45">
              <div class="mb-2">
                <label id="descripcionUbicacion" class="form-control-plaintext desc"></label>
              </div>
            </div>

            <div class="mb-2 w-45">
              <div class="mb-2">
                <label id="descripcionEstado" class="form-control-plaintext desc"></label>
              </div>
            </div>
          </div>

          <div class="d-flex justify-content-center mt-2">
            <div>
              <button type="submit" class="btn btn-outline-primary">Registrar</button>
            </div>
          </div>

        </form>
      </div>

      <!-- Modal Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
      </div>

    </div>
  </div>
</div>

<script>
  // Función para iniciar la cámara
  function startCamera() {
    const cameraView = document.getElementById('cameraView');
    const cameraCanvas = document.getElementById('cameraCanvas');
    const cameraContext = cameraCanvas.getContext('2d');

    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
      navigator.mediaDevices.getUserMedia({ video: true })
        .then(function(stream) {
          cameraView.srcObject = stream;
          cameraView.play();

          cameraView.addEventListener('canplay', function() {
            cameraCanvas.width = cameraView.videoWidth;
            cameraCanvas.height = cameraView.videoHeight;
          });
        })
        .catch(function(err) {
          console.error('Error al acceder a la cámara: ', err);
        });
    }
  }

  // Función para tomar la foto
  function takePhoto() {
    const cameraCanvas = document.getElementById('cameraCanvas');
    const previewImage = document.getElementById('previewImage');
    const cameraContext = cameraCanvas.getContext('2d');

    cameraContext.drawImage(document.getElementById('cameraView'), 0, 0, cameraCanvas.width, cameraCanvas.height);
    const dataUrl = cameraCanvas.toDataURL('image/png');
    previewImage.src = dataUrl;
    previewImage.style.display = 'block';
  }

  // Iniciar la cámara al cargar el modal
  $('#nwArticle').on('shown.bs.modal', function () {
    startCamera();
  });
</script>
