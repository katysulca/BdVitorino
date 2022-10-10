-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2022 a las 19:04:52
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vitorino`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `codigo` int(8) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  `estado` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`codigo`, `descripcion`, `estado`) VALUES
(5, 'Dulce', 'agotado'),
(7, 'Crugiente', 'disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `codigo` int(8) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `ruc` varchar(11) DEFAULT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`codigo`, `nombres`, `apellidos`, `ruc`, `direccion`, `telefono`, `email`) VALUES
(1, 'mario', 'Perez', '00124', 'molina', '989741256', 'mario@gmail.com'),
(3, 'Mario', 'Garcia', '000122', 'Av.Paramericana', '98456321', 'MarioGarcia@gmail.com'),
(5, 'Luis', 'Martinez', '001254', 'Lurin', '989654710', 'luismartinez@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura_compra`
--

CREATE TABLE `detalle_factura_compra` (
  `codigo` int(8) NOT NULL,
  `facturaCompra` int(8) NOT NULL,
  `producto` int(8) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_guia_entrada`
--

CREATE TABLE `detalle_guia_entrada` (
  `codigo` int(8) NOT NULL,
  `producto` int(8) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_guia_salida`
--

CREATE TABLE `detalle_guia_salida` (
  `guiaSalida` int(8) NOT NULL,
  `producto` int(8) NOT NULL,
  `cantidad` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inventario`
--

CREATE TABLE `detalle_inventario` (
  `codigo` int(8) NOT NULL,
  `producto` int(8) NOT NULL,
  `cantidad` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `codigo` int(8) NOT NULL,
  `tipoEmpleado` int(8) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_compra`
--

CREATE TABLE `factura_compra` (
  `codigo` int(8) NOT NULL,
  `proveedor` int(8) NOT NULL,
  `observaciones` varchar(30) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_entrada`
--

CREATE TABLE `guia_entrada` (
  `codigo` int(8) NOT NULL,
  `fecha` date NOT NULL,
  `proveedor` int(8) NOT NULL,
  `facturaCompra` int(8) NOT NULL,
  `observaciones` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_salida`
--

CREATE TABLE `guia_salida` (
  `codigo` int(8) NOT NULL,
  `fecha` date NOT NULL,
  `cliente` int(8) NOT NULL,
  `observaciones` varchar(25) NOT NULL,
  `empleado` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `codigo` int(8) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `guiaEntrada` int(8) NOT NULL,
  `guiaSalida` int(8) NOT NULL,
  `stockInicial` int(11) NOT NULL,
  `totalStock` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` int(8) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `categoria` int(8) NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` varchar(11) NOT NULL,
  `proveedor` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `categoria`, `fechaVencimiento`, `stock`, `precio`, `estado`, `proveedor`) VALUES
(1, 'pan', 5, '2022-08-20', 30, '1.00', 'disponible', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `codigo` int(8) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`codigo`, `nombre`, `ruc`, `direccion`, `telefono`, `email`) VALUES
(1, 'maria', '013', 'vmt', '985412365', 'maria@gmail.com'),
(8, 'luis', '1015', 'SJL', '989565412', 'victor@gmail.com'),
(19, 'Carol', 'Martinez', 'VMT', '989714250', 'carolmartinez@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleados`
--

CREATE TABLE `tipo_empleados` (
  `codigo` int(8) NOT NULL,
  `descripcion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_empleados`
--

INSERT INTO `tipo_empleados` (`codigo`, `descripcion`) VALUES
(1, 'Almacen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `codigo` int(8) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(45) NOT NULL,
  `tipoUsuario` varchar(25) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `detalle_factura_compra`
--
ALTER TABLE `detalle_factura_compra`
  ADD PRIMARY KEY (`codigo`,`facturaCompra`,`producto`),
  ADD KEY `facturaCompra` (`facturaCompra`),
  ADD KEY `producto` (`producto`);

--
-- Indices de la tabla `detalle_guia_entrada`
--
ALTER TABLE `detalle_guia_entrada`
  ADD PRIMARY KEY (`codigo`,`producto`),
  ADD KEY `producto` (`producto`);

--
-- Indices de la tabla `detalle_guia_salida`
--
ALTER TABLE `detalle_guia_salida`
  ADD PRIMARY KEY (`guiaSalida`,`producto`),
  ADD KEY `producto` (`producto`);

--
-- Indices de la tabla `detalle_inventario`
--
ALTER TABLE `detalle_inventario`
  ADD PRIMARY KEY (`codigo`,`producto`),
  ADD KEY `producto` (`producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `tipoEmpleado` (`tipoEmpleado`);

--
-- Indices de la tabla `factura_compra`
--
ALTER TABLE `factura_compra`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `proveedor` (`proveedor`);

--
-- Indices de la tabla `guia_entrada`
--
ALTER TABLE `guia_entrada`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `facturaCompra` (`facturaCompra`),
  ADD KEY `proveedor` (`proveedor`);

--
-- Indices de la tabla `guia_salida`
--
ALTER TABLE `guia_salida`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `empleado` (`empleado`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `guiaEntrada` (`guiaEntrada`),
  ADD KEY `guiaSalida` (`guiaSalida`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `categoria` (`categoria`),
  ADD KEY `proveedor` (`proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `tipo_empleados`
--
ALTER TABLE `tipo_empleados`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD KEY `codigo` (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_factura_compra`
--
ALTER TABLE `detalle_factura_compra`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_guia_entrada`
--
ALTER TABLE `detalle_guia_entrada`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_guia_salida`
--
ALTER TABLE `detalle_guia_salida`
  MODIFY `guiaSalida` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_inventario`
--
ALTER TABLE `detalle_inventario`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura_compra`
--
ALTER TABLE `factura_compra`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guia_entrada`
--
ALTER TABLE `guia_entrada`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guia_salida`
--
ALTER TABLE `guia_salida`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tipo_empleados`
--
ALTER TABLE `tipo_empleados`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codigo` int(8) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_factura_compra`
--
ALTER TABLE `detalle_factura_compra`
  ADD CONSTRAINT `detalle_factura_compra_ibfk_1` FOREIGN KEY (`facturaCompra`) REFERENCES `factura_compra` (`codigo`),
  ADD CONSTRAINT `detalle_factura_compra_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `detalle_guia_entrada`
--
ALTER TABLE `detalle_guia_entrada`
  ADD CONSTRAINT `detalle_guia_entrada_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `guia_entrada` (`codigo`),
  ADD CONSTRAINT `detalle_guia_entrada_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `detalle_guia_salida`
--
ALTER TABLE `detalle_guia_salida`
  ADD CONSTRAINT `detalle_guia_salida_ibfk_1` FOREIGN KEY (`guiaSalida`) REFERENCES `guia_salida` (`codigo`),
  ADD CONSTRAINT `detalle_guia_salida_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `detalle_inventario`
--
ALTER TABLE `detalle_inventario`
  ADD CONSTRAINT `detalle_inventario_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `inventario` (`codigo`),
  ADD CONSTRAINT `detalle_inventario_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`tipoEmpleado`) REFERENCES `tipo_empleados` (`codigo`);

--
-- Filtros para la tabla `factura_compra`
--
ALTER TABLE `factura_compra`
  ADD CONSTRAINT `factura_compra_ibfk_1` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`codigo`);

--
-- Filtros para la tabla `guia_entrada`
--
ALTER TABLE `guia_entrada`
  ADD CONSTRAINT `guia_entrada_ibfk_1` FOREIGN KEY (`facturaCompra`) REFERENCES `factura_compra` (`codigo`),
  ADD CONSTRAINT `guia_entrada_ibfk_2` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`codigo`);

--
-- Filtros para la tabla `guia_salida`
--
ALTER TABLE `guia_salida`
  ADD CONSTRAINT `guia_salida_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`codigo`),
  ADD CONSTRAINT `guia_salida_ibfk_2` FOREIGN KEY (`empleado`) REFERENCES `empleado` (`codigo`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`guiaEntrada`) REFERENCES `guia_entrada` (`codigo`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`guiaSalida`) REFERENCES `guia_salida` (`codigo`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`codigo`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`codigo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `empleado` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
