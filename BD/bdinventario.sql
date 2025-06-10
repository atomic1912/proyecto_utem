-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-11-2024 a las 18:33:18
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
-- Base de datos: `bdinventario`
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
  `nombre_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `nombre_estado` varchar(50) NOT NULL
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
  `nombre_ubicacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_productos_con_cantidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_productos_con_cantidad` (
`id_producto` int
,`nombre_producto` varchar(100)
,`categoria` varchar(50)
,`cantidad` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_productos_defectuosos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_productos_defectuosos` (
`id_producto` int
,`nombre_producto` varchar(100)
,`categoria` varchar(50)
,`ubicacion` varchar(100)
,`estado` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_productos_detalles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_productos_detalles` (
`id_producto` int
,`nombre_producto` varchar(100)
,`descripcion` text
,`categoria` varchar(50)
,`ubicacion` varchar(100)
,`estado` varchar(50)
,`numero_serie` varchar(100)
,`numero_inventario` varchar(50)
,`cantidad` int
,`agrupar` tinyint(1)
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
  ADD UNIQUE KEY `nombre_ubicacion` (`nombre_ubicacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_productos`
--
ALTER TABLE `detalles_productos`
  MODIFY `id_detalle` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id_ubicacion` int NOT NULL AUTO_INCREMENT;

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
