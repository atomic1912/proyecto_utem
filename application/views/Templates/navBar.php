<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <!-- Logo y enlace a la página de inicio -->
    		<a class="navbar-brand" href="<?php echo base_url(); ?>" ><img class="logo" src="<?php echo base_url(); ?>assets/logos/LogotechLab1.png"></a>
    
    

    <!-- Botón de hamburguesa para dispositivos móviles -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Elementos del Navbar -->
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav mx-auto">
        <!-- Elemento central del Navbar -->
        <li class="nav-item">
        	<h4 class="navbar-brand text-white">UTeMTechLab Control</h4>
        </li>
      </ul>
      <!-- Elementos del Navbar a la derecha -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="<?php echo site_url('login'); ?>">Inicio de sesión</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Acerca de</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contacto</a>
        </li>
      </ul>
    </div>
  </div>
</nav>