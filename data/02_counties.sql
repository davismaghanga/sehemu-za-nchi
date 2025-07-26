-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2019 at 07:46 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

CREATE TABLE `counties` (
  `id` int(10) UNSIGNED NOT NULL,
  `county` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counties`
--

INSERT INTO `counties` (`id`, `county`, `region_id`, `created_at`, `updated_at`) VALUES
(1, 'Mombasa', 1, NULL, NULL),
(2, 'Kwale', 1, NULL, NULL),
(3, 'Kilifi', 1, NULL, NULL),
(4, 'Tana River', 1, NULL, NULL),
(5, 'Lamu', 1, NULL, NULL),
(6, 'Taita Taveta', 1, NULL, NULL),
(7, 'Turkana', 2, NULL, NULL),
(8, 'West Pokot', 2, NULL, NULL),
(9, 'Samburu', 2, NULL, NULL),
(10, 'Trans-Nzoia', 2, NULL, NULL),
(11, 'Uasin Gishu', 2, NULL, NULL),
(12, 'Elgeyo Marakwet', 2, NULL, NULL),
(13, 'Nandi', 2, NULL, NULL),
(14, 'Baringo', 2, NULL, NULL),
(15, 'Laikipia', 2, NULL, NULL),
(16, 'Nakuru', 2, NULL, NULL),
(17, 'Narok', 2, NULL, NULL),
(18, 'Kajiado', 2, NULL, NULL),
(19, 'Kericho', 2, NULL, NULL),
(20, 'Bomet', 2, NULL, NULL),
(21, 'Nairobi', 3, NULL, NULL),
(22, 'Nyandarua', 4, NULL, NULL),
(23, 'Nyeri', 4, NULL, NULL),
(24, 'Kirinyaga', 4, NULL, NULL),
(25, 'Muranga\'a', 4, NULL, NULL),
(26, 'Kiambu', 4, NULL, NULL),
(27, 'Kakamega', 5, NULL, NULL),
(28, 'Vihiga', 5, NULL, NULL),
(29, 'Bungoma', 5, NULL, NULL),
(30, 'Busia', 5, NULL, NULL),
(31, 'Siaya', 6, NULL, NULL),
(32, 'Kisumu', 6, NULL, NULL),
(33, 'Homa Bay', 6, NULL, NULL),
(34, 'Migori', 6, NULL, NULL),
(35, 'Kisii', 6, NULL, NULL),
(36, 'Nyamira', 6, NULL, NULL),
(37, 'Garissa', 7, NULL, NULL),
(38, 'Wajir', 7, NULL, NULL),
(39, 'Mandera', 7, NULL, NULL),
(40, 'Marsabit', 8, NULL, NULL),
(41, 'Isiolo', 8, NULL, NULL),
(42, 'Meru', 8, NULL, NULL),
(43, 'Tharaka Nithi', 8, NULL, NULL),
(44, 'Embu', 8, NULL, NULL),
(45, 'Kitui', 8, NULL, NULL),
(46, 'Machakos', 8, NULL, NULL),
(47, 'Makueni', 8, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `counties`
--
ALTER TABLE `counties`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `counties`
--
ALTER TABLE `counties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
