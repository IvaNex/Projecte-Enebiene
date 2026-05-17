-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 14-05-2026 a las 10:16:40
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
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `creadores`
--

INSERT INTO `creadores` (`id`, `nombre`, `pais`, `descripcion`) VALUES
(1, 'Nintendo', 'Japón', 'Creadores de Mario y Zelda'),
(2, 'Rockstar Games', 'EEUU', 'Famosos por la saga GTA'),
(3, 'Ubisoft', 'Francia', 'Desarrolladores de Assassin\'s Creed'),
(4, 'Sony Interactive', 'Japón', 'Responsables de la marca PlayStation'),
(5, 'Electronic Arts', 'EEUU', 'Líderes en juegos de deportes como FIFA/FC'),
(6, 'Sega', 'Japó', 'Creadors de Sonic'),
(7, 'Capcom', 'Japó', 'Resident Evil i Street Fighter'),
(8, 'Square Enix', 'Japó', 'Final Fantasy i Kingdom Hearts'),
(9, 'Konami', 'Japó', 'Metal Gear i Silent Hill'),
(10, 'Bandai Namco', 'Japó', 'Pac-Man i Tekken'),
(11, 'Activision', 'EUA', 'Call of Duty'),
(12, 'Blizzard', 'EUA', 'World of Warcraft'),
(13, 'Bethesda', 'EUA', 'Skyrim i Fallout'),
(14, 'Valve', 'EUA', 'Half-Life i Steam'),
(15, 'Epic Games', 'EUA', 'Fortnite i Unreal'),
(16, 'BioWare', 'Canadà', 'Mass Effect'),
(17, 'CD Projekt Red', 'Polònia', 'The Witcher i Cyberpunk'),
(18, 'FromSoftware', 'Japó', 'Dark Souls i Elden Ring'),
(19, 'Insomniac Games', 'EUA', 'Spider-Man i Ratchet'),
(20, 'Naughty Dog', 'EUA', 'The Last of Us'),
(21, 'Santa Monica Studio', 'EUA', 'God of War'),
(22, 'PlatinumGames', 'Japó', 'Bayonetta'),
(23, 'Team Cherry', 'Austràlia', 'Hollow Knight'),
(24, 'Mojang', 'Suècia', 'Minecraft'),
(25, 'Supergiant Games', 'EUA', 'Hades'),
(26, 'Rare', 'Regne Unit', 'Sea of Thieves'),
(27, 'Obsidian', 'EUA', 'Fallout New Vegas'),
(28, 'id Software', 'EUA', 'DOOM'),
(29, 'Arkane Studios', 'França', 'Dishonored'),
(30, 'Remedy Entertainment', 'Finlàndia', 'Alan Wake'),
(31, 'Techland', 'Polònia', 'Dying Light'),
(32, 'Guerrilla Games', 'Països Baixos', 'Horizon Zero Dawn'),
(33, 'Sucker Punch', 'EUA', 'Ghost of Tsushima'),
(34, 'Quantic Dream', 'França', 'Detroit Become Human'),
(35, 'Telltale Games', 'EUA', 'The Walking Dead'),
(36, 'Media Molecule', 'Regne Unit', 'LittleBigPlanet'),
(37, 'Polyphony Digital', 'Japó', 'Gran Turismo'),
(38, 'Warner Bros Games', 'EUA', 'Batman Arkham'),
(39, 'Gearbox Software', 'EUA', 'Borderlands'),
(40, 'Crytek', 'Alemanya', 'Crysis'),
(41, 'Creative Assembly', 'Regne Unit', 'Total War'),
(42, 'Paradox Interactive', 'Suècia', 'Stellaris'),
(43, 'Hello Games', 'Regne Unit', 'No Mans Sky'),
(44, 'Kojima Productions', 'Japó', 'Death Stranding'),
(45, 'Devolver Digital', 'EUA', 'Hotline Miami'),
(46, 'Playdead', 'Dinamarca', 'Limbo'),
(47, 'Team17', 'Regne Unit', 'Worms'),
(48, 'Riot Games', 'EUA', 'League of Legends'),
(49, 'Bungie', 'EUA', 'Halo i Destiny'),
(50, 'Respawn Entertainment', 'EUA', 'Apex Legends');

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
(5, 'FC 24', 'Simulador de fútbol', 69.99, 75, '2023-09-29', 'PEGI 3', 1, 5, 5),
(6, 'Sonic Frontiers', 'Aventura de velocidad en mundo abierto', 59.99, 75, '2022-11-08', 'PEGI 7', 0, 1, 6),
(7, 'Resident Evil Village', 'Terror y acción en una aldea misteriosa', 39.99, 84, '2021-05-07', 'PEGI 18', 0, 1, 7),
(8, 'Devil May Cry 5', 'Acción estilizada con cazadores de demonios', 29.99, 88, '2019-03-08', 'PEGI 18', 1, 1, 7),
(9, 'Metal Gear Solid V', 'Infiltración táctica en mundo abierto', 19.99, 93, '2015-09-01', 'PEGI 18', 1, 1, 9),
(10, 'Call of Duty: MWIII', 'Shooter bélico de ritmo frenético', 69.99, 60, '2023-11-10', 'PEGI 18', 1, 1, 11),
(11, 'Spider-Man 2', 'Balanceo y combate por Nueva York', 79.99, 90, '2023-10-20', 'PEGI 16', 0, 1, 19),
(12, 'God of War Ragnarok', 'Épica conclusión de la saga nórdica', 69.99, 94, '2022-11-09', 'PEGI 18', 0, 1, 21),
(13, 'Bayonetta 3', 'Acción desenfrenada con la bruja de Umbra', 59.99, 86, '2022-10-28', 'PEGI 16', 0, 1, 22),
(14, 'Dishonored 2', 'Sigilo y poderes sobrenaturales', 14.99, 88, '2016-11-11', 'PEGI 18', 0, 1, 29),
(15, 'Dying Light 2', 'Parkour y zombis en una ciudad devastada', 49.99, 76, '2022-02-04', 'PEGI 18', 1, 1, 31),
(16, 'Final Fantasy VII Rebirth', 'Segunda parte del remake legendario', 79.99, 92, '2024-02-29', 'PEGI 16', 0, 2, 8),
(17, 'Kingdom Hearts III', 'Aventura mágica con personajes de Disney', 24.99, 83, '2019-01-25', 'PEGI 7', 0, 2, 8),
(18, 'Elden Ring', 'Desafío extremo en las Tierras Intermedias', 59.99, 96, '2022-02-25', 'PEGI 16', 1, 2, 18),
(19, 'The Last of Us Part II', 'Historia cruda de venganza y supervivencia', 39.99, 93, '2020-06-19', 'PEGI 18', 0, 2, 20),
(20, 'Uncharted 4', 'La última gran aventura de Nathan Drake', 19.99, 93, '2016-05-10', 'PEGI 16', 1, 2, 20),
(21, 'Horizon Forbidden West', 'Mundo post-apocalíptico de máquinas', 49.99, 88, '2022-02-18', 'PEGI 16', 0, 2, 32),
(22, 'Ghost of Tsushima', 'El camino del samurái en una isla invadida', 49.99, 87, '2020-07-17', 'PEGI 18', 1, 2, 33),
(23, 'Detroit: Become Human', 'Drama interactivo sobre androides', 29.99, 78, '2018-05-25', 'PEGI 18', 0, 2, 34),
(24, 'Death Stranding', 'Conectar un mundo fragmentado', 34.99, 82, '2019-11-08', 'PEGI 18', 1, 2, 44),
(25, 'No Mans Sky', 'Exploración espacial infinita', 49.99, 71, '2016-08-09', 'PEGI 7', 1, 2, 43),
(26, 'Skyrim Anniversary Edition', 'El RPG de fantasía definitivo', 39.99, 94, '2021-11-11', 'PEGI 18', 0, 3, 13),
(27, 'Starfield', 'Exploración de la NASA-punk en el espacio', 69.99, 83, '2023-09-06', 'PEGI 16', 0, 3, 13),
(28, 'The Witcher 3', 'Caza de monstruos en un mundo rico', 29.99, 92, '2015-05-19', 'PEGI 18', 0, 3, 17),
(29, 'Cyberpunk 2077', 'Futuro distópico en Night City', 49.99, 86, '2020-12-10', 'PEGI 18', 0, 3, 17),
(30, 'Mass Effect Legendary', 'Trilogía épica de ópera espacial', 59.99, 90, '2021-05-14', 'PEGI 18', 0, 3, 16),
(31, 'Hades', 'Escapa del inframundo griego', 24.99, 93, '2020-09-17', 'PEGI 12', 0, 3, 25),
(32, 'Baldurs Gate 3', 'Estrategia y rol profundo de D&D', 59.99, 96, '2023-08-03', 'PEGI 18', 1, 3, 15),
(33, 'Fallout: New Vegas', 'Supervivencia en el desierto post-nuclear', 9.99, 84, '2010-10-19', 'PEGI 18', 0, 3, 27),
(34, 'Star Wars Jedi: Survivor', 'El camino de un caballero Jedi', 69.99, 85, '2023-04-28', 'PEGI 16', 0, 3, 50),
(35, 'Diablo IV', 'Lucha eterna contra las legiones del infierno', 69.99, 86, '2023-06-05', 'PEGI 18', 1, 3, 12),
(36, 'Overwatch 2', 'Héroes compitiendo en arenas por equipos', 0.00, 79, '2022-10-04', 'PEGI 12', 1, 4, 12),
(37, 'Half-Life: Alyx', 'Revolución de la VR en el universo Valve', 58.99, 93, '2020-03-23', 'PEGI 18', 0, 4, 14),
(38, 'Counter-Strike 2', 'Táctica competitiva de disparos', 0.00, 82, '2023-09-27', 'PEGI 18', 1, 4, 14),
(39, 'DOOM Eternal', 'Matanza frenética de demonios', 39.99, 88, '2020-03-20', 'PEGI 18', 1, 4, 28),
(40, 'Borderlands 3', 'Caos de botín y disparos en Pandora', 59.99, 81, '2019-09-13', 'PEGI 18', 1, 4, 39),
(41, 'Crysis Remastered', '¿Puede tu PC moverlo? Acción técnica', 29.99, 70, '2020-09-18', 'PEGI 16', 0, 4, 40),
(42, 'Apex Legends', 'Battle Royale de ritmo rápido', 0.00, 88, '2019-02-04', 'PEGI 12', 1, 4, 50),
(43, 'Destiny 2', 'Aventura de acción en un mundo persistente', 0.00, 85, '2017-09-06', 'PEGI 16', 1, 4, 49),
(44, 'Halo Infinite', 'El regreso del Jefe Maestro', 59.99, 87, '2021-12-08', 'PEGI 16', 1, 4, 49),
(45, 'Valorant', 'Shooter táctico con habilidades únicas', 0.00, 80, '2020-06-02', 'PEGI 16', 1, 4, 48),
(46, 'Madden NFL 24', 'Fútbol americano profesional', 69.99, 70, '2023-08-18', 'PEGI 3', 1, 5, 5),
(47, 'F1 23', 'El circo de la Fórmula 1', 69.99, 84, '2023-06-16', 'PEGI 3', 1, 5, 5),
(48, 'Gran Turismo 7', 'El simulador de conducción real', 69.99, 87, '2022-03-04', 'PEGI 3', 1, 5, 37),
(49, 'NBA 2K24', 'La mejor experiencia de baloncesto', 69.99, 68, '2023-09-08', 'PEGI 3', 1, 5, 2),
(50, 'Tony Hawks Pro Skater 1+2', 'Remake de los clásicos del skate', 39.99, 89, '2020-09-04', 'PEGI 12', 1, 5, 11),
(51, 'Rocket League', 'Fútbol con coches propulsados', 0.00, 86, '2015-07-07', 'PEGI 3', 1, 5, 15),
(52, 'Worms W.M.D', 'Guerra de gusanos por turnos', 29.99, 78, '2016-08-23', 'PEGI 7', 1, 5, 47),
(53, 'FIFA 23', 'Último juego bajo la marca FIFA', 69.99, 77, '2022-09-27', 'PEGI 3', 1, 5, 5),
(54, 'The Crew Motorfest', 'Festival de conducción en Hawái', 69.99, 76, '2023-09-14', 'PEGI 12', 1, 5, 3),
(55, 'Steep', 'Deportes extremos de invierno', 29.99, 72, '2016-12-02', 'PEGI 12', 1, 5, 3),
(56, 'Sonic Mania', 'Homenaje a los 16 bits de Sonic', 19.99, 86, '2017-08-15', 'PEGI 3', 1, 6, 6),
(57, 'Hollow Knight', 'Metroidvania en un reino de insectos', 14.99, 90, '2017-02-24', 'PEGI 7', 0, 6, 23),
(58, 'Ratchet & Clank: Rift Apart', 'Aventura interdimensional', 79.99, 88, '2021-06-11', 'PEGI 7', 0, 6, 19),
(59, 'LittleBigPlanet 3', 'Crea, juega y comparte tus niveles', 19.99, 79, '2014-11-18', 'PEGI 7', 1, 6, 36),
(60, 'Sackboy: A Big Adventure', 'Diversión plataformera en 3D', 69.99, 83, '2020-11-12', 'PEGI 7', 1, 6, 36),
(61, 'It Takes Two', 'Cooperación necesaria para avanzar', 39.99, 88, '2021-03-26', 'PEGI 12', 1, 6, 5),
(62, 'Rayman Legends', 'Plataformas rítmico y colorido', 19.99, 92, '2013-08-29', 'PEGI 7', 1, 6, 3),
(63, 'Crash Bandicoot 4', 'Dificultad clásica y nuevas máscaras', 59.99, 85, '2020-10-02', 'PEGI 7', 0, 6, 11),
(64, 'Limbo', 'Pesadilla monocromática de puzles', 9.99, 90, '2010-07-21', 'PEGI 16', 0, 6, 46),
(65, 'Inside', 'Sucesor espiritual de Limbo', 19.99, 93, '2016-06-29', 'PEGI 16', 0, 6, 46),
(66, 'Minecraft', 'Construcción libre de bloques', 23.99, 93, '2011-11-18', 'PEGI 7', 1, 7, 24),
(67, 'The Sims 4', 'Simula la vida de tus personajes', 0.00, 70, '2014-09-02', 'PEGI 12', 0, 7, 5),
(68, 'Sea of Thieves', 'Vida de pirata en alta mar', 39.99, 67, '2018-03-20', 'PEGI 12', 1, 7, 26),
(69, 'Microsoft Flight Simulator', 'Vuela por todo el planeta', 69.99, 91, '2020-08-18', 'PEGI 3', 1, 7, 11),
(70, 'Cities: Skylines II', 'Construye y gestiona tu metrópolis', 49.99, 74, '2023-10-24', 'PEGI 3', 0, 7, 42),
(71, 'Stellaris', 'Estrategia y simulación galáctica', 39.99, 78, '2016-05-09', 'PEGI 7', 1, 7, 42),
(72, 'Euro Truck Simulator 2', 'Transporte por carretera en Europa', 19.99, 79, '2012-10-18', 'PEGI 3', 1, 7, 11),
(73, 'Elite Dangerous', 'Simulación espacial masiva', 24.99, 80, '2014-12-16', 'PEGI 7', 1, 7, 14),
(74, 'Planet Coaster', 'Gestiona tu propio parque de atracciones', 37.99, 84, '2016-11-17', 'PEGI 3', 0, 7, 15),
(75, 'Kerbal Space Program', 'Dirige tu propio programa espacial', 39.99, 88, '2015-04-27', 'PEGI 3', 0, 7, 14),
(76, 'Total War: Warhammer III', 'Estrategia fantástica masiva', 59.99, 85, '2022-02-17', 'PEGI 16', 1, 8, 41),
(77, 'StarCraft II', 'Estrategia en tiempo real competitiva', 0.00, 93, '2010-07-27', 'PEGI 12', 1, 8, 12),
(78, 'Civilization VI', 'Lidera una civilización hasta la historia', 59.99, 88, '2016-10-21', 'PEGI 12', 1, 8, 38),
(79, 'Age of Empires IV', 'El regreso de la estrategia histórica', 39.99, 81, '2021-10-28', 'PEGI 12', 1, 8, 11),
(80, 'XCOM 2', 'Resistencia táctica contra invasores', 49.99, 88, '2016-02-05', 'PEGI 16', 1, 8, 11),
(81, 'Company of Heroes 3', 'Combate táctico en la 2ª Guerra Mundial', 59.99, 81, '2023-02-23', 'PEGI 18', 1, 8, 6),
(82, 'Crusader Kings III', 'Dinastías y drama medieval', 49.99, 91, '2020-09-01', 'PEGI 12', 1, 8, 42),
(83, 'Hearthstone', 'Duelos de cartas coleccionables', 0.00, 88, '2014-03-11', 'PEGI 7', 1, 8, 12),
(84, 'League of Legends', 'El MOBA más popular del mundo', 0.00, 78, '2009-10-27', 'PEGI 12', 1, 8, 48),
(85, 'Dota 2', 'Estrategia profunda y compleja', 0.00, 90, '2013-07-09', 'PEGI 12', 1, 8, 14),
(86, 'Silent Hill 2 Remake', 'Terror psicológico en la niebla', 69.99, 87, '2024-10-08', 'PEGI 18', 0, 9, 9),
(87, 'Resident Evil 4 Remake', 'Acción y terror en España rural', 59.99, 93, '2023-03-24', 'PEGI 18', 0, 9, 7),
(88, 'Alan Wake 2', 'Historia entrelazada de misterio y horror', 59.99, 89, '2023-10-27', 'PEGI 18', 0, 9, 30),
(89, 'Amnesia: The Bunker', 'Supervivencia claustrofóbica en la guerra', 24.99, 78, '2023-06-06', 'PEGI 18', 0, 9, 45),
(90, 'Dead Space Remake', 'Terror espacial en la nave Ishimura', 59.99, 89, '2023-01-27', 'PEGI 18', 0, 9, 5),
(91, 'Outlast 2', 'Investigación periodística terrorífica', 29.99, 75, '2017-04-25', 'PEGI 18', 0, 9, 45),
(92, 'Alien: Isolation', 'Sigilo frente a la criatura perfecta', 39.99, 81, '2014-10-07', 'PEGI 18', 0, 9, 41),
(93, 'The Evil Within 2', 'Viaje a la mente de una pesadilla', 29.99, 82, '2017-10-13', 'PEGI 18', 0, 9, 13),
(94, 'Phasmophobia', 'Caza de fantasmas cooperativa', 11.99, 85, '2020-09-18', 'PEGI 12', 1, 9, 15),
(95, 'Little Nightmares II', 'Aventura de suspense y puzles', 29.99, 82, '2021-02-11', 'PEGI 12', 0, 9, 11),
(96, 'Street Fighter 6', 'La evolución del combate callejero', 59.99, 92, '2023-06-02', 'PEGI 12', 1, 10, 7),
(97, 'Tekken 8', 'El torneo del puño de hierro', 69.99, 90, '2024-01-26', 'PEGI 16', 1, 10, 10),
(98, 'Mortal Kombat 1', 'Reinicio sangriento del universo', 69.99, 83, '2023-09-19', 'PEGI 18', 1, 10, 38),
(99, 'Guilty Gear Strive', 'Lucha anime de alta calidad', 39.99, 87, '2021-06-11', 'PEGI 12', 1, 10, 10),
(100, 'Dragon Ball FighterZ', 'Espectaculares batallas saiyan', 59.99, 87, '2018-01-26', 'PEGI 12', 1, 10, 10);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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