-- phpMyAdmin SQL Dump
-- version 4.7.8
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-03-2018 a las 22:28:32
-- Versión del servidor: 10.2.12-MariaDB
-- Versión de PHP: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mendizalinares`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `idarea` int(11) NOT NULL,
  `areadescripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`idarea`, `areadescripcion`) VALUES
(1, 'Academico'),
(2, 'Administrativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencia`
--

CREATE TABLE `dependencia` (
  `iddependencia` int(11) NOT NULL,
  `dpdescripcion` varchar(100) NOT NULL,
  `idarea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dependencia`
--

INSERT INTO `dependencia` (`iddependencia`, `dpdescripcion`, `idarea`) VALUES
(1, 'Facultad de Ingenieria, Arquitectura y urbanismo', 1),
(2, 'Secretaria general', 2),
(3, 'sistemas', 1),
(4, 'administracion', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_gasto`
--

CREATE TABLE `detalle_gasto` (
  `iddetalle_gasto` int(11) NOT NULL,
  `dgdescripcion` varchar(100) NOT NULL,
  `idtipo_gasto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_gasto`
--

INSERT INTO `detalle_gasto` (`iddetalle_gasto`, `dgdescripcion`, `idtipo_gasto`) VALUES
(1, 'Material de oficina', 1),
(2, 'Remuneraciones', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

CREATE TABLE `presupuesto` (
  `idpresupuesto` int(11) NOT NULL,
  `iddetalle_gasto` int(11) NOT NULL,
  `iddependencia` int(11) NOT NULL,
  `idunidad_og` int(11) NOT NULL,
  `preanio` varchar(4) NOT NULL,
  `premonto` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `presupuesto`
--

INSERT INTO `presupuesto` (`idpresupuesto`, `iddetalle_gasto`, `iddependencia`, `idunidad_og`, `preanio`, `premonto`) VALUES
(1, 2, 4, 4, '2018', 12.00),
(2, 1, 1, 1, '2018', 10.20),
(3, 2, 3, 3, '2018', 5.00),
(4, 2, 4, 4, '2018', 5.00),
(5, 2, 1, 1, '2018', 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_gasto`
--

CREATE TABLE `tipo_gasto` (
  `idtipo_gasto` int(11) NOT NULL,
  `tgdescripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_gasto`
--

INSERT INTO `tipo_gasto` (`idtipo_gasto`, `tgdescripcion`) VALUES
(1, 'Otros gastos'),
(2, 'Personal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_org`
--

CREATE TABLE `unidad_org` (
  `idunidad_org` int(11) NOT NULL,
  `uodescripcion` varchar(100) NOT NULL,
  `iddependencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad_org`
--

INSERT INTO `unidad_org` (`idunidad_org`, `uodescripcion`, `iddependencia`) VALUES
(1, 'primera', 1),
(2, 'segunda', 2),
(3, 'tercera', 3),
(4, 'cuarta', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`idarea`);

--
-- Indices de la tabla `dependencia`
--
ALTER TABLE `dependencia`
  ADD PRIMARY KEY (`iddependencia`),
  ADD KEY `idarea` (`idarea`);

--
-- Indices de la tabla `detalle_gasto`
--
ALTER TABLE `detalle_gasto`
  ADD PRIMARY KEY (`iddetalle_gasto`),
  ADD KEY `idtipo_gasto` (`idtipo_gasto`);

--
-- Indices de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD PRIMARY KEY (`idpresupuesto`),
  ADD KEY `iddetalle_gasto` (`iddetalle_gasto`),
  ADD KEY `idunidad_og` (`idunidad_og`);

--
-- Indices de la tabla `tipo_gasto`
--
ALTER TABLE `tipo_gasto`
  ADD PRIMARY KEY (`idtipo_gasto`);

--
-- Indices de la tabla `unidad_org`
--
ALTER TABLE `unidad_org`
  ADD PRIMARY KEY (`idunidad_org`),
  ADD KEY `iddependencia` (`iddependencia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `idarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `dependencia`
--
ALTER TABLE `dependencia`
  MODIFY `iddependencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_gasto`
--
ALTER TABLE `detalle_gasto`
  MODIFY `iddetalle_gasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  MODIFY `idpresupuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_gasto`
--
ALTER TABLE `tipo_gasto`
  MODIFY `idtipo_gasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `unidad_org`
--
ALTER TABLE `unidad_org`
  MODIFY `idunidad_org` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dependencia`
--
ALTER TABLE `dependencia`
  ADD CONSTRAINT `dependencia_ibfk_1` FOREIGN KEY (`idarea`) REFERENCES `area` (`idarea`);

--
-- Filtros para la tabla `detalle_gasto`
--
ALTER TABLE `detalle_gasto`
  ADD CONSTRAINT `detalle_gasto_ibfk_1` FOREIGN KEY (`idtipo_gasto`) REFERENCES `tipo_gasto` (`idtipo_gasto`);

--
-- Filtros para la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD CONSTRAINT `presupuesto_ibfk_1` FOREIGN KEY (`iddetalle_gasto`) REFERENCES `detalle_gasto` (`iddetalle_gasto`),
  ADD CONSTRAINT `presupuesto_ibfk_2` FOREIGN KEY (`idunidad_og`) REFERENCES `unidad_org` (`idunidad_org`);

--
-- Filtros para la tabla `unidad_org`
--
ALTER TABLE `unidad_org`
  ADD CONSTRAINT `unidad_org_ibfk_1` FOREIGN KEY (`iddependencia`) REFERENCES `dependencia` (`iddependencia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
