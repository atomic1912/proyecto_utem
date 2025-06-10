-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-11-2024 a las 21:09:58
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
-- Base de datos: `dbtechlab`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delpers` (IN `nrfc` VARCHAR(15))   BEGIN
   DELETE FROM personas WHERE rfc=nrfc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insper` (IN `rfc` VARCHAR(15), `nombre` VARCHAR(30), `app` VARCHAR(30), `apm` VARCHAR(30), `sexo` VARCHAR(10), `edociv` VARCHAR(20))   BEGIN
INSERT INTO personas VALUES (rfc, nombre, app, apm, sexo,edociv);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `udtpers` (IN `nrfc` VARCHAR(15), `nnombre` VARCHAR(30), `napp` VARCHAR(30), `napm` VARCHAR(30), `nsexo` VARCHAR(10), `nedociv` VARCHAR(20))   BEGIN
UPDATE personas SET nombre=nnombre, app=napp, apm=napm, sexo=nsexo, edociv=nedociv WHERE rfc=nrfc;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `idAcceso` int UNSIGNED NOT NULL,
  `idHoraEntrada` int UNSIGNED NOT NULL,
  `idHoraSalida` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesoautorizado`
--

CREATE TABLE `accesoautorizado` (
  `idAccesoAutorizado` int UNSIGNED NOT NULL,
  `idHorasAutorizadas` int UNSIGNED DEFAULT NULL,
  `idLaboratorio` int UNSIGNED DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `numeroControlAdministrador` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador_laboratorio`
--

CREATE TABLE `administrador_laboratorio` (
  `numeroControlAdministrador` int UNSIGNED NOT NULL,
  `idLaboratorio` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `numeroControlAlumno` int UNSIGNED NOT NULL,
  `idGrupo` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anio`
--

CREATE TABLE `anio` (
  `idAnio` int UNSIGNED NOT NULL,
  `anio` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacidad`
--

CREATE TABLE `capacidad` (
  `idCapacidad` int UNSIGNED NOT NULL,
  `cantidadAlumnos` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacidad_laboratorio`
--

CREATE TABLE `capacidad_laboratorio` (
  `idCapacidad` int UNSIGNED NOT NULL,
  `idLaboratorio` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `idColor` int UNSIGNED NOT NULL,
  `nombreColor` varchar(15) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion`
--

CREATE TABLE `descripcion` (
  `idDescripcion` int UNSIGNED NOT NULL,
  `estado` varchar(60) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia`
--

CREATE TABLE `dia` (
  `idDia` int UNSIGNED NOT NULL,
  `dia` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discoduro`
--

CREATE TABLE `discoduro` (
  `idDiscoDuro` int UNSIGNED NOT NULL,
  `capacidadDiscoDuro` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `idEquipo` int UNSIGNED NOT NULL,
  `claveEquipo` varchar(10) NOT NULL,
  `numInventarioEscolar` int UNSIGNED NOT NULL,
  `idRam` int UNSIGNED NOT NULL,
  `idDiscoDuro` int UNSIGNED NOT NULL,
  `idUbicacionEnMesa` int UNSIGNED DEFAULT NULL,
  `idColor` int UNSIGNED DEFAULT NULL,
  `idProcesador` int UNSIGNED NOT NULL,
  `idProducto` int UNSIGNED NOT NULL,
  `idLaboratorio` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idEstado` int UNSIGNED NOT NULL,
  `tipoEstado` varchar(15) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha`
--

CREATE TABLE `fecha` (
  `idFecha` int UNSIGNED NOT NULL,
  `idDia` int UNSIGNED NOT NULL,
  `idMes` int UNSIGNED NOT NULL,
  `idAnio` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idGrupo` int UNSIGNED NOT NULL,
  `nombreGrupo` varchar(10) NOT NULL,
  `cantidadAlumnos` int NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horaentrada`
--

CREATE TABLE `horaentrada` (
  `idHoraEntrada` int UNSIGNED NOT NULL,
  `hora` time NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `idHorario` int UNSIGNED NOT NULL,
  `idLaboratorio` int UNSIGNED NOT NULL,
  `idGrupo` int UNSIGNED NOT NULL,
  `idNombreDia` int UNSIGNED NOT NULL,
  `idAcceso` int UNSIGNED NOT NULL,
  `numeroControlMaestro` int UNSIGNED NOT NULL,
  `idMateria` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horasalida`
--

CREATE TABLE `horasalida` (
  `idHoraSalida` int UNSIGNED NOT NULL,
  `hora` time NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horasautorizadas`
--

CREATE TABLE `horasautorizadas` (
  `idHorasAutorizadas` int UNSIGNED NOT NULL,
  `cantidad` varchar(10) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horasporcuatrimestre`
--

CREATE TABLE `horasporcuatrimestre` (
  `idHorasPorCuatrimestre` int UNSIGNED NOT NULL,
  `cantidad` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `idLaboratorio` int UNSIGNED NOT NULL,
  `nombreLaboratorio` varchar(30) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro`
--

CREATE TABLE `maestro` (
  `numeroControlMaestro` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro_grupo`
--

CREATE TABLE `maestro_grupo` (
  `numeroControlMaestro` int UNSIGNED NOT NULL,
  `idGrupo` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int UNSIGNED NOT NULL,
  `nombreMarca` varchar(30) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idMateria` int UNSIGNED NOT NULL,
  `materia` varchar(50) DEFAULT NULL,
  `idHorasPorCuatrimestre` int UNSIGNED NOT NULL,
  `numeroControlMaestro` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mes`
--

CREATE TABLE `mes` (
  `idMes` int UNSIGNED NOT NULL,
  `mes` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mobiliario`
--

CREATE TABLE `mobiliario` (
  `idmobiliario` int UNSIGNED NOT NULL,
  `claveMobiliario` varchar(20) NOT NULL,
  `idDescripcion` int UNSIGNED NOT NULL,
  `idLaboratorio` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `idModelo` int UNSIGNED NOT NULL,
  `claveModelo` varchar(30) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombredia`
--

CREATE TABLE `nombredia` (
  `idNombreDia` int UNSIGNED NOT NULL,
  `nombreDia` varchar(11) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perifericos`
--

CREATE TABLE `perifericos` (
  `idPeriferico` int UNSIGNED NOT NULL,
  `clavePeriferico` varchar(10) NOT NULL,
  `numInventarioEscolar` int UNSIGNED NOT NULL,
  `idTipoPeriferico` int UNSIGNED NOT NULL,
  `idEquipo` int UNSIGNED NOT NULL,
  `idProducto` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesador`
--

CREATE TABLE `procesador` (
  `idProcesador` int UNSIGNED NOT NULL,
  `nombreProcesador` varchar(15) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int UNSIGNED NOT NULL,
  `numSerie` int UNSIGNED NOT NULL,
  `idModelo` int UNSIGNED DEFAULT NULL,
  `idMarca` int UNSIGNED DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram`
--

CREATE TABLE `ram` (
  `idRam` int UNSIGNED NOT NULL,
  `capacidadRam` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `folio` int UNSIGNED NOT NULL,
  `idLaboratorio` int UNSIGNED NOT NULL,
  `idEquipo` int UNSIGNED NOT NULL,
  `motivo` varchar(150) NOT NULL,
  `numeroControlAlumno` int UNSIGNED NOT NULL,
  `numeroControlMaestro` int UNSIGNED NOT NULL,
  `numeroControlAdministrador` int UNSIGNED NOT NULL,
  `idTipoReporte` int UNSIGNED NOT NULL,
  `idEstado` int UNSIGNED NOT NULL,
  `idFecha` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccionesdemesa`
--

CREATE TABLE `seccionesdemesa` (
  `idSeccionesDeMesa` int UNSIGNED NOT NULL,
  `secciones` varchar(60) NOT NULL,
  `idMobiliario` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudesdeacceso`
--

CREATE TABLE `solicitudesdeacceso` (
  `idSolicitud` int UNSIGNED NOT NULL,
  `idLaboratorio` int UNSIGNED NOT NULL,
  `numeroControlAdministrador` int UNSIGNED NOT NULL,
  `idGrupo` int UNSIGNED NOT NULL,
  `numeroControlMaestro` int UNSIGNED NOT NULL,
  `idAcceso` int UNSIGNED NOT NULL,
  `idAccesoAutorizado` int UNSIGNED DEFAULT NULL,
  `idFecha` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoperiferico`
--

CREATE TABLE `tipoperiferico` (
  `idTipoPeriferico` int UNSIGNED NOT NULL,
  `nombrePeriferico` varchar(30) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporeporte`
--

CREATE TABLE `tiporeporte` (
  `idTipoReporte` int UNSIGNED NOT NULL,
  `nombreTipoReporte` varchar(15) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipoUsuario` int UNSIGNED NOT NULL,
  `nombreTipo` varchar(20) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacionenmesa`
--

CREATE TABLE `ubicacionenmesa` (
  `idUbicacionEnMesa` int UNSIGNED NOT NULL,
  `ubicacion` varchar(15) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadmedida`
--

CREATE TABLE `unidadmedida` (
  `idUnidadMedida` int UNSIGNED NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `idEquipo` int UNSIGNED NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `correo` varchar(50) NOT NULL,
  `nombreCompleto` varchar(60) NOT NULL,
  `telefono` int UNSIGNED NOT NULL,
  `contraseña` varchar(30) NOT NULL,
  `idLaboratorio` int UNSIGNED NOT NULL,
  `numeroControMaestro` int UNSIGNED NOT NULL,
  `numeroControlAlumno` int UNSIGNED NOT NULL,
  `idTipoUsuario` int UNSIGNED NOT NULL,
  `idEquipo` int UNSIGNED DEFAULT NULL
);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`idAcceso`),
  ADD KEY `idHoraEntrada` (`idHoraEntrada`),
  ADD KEY `idHoraSalida` (`idHoraSalida`);

--
-- Indices de la tabla `accesoautorizado`
--
ALTER TABLE `accesoautorizado`
  ADD PRIMARY KEY (`idAccesoAutorizado`),
  ADD KEY `idHorasAutorizadas` (`idHorasAutorizadas`),
  ADD KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`numeroControlAdministrador`);

--
-- Indices de la tabla `administrador_laboratorio`
--
ALTER TABLE `administrador_laboratorio`
  ADD KEY `numeroControlAdministrador` (`numeroControlAdministrador`),
  ADD KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`numeroControlAlumno`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indices de la tabla `anio`
--
ALTER TABLE `anio`
  ADD PRIMARY KEY (`idAnio`);

--
-- Indices de la tabla `capacidad`
--
ALTER TABLE `capacidad`
  ADD PRIMARY KEY (`idCapacidad`);

--
-- Indices de la tabla `capacidad_laboratorio`
--
ALTER TABLE `capacidad_laboratorio`
  ADD KEY `idCapacidad` (`idCapacidad`),
  ADD KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`idColor`);

--
-- Indices de la tabla `descripcion`
--
ALTER TABLE `descripcion`
  ADD PRIMARY KEY (`idDescripcion`);

--
-- Indices de la tabla `dia`
--
ALTER TABLE `dia`
  ADD PRIMARY KEY (`idDia`);

--
-- Indices de la tabla `discoduro`
--
ALTER TABLE `discoduro`
  ADD PRIMARY KEY (`idDiscoDuro`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`idEquipo`),
  ADD KEY `idRam` (`idRam`),
  ADD KEY `idDiscoDuro` (`idDiscoDuro`),
  ADD KEY `idUbicacionEnMesa` (`idUbicacionEnMesa`),
  ADD KEY `idColor` (`idColor`),
  ADD KEY `idProcesador` (`idProcesador`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `fecha`
--
ALTER TABLE `fecha`
  ADD PRIMARY KEY (`idFecha`),
  ADD KEY `idDia` (`idDia`),
  ADD KEY `idMes` (`idMes`),
  ADD KEY `idAnio` (`idAnio`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`);

--
-- Indices de la tabla `horaentrada`
--
ALTER TABLE `horaentrada`
  ADD PRIMARY KEY (`idHoraEntrada`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`idHorario`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idNombreDia` (`idNombreDia`),
  ADD KEY `idAcceso` (`idAcceso`),
  ADD KEY `numeroControlMaestro` (`numeroControlMaestro`),
  ADD KEY `idMateria` (`idMateria`);

--
-- Indices de la tabla `horasalida`
--
ALTER TABLE `horasalida`
  ADD PRIMARY KEY (`idHoraSalida`);

--
-- Indices de la tabla `horasautorizadas`
--
ALTER TABLE `horasautorizadas`
  ADD PRIMARY KEY (`idHorasAutorizadas`);

--
-- Indices de la tabla `horasporcuatrimestre`
--
ALTER TABLE `horasporcuatrimestre`
  ADD PRIMARY KEY (`idHorasPorCuatrimestre`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`idLaboratorio`);

--
-- Indices de la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD PRIMARY KEY (`numeroControlMaestro`);

--
-- Indices de la tabla `maestro_grupo`
--
ALTER TABLE `maestro_grupo`
  ADD KEY `numeroControlMaestro` (`numeroControlMaestro`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idMateria`),
  ADD KEY `idHorasPorCuatrimestre` (`idHorasPorCuatrimestre`),
  ADD KEY `numeroControlMaestro` (`numeroControlMaestro`);

--
-- Indices de la tabla `mes`
--
ALTER TABLE `mes`
  ADD PRIMARY KEY (`idMes`);

--
-- Indices de la tabla `mobiliario`
--
ALTER TABLE `mobiliario`
  ADD PRIMARY KEY (`idmobiliario`),
  ADD KEY `idDescripcion` (`idDescripcion`),
  ADD KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idModelo`);

--
-- Indices de la tabla `nombredia`
--
ALTER TABLE `nombredia`
  ADD PRIMARY KEY (`idNombreDia`);

--
-- Indices de la tabla `perifericos`
--
ALTER TABLE `perifericos`
  ADD PRIMARY KEY (`idPeriferico`),
  ADD KEY `idTipoPeriferico` (`idTipoPeriferico`),
  ADD KEY `idEquipo` (`idEquipo`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `procesador`
--
ALTER TABLE `procesador`
  ADD PRIMARY KEY (`idProcesador`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idModelo` (`idModelo`),
  ADD KEY `idMarca` (`idMarca`);

--
-- Indices de la tabla `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`idRam`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `idEquipo` (`idEquipo`),
  ADD KEY `numeroControlAlumno` (`numeroControlAlumno`),
  ADD KEY `numeroControlMaestro` (`numeroControlMaestro`),
  ADD KEY `numeroControlAdministrador` (`numeroControlAdministrador`),
  ADD KEY `idTipoReporte` (`idTipoReporte`),
  ADD KEY `idEstado` (`idEstado`),
  ADD KEY `idFecha` (`idFecha`);

--
-- Indices de la tabla `seccionesdemesa`
--
ALTER TABLE `seccionesdemesa`
  ADD PRIMARY KEY (`idSeccionesDeMesa`),
  ADD KEY `idMobiliario` (`idMobiliario`);

--
-- Indices de la tabla `solicitudesdeacceso`
--
ALTER TABLE `solicitudesdeacceso`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `numeroControlAdministrador` (`numeroControlAdministrador`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `numeroControlMaestro` (`numeroControlMaestro`),
  ADD KEY `idAcceso` (`idAcceso`),
  ADD KEY `idAccesoAutorizado` (`idAccesoAutorizado`),
  ADD KEY `idFecha` (`idFecha`);

--
-- Indices de la tabla `tipoperiferico`
--
ALTER TABLE `tipoperiferico`
  ADD PRIMARY KEY (`idTipoPeriferico`);

--
-- Indices de la tabla `tiporeporte`
--
ALTER TABLE `tiporeporte`
  ADD PRIMARY KEY (`idTipoReporte`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `ubicacionenmesa`
--
ALTER TABLE `ubicacionenmesa`
  ADD PRIMARY KEY (`idUbicacionEnMesa`);

--
-- Indices de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  ADD PRIMARY KEY (`idUnidadMedida`),
  ADD KEY `idEquipo` (`idEquipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`correo`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `numeroControlAlumno` (`numeroControlAlumno`),
  ADD KEY `numeroControMaestro` (`numeroControMaestro`),
  ADD KEY `idTipoUsuario` (`idTipoUsuario`),
  ADD KEY `idEquipo` (`idEquipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `idAcceso` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `accesoautorizado`
--
ALTER TABLE `accesoautorizado`
  MODIFY `idAccesoAutorizado` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `numeroControlAdministrador` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `anio`
--
ALTER TABLE `anio`
  MODIFY `idAnio` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capacidad`
--
ALTER TABLE `capacidad`
  MODIFY `idCapacidad` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `idColor` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dia`
--
ALTER TABLE `dia`
  MODIFY `idDia` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `discoduro`
--
ALTER TABLE `discoduro`
  MODIFY `idDiscoDuro` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `idEquipo` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fecha`
--
ALTER TABLE `fecha`
  MODIFY `idFecha` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idGrupo` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horaentrada`
--
ALTER TABLE `horaentrada`
  MODIFY `idHoraEntrada` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `idHorario` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horasalida`
--
ALTER TABLE `horasalida`
  MODIFY `idHoraSalida` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horasautorizadas`
--
ALTER TABLE `horasautorizadas`
  MODIFY `idHorasAutorizadas` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horasporcuatrimestre`
--
ALTER TABLE `horasporcuatrimestre`
  MODIFY `idHorasPorCuatrimestre` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `idLaboratorio` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idMarca` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idMateria` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mes`
--
ALTER TABLE `mes`
  MODIFY `idMes` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mobiliario`
--
ALTER TABLE `mobiliario`
  MODIFY `idmobiliario` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `idModelo` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nombredia`
--
ALTER TABLE `nombredia`
  MODIFY `idNombreDia` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perifericos`
--
ALTER TABLE `perifericos`
  MODIFY `idPeriferico` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `procesador`
--
ALTER TABLE `procesador`
  MODIFY `idProcesador` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ram`
--
ALTER TABLE `ram`
  MODIFY `idRam` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `folio` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudesdeacceso`
--
ALTER TABLE `solicitudesdeacceso`
  MODIFY `idSolicitud` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoperiferico`
--
ALTER TABLE `tipoperiferico`
  MODIFY `idTipoPeriferico` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiporeporte`
--
ALTER TABLE `tiporeporte`
  MODIFY `idTipoReporte` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacionenmesa`
--
ALTER TABLE `ubicacionenmesa`
  MODIFY `idUbicacionEnMesa` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  MODIFY `idUnidadMedida` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`idHoraEntrada`) REFERENCES `horaentrada` (`idHoraEntrada`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acceso_ibfk_2` FOREIGN KEY (`idHoraSalida`) REFERENCES `horasalida` (`idHoraSalida`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `accesoautorizado`
--
ALTER TABLE `accesoautorizado`
  ADD CONSTRAINT `accesoautorizado_ibfk_1` FOREIGN KEY (`idHorasAutorizadas`) REFERENCES `horasautorizadas` (`idHorasAutorizadas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accesoautorizado_ibfk_2` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `administrador_laboratorio`
--
ALTER TABLE `administrador_laboratorio`
  ADD CONSTRAINT `administrador_laboratorio_ibfk_1` FOREIGN KEY (`numeroControlAdministrador`) REFERENCES `administrador` (`numeroControlAdministrador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrador_laboratorio_ibfk_2` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `capacidad_laboratorio`
--
ALTER TABLE `capacidad_laboratorio`
  ADD CONSTRAINT `capacidad_laboratorio_ibfk_1` FOREIGN KEY (`idCapacidad`) REFERENCES `capacidad` (`idCapacidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `capacidad_laboratorio_ibfk_2` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idRam`) REFERENCES `ram` (`idRam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`idDiscoDuro`) REFERENCES `discoduro` (`idDiscoDuro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_3` FOREIGN KEY (`idUbicacionEnMesa`) REFERENCES `ubicacionenmesa` (`idUbicacionEnMesa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_4` FOREIGN KEY (`idColor`) REFERENCES `color` (`idColor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_5` FOREIGN KEY (`idProcesador`) REFERENCES `procesador` (`idProcesador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_6` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_7` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fecha`
--
ALTER TABLE `fecha`
  ADD CONSTRAINT `fecha_ibfk_1` FOREIGN KEY (`idDia`) REFERENCES `dia` (`idDia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fecha_ibfk_2` FOREIGN KEY (`idMes`) REFERENCES `mes` (`idMes`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fecha_ibfk_3` FOREIGN KEY (`idAnio`) REFERENCES `anio` (`idAnio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `horario_ibfk_3` FOREIGN KEY (`idNombreDia`) REFERENCES `nombredia` (`idNombreDia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `horario_ibfk_4` FOREIGN KEY (`idAcceso`) REFERENCES `acceso` (`idAcceso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `horario_ibfk_5` FOREIGN KEY (`numeroControlMaestro`) REFERENCES `maestro` (`numeroControlMaestro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `horario_ibfk_6` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `maestro_grupo`
--
ALTER TABLE `maestro_grupo`
  ADD CONSTRAINT `maestro_grupo_ibfk_1` FOREIGN KEY (`numeroControlMaestro`) REFERENCES `maestro` (`numeroControlMaestro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maestro_grupo_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`idHorasPorCuatrimestre`) REFERENCES `horasporcuatrimestre` (`idHorasPorCuatrimestre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`numeroControlMaestro`) REFERENCES `maestro` (`numeroControlMaestro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mobiliario`
--
ALTER TABLE `mobiliario`
  ADD CONSTRAINT `mobiliario_ibfk_1` FOREIGN KEY (`idDescripcion`) REFERENCES `descripcion` (`idDescripcion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mobiliario_ibfk_2` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `perifericos`
--
ALTER TABLE `perifericos`
  ADD CONSTRAINT `perifericos_ibfk_1` FOREIGN KEY (`idTipoPeriferico`) REFERENCES `tipoperiferico` (`idTipoPeriferico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perifericos_ibfk_2` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perifericos_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idModelo`) REFERENCES `modelo` (`idModelo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reporte_ibfk_2` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reporte_ibfk_3` FOREIGN KEY (`numeroControlAlumno`) REFERENCES `alumno` (`numeroControlAlumno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reporte_ibfk_4` FOREIGN KEY (`numeroControlMaestro`) REFERENCES `maestro` (`numeroControlMaestro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reporte_ibfk_5` FOREIGN KEY (`numeroControlAdministrador`) REFERENCES `administrador` (`numeroControlAdministrador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reporte_ibfk_6` FOREIGN KEY (`idTipoReporte`) REFERENCES `tiporeporte` (`idTipoReporte`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reporte_ibfk_7` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reporte_ibfk_8` FOREIGN KEY (`idFecha`) REFERENCES `fecha` (`idFecha`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccionesdemesa`
--
ALTER TABLE `seccionesdemesa`
  ADD CONSTRAINT `seccionesdemesa_ibfk_1` FOREIGN KEY (`idMobiliario`) REFERENCES `mobiliario` (`idmobiliario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitudesdeacceso`
--
ALTER TABLE `solicitudesdeacceso`
  ADD CONSTRAINT `solicitudesdeacceso_ibfk_1` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudesdeacceso_ibfk_2` FOREIGN KEY (`numeroControlAdministrador`) REFERENCES `administrador` (`numeroControlAdministrador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudesdeacceso_ibfk_3` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudesdeacceso_ibfk_4` FOREIGN KEY (`numeroControlMaestro`) REFERENCES `maestro` (`numeroControlMaestro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudesdeacceso_ibfk_5` FOREIGN KEY (`idAcceso`) REFERENCES `acceso` (`idAcceso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudesdeacceso_ibfk_6` FOREIGN KEY (`idAccesoAutorizado`) REFERENCES `accesoautorizado` (`idAccesoAutorizado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudesdeacceso_ibfk_7` FOREIGN KEY (`idFecha`) REFERENCES `fecha` (`idFecha`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `unidadmedida`
--
ALTER TABLE `unidadmedida`
  ADD CONSTRAINT `unidadmedida_ibfk_1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`numeroControlAlumno`) REFERENCES `alumno` (`numeroControlAlumno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`numeroControMaestro`) REFERENCES `maestro` (`numeroControlMaestro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_5` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
