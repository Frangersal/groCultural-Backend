-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-05-2026 a las 00:16:56
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbgrosic`
--
CREATE DATABASE IF NOT EXISTS `dbgrosic` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbgrosic`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `id_estado` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capital` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Información no disponible',
  `extension_territorial` int NOT NULL,
  `gentilicio` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Información no disponible',
  `numero_municipios` int NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen_estado` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen_escudo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `nombre`, `capital`, `extension_territorial`, `gentilicio`, `numero_municipios`, `descripcion`, `imagen_estado`, `imagen_escudo`, `created_at`, `updated_at`) VALUES
(1, 'Guerrero', 'Chilpancingo de los Bravo', 63596, 'Guerrerense', 85, 'Estado libre y soberano ubicado en la región suroeste del país.', NULL, NULL, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fauna`
--

DROP TABLE IF EXISTS `fauna`;
CREATE TABLE IF NOT EXISTS `fauna` (
  `id_fauna` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_cientfico` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No se especifica',
  `promedio_vida` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No se especifica',
  `descripcion_general` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_fauna`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `fauna`
--

INSERT INTO `fauna` (`id_fauna`, `nombre`, `nombre_cientfico`, `promedio_vida`, `descripcion_general`, `created_at`, `updated_at`) VALUES
(1, 'Iguana Verde', 'Iguana iguana', '10-20 años', 'Reptil escamoso común en regiones cálidas', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Tlacuache', 'Didelphis virginiana', '2-4 años', 'Marsupial común en diversas partes del estado', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Venado Cola Blanca', 'Odocoileus virginianus', '4-5 años', 'Cervido de tamaño mediano', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 'Jabalí', 'Pecari tajacu', '10-15 años', 'Mamífero artiodáctilo de hábitat boscoso', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 'Coyote', 'Canis latrans', '10-14 años', 'Mamífero que habita gran parte de Norteamérica', '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fauna_imagenes`
--

DROP TABLE IF EXISTS `fauna_imagenes`;
CREATE TABLE IF NOT EXISTS `fauna_imagenes` (
  `id_fauna` int UNSIGNED NOT NULL,
  `id_imagen` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_fauna_has_imagenes_fauna1_idx` (`id_fauna`),
  KEY `fk_fauna_has_imagenes_imagenes1_idx` (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fauna_municipios`
--

DROP TABLE IF EXISTS `fauna_municipios`;
CREATE TABLE IF NOT EXISTS `fauna_municipios` (
  `id_Fauna` int UNSIGNED NOT NULL,
  `id_municipio` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_Fauna_has_municipios_municipios1_idx` (`id_municipio`),
  KEY `fk_Fauna_has_municipios_Fauna1_idx` (`id_Fauna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `fauna_municipios`
--

INSERT INTO `fauna_municipios` (`id_Fauna`, `id_municipio`, `created_at`, `updated_at`) VALUES
(4, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 8, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 9, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 9, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 10, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 10, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 11, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 11, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 11, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 12, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 12, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 13, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 13, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 14, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 14, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 15, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 16, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 16, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 16, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 17, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 17, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 17, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 18, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 18, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 18, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 19, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 20, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 21, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 22, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 22, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 22, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 23, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 23, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 24, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 24, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 24, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 25, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 25, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 25, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 26, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 27, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 27, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 27, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 28, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 28, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 29, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 30, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 30, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 30, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 31, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 32, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 32, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 32, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 33, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 33, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 34, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 35, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 35, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 35, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 36, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 36, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 36, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 37, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 37, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 37, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 38, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 38, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 39, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 39, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 40, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 41, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 41, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 41, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 42, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 42, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 43, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 44, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 44, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 45, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 45, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 45, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 46, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 46, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 46, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 47, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 47, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 48, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 48, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 49, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 49, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 49, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 50, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 50, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 51, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 52, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 52, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 53, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 53, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 53, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 54, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 54, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 55, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 55, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 56, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 57, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 57, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 58, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 59, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 59, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 59, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 60, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 60, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 60, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 61, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 62, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 62, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 63, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 63, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 63, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 64, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 64, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 64, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 65, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 65, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 66, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 67, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 67, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 67, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 68, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 68, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 68, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 69, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 70, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 70, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 71, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 72, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 72, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 73, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 73, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 73, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 74, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 74, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 74, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 75, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 75, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 75, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 76, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 77, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 77, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 78, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 78, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 79, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 79, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 80, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 80, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 80, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 81, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 81, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 82, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 82, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 82, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 83, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flora`
--

DROP TABLE IF EXISTS `flora`;
CREATE TABLE IF NOT EXISTS `flora` (
  `id_flora` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_cientifico` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Informacion no disponible',
  `genero` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Informacion no disponible',
  `familia` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Informacion no disponible',
  `especie` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Informacion no disponible',
  `descripcion_general` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_flora`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `flora`
--

INSERT INTO `flora` (`id_flora`, `nombre`, `nombre_cientifico`, `genero`, `familia`, `especie`, `descripcion_general`, `created_at`, `updated_at`) VALUES
(1, 'Cempasúchil', 'Tagetes erecta', 'Tagetes', 'Asteraceae', 'T. erecta', 'Flor tradicional muy utilizada en día de muertos.', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Nochebuena', 'Euphorbia pulcherrima', 'Euphorbia', 'Euphorbiaceae', 'E. pulcherrima', 'Planta de uso ornamental, nativa de Guerrero.', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Parota', 'Enterolobium cyclocarpum', 'Enterolobium', 'Fabaceae', 'E. cyclocarpum', 'Árbol frondoso común en climas cálidos y costa.', '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flora_imagenes`
--

DROP TABLE IF EXISTS `flora_imagenes`;
CREATE TABLE IF NOT EXISTS `flora_imagenes` (
  `id_flora` int UNSIGNED NOT NULL,
  `id_imagen` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_Flora_has_imagenes_Flora1_idx` (`id_flora`),
  KEY `fk_Flora_has_imagenes_imagenes1_idx` (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flora_municipios`
--

DROP TABLE IF EXISTS `flora_municipios`;
CREATE TABLE IF NOT EXISTS `flora_municipios` (
  `id_flora` int UNSIGNED NOT NULL,
  `id_municipio` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_Flora_has_municipios_municipios1_idx` (`id_municipio`),
  KEY `fk_Flora_has_municipios_Flora1_idx` (`id_flora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `flora_municipios`
--

INSERT INTO `flora_municipios` (`id_flora`, `id_municipio`, `created_at`, `updated_at`) VALUES
(2, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 8, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 8, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 9, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 9, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 10, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 11, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 12, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 12, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 13, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 13, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 14, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 14, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 15, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 16, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 17, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 17, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 18, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 19, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 20, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 21, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 22, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 23, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 24, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 24, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 25, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 25, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 26, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 26, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 27, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 27, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 28, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 28, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 29, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 29, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 30, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 31, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 31, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 32, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 33, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 34, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 35, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 35, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 36, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 37, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 37, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 38, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 38, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 39, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 39, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 40, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 41, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 41, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 42, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 42, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 43, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 44, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 45, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 45, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 46, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 47, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 47, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 48, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 49, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 49, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 50, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 50, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 51, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 51, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 52, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 53, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 54, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 55, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 55, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 56, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 56, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 57, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 57, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 58, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 58, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 59, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 60, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 60, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 61, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 61, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 62, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 62, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 63, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 63, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 64, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 65, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 66, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 66, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 67, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 68, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 69, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 69, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 70, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 70, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 71, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 71, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 72, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 72, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 73, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 74, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 74, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 75, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 76, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 77, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 77, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 78, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 79, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 79, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 80, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 80, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 81, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 82, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 83, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE IF NOT EXISTS `imagenes` (
  `id_imagen` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ruta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intereses_culturales`
--

DROP TABLE IF EXISTS `intereses_culturales`;
CREATE TABLE IF NOT EXISTS `intereses_culturales` (
  `id_interes_cult` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_general` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `horario` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Información no disponible',
  `direccion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_municipio` int UNSIGNED NOT NULL,
  `id_tipo_interes` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_interes_cult`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_int_culturales_municipios_idx` (`id_municipio`),
  KEY `fk_tipo_intereses_culturales_idx` (`id_tipo_interes`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `intereses_culturales`
--

INSERT INTO `intereses_culturales` (`id_interes_cult`, `nombre`, `descripcion_general`, `horario`, `direccion`, `id_municipio`, `id_tipo_interes`, `created_at`, `updated_at`) VALUES
(1, 'La Quebrada', 'Acantilado icónico.', 'Abierto todo el público', 'Acapulco, Gro.', 1, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Grutas de Cacahuamilpa', 'Parque nacional de cavernas imponentes.', '10:00 a 17:00', 'Pilcaya, Gro.', 25, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Zona Arqueológica de Tehuacalco', 'Sitio arqueológico con basamentos.', '9:00 a 16:00', 'Chilpancingo, Gro.', 4, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 'Parroquia de Santa Prisca', 'Templo virreinal barroco.', '7:00 a 19:00', 'Taxco de Alarcón, Gro.', 30, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intereses_culturales_has_imagenes`
--

DROP TABLE IF EXISTS `intereses_culturales_has_imagenes`;
CREATE TABLE IF NOT EXISTS `intereses_culturales_has_imagenes` (
  `id_interes_cult` int UNSIGNED NOT NULL,
  `id_imagen` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_intereses_culturales_has_imagenes_imagenes1_idx` (`id_imagen`),
  KEY `fk_intereses_culturales_has_imagenes_intereses_culturales1_idx` (`id_interes_cult`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lenguajes`
--

DROP TABLE IF EXISTS `lenguajes`;
CREATE TABLE IF NOT EXISTS `lenguajes` (
  `id_lengua` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `disponibilidad` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Disponible',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_lengua`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lenguajes`
--

INSERT INTO `lenguajes` (`id_lengua`, `nombre`, `descripcion`, `disponibilidad`, `created_at`, `updated_at`) VALUES
(1, 'Español', 'Idioma predominante en el estado (Indoeuropea)', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Nahuatl', 'Lengua hablada en la región Montaña y Norte (Yuto-nahua)', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Mixteco (Tu\'un Savi)', 'Hablado en la región Costa Chica y Montaña (Otomangue)', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 'Tlapaneco (Me\'phaa)', 'Hablado en la zona centro y montaña de Guerrero (Otomangue)', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 'Amuzgo', 'Lengua hablada principalmente en la Costa Chica (Otomangue)', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_02_17_121520_create_imagens_table', 1),
(4, '2019_02_17_121520_create_usuarios_table', 1),
(5, '2019_02_17_121521_create_estados_table', 1),
(6, '2019_02_17_121521_create_faunas_table', 1),
(7, '2019_02_17_121521_create_floras_table', 1),
(8, '2019_02_17_121521_create_lenguajes_table', 1),
(9, '2019_02_17_121521_create_religions_table', 1),
(10, '2019_02_17_121521_create_tipo_sitio_interes_table', 1),
(11, '2019_02_17_121521_create_tipo_tradicions_table', 1),
(12, '2019_02_17_121620_create_regions_table', 1),
(13, '2019_02_17_121720_create_municipios_table', 1),
(14, '2019_02_17_121822_create_sitio_interes_table', 1),
(15, '2019_02_17_121822_create_tradicions_table', 1),
(16, '2019_02_17_121837_create_fauna_has_imagens_table', 1),
(17, '2019_02_17_121921_create_sitio_interes_has_imagens_table', 1),
(18, '2019_02_17_122026_create_flora_has_imagens_table', 1),
(19, '2019_02_17_122257_create_municipio_has_faunas_table', 1),
(20, '2019_02_17_122446_create_municipio_has_floras_table', 1),
(21, '2019_02_17_122545_create_municipio_has_lenguajes_table', 1),
(22, '2019_02_17_122720_create_municipio_has_religions_table', 1),
(23, '2019_02_17_122745_create_municipio_has_tradicions_table', 1),
(24, '2019_02_17_123036_create_tradicion_has_imagens_table', 1),
(25, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

DROP TABLE IF EXISTS `municipios`;
CREATE TABLE IF NOT EXISTS `municipios` (
  `id_municipio` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clima` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Información no disponible',
  `numero_habitantes` int NOT NULL,
  `historia_general` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `escudo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mapa` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_region` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_municipio`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_municipios_regiones1_idx` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `nombre`, `clima`, `numero_habitantes`, `historia_general`, `escudo`, `mapa`, `id_region`, `created_at`, `updated_at`) VALUES
(1, 'Acapulco de Juárez', 'Agradable / Variable', 34442, 'Historia general de Acapulco de Juárez no disponible actualmente...', NULL, NULL, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Ahuacuotzingo', 'Agradable / Variable', 9928, 'Historia general de Ahuacuotzingo no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Chilapa de Álvarez', 'Agradable / Variable', 39619, 'Historia general de Chilapa de Álvarez no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 'Chilpancingo de los Bravo', 'Agradable / Variable', 80716, 'Historia general de Chilpancingo de los Bravo no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 'Eduardo Neri', 'Agradable / Variable', 52664, 'Historia general de Eduardo Neri no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(6, 'General Heliodoro Castillo', 'Agradable / Variable', 63385, 'Historia general de General Heliodoro Castillo no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(7, 'José Joaquín de Herrera', 'Agradable / Variable', 51047, 'Historia general de José Joaquín de Herrera no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(8, 'Juan R. Escudero', 'Agradable / Variable', 82707, 'Historia general de Juan R. Escudero no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(9, 'Leonardo Bravo', 'Agradable / Variable', 32481, 'Historia general de Leonardo Bravo no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(10, 'Mártir de Cuilapan', 'Agradable / Variable', 9873, 'Historia general de Mártir de Cuilapan no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(11, 'Mochitlán', 'Agradable / Variable', 93250, 'Historia general de Mochitlán no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(12, 'Quechultenango', 'Agradable / Variable', 53656, 'Historia general de Quechultenango no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(13, 'Tixtla de Guerrero', 'Agradable / Variable', 52627, 'Historia general de Tixtla de Guerrero no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(14, 'Zitlala', 'Agradable / Variable', 62417, 'Historia general de Zitlala no disponible actualmente...', NULL, NULL, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(15, 'Ayutla de los Libres', 'Agradable / Variable', 98060, 'Historia general de Ayutla de los Libres no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(16, 'Azoyú', 'Agradable / Variable', 16144, 'Historia general de Azoyú no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(17, 'Copala', 'Agradable / Variable', 87839, 'Historia general de Copala no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(18, 'Cuajinicuilapa', 'Agradable / Variable', 10070, 'Historia general de Cuajinicuilapa no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(19, 'Cuautepec', 'Agradable / Variable', 76179, 'Historia general de Cuautepec no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(20, 'Florencio Villarreal', 'Agradable / Variable', 71892, 'Historia general de Florencio Villarreal no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(21, 'Igualapa', 'Agradable / Variable', 91165, 'Historia general de Igualapa no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(22, 'Juchitán', 'Agradable / Variable', 40034, 'Historia general de Juchitán no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(23, 'Marquelia', 'Agradable / Variable', 91793, 'Historia general de Marquelia no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(24, 'Ometepec', 'Agradable / Variable', 46759, 'Historia general de Ometepec no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(25, 'San Luis Acatlán', 'Agradable / Variable', 76115, 'Historia general de San Luis Acatlán no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(26, 'San Marcos', 'Agradable / Variable', 98523, 'Historia general de San Marcos no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(27, 'Tecoanapa', 'Agradable / Variable', 43747, 'Historia general de Tecoanapa no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(28, 'Xochistlahuaca', 'Agradable / Variable', 97700, 'Historia general de Xochistlahuaca no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(29, 'Las Vigas', 'Agradable / Variable', 83622, 'Historia general de Las Vigas no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(30, 'San Nicolás', 'Agradable / Variable', 64286, 'Historia general de San Nicolás no disponible actualmente...', NULL, NULL, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(31, 'Atoyac de Álvarez', 'Agradable / Variable', 13151, 'Historia general de Atoyac de Álvarez no disponible actualmente...', NULL, NULL, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(32, 'Benito Juárez', 'Agradable / Variable', 61409, 'Historia general de Benito Juárez no disponible actualmente...', NULL, NULL, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(33, 'Coahuayutla de José María Izazaga', 'Agradable / Variable', 93067, 'Historia general de Coahuayutla de José María Izazaga no disponible actualmente...', NULL, NULL, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(34, 'Coyuca de Benítez', 'Agradable / Variable', 51129, 'Historia general de Coyuca de Benítez no disponible actualmente...', NULL, NULL, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(35, 'Petatlán', 'Agradable / Variable', 25063, 'Historia general de Petatlán no disponible actualmente...', NULL, NULL, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(36, 'Tecpan de Galeana', 'Agradable / Variable', 85446, 'Historia general de Tecpan de Galeana no disponible actualmente...', NULL, NULL, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(37, 'La Unión de Isidoro Montes de Oca', 'Agradable / Variable', 13747, 'Historia general de La Unión de Isidoro Montes de Oca no disponible actualmente...', NULL, NULL, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(38, 'Zihuatanejo de Azueta', 'Agradable / Variable', 72668, 'Historia general de Zihuatanejo de Azueta no disponible actualmente...', NULL, NULL, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(39, 'Acatepec', 'Agradable / Variable', 18634, 'Historia general de Acatepec no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(40, 'Alcozauca de Guerrero', 'Agradable / Variable', 45504, 'Historia general de Alcozauca de Guerrero no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(41, 'Alpoyeca', 'Agradable / Variable', 75110, 'Historia general de Alpoyeca no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(42, 'Atlamajalcingo del Monte', 'Agradable / Variable', 69464, 'Historia general de Atlamajalcingo del Monte no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(43, 'Atlixtac', 'Agradable / Variable', 93639, 'Historia general de Atlixtac no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(44, 'Cochoapa el Grande', 'Agradable / Variable', 71570, 'Historia general de Cochoapa el Grande no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(45, 'Copanatoyac', 'Agradable / Variable', 63463, 'Historia general de Copanatoyac no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(46, 'Cualác', 'Agradable / Variable', 10141, 'Historia general de Cualác no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(47, 'Huamuxtitlán', 'Agradable / Variable', 71510, 'Historia general de Huamuxtitlán no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(48, 'Iliatenco', 'Agradable / Variable', 9430, 'Historia general de Iliatenco no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(49, 'Malinaltepec', 'Agradable / Variable', 96165, 'Historia general de Malinaltepec no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(50, 'Metlatónoc', 'Agradable / Variable', 87731, 'Historia general de Metlatónoc no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(51, 'Olinalá', 'Agradable / Variable', 11165, 'Historia general de Olinalá no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(52, 'Tlacoapa', 'Agradable / Variable', 52845, 'Historia general de Tlacoapa no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(53, 'Tlalixtaquilla de Maldonado', 'Agradable / Variable', 38836, 'Historia general de Tlalixtaquilla de Maldonado no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(54, 'Tlapa de Comonfort', 'Agradable / Variable', 90553, 'Historia general de Tlapa de Comonfort no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(55, 'Xalpatláhuac', 'Agradable / Variable', 65983, 'Historia general de Xalpatláhuac no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(56, 'Zapotitlán Tablas', 'Agradable / Variable', 33152, 'Historia general de Zapotitlán Tablas no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(57, 'Santa Cruz del Rincón', 'Agradable / Variable', 40677, 'Historia general de Santa Cruz del Rincón no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(58, 'Ñuu Savi', 'Agradable / Variable', 76244, 'Historia general de Ñuu Savi no disponible actualmente...', NULL, NULL, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(59, 'Apaxtla', 'Agradable / Variable', 72860, 'Historia general de Apaxtla no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(60, 'Atenango del Río', 'Agradable / Variable', 22259, 'Historia general de Atenango del Río no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(61, 'Buenavista de Cuéllar', 'Agradable / Variable', 45203, 'Historia general de Buenavista de Cuéllar no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(62, 'Cocula', 'Agradable / Variable', 58750, 'Historia general de Cocula no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(63, 'Copalillo', 'Agradable / Variable', 78601, 'Historia general de Copalillo no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(64, 'Cuetzala del Progreso', 'Agradable / Variable', 18329, 'Historia general de Cuetzala del Progreso no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(65, 'General Canuto A. Neri', 'Agradable / Variable', 28568, 'Historia general de General Canuto A. Neri no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(66, 'Huitzuco de los Figueroa', 'Agradable / Variable', 50189, 'Historia general de Huitzuco de los Figueroa no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(67, 'Iguala de la Independencia', 'Agradable / Variable', 91841, 'Historia general de Iguala de la Independencia no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(68, 'Ixcateopan de Cuauhtémoc', 'Agradable / Variable', 48574, 'Historia general de Ixcateopan de Cuauhtémoc no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(69, 'Pedro Ascencio Alquisiras', 'Agradable / Variable', 71063, 'Historia general de Pedro Ascencio Alquisiras no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(70, 'Pilcaya', 'Agradable / Variable', 95205, 'Historia general de Pilcaya no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(71, 'Taxco de Alarcón', 'Agradable / Variable', 79966, 'Historia general de Taxco de Alarcón no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(72, 'Teloloapan', 'Agradable / Variable', 70140, 'Historia general de Teloloapan no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(73, 'Tepecoacuilco de Trujano', 'Agradable / Variable', 62096, 'Historia general de Tepecoacuilco de Trujano no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(74, 'Tetipac', 'Agradable / Variable', 50363, 'Historia general de Tetipac no disponible actualmente...', NULL, NULL, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(75, 'Ajuchitlán del Progreso', 'Agradable / Variable', 95836, 'Historia general de Ajuchitlán del Progreso no disponible actualmente...', NULL, NULL, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(76, 'Arcelia', 'Agradable / Variable', 6967, 'Historia general de Arcelia no disponible actualmente...', NULL, NULL, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(77, 'Coyuca de Catalán', 'Agradable / Variable', 8569, 'Historia general de Coyuca de Catalán no disponible actualmente...', NULL, NULL, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(78, 'Cutzamala de Pinzón', 'Agradable / Variable', 71452, 'Historia general de Cutzamala de Pinzón no disponible actualmente...', NULL, NULL, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(79, 'Pungarabato', 'Agradable / Variable', 43394, 'Historia general de Pungarabato no disponible actualmente...', NULL, NULL, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(80, 'San Miguel Totolapan', 'Agradable / Variable', 72695, 'Historia general de San Miguel Totolapan no disponible actualmente...', NULL, NULL, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(81, 'Tlalchapa', 'Agradable / Variable', 14907, 'Historia general de Tlalchapa no disponible actualmente...', NULL, NULL, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(82, 'Tlapehuala', 'Agradable / Variable', 95022, 'Historia general de Tlapehuala no disponible actualmente...', NULL, NULL, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(83, 'Zirándaro', 'Agradable / Variable', 14381, 'Historia general de Zirándaro no disponible actualmente...', NULL, NULL, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios_lenguajes`
--

DROP TABLE IF EXISTS `municipios_lenguajes`;
CREATE TABLE IF NOT EXISTS `municipios_lenguajes` (
  `id_lengua` int UNSIGNED NOT NULL,
  `id_municipio` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_municipio_municipio_idx` (`id_municipio`),
  KEY `fk_lengua_lengua_idx` (`id_lengua`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipios_lenguajes`
--

INSERT INTO `municipios_lenguajes` (`id_lengua`, `id_municipio`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 5, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 6, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 7, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 8, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 8, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 9, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 9, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 10, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 10, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 11, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 11, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 12, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 12, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 13, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 14, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 15, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 16, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 17, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 18, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 19, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 20, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 21, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 22, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 23, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 24, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 25, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 26, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 26, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 27, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 27, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 28, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 29, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 29, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 30, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 31, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 32, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 33, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 34, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 35, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 35, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 36, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 36, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 37, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 38, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 38, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 39, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 40, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 40, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 41, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 42, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 43, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 44, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 44, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 45, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 46, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 47, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 48, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 48, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 49, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 50, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 51, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 51, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 52, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 53, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 54, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 55, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 56, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 57, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 58, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 59, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 60, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 61, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 62, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 63, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 63, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 64, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 65, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 66, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 67, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 67, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 68, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 69, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 69, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 70, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 71, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 72, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 73, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 74, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 75, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 75, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 76, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 77, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 77, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 78, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 79, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 79, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 80, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 80, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 81, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 82, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(1, 83, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios_religiones`
--

DROP TABLE IF EXISTS `municipios_religiones`;
CREATE TABLE IF NOT EXISTS `municipios_religiones` (
  `id_municipio` int UNSIGNED NOT NULL,
  `id_religion` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_municipio_religion_municipios_idx` (`id_municipio`),
  KEY `fk_municipio_religion_religiones_idx` (`id_religion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipios_religiones`
--

INSERT INTO `municipios_religiones` (`id_municipio`, `id_religion`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(6, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(7, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(7, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(8, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(8, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(9, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(10, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(11, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(11, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(12, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(13, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(13, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(14, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(14, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(15, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(15, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(16, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(16, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(17, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(17, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(18, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(18, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(19, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(20, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(20, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(21, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(22, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(23, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(23, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(24, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(24, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(25, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(26, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(27, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(27, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(28, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(29, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(30, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(30, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(31, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(32, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(33, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(34, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(35, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(36, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(37, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(37, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(38, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(39, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(39, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(40, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(40, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(41, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(42, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(42, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(43, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(44, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(45, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(46, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(47, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(47, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(48, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(48, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(49, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(49, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(50, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(50, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(51, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(51, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(52, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(52, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(53, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(54, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(55, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(56, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(57, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(57, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(58, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(59, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(59, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(60, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(61, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(62, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(62, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(63, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(63, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(64, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(65, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(65, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(66, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(67, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(67, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(68, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(69, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(69, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(70, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(71, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(72, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(73, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(74, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(74, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(75, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(75, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(76, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(77, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(78, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(79, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(80, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(80, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(81, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(81, 4, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(82, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(82, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(83, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios_tradiciones`
--

DROP TABLE IF EXISTS `municipios_tradiciones`;
CREATE TABLE IF NOT EXISTS `municipios_tradiciones` (
  `id_municipio` int UNSIGNED NOT NULL,
  `id_tradicion` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_muni_tradi_municipios_idx` (`id_municipio`),
  KEY `fk_muni_tradi_tradiciones_idx` (`id_tradicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipios_tradiciones`
--

INSERT INTO `municipios_tradiciones` (`id_municipio`, `id_tradicion`, `created_at`, `updated_at`) VALUES
(11, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(12, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(13, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(16, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(17, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(21, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(31, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(33, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(40, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(41, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(42, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(43, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(45, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(55, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(56, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(60, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(61, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(63, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(67, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(69, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(72, 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(75, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(81, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(82, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 2, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

DROP TABLE IF EXISTS `regiones`;
CREATE TABLE IF NOT EXISTS `regiones` (
  `id_region` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capital_regional` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Información no disponible',
  `extension_territorial` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Información no disponible',
  `ubicacion_geografica` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Información no disponible',
  `numero_habitantes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Información no disponible',
  `disponibilidad` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Disponible',
  `numero_municipios` int NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapa` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_estado` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_region`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_regiones_estados1_idx` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id_region`, `nombre`, `capital_regional`, `extension_territorial`, `ubicacion_geografica`, `numero_habitantes`, `disponibilidad`, `numero_municipios`, `descripcion`, `mapa`, `id_estado`, `created_at`, `updated_at`) VALUES
(1, 'Acapulco', 'Acapulco de Juárez', 'Información no disponible', 'Información no disponible', '0', 'Disponible', 1, 'Región de Acapulco en el Estado de Guerrero', NULL, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Centro', 'Chilpancingo de los Bravo', 'Información no disponible', 'Información no disponible', '0', 'Disponible', 13, 'Región de Centro en el Estado de Guerrero', NULL, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Costa Chica', 'Ometepec', 'Información no disponible', 'Información no disponible', '0', 'Disponible', 16, 'Región de Costa Chica en el Estado de Guerrero', NULL, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 'Costa Grande', 'Zihuatanejo de Azueta', 'Información no disponible', 'Información no disponible', '0', 'Disponible', 8, 'Región de Costa Grande en el Estado de Guerrero', NULL, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 'Montaña', 'Tlapa de Comonfort', 'Información no disponible', 'Información no disponible', '0', 'Disponible', 19, 'Región de Montaña en el Estado de Guerrero', NULL, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(6, 'Norte', 'Iguala de la Independencia', 'Información no disponible', 'Información no disponible', '0', 'Disponible', 16, 'Región de Norte en el Estado de Guerrero', NULL, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(7, 'Tierra Caliente', 'Ciudad Altamirano', 'Información no disponible', 'Información no disponible', '0', 'Disponible', 9, 'Región de Tierra Caliente en el Estado de Guerrero', NULL, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(8, 'Sierra', 'Heliodoro Castillo', 'Información no disponible', 'Información no disponible', '0', 'Disponible', 3, 'Región de Sierra en el Estado de Guerrero', NULL, 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `religiones`
--

DROP TABLE IF EXISTS `religiones`;
CREATE TABLE IF NOT EXISTS `religiones` (
  `id_religion` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `disponibilidad` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Disponible',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_religion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `religiones`
--

INSERT INTO `religiones` (`id_religion`, `nombre`, `descripcion`, `disponibilidad`, `created_at`, `updated_at`) VALUES
(1, 'Catolicismo', 'Religión mayoritaria del estado por herencia colonial', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Protestantismo / Evangélica', 'Diversas denominaciones cristianas', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Creencias Tradicionales Indígenas', 'Sincretismos basados en deidades antiguas combinadas con la liturgia', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 'Sin Religión', 'Personas que no profesan credo o fe alguna', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_intereses_culturales`
--

DROP TABLE IF EXISTS `tipo_intereses_culturales`;
CREATE TABLE IF NOT EXISTS `tipo_intereses_culturales` (
  `id_tipo_interes` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disponibilidad` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Disponible',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_interes`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_intereses_culturales`
--

INSERT INTO `tipo_intereses_culturales` (`id_tipo_interes`, `nombre`, `disponibilidad`, `created_at`, `updated_at`) VALUES
(1, 'Zona Arqueológica', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Playa', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Museo', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(4, 'Iglesia / Templo', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(5, 'Pueblo Mágico', 'Disponible', '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_tradicion`
--

DROP TABLE IF EXISTS `tipo_tradicion`;
CREATE TABLE IF NOT EXISTS `tipo_tradicion` (
  `id_tipo_tradicion` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_tradicion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_tradicion`
--

INSERT INTO `tipo_tradicion` (`id_tipo_tradicion`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Danza / Baile regional', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Festividad Religiosa', '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Feria Popular', '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tradiciones`
--

DROP TABLE IF EXISTS `tradiciones`;
CREATE TABLE IF NOT EXISTS `tradiciones` (
  `id_tradicion` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_festejo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Informacion no disponible',
  `id_tipo_tradicion` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tradicion`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_tradiciones_tipo_tradicion_idx` (`id_tipo_tradicion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tradiciones`
--

INSERT INTO `tradiciones` (`id_tradicion`, `nombre`, `descripcion`, `fecha_festejo`, `id_tipo_tradicion`, `created_at`, `updated_at`) VALUES
(1, 'Danza de los Tlacololeros', 'Danza tradicional de petición de lluvias y fertilidad.', 'Septiembre a Diciembre', 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(2, 'Feria de San Mateo, Navidad y Año Nuevo', 'Se celebra en Chilpancingo, el \"Paseo del Pendón\".', 'Diciembre y Enero', 3, '2026-05-05 03:34:47', '2026-05-05 03:34:47'),
(3, 'Danza de los Diablos', 'Baile típico de la región de la Costa Chica.', 'Día de Muertos', 1, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tradiciones_has_imagenes`
--

DROP TABLE IF EXISTS `tradiciones_has_imagenes`;
CREATE TABLE IF NOT EXISTS `tradiciones_has_imagenes` (
  `tradiciones_id_tradicion` int UNSIGNED NOT NULL,
  `imagenes_id_imagen` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_tradiciones_has_imagenes_tradiciones1_idx` (`tradiciones_id_tradicion`),
  KEY `fk_tradiciones_has_imagenes_imagenes1_idx` (`imagenes_id_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@grocultural.com', '2026-05-05 03:34:47', '$2y$10$4BQifRDrVMlkH31ts3IKnenrgRMwx.jP3oo2FuoFC1yLGyCtgE1kq', NULL, '2026-05-05 03:34:47', '2026-05-05 03:34:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_usuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo_electronico` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `username`, `contrasena`, `tipo_usuario`, `nombre`, `apellidos`, `correo_electronico`, `created_at`, `updated_at`) VALUES
(1, 'adminfgsm', '$2y$10$VURcfGjwctMFqiTzTBUhdOa7kgTcBOBUaN1OK5ZlHbDOuYv7gFpye', 'Administrador', 'Admin', 'Sistema', 'admin@grocultural.com', '2026-05-05 03:34:47', '2026-05-05 03:34:47');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fauna_imagenes`
--
ALTER TABLE `fauna_imagenes`
  ADD CONSTRAINT `fauna_imagenes_id_fauna` FOREIGN KEY (`id_fauna`) REFERENCES `fauna` (`id_fauna`),
  ADD CONSTRAINT `fk_fauna_has_imagenes_imagenes1_idx` FOREIGN KEY (`id_imagen`) REFERENCES `imagenes` (`id_imagen`);

--
-- Filtros para la tabla `fauna_municipios`
--
ALTER TABLE `fauna_municipios`
  ADD CONSTRAINT `fauna_municipios_id_Fauna` FOREIGN KEY (`id_Fauna`) REFERENCES `fauna` (`id_fauna`),
  ADD CONSTRAINT `fk_Fauna_has_municipios_municipios1_idx` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`);

--
-- Filtros para la tabla `flora_imagenes`
--
ALTER TABLE `flora_imagenes`
  ADD CONSTRAINT `fk_Flora_has_imagenes_imagenes1_idx` FOREIGN KEY (`id_imagen`) REFERENCES `imagenes` (`id_imagen`),
  ADD CONSTRAINT `flora_imagenes_id_flora` FOREIGN KEY (`id_flora`) REFERENCES `flora` (`id_flora`);

--
-- Filtros para la tabla `flora_municipios`
--
ALTER TABLE `flora_municipios`
  ADD CONSTRAINT `fk_Flora_has_municipios_municipios1_idx` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`),
  ADD CONSTRAINT `flora_municipios_id_flora` FOREIGN KEY (`id_flora`) REFERENCES `flora` (`id_flora`);

--
-- Filtros para la tabla `intereses_culturales`
--
ALTER TABLE `intereses_culturales`
  ADD CONSTRAINT `fk_int_culturales_municipios_idx` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`),
  ADD CONSTRAINT `fk_tipo_intereses_culturales_idx` FOREIGN KEY (`id_tipo_interes`) REFERENCES `tipo_intereses_culturales` (`id_tipo_interes`);

--
-- Filtros para la tabla `intereses_culturales_has_imagenes`
--
ALTER TABLE `intereses_culturales_has_imagenes`
  ADD CONSTRAINT `fk_intereses_culturales_has_imagenes_imagenes1_idx` FOREIGN KEY (`id_imagen`) REFERENCES `imagenes` (`id_imagen`),
  ADD CONSTRAINT `fk_intereses_culturales_has_imagenes_intereses_culturales1_idx` FOREIGN KEY (`id_interes_cult`) REFERENCES `intereses_culturales` (`id_interes_cult`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_municipios_regiones1_idx` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`id_region`);

--
-- Filtros para la tabla `municipios_lenguajes`
--
ALTER TABLE `municipios_lenguajes`
  ADD CONSTRAINT `fk_municipio_municipio_idx` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`),
  ADD CONSTRAINT `municipios_lenguajes_id_lengua` FOREIGN KEY (`id_lengua`) REFERENCES `lenguajes` (`id_lengua`);

--
-- Filtros para la tabla `municipios_religiones`
--
ALTER TABLE `municipios_religiones`
  ADD CONSTRAINT `fk_municipio_religion_religiones_idx` FOREIGN KEY (`id_religion`) REFERENCES `religiones` (`id_religion`),
  ADD CONSTRAINT `municipios_religiones_id_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`);

--
-- Filtros para la tabla `municipios_tradiciones`
--
ALTER TABLE `municipios_tradiciones`
  ADD CONSTRAINT `fk_muni_tradi_municipios_idx` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`),
  ADD CONSTRAINT `fk_muni_tradi_tradiciones_idx` FOREIGN KEY (`id_tradicion`) REFERENCES `tradiciones` (`id_tradicion`);

--
-- Filtros para la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD CONSTRAINT `fk_regiones_estados1_idx` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`);

--
-- Filtros para la tabla `tradiciones`
--
ALTER TABLE `tradiciones`
  ADD CONSTRAINT `fk_tradiciones_tipo_tradicion_idx` FOREIGN KEY (`id_tipo_tradicion`) REFERENCES `tipo_tradicion` (`id_tipo_tradicion`);

--
-- Filtros para la tabla `tradiciones_has_imagenes`
--
ALTER TABLE `tradiciones_has_imagenes`
  ADD CONSTRAINT `fk_tradiciones_has_imagenes_imagenes1_idx` FOREIGN KEY (`imagenes_id_imagen`) REFERENCES `imagenes` (`id_imagen`),
  ADD CONSTRAINT `fk_tradiciones_has_imagenes_tradiciones1_idx` FOREIGN KEY (`tradiciones_id_tradicion`) REFERENCES `tradiciones` (`id_tradicion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
