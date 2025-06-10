-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-12-2024 a las 14:59:52
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbinventariolab`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_categoria` (IN `id` INT, IN `nuevo_nombre` VARCHAR(50))   BEGIN
    UPDATE categorias 
    SET nombre_categoria = nuevo_nombre 
    WHERE id_categoria = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crear_categoria` (IN `nombre` VARCHAR(50))   BEGIN
    INSERT INTO categorias (nombre_categoria) VALUES (nombre);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_categoria` (IN `id` INT)   BEGIN
    DELETE FROM categorias WHERE id_categoria = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_categorias` ()   BEGIN
    SELECT * FROM categorias;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcionCategoria` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcionCategoria`) VALUES
(1, 'Computadoras y Periféricos', 'PC de escritorio, Laptops, Monitores, Impresoras, Teclados, Mouse, Escáneres'),
(2, 'Herramientas Manuales', 'Desarmadores, Llaves ajustables, Alicates, Martillos, Pinzas de precisión'),
(3, 'Equipos Electrónicos', 'Multímetros, Fuentes de poder , Soldadores eléctricos, Generadores de señal'),
(4, 'Materiales Consumibles', 'Cables (USB, HDMI, Ethernet, etc.), Conectores, Resistencias, Capacitores, Protoboards'),
(5, 'Equipos de Medición', 'Calibradores, Termómetros digitales, Tacómetros, Sensores (temperatura, humedad, etc.)'),
(6, 'Componentes Electrónicos', 'Circuitos integrados, Microcontroladores, Transistores, Diodos, LEDs, Placas'),
(7, 'Equipos de Redes y Telecomunicaciones', 'Routers, Switches, Access points, Patch panels, Herramientas de ponchado, Tester de Red'),
(8, 'Instrumentos de Seguridad y Prevención', 'Extintores, Alarmas, Detectores de humo, Cámaras de seguridad'),
(9, 'Otros', 'Mobiliario (mesas, sillas, gabinetes), Software con licencia, Manuales de usuario y documentación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_productos`
--

CREATE TABLE `detalles_productos` (
  `id_detalle` int NOT NULL,
  `id_producto` int NOT NULL,
  `numero_serie` varchar(100) DEFAULT NULL,
  `numero_inventario` varchar(50) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `agrupar` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estado` int NOT NULL,
  `nombre_estado` varchar(50) NOT NULL,
  `descripcionEstado` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `nombre_estado`, `descripcionEstado`) VALUES
(1, 'Nuevo', 'El material no ha sido usado / Se encuentra en su empaque original o recién adquirido.'),
(2, 'Usado', 'Ha sido utilizado previamente pero está en condiciones funcionales / Puede tener signos de desgaste menores, como arañazos o marcas'),
(3, 'En reparación', 'El material no está operativo y está en proceso de reparación / Podría estar bajo diagnóstico o esperando piezas de repuesto.'),
(4, 'Defectuoso', 'No funciona correctamente y no está en uso / Puede estar a la espera de decisión para reparación o reemplazo.'),
(5, 'Disponible', 'Operativo y listo para ser usado por los usuarios del laboratorio / Está en el inventario activo.'),
(6, 'Reservado', 'Apartado para un proyecto específico o asignado temporalmente a un usuario o grupo.'),
(7, 'Prestado', 'Retirado temporalmente del laboratorio por algún usuario / Debe haber un registro de quién lo tiene y cuándo se espera su devolución.'),
(8, 'Obsoleto', 'El material ya no cumple con las especificaciones actuales y está fuera de servicio / Puede estar pendiente de reciclaje o eliminación.'),
(9, 'Extraviado', 'Reportado como perdido en el inventario / Puede estar en proceso de búsqueda o investigación.'),
(10, 'Baja', 'Formalmente dado de baja del inventario / Esto puede incluir materiales vendidos, reciclados o desechados.'),
(11, 'En mantenimiento preventivo', 'Está siendo revisado para garantizar su funcionamiento continuo / No está disponible temporalmente.'),
(12, 'En evaluación', 'Nuevo equipo que está siendo probado antes de su uso regular / Puede incluir configuraciones iniciales o capacitación sobre su uso.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenesproductos`
--

CREATE TABLE `imagenesproductos` (
  `idImagen` int NOT NULL,
  `nombreImagen` varchar(200) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `bPrincpal` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `id_categoria` int NOT NULL,
  `id_ubicacion` int NOT NULL,
  `id_estado` int NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id_ubicacion` int NOT NULL,
  `nombreUbicacion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descripcionUbicacion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`id_ubicacion`, `nombreUbicacion`, `descripcionUbicacion`) VALUES
(1, 'Laboratorio de Soporte', 'Se encuentra en el Módulo 1, planta alta, subiendo escaleras principales al fondo a la izquierda, subiendo por las escaleras de emergencia, el primer laboratorio de la derecha\nTiene capacidad para aproximadamente 37 computadoras de escritorio, incluyendo la del docente.\nTiene capacidad para aproximadamente 50 personas.'),
(2, 'Laboratorio de Desarrollo', 'Se encuentra en el Módulo 1, planta alta, subiendo escaleras principales al fondo a la derecha, subiendo por las escaleras de emergencia, el primer laboratorio de la izquierda\r\nTiene capacidad para aproximadamente 31 computadoras de escritorio, incluyendo la del docente.\r\nTiene capacidad para aproximadamente 40 personas.'),
(3, 'Oficina / Bodega 1. Laboratorio Soporte', 'Se encuentra en Modulo 1, planta alta, dentro del laboratorio de soporte, puerta de la izquierda.\r\n'),
(4, 'Bodega 2. Laboratorio Soporte', 'Se encuentra en Modulo 1, planta alta, dentro del laboratorio de soporte, puerta de la derecha.'),
(5, 'Laboratorio de IoT (Aula 9)', 'Se encuentra en el Módulo 1, planta alta, Aula 9\r\nTiene capacidad para aproximadamente 19 computadoras de escritorio, incluyendo la del docente.\r\nTiene capacidad para aproximadamente 25 personas.');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_productos_con_cantidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_productos_con_cantidad` (
`cantidad` int
,`categoria` varchar(50)
,`id_producto` int
,`nombre_producto` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_productos_defectuosos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_productos_defectuosos` (
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_productos_detalles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_productos_detalles` (
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_productos_por_categoria`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_productos_por_categoria` (
`categoria` varchar(50)
,`total_productos` bigint
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_productos_con_cantidad`
--
DROP TABLE IF EXISTS `vw_productos_con_cantidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_productos_con_cantidad`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre_producto` AS `nombre_producto`, `c`.`nombre_categoria` AS `categoria`, `d`.`cantidad` AS `cantidad` FROM ((`productos` `p` join `categorias` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) join `detalles_productos` `d` on((`p`.`id_producto` = `d`.`id_producto`))) WHERE (`d`.`cantidad` > 0) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_productos_defectuosos`
--
DROP TABLE IF EXISTS `vw_productos_defectuosos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_productos_defectuosos`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre_producto` AS `nombre_producto`, `c`.`nombre_categoria` AS `categoria`, `u`.`nombre_ubicacion` AS `ubicacion`, `e`.`nombre_estado` AS `estado` FROM (((`productos` `p` join `categorias` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) join `ubicaciones` `u` on((`p`.`id_ubicacion` = `u`.`id_ubicacion`))) join `estados` `e` on((`p`.`id_estado` = `e`.`id_estado`))) WHERE (`e`.`nombre_estado` = 'Defectuoso') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_productos_detalles`
--
DROP TABLE IF EXISTS `vw_productos_detalles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_productos_detalles`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre_producto` AS `nombre_producto`, `p`.`descripcion` AS `descripcion`, `c`.`nombre_categoria` AS `categoria`, `u`.`nombre_ubicacion` AS `ubicacion`, `e`.`nombre_estado` AS `estado`, `d`.`numero_serie` AS `numero_serie`, `d`.`numero_inventario` AS `numero_inventario`, `d`.`cantidad` AS `cantidad`, `d`.`agrupar` AS `agrupar` FROM ((((`productos` `p` left join `categorias` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) left join `ubicaciones` `u` on((`p`.`id_ubicacion` = `u`.`id_ubicacion`))) left join `estados` `e` on((`p`.`id_estado` = `e`.`id_estado`))) left join `detalles_productos` `d` on((`p`.`id_producto` = `d`.`id_producto`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_productos_por_categoria`
--
DROP TABLE IF EXISTS `vw_productos_por_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_productos_por_categoria`  AS SELECT `c`.`nombre_categoria` AS `categoria`, count(`p`.`id_producto`) AS `total_productos` FROM (`productos` `p` join `categorias` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) GROUP BY `c`.`nombre_categoria` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `detalles_productos`
--
ALTER TABLE `detalles_productos`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`),
  ADD UNIQUE KEY `nombre_estado` (`nombre_estado`);

--
-- Indices de la tabla `imagenesproductos`
--
ALTER TABLE `imagenesproductos`
  ADD PRIMARY KEY (`idImagen`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_ubicacion` (`id_ubicacion`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id_ubicacion`),
  ADD UNIQUE KEY `nombre_ubicacion` (`nombreUbicacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detalles_productos`
--
ALTER TABLE `detalles_productos`
  MODIFY `id_detalle` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `imagenesproductos`
--
ALTER TABLE `imagenesproductos`
  MODIFY `idImagen` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id_ubicacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_productos`
--
ALTER TABLE `detalles_productos`
  ADD CONSTRAINT `detalles_productos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicaciones` (`id_ubicacion`),
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
