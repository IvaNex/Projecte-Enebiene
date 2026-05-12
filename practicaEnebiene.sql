-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 12-05-2026 a las 18:05:24
-- Versión del servidor: 10.7.8-MariaDB-1:10.7.8+maria~ubu2004
-- Versión de PHP: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practicaEnebien`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creadores`
--

CREATE TABLE `creadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `creadores`
--

INSERT INTO `creadores` (`id`, `nombre`, `pais`, `imagen`, `descripcion`) VALUES
(1, 'Nintendo', 'Japón', 'nintendo.png', 'Creadores de Mario y Zelda'),
(2, 'Rockstar Games', 'EEUU', 'rockstar.png', 'Famosos por la saga GTA'),
(3, 'Ubisoft', 'Francia', 'ubisoft.png', 'Desarrolladores de Assassin\'s Creed'),
(4, 'Sony Interactive', 'Japón', 'sony.png', 'Responsables de la marca PlayStation'),
(5, 'Electronic Arts', 'EEUU', 'ea.png', 'Líderes en juegos de deportes como FIFA/FC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
(1, 'Acción'),
(2, 'Aventura'),
(3, 'RPG'),
(4, 'Shooter'),
(5, 'Deportes'),
(6, 'Plataformas'),
(7, 'Simulación'),
(8, 'Estrategia'),
(9, 'Terror'),
(10, 'Lucha');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuegos`
--

CREATE TABLE `videojuegos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `fecha_lanzamiento` date DEFAULT NULL,
  `pegi` varchar(10) DEFAULT NULL,
  `es_multijugador` tinyint(1) DEFAULT 0,
  `id_genero` int(11) NOT NULL,
  `id_creador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `videojuegos`
--

INSERT INTO `videojuegos` (`id`, `titulo`, `descripcion`, `precio`, `puntuacion`, `fecha_lanzamiento`, `pegi`, `es_multijugador`, `id_genero`, `id_creador`) VALUES
(1, 'Super Mario Odyssey', 'Una aventura en 3D increíble', 59.99, 97, '2017-10-27', 'PEGI 3', 0, 6, 1),
(2, 'Grand Theft Auto V', 'Mundo abierto en Los Santos', 29.99, 95, '2013-09-17', 'PEGI 18', 1, 1, 2),
(3, 'The Legend of Zelda: Breath of the Wild', 'Exploración sin límites', 69.99, 98, '2017-03-03', 'PEGI 7', 0, 2, 1),
(4, 'Assassin\'s Creed Valhalla', 'Aventura vikinga', 39.99, 80, '2020-11-10', 'PEGI 18', 0, 2, 3),
(5, 'FC 24', 'Simulador de fútbol', 69.99, 75, '2023-09-29', 'PEGI 3', 1, 5, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `creadores`
--
ALTER TABLE `creadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_genero` (`id_genero`),
  ADD KEY `fk_creador` (`id_creador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `creadores`
--
ALTER TABLE `creadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD CONSTRAINT `fk_creador` FOREIGN KEY (`id_creador`) REFERENCES `creadores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_genero` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
