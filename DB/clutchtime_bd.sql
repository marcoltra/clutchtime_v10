-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-05-2026 a las 15:01:28
-- Versión del servidor: 8.4.7
-- Versión de PHP: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clutchtime_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `nivel` enum('Conferencia','División','Grupo') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'División',
  `imagen_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL o ruta de la imagen representativa',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`, `nivel`, `imagen_url`, `created_at`) VALUES
(1, 'Conferencia Este', 'Equipos de la Costa Este de EE.UU.', 'Conferencia', 'https://basketexpress.wordpress.com/wp-content/uploads/2013/10/e.gif', '2026-03-23 15:11:38'),
(2, 'Conferencia Oeste', 'Equipos de la Costa Oeste de EE.UU.', 'Conferencia', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMiRc2iBEZQ2I-i-XmiRN5GjUZo2sigh47AQ&s', '2026-03-23 15:11:38'),
(3, 'División Atlántico', 'División del norte de la Conferencia Este', 'División', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpb_FiZO3VB49Mb9PFafydAPqzInQC6pJufg&s', '2026-03-23 15:11:38'),
(4, 'División Central', 'División central de la Conferencia Este', 'División', 'https://campoatras.com/wp-content/uploads/2025/10/ChatGPT-Image-18-oct-2025-20_37_322.jpg.webp', '2026-03-23 15:11:38'),
(5, 'División Sureste', 'División sur de la Conferencia Este', 'División', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTWQMYM6ny_d9LOxsqW9FUrHfI05CHIP1KHA&s', '2026-03-23 15:11:38'),
(6, 'División Noroeste', 'División noroeste de la Conferencia Oeste', 'División', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTinAoBJXs1STUHX9nmxsmOXzpSihzSMXb7_A&s', '2026-03-23 15:11:38'),
(7, 'División Pacífico', 'División pacífico de la Conferencia Oeste', 'División', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ52lodDnJeYn2tAsMtR8yhCAEQo9Rzh87ihw&s', '2026-03-23 15:11:38'),
(8, 'División Suroeste', 'División suroeste de la Conferencia Oeste', 'División', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTWQMYM6ny_d9LOxsqW9FUrHfI05CHIP1KHA&s', '2026-03-23 15:11:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE IF NOT EXISTS `ciudades` (
  `id_ciudad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Estados Unidos',
  `estadio_principal` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacidad_estadio` int DEFAULT NULL,
  `latitud` decimal(9,6) DEFAULT NULL,
  `longitud` decimal(9,6) DEFAULT NULL,
  `imagen_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL o ruta de la foto de la ciudad',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `nombre`, `estado`, `pais`, `estadio_principal`, `capacidad_estadio`, `latitud`, `longitud`, `imagen_url`, `created_at`) VALUES
(1, 'Los Angeles', 'California', 'Estados Unidos', 'Crypto.com Arena', 19068, 34.043056, -118.267222, 'https://www.infobae.com/new-resizer/J_3FJRStA5eodllOKitZgSUd6M0=/arc-anglerfish-arc2-prod-infobae/public/C2ORM5UDNJHRRKYPWA5BJQRXUA.jpg', '2026-03-23 15:11:38'),
(2, 'New York', 'Nueva York', 'Estados Unidos', 'Madison Square Garden', 19812, 40.750580, -73.993439, 'https://www.civitatis.com/f/estados-unidos/nueva-york/galeria/vista-exterior-msg.jpg', '2026-03-23 15:11:38'),
(3, 'Chicago', 'Illinois', 'Estados Unidos', 'United Center', 20917, 41.880648, -87.674299, 'https://media.istockphoto.com/id/458734297/es/foto/united-center-en-chicago.jpg?s=612x612&w=0&k=20&c=zKkQ2noRdkcqmkIE3Ryq_ojOXDY73ZhzdcO2gzNwMCY=', '2026-03-23 15:11:38'),
(4, 'Miami', 'Florida', 'Estados Unidos', 'Kaseya Center', 19600, 25.781389, -80.187778, 'https://media.istockphoto.com/id/482185698/es/foto/american-airlines-arena.jpg?s=612x612&w=0&k=20&c=RPH9IZqD3Im6yRm423RJwarI1tdz6OrdO67w6wzRUDk=', '2026-03-23 15:11:38'),
(5, 'Boston', 'Massachusetts', 'Estados Unidos', 'TD Garden', 19156, 42.366303, -71.062228, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/31/36/90/td-garden-exterior.jpg?w=1200&h=-1&s=1', '2026-03-23 15:11:38'),
(6, 'Golden State', 'California', 'Estados Unidos', 'Chase Center', 18064, 37.768056, -122.387778, 'https://cdn2.mediotiempo.com/uploads/media/2019/09/02/fotos-chase-center-arena-golden-3.jpg', '2026-03-23 15:11:38'),
(7, 'Dallas', 'Texas', 'Estados Unidos', 'American Airlines Center', 19200, 32.790556, -96.810278, 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/10/28/c1/25.jpg', '2026-03-23 15:11:38'),
(8, 'San Antonio', 'Texas', 'Estados Unidos', 'AT&T Center', 18418, 29.426944, -98.437500, 'https://cri.com/hubfs/Case%20Study%20Images/ATT%20Center/stadium.jpg', '2026-03-23 15:11:38'),
(9, 'Toronto', 'Ontario', 'Canadá', 'Scotiabank Arena', 19800, 43.643333, -79.379167, 'https://upload.wikimedia.org/wikipedia/commons/2/21/Toronto_-_ON_-_Rogers_Centre_%28Nacht%29.jpg', '2026-03-23 15:11:38'),
(10, 'Denver', 'Colorado', 'Estados Unidos', 'Ball Arena', 19520, 39.748611, -105.007500, 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Denver_Pepsi_Center_1.jpg', '2026-03-23 15:11:38'),
(11, 'Philadelphia', 'Pennsylvania', 'Estados Unidos', 'Wells Fargo Center', 20478, 39.901111, -75.171944, 'https://example.com/img/philadelphia.jpg', '2026-04-23 14:51:45'),
(12, 'Brooklyn', 'Nueva York', 'Estados Unidos', 'Barclays Center', 17732, 40.682611, -73.975278, 'https://example.com/img/brooklyn.jpg', '2026-04-23 14:51:45'),
(13, 'Milwaukee', 'Wisconsin', 'Estados Unidos', 'Fiserv Forum', 17341, 43.043611, -87.916944, 'https://example.com/img/milwaukee.jpg', '2026-04-23 14:51:45'),
(14, 'Cleveland', 'Ohio', 'Estados Unidos', 'Rocket Mortgage FieldHouse', 19432, 41.496389, -81.688056, 'https://example.com/img/cleveland.jpg', '2026-04-23 14:51:45'),
(15, 'Indiana', 'Indiana', 'Estados Unidos', 'Gainbridge Fieldhouse', 17923, 39.763889, -86.155556, 'https://example.com/img/indiana.jpg', '2026-04-23 14:51:45'),
(16, 'Detroit', 'Michigan', 'Estados Unidos', 'Little Caesars Arena', 20332, 42.341111, -83.055000, 'https://example.com/img/detroit.jpg', '2026-04-23 14:51:45'),
(17, 'Charlotte', 'Carolina del Norte', 'Estados Unidos', 'Spectrum Center', 19077, 35.225278, -80.839167, 'https://example.com/img/charlotte.jpg', '2026-04-23 14:51:45'),
(18, 'Orlando', 'Florida', 'Estados Unidos', 'Kia Center', 18846, 28.539167, -81.383611, 'https://example.com/img/orlando.jpg', '2026-04-23 14:51:45'),
(19, 'Washington', 'D.C.', 'Estados Unidos', 'Capital One Arena', 20356, 38.898056, -77.020833, 'https://example.com/img/washington.jpg', '2026-04-23 14:51:45'),
(20, 'Atlanta', 'Georgia', 'Estados Unidos', 'State Farm Arena', 18118, 33.757222, -84.396389, 'https://example.com/img/atlanta.jpg', '2026-04-23 14:51:45'),
(21, 'Phoenix', 'Arizona', 'Estados Unidos', 'Footprint Center', 18055, 33.445833, -112.071389, 'https://example.com/img/phoenix.jpg', '2026-04-23 14:51:45'),
(22, 'Sacramento', 'California', 'Estados Unidos', 'Golden 1 Center', 17583, 38.580278, -121.499722, 'https://example.com/img/sacramento.jpg', '2026-04-23 14:51:45'),
(23, 'Portland', 'Oregón', 'Estados Unidos', 'Moda Center', 19441, 45.531667, -122.666667, 'https://example.com/img/portland.jpg', '2026-04-23 14:51:45'),
(24, 'Salt Lake City', 'Utah', 'Estados Unidos', 'Delta Center', 18306, 40.768333, -111.901111, 'https://example.com/img/saltlakecity.jpg', '2026-04-23 14:51:45'),
(25, 'Oklahoma City', 'Oklahoma', 'Estados Unidos', 'Paycom Center', 18203, 35.463333, -97.515278, 'https://example.com/img/oklahomacity.jpg', '2026-04-23 14:51:45'),
(26, 'Houston', 'Texas', 'Estados Unidos', 'Toyota Center', 18055, 29.750833, -95.362222, 'https://example.com/img/houston.jpg', '2026-04-23 14:51:45'),
(27, 'New Orleans', 'Luisiana', 'Estados Unidos', 'Smoothie King Center', 16867, 29.948889, -90.082222, 'https://example.com/img/neworleans.jpg', '2026-04-23 14:51:45'),
(28, 'Memphis', 'Tennessee', 'Estados Unidos', 'FedExForum', 17794, 35.138333, -90.050556, 'https://example.com/img/memphis.jpg', '2026-04-23 14:51:45'),
(29, 'Minneapolis', 'Minnesota', 'Estados Unidos', 'Target Center', 18978, 44.979722, -93.276389, 'https://example.com/img/minneapolis.jpg', '2026-04-23 14:51:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `id_ciudad` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abreviacion` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conferencia` enum('Este','Oeste') COLLATE utf8mb4_unicode_ci NOT NULL,
  `division` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anio_fundacion` year DEFAULT NULL,
  `color_principal` char(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Hex color, ej: #C9082A',
  `imagen_logo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL o ruta del logo del equipo',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `uq_abreviacion` (`abreviacion`),
  KEY `fk_equipo_ciudad` (`id_ciudad`),
  KEY `fk_equipo_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `id_ciudad`, `id_categoria`, `nombre`, `abreviacion`, `conferencia`, `division`, `anio_fundacion`, `color_principal`, `imagen_logo`, `created_at`) VALUES
(1, 1, 7, 'Los Angeles Lakers', 'LAL', 'Oeste', 'División Pacífico', '1947', '#552583', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Los_Angeles_Lakers_logo.svg/1280px-Los_Angeles_Lakers_logo.svg.png', '2026-03-23 15:11:38'),
(2, 1, 7, 'Los Angeles Clippers', 'LAC', 'Oeste', 'División Pacífico', '1970', '#C8102E', 'https://upload.wikimedia.org/wikipedia/en/thumb/e/ed/Los_Angeles_Clippers_%282024%29.svg/1280px-Los_Angeles_Clippers_%282024%29.svg.png', '2026-03-23 15:11:38'),
(3, 2, 3, 'New York Knicks', 'NYK', 'Este', 'División Atlántico', '1946', '#006BB6', 'https://upload.wikimedia.org/wikipedia/en/thumb/2/25/New_York_Knicks_logo.svg/1280px-New_York_Knicks_logo.svg.png', '2026-03-23 15:11:38'),
(4, 3, 4, 'Chicago Bulls', 'CHI', 'Este', 'División Central', '1966', '#CE1141', 'https://upload.wikimedia.org/wikipedia/en/6/67/Chicago_Bulls_logo.svg', '2026-03-23 15:11:38'),
(5, 4, 5, 'Miami Heat', 'MIA', 'Este', 'División Sureste', '1988', '#98002E', 'https://upload.wikimedia.org/wikipedia/en/f/fb/Miami_Heat_logo.svg', '2026-03-23 15:11:38'),
(6, 5, 3, 'Boston Celtics', 'BOS', 'Este', 'División Atlántico', '1946', '#007A33', 'https://upload.wikimedia.org/wikipedia/en/8/8f/Boston_Celtics.svg', '2026-03-23 15:11:38'),
(7, 6, 7, 'Golden State Warriors', 'GSW', 'Oeste', 'División Pacífico', '1946', '#1D428A', 'https://upload.wikimedia.org/wikipedia/en/thumb/0/01/Golden_State_Warriors_logo.svg/1280px-Golden_State_Warriors_logo.svg.png', '2026-03-23 15:11:38'),
(8, 7, 8, 'Dallas Mavericks', 'DAL', 'Oeste', 'División Suroeste', '1980', '#00538C', 'https://upload.wikimedia.org/wikipedia/en/9/97/Dallas_Mavericks_logo.svg', '2026-03-23 15:11:38'),
(9, 8, 8, 'San Antonio Spurs', 'SAS', 'Oeste', 'División Suroeste', '1967', '#C4CED4', 'https://upload.wikimedia.org/wikipedia/en/a/a2/San_Antonio_Spurs.svg', '2026-03-23 15:11:38'),
(10, 9, 3, 'Toronto Raptors', 'TOR', 'Este', 'División Atlántico', '1995', '#CE1141', 'https://upload.wikimedia.org/wikipedia/en/thumb/3/36/Toronto_Raptors_logo.svg/250px-Toronto_Raptors_logo.svg.png', '2026-03-23 15:11:38'),
(11, 10, 6, 'Denver Nuggets', 'DEN', 'Oeste', 'División Noroeste', '1967', '#0E2240', 'https://upload.wikimedia.org/wikipedia/en/thumb/7/76/Denver_Nuggets.svg/1280px-Denver_Nuggets.svg.png', '2026-03-23 15:11:38'),
(12, 11, 4, 'Philadelphia 76ers', 'PHI', 'Este', 'División Central', '1946', '#006BB6', 'https://example.com/logos/76ers.png', '2026-04-23 14:51:45'),
(13, 12, 3, 'Brooklyn Nets', 'BKN', 'Este', 'División Atlántico', '1967', '#000000', 'https://example.com/logos/nets.png', '2026-04-23 14:51:45'),
(14, 13, 4, 'Milwaukee Bucks', 'MIL', 'Este', 'División Central', '1968', '#00471B', 'https://example.com/logos/bucks.png', '2026-04-23 14:51:45'),
(15, 14, 4, 'Cleveland Cavaliers', 'CLE', 'Este', 'División Central', '1970', '#860038', 'https://example.com/logos/cavaliers.png', '2026-04-23 14:51:45'),
(16, 15, 4, 'Indiana Pacers', 'IND', 'Este', 'División Central', '1967', '#002D62', 'https://example.com/logos/pacers.png', '2026-04-23 14:51:45'),
(17, 16, 4, 'Detroit Pistons', 'DET', 'Este', 'División Central', '1941', '#C8102E', 'https://example.com/logos/pistons.png', '2026-04-23 14:51:45'),
(18, 17, 5, 'Charlotte Hornets', 'CHA', 'Este', 'División Sureste', '1988', '#1D1160', 'https://example.com/logos/hornets.png', '2026-04-23 14:51:45'),
(19, 18, 5, 'Orlando Magic', 'ORL', 'Este', 'División Sureste', '1989', '#0077C0', 'https://example.com/logos/magic.png', '2026-04-23 14:51:45'),
(20, 19, 5, 'Washington Wizards', 'WAS', 'Este', 'División Sureste', '1961', '#002B5C', 'https://example.com/logos/wizards.png', '2026-04-23 14:51:45'),
(21, 20, 5, 'Atlanta Hawks', 'ATL', 'Este', 'División Sureste', '1946', '#C1D32F', 'https://example.com/logos/hawks.png', '2026-04-23 14:51:45'),
(22, 21, 7, 'Phoenix Suns', 'PHX', 'Oeste', 'División Pacífico', '1968', '#1D1160', 'https://example.com/logos/suns.png', '2026-04-23 14:51:45'),
(23, 22, 7, 'Sacramento Kings', 'SAC', 'Oeste', 'División Pacífico', '1945', '#5A2D81', 'https://example.com/logos/kings.png', '2026-04-23 14:51:45'),
(24, 23, 7, 'Portland Trail Blazers', 'POR', 'Oeste', 'División Pacífico', '1970', '#E03A3E', 'https://example.com/logos/blazers.png', '2026-04-23 14:51:45'),
(25, 24, 6, 'Utah Jazz', 'UTA', 'Oeste', 'División Noroeste', '1974', '#002B5C', 'https://example.com/logos/jazz.png', '2026-04-23 14:51:45'),
(26, 25, 6, 'Oklahoma City Thunder', 'OKC', 'Oeste', 'División Noroeste', '1967', '#007AC1', 'https://example.com/logos/thunder.png', '2026-04-23 14:51:45'),
(27, 26, 8, 'Houston Rockets', 'HOU', 'Oeste', 'División Suroeste', '1967', '#CE1141', 'https://example.com/logos/rockets.png', '2026-04-23 14:51:45'),
(28, 27, 8, 'New Orleans Pelicans', 'NOP', 'Oeste', 'División Suroeste', '2002', '#0C2340', 'https://example.com/logos/pelicans.png', '2026-04-23 14:51:45'),
(29, 28, 8, 'Memphis Grizzlies', 'MEM', 'Oeste', 'División Suroeste', '1995', '#5D76A9', 'https://example.com/logos/grizzlies.png', '2026-04-23 14:51:45'),
(30, 29, 6, 'Minnesota Timberwolves', 'MIN', 'Oeste', 'División Noroeste', '1989', '#0C2340', 'https://example.com/logos/timberwolves.png', '2026-04-23 14:51:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadisticas`
--

DROP TABLE IF EXISTS `estadisticas`;
CREATE TABLE IF NOT EXISTS `estadisticas` (
  `id_estadistica` int NOT NULL AUTO_INCREMENT,
  `id_jugador` int NOT NULL,
  `id_partido` int NOT NULL,
  `minutos_jugados` tinyint UNSIGNED DEFAULT NULL,
  `puntos` tinyint UNSIGNED DEFAULT '0',
  `rebotes` tinyint UNSIGNED DEFAULT '0',
  `asistencias` tinyint UNSIGNED DEFAULT '0',
  `robos` tinyint UNSIGNED DEFAULT '0',
  `tapones` tinyint UNSIGNED DEFAULT '0',
  `perdidas` tinyint UNSIGNED DEFAULT '0',
  `tiros_campo_int` tinyint UNSIGNED DEFAULT '0',
  `tiros_campo_enc` tinyint UNSIGNED DEFAULT '0',
  `triples_int` tinyint UNSIGNED DEFAULT '0',
  `triples_enc` tinyint UNSIGNED DEFAULT '0',
  `tiros_libres_int` tinyint UNSIGNED DEFAULT '0',
  `tiros_libres_enc` tinyint UNSIGNED DEFAULT '0',
  `plus_minus` smallint DEFAULT '0',
  `imagen_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL o ruta de imagen destacada del jugador en este partido',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estadistica`),
  UNIQUE KEY `uq_jugador_partido` (`id_jugador`,`id_partido`),
  KEY `fk_estad_jugador` (`id_jugador`),
  KEY `fk_estad_partido` (`id_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `id_ciudad` int NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('All-Star Game','Draft','Playoffs','Finals','Summer League','Regular Season','Otro') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `imagen_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL o ruta del cartel/imagen del evento',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lat` decimal(9,6) DEFAULT NULL COMMENT 'Latitud del evento',
  `lng` decimal(9,6) DEFAULT NULL COMMENT 'Longitud del evento',
  PRIMARY KEY (`id_evento`),
  KEY `fk_evento_ciudad` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `id_ciudad`, `nombre`, `tipo`, `fecha_inicio`, `fecha_fin`, `descripcion`, `imagen_url`, `created_at`, `lat`, `lng`) VALUES
(1, 2, 'NBA All-Star Game 2025', 'All-Star Game', '2025-02-16', '2025-02-16', 'Juego de estrellas edición 2025 en Nueva York', 'https://estaticos-cdn.prensaiberica.es/clip/c9dea18c-7318-4f65-b891-3e59fd104ea0_alta-libre-aspect-ratio_default_0.jpg', '2026-03-23 15:11:38', 40.750580, -73.993439),
(2, 1, 'NBA Draft 2024', 'Draft', '2024-06-26', '2024-06-26', 'Selección anual de jugadores universitarios', 'https://cdn.nba.com/manage/2024/06/2024-nba-draft-class.jpg', '2026-03-23 15:11:38', 34.043056, -118.267222),
(3, 5, 'NBA Finals 2024', 'Finals', '2024-06-06', '2024-06-17', 'Serie final de campeonato de la temporada 2023-24', 'https://sportshub.cbsistatic.com/i/r/2024/04/15/743eba56-6f92-4ac2-9580-ed0f556e435e/resize/750x422/e978eb838d24a5efc87b73e6bd50aefc/brad-bracket.png', '2026-03-23 15:11:38', 42.366303, -71.062228),
(4, 6, 'NBA Summer League 2024', 'Summer League', '2024-07-05', '2024-07-17', 'Liga de verano para rookies y jugadores jóvenes', 'https://hallpassnetwork.com/wp-content/uploads/2024/02/HP-2024-email-SL24-dates.jpg', '2026-03-23 15:11:38', 37.768056, -122.387778),
(5, 3, 'NBA Playoffs 2024 - Conf.E', 'Playoffs', '2024-04-20', '2024-05-30', 'Playoffs de la Conferencia Este 2024', 'https://sportshub.cbsistatic.com/i/2024/05/31/f19f88f0-fb94-4801-a16c-8e3d9fbb1ee0/dallas-finals-bracket.png', '2026-03-23 15:11:38', 41.880648, -87.674299),
(6, 2, 'NBA All-Star Game 2026', 'All-Star Game', '2026-02-15', '2026-02-15', 'Juego de Estrellas edición 2026 en Nueva York', 'https://example.com/img/allstar2026.jpg', '2026-05-04 14:55:19', NULL, NULL),
(7, 2, 'NBA Draft 2025', 'Draft', '2025-06-25', '2025-06-25', 'Selección anual de rookies, edición 2025 en Brooklyn', 'https://example.com/img/draft2025.jpg', '2026-05-04 14:55:19', NULL, NULL),
(8, 4, 'NBA Finals 2025', 'Finals', '2025-06-05', '2025-06-22', 'Serie final de campeonato de la temporada 2024-25', 'https://example.com/img/finals2025.jpg', '2026-05-04 14:55:19', NULL, NULL),
(9, 7, 'NBA Playoffs 2025 - Conf. Oeste', 'Playoffs', '2025-04-19', '2025-05-28', 'Playoffs de la Conferencia Oeste 2025', 'https://example.com/img/playoffs_oeste2025.jpg', '2026-05-04 14:55:19', NULL, NULL),
(10, 5, 'NBA Playoffs 2025 - Conf. Este', 'Playoffs', '2025-04-19', '2025-05-30', 'Playoffs de la Conferencia Este 2025', 'https://example.com/img/playoffs_este2025.jpg', '2026-05-04 14:55:19', NULL, NULL),
(11, 6, 'NBA Summer League 2025', 'Summer League', '2025-07-11', '2025-07-21', 'Liga de verano 2025 para rookies y jugadores jóvenes', 'https://example.com/img/summerleague2025.jpg', '2026-05-04 14:55:19', NULL, NULL),
(12, 1, 'NBA All-Star Weekend 2024', 'Otro', '2024-02-17', '2024-02-17', 'Eventos del fin de semana de estrellas: Skills Challenge y Slam Dunk', 'https://example.com/img/allstarweekend2024.jpg', '2026-05-04 14:55:19', NULL, NULL),
(13, 10, 'NBA Playoffs 2024 - Conf. Oeste', 'Playoffs', '2024-04-20', '2024-05-30', 'Playoffs de la Conferencia Oeste 2024', 'https://example.com/img/playoffs_oeste2024.jpg', '2026-05-04 14:55:19', NULL, NULL),
(14, 3, 'NBA In-Season Tournament 2024', 'Otro', '2024-11-12', '2024-12-21', 'Torneo de mitad de temporada NBA Cup 2024-25', 'https://example.com/img/nbacup2024.jpg', '2026-05-04 14:55:19', NULL, NULL),
(15, 8, 'NBA All-Star Game 2025', 'All-Star Game', '2025-02-16', '2025-02-16', 'Juego de Estrellas edición 2025 en San Antonio', 'https://example.com/img/allstar2025_sa.jpg', '2026-05-04 14:55:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
CREATE TABLE IF NOT EXISTS `jugadores` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posicion` enum('Base','Escolta','Alero','Ala-Pívot','Pívot') COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_camiseta` tinyint UNSIGNED DEFAULT NULL,
  `nacionalidad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Estadounidense',
  `fecha_nacimiento` date DEFAULT NULL,
  `altura_metros` decimal(4,2) DEFAULT NULL,
  `peso_kg` decimal(5,2) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `imagen_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL o ruta de la foto del jugador',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jugador`),
  KEY `fk_jugador_equipo` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `id_equipo`, `nombre`, `apellido`, `posicion`, `numero_camiseta`, `nacionalidad`, `fecha_nacimiento`, `altura_metros`, `peso_kg`, `activo`, `imagen_url`, `created_at`) VALUES
(1, 1, 'LeBron', 'James', 'Alero', 23, 'Estadounidense', '1984-12-30', 2.06, 113.40, 1, 'https://cdn.nba.com/headshots/nba/latest/1040x760/2544.png', '2026-03-23 15:11:38'),
(2, 1, 'Anthony', 'Davis', 'Pívot', 3, 'Estadounidense', '1993-03-11', 2.08, 114.80, 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/6583.png&w=350&h=254', '2026-03-23 15:11:38'),
(3, 7, 'Stephen', 'Curry', 'Base', 30, 'Estadounidense', '1988-03-14', 1.88, 84.10, 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3975.png', '2026-03-23 15:11:38'),
(4, 5, 'Jayson', 'Tatum', 'Alero', 0, 'Estadounidense', '1998-03-03', 2.03, 95.25, 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4065648.png', '2026-03-23 15:11:38'),
(5, 4, 'Jimmy', 'Butler', 'Alero', 22, 'Estadounidense', '1989-09-14', 2.01, 104.30, 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/6430.png', '2026-03-23 15:11:38'),
(6, 3, 'Jalen', 'Brunson', 'Base', 11, 'Estadounidense', '1996-08-31', 1.88, 84.00, 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/3934672.png&w=350&h=254', '2026-03-23 15:11:38'),
(7, 8, 'Luka', 'Doncic', 'Base', 77, 'Esloveno', '1999-02-28', 2.01, 104.30, 1, 'https://assets.fiba.basketball/image/upload/w_2800/c_pad,ar_12:10/c_pad,ar_10:12/ar_10:12,c_crop,g_face,z_0.25/e_trim/c_lpad,ar_1:1/w_2800/w_2200,h_2000,c_crop,x_300/w_300,c_fill/q_auto/f_auto/.headshot--person_196610?buster=20565', '2026-03-23 15:11:38'),
(8, 11, 'Nikola', 'Jokic', 'Pívot', 15, 'Serbio', '1995-02-19', 2.11, 128.80, 1, 'https://a.espncdn.com/i/headshots/nba/players/full/3112335.png', '2026-03-23 15:11:38'),
(9, 4, 'Bam', 'Adebayo', 'Pívot', 13, 'Estadounidense', '1997-07-18', 2.06, 115.70, 1, 'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/4066261.png&w=350&h=254', '2026-03-23 15:11:38'),
(10, 5, 'Jaylen', 'Brown', 'Escolta', 7, 'Estadounidense', '1996-10-24', 1.98, 101.25, 1, 'https://cdn.nba.com/headshots/nba/latest/1040x760/1627759.png', '2026-03-23 15:11:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

DROP TABLE IF EXISTS `partidos`;
CREATE TABLE IF NOT EXISTS `partidos` (
  `id_partido` int NOT NULL AUTO_INCREMENT,
  `id_evento` int DEFAULT NULL,
  `id_temporada` int NOT NULL,
  `id_equipo_local` int NOT NULL,
  `id_equipo_visitante` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT NULL,
  `puntos_local` tinyint UNSIGNED DEFAULT NULL,
  `puntos_visitante` tinyint UNSIGNED DEFAULT NULL,
  `estado` enum('Programado','En Juego','Finalizado','Suspendido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Programado',
  `temporada` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL o ruta de imagen/captura del partido',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_partido`),
  KEY `fk_partido_evento` (`id_evento`),
  KEY `fk_partido_temporada` (`id_temporada`),
  KEY `fk_partido_local` (`id_equipo_local`),
  KEY `fk_partido_visitante` (`id_equipo_visitante`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id_partido`, `id_evento`, `id_temporada`, `id_equipo_local`, `id_equipo_visitante`, `fecha`, `hora`, `puntos_local`, `puntos_visitante`, `estado`, `temporada`, `imagen_url`, `created_at`) VALUES
(1, NULL, 1, 1, 3, '2023-11-10', '20:30:00', 112, 108, 'Finalizado', '2023-24', 'https://s.yimg.com/ny/api/res/1.2/rW5eF5xt5pa_wly3_fXtSg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04NDQ7Y2Y9d2VicA--/https://media.zenfs.com/en/hoops_hype_usa_today_sports_articles_974/fcfba2e03257ed641c4258abcad317dd', '2026-03-23 15:11:38'),
(2, NULL, 1, 6, 8, '2023-11-14', '21:00:00', 128, 119, 'Finalizado', '2023-24', 'https://library.sportingnews.com/styles/twitter_card_120x120/s3/2024-01/Mavericks%20vs.%20Celtics.png?itok=yutWy03m', '2026-03-23 15:11:38'),
(3, NULL, 1, 5, 4, '2023-12-01', '19:30:00', 102, 98, 'Finalizado', '2023-24', 'https://cdn.nba.com/teams/legacy/www.nba.com/bulls/sites/bulls/files/mybulls_matchups1920_mia.jpg', '2026-03-23 15:11:38'),
(4, NULL, 1, 11, 7, '2024-01-15', '20:00:00', 125, 110, 'Finalizado', '2023-24', 'https://cdn.nba.com/logos/nba/davinci/images/team-matchups/nba/latest/ced/den-gsw/1920x1080.png', '2026-03-23 15:11:38'),
(5, NULL, 1, 3, 1, '2024-02-20', '20:30:00', 114, 109, 'Finalizado', '2023-24', 'https://cdn.nba.com/logos/nba/davinci/images/team-matchups/nba/latest/ced/nyk-lal/1920x1080.png', '2026-03-23 15:11:38'),
(8, NULL, 7, 7, 4, '2023-11-20', '21:00:00', 120, 111, 'Finalizado', '2023-24', 'https://example.com/img/p_gsw_chi_1120.jpg', '2026-05-04 14:55:19'),
(9, NULL, 7, 5, 3, '2023-11-22', '19:30:00', 105, 99, 'Finalizado', '2023-24', 'https://example.com/img/p_mia_nyk_1122.jpg', '2026-05-04 14:55:19'),
(10, NULL, 7, 11, 6, '2023-11-25', '20:00:00', 118, 108, 'Finalizado', '2023-24', 'https://example.com/img/p_den_bos_1125.jpg', '2026-05-04 14:55:19'),
(11, NULL, 7, 8, 1, '2023-11-28', '21:30:00', 116, 101, 'Finalizado', '2023-24', 'https://example.com/img/p_dal_lal_1128.jpg', '2026-05-04 14:55:19'),
(12, NULL, 7, 9, 2, '2023-11-30', '20:30:00', 98, 104, 'Finalizado', '2023-24', 'https://example.com/img/p_sas_lac_1130.jpg', '2026-05-04 14:55:19'),
(13, NULL, 7, 3, 7, '2023-12-05', '20:30:00', 107, 115, 'Finalizado', '2023-24', 'https://example.com/img/p_nyk_gsw_1205.jpg', '2026-05-04 14:55:19'),
(14, NULL, 7, 6, 9, '2023-12-08', '19:00:00', 125, 103, 'Finalizado', '2023-24', 'https://example.com/img/p_bos_sas_1208.jpg', '2026-05-04 14:55:19'),
(15, NULL, 7, 10, 5, '2023-12-12', '19:30:00', 91, 112, 'Finalizado', '2023-24', 'https://example.com/img/p_tor_mia_1212.jpg', '2026-05-04 14:55:19'),
(16, NULL, 7, 1, 11, '2023-12-19', '20:00:00', 122, 126, 'Finalizado', '2023-24', 'https://example.com/img/p_lal_den_1219.jpg', '2026-05-04 14:55:19'),
(17, NULL, 7, 2, 8, '2023-12-23', '21:00:00', 103, 109, 'Finalizado', '2023-24', 'https://example.com/img/p_lac_dal_1223.jpg', '2026-05-04 14:55:19'),
(18, NULL, 7, 4, 3, '2024-01-08', '20:00:00', 114, 106, 'Finalizado', '2023-24', 'https://example.com/img/p_chi_nyk_0108.jpg', '2026-05-04 14:55:19'),
(19, NULL, 7, 7, 1, '2024-01-20', '21:30:00', 121, 118, 'Finalizado', '2023-24', 'https://example.com/img/p_gsw_lal_0120.jpg', '2026-05-04 14:55:19'),
(20, NULL, 7, 5, 6, '2024-02-07', '20:00:00', 99, 117, 'Finalizado', '2023-24', 'https://example.com/img/p_mia_bos_0207.jpg', '2026-05-04 14:55:19'),
(21, NULL, 7, 11, 8, '2024-02-27', '20:30:00', 130, 112, 'Finalizado', '2023-24', 'https://example.com/img/p_den_dal_0227.jpg', '2026-05-04 14:55:19'),
(22, NULL, 7, 9, 10, '2024-03-15', '20:00:00', 108, 102, 'Finalizado', '2023-24', 'https://example.com/img/p_sas_tor_0315.jpg', '2026-05-04 14:55:19'),
(23, NULL, 9, 1, 5, '2024-10-23', '20:30:00', 108, 114, 'Finalizado', '2024-25', 'https://example.com/img/p_lal_mia_1023.jpg', '2026-05-04 14:55:19'),
(24, NULL, 9, 6, 3, '2024-10-25', '19:30:00', 119, 98, 'Finalizado', '2024-25', 'https://example.com/img/p_bos_nyk_1025.jpg', '2026-05-04 14:55:19'),
(25, NULL, 9, 7, 9, '2024-10-28', '21:30:00', 125, 107, 'Finalizado', '2024-25', 'https://example.com/img/p_gsw_sas_1028.jpg', '2026-05-04 14:55:19'),
(26, NULL, 9, 11, 2, '2024-11-02', '20:00:00', 117, 111, 'Finalizado', '2024-25', 'https://example.com/img/p_den_lac_1102.jpg', '2026-05-04 14:55:19'),
(27, NULL, 9, 4, 10, '2024-11-06', '19:00:00', 104, 97, 'Finalizado', '2024-25', 'https://example.com/img/p_chi_tor_1106.jpg', '2026-05-04 14:55:19'),
(28, NULL, 9, 8, 6, '2024-11-13', '21:00:00', 113, 120, 'Finalizado', '2024-25', 'https://example.com/img/p_dal_bos_1113.jpg', '2026-05-04 14:55:19'),
(29, NULL, 9, 5, 7, '2024-11-18', '20:30:00', 101, 122, 'Finalizado', '2024-25', 'https://example.com/img/p_mia_gsw_1118.jpg', '2026-05-04 14:55:19'),
(30, NULL, 9, 3, 1, '2024-12-03', '20:30:00', 118, 109, 'Finalizado', '2024-25', 'https://example.com/img/p_nyk_lal_1203.jpg', '2026-05-04 14:55:19'),
(31, NULL, 9, 9, 11, '2024-12-07', '20:00:00', 95, 128, 'Finalizado', '2024-25', 'https://example.com/img/p_sas_den_1207.jpg', '2026-05-04 14:55:19'),
(32, NULL, 9, 10, 4, '2024-12-14', '19:30:00', 112, 105, 'Finalizado', '2024-25', 'https://example.com/img/p_tor_chi_1214.jpg', '2026-05-04 14:55:19'),
(33, NULL, 9, 2, 8, '2025-01-08', '21:00:00', 106, 119, 'Finalizado', '2024-25', 'https://example.com/img/p_lac_dal_0108.jpg', '2026-05-04 14:55:19'),
(34, NULL, 9, 1, 7, '2025-01-15', '20:30:00', 115, 122, 'Finalizado', '2024-25', 'https://example.com/img/p_lal_gsw_0115.jpg', '2026-05-04 14:55:19'),
(35, NULL, 9, 6, 5, '2025-01-22', '19:30:00', 132, 118, 'Finalizado', '2024-25', 'https://example.com/img/p_bos_mia_0122.jpg', '2026-05-04 14:55:19'),
(36, NULL, 9, 11, 3, '2025-02-04', '20:00:00', 124, 110, 'Finalizado', '2024-25', 'https://example.com/img/p_den_nyk_0204.jpg', '2026-05-04 14:55:19'),
(37, NULL, 9, 8, 9, '2025-02-11', '21:30:00', 136, 124, 'Finalizado', '2024-25', 'https://example.com/img/p_dal_sas_0211.jpg', '2026-05-04 14:55:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadas`
--

DROP TABLE IF EXISTS `temporadas`;
CREATE TABLE IF NOT EXISTS `temporadas` (
  `id_temporada` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ej: 2023-24',
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `tipo` enum('Regular','Pretemporada','Playoffs','Finals') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Regular',
  `campeon` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mvp_finals` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_temporada`),
  UNIQUE KEY `uq_temporada_nombre` (`nombre`,`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `temporadas`
--

INSERT INTO `temporadas` (`id_temporada`, `nombre`, `fecha_inicio`, `fecha_fin`, `tipo`, `campeon`, `mvp_finals`, `imagen_url`, `created_at`) VALUES
(1, '2020-21', '2020-12-22', '2021-04-10', 'Regular', NULL, NULL, 'https://example.com/img/temporada2021.jpg', '2026-05-04 14:51:55'),
(2, '2020-21', '2021-05-22', '2021-07-20', 'Finals', 'Milwaukee Bucks', 'Giannis Antetokounmpo', 'https://example.com/img/finals2021.jpg', '2026-05-04 14:51:55'),
(3, '2021-22', '2021-10-19', '2022-04-10', 'Regular', NULL, NULL, 'https://example.com/img/temporada2122.jpg', '2026-05-04 14:51:55'),
(4, '2021-22', '2022-04-16', '2022-06-16', 'Finals', 'Golden State Warriors', 'Stephen Curry', 'https://example.com/img/finals2122.jpg', '2026-05-04 14:51:55'),
(5, '2022-23', '2022-10-18', '2023-04-09', 'Regular', NULL, NULL, 'https://example.com/img/temporada2223.jpg', '2026-05-04 14:51:55'),
(6, '2022-23', '2023-04-15', '2023-06-12', 'Finals', 'Denver Nuggets', 'Nikola Jokic', 'https://example.com/img/finals2223.jpg', '2026-05-04 14:51:55'),
(7, '2023-24', '2023-10-24', '2024-04-14', 'Regular', NULL, NULL, 'https://example.com/img/temporada2324.jpg', '2026-05-04 14:51:55'),
(8, '2023-24', '2024-04-20', '2024-06-17', 'Finals', 'Boston Celtics', 'Jaylen Brown', 'https://example.com/img/finals2324.jpg', '2026-05-04 14:51:55'),
(9, '2024-25', '2024-10-22', '2025-04-13', 'Regular', NULL, NULL, 'https://example.com/img/temporada2425.jpg', '2026-05-04 14:51:55'),
(10, '2024-25', '2025-04-19', '2025-06-22', 'Finals', NULL, NULL, 'https://example.com/img/finals2425.jpg', '2026-05-04 14:51:55');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `fk_equipo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipo_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  ADD CONSTRAINT `fk_estad_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estad_partido` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_evento_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `fk_jugador_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `fk_partido_evento` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_partido_local` FOREIGN KEY (`id_equipo_local`) REFERENCES `equipos` (`id_equipo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_partido_temporada` FOREIGN KEY (`id_temporada`) REFERENCES `temporadas` (`id_temporada`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_partido_visitante` FOREIGN KEY (`id_equipo_visitante`) REFERENCES `equipos` (`id_equipo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
