<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tu Página con Bootstrap 5</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            padding-top: 56px; /* Altura del navbar fijo en la parte superior */
        }

        /* Estilo para el menú lateral */
        .sidebar {
            position: fixed;
            left: 0;
            top: 56px; /* Altura del navbar fijo en la parte superior */
            bottom: 0;
            width: 25%;
            padding: 20px;
            background-color: #f8f9fa; /* Puedes cambiar el color de fondo según tus preferencias */
            border-right: 1px solid #dee2e6;
            overflow-y: auto; /* Permite desplazamiento vertical si el contenido es más largo que la pantalla */
        }

        /* Ajusta el contenido principal para evitar que se solape con el menú lateral */
        .content {
            margin-left: 25%; /* Ancho del menú lateral */
            padding: 20px;
        }
    </style>
</head>
<body>

    <!-- Navbar fijo en la parte superior -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">Tu Logo</a>
            <!-- Aquí puedes agregar más elementos al navbar si es necesario -->
        </div>
    </nav>

    <!-- Menú lateral fijo a la izquierda -->
    <div class="sidebar">
        <!-- Contenido del menú lateral -->
        <h2>Menú Lateral</h2>
        <ul>
            <li><a href="#">Opción 1</a></li>
            <li><a href="#">Opción 2</a></li>
            <!-- Agrega más opciones según sea necesario -->
        </ul>
    </div>

    <!-- Contenido principal -->
    <div class="content">
        <h1>Contenido Principal</h1>
        <!-- Aquí puedes agregar el resto del contenido de tu página -->
    </div>

    <!-- Bootstrap JS y Popper.js (Requeridos para funcionalidades de Bootstrap) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
