<body class="d-flex flex-column bg-success">
<?php $this->load->view('Templates/navBar'); ?>
    
    <!-- Contenedor principal con flexbox -->
    <div class="container-fluid  d-flex flex-grow-1 body ">

        <!-- Menú lateral fijo a la izquierda -->
        <?php  //$this->load->view('Templates/menu');?>
        

        <!-- Contenido principal -->
        <?php  $this->load->view('Principal/content');?>
        

    </div>
   
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>