<style>
	.w-80{
		margin-top: 10%;
		margin-left:20%;
	    width: 60%;
	    padding: 10px;
	    height: 40%;
	}

	.bg-lightgreen{
		background-color: #D8EEE0;
	}

</style>

<body class="d-flex flex-column bg-success">
	<?php $this->load->view('Templates/navBar'); ?>
	<section class="d-flex flex-column bg-lightgreen w-80 rounded shadow" >
		<div>
			<h3 class="text-center">Bienvenido! <hr></h3>
		</div>

		<div class="d-flex justify-content-center text-center">
			<div class =" w-25">
				<form action="login" autocomplete="off">
				  <div class="mb-3 mt-3">
				    <label for="userName" class="form-label">Usuario:</label>
				    <input type="text" class="form-control" id="userName" placeholder="Usuario" name="userName" required>
				  </div>
				  <div class="mb-3">
				    <label for="psw" class="form-label">Contraseña:</label>
				    <input type="password" class="form-control" id="psw" placeholder="Contraseña" name="psw" required>
				  </div>
				  
				  <button type="submit" class="btn btn-success">Entrar</button>
				</form>
			</div>
		</div>
	</section>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
