-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2023 at 07:05 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fruityvice`
--

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1679067937);

-- --------------------------------------------------------

--
-- Table structure for table `tblfavorites`
--

CREATE TABLE `tblfavorites` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `ffamily` varchar(100) DEFAULT NULL,
  `fsumofnutritions` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblfavorites`
--

INSERT INTO `tblfavorites` (`id`, `uid`, `fid`, `fname`, `ffamily`, `fsumofnutritions`, `created_at`) VALUES
(2, 100, 43, 'Avocado', 'Lauraceae', '185.85', '2023-03-17 16:17:32'),
(3, 100, 46, 'Blueberry', 'Rosaceae', '40.3', '2023-03-17 16:17:45'),
(4, 100, 43, 'Avocado', 'Lauraceae', '185.85', '2023-03-17 16:30:53'),
(5, 100, 43, 'Avocado', 'Lauraceae', '185.85', '2023-03-17 16:31:11'),
(6, 100, 46, 'Blueberry', 'Rosaceae', '40.3', '2023-03-17 16:31:18'),
(7, 100, 61, 'Lingonberry', 'Ericaceae', '68.13', '2023-03-17 16:32:22'),
(8, 100, 63, 'Mango', 'Anacardiaceae', '89.9', '2023-03-17 16:32:27'),
(9, 100, 65, 'Morus', 'Moraceae', '62.73', '2023-03-17 16:32:29'),
(10, 100, 66, 'Orange', 'Rutaceae', '60.7', '2023-03-17 16:32:32'),
(11, 100, 68, 'Passionfruit', 'Passifloraceae', '133.5', '2023-03-17 16:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `tblfruits`
--

CREATE TABLE `tblfruits` (
  `id` int(11) NOT NULL,
  `genus` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `fruitsid` int(11) DEFAULT NULL,
  `family` varchar(100) DEFAULT NULL,
  `order` varchar(100) DEFAULT NULL,
  `carbohydrates` varchar(100) DEFAULT NULL,
  `protein` varchar(100) DEFAULT NULL,
  `fat` varchar(100) DEFAULT NULL,
  `calories` varchar(100) DEFAULT NULL,
  `sugar` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblfruits`
--

INSERT INTO `tblfruits` (`id`, `genus`, `name`, `fruitsid`, `family`, `order`, `carbohydrates`, `protein`, `fat`, `calories`, `sugar`, `status`, `created_at`) VALUES
(41, 'Malus', 'Apple', 6, 'Rosaceae', 'Rosales', '11.4', '0.3', '0.4', '52', '10.3', 'Active', '2023-03-17 15:13:51'),
(42, 'Prunus', 'Apricot', 35, 'Rosaceae', 'Rosales', '3.9', '0.5', '0.1', '15', '3.2', 'Active', '2023-03-17 15:13:51'),
(43, 'Persea', 'Avocado', 84, 'Lauraceae', 'Laurales', '8.53', '2', '14.66', '160', '0.66', 'Active', '2023-03-17 15:13:51'),
(44, 'Musa', 'Banana', 1, 'Musaceae', 'Zingiberales', '22', '1', '0.2', '96', '17.2', 'Active', '2023-03-17 15:13:51'),
(45, 'Rubus', 'Blackberry', 64, 'Rosaceae', 'Rosales', '9', '1.3', '0.4', '40', '4.5', 'Active', '2023-03-17 15:13:51'),
(46, 'Fragaria', 'Blueberry', 33, 'Rosaceae', 'Rosales', '5.5', '0', '0.4', '29', '5.4', 'Active', '2023-03-17 15:13:51'),
(47, 'Prunus', 'Cherry', 9, 'Rosaceae', 'Rosales', '12', '1', '0.3', '50', '8', 'Active', '2023-03-17 15:13:51'),
(48, 'Vaccinium', 'Cranberry', 87, 'Ericaceae', 'Ericales', '12.2', '0.4', '0.1', '46', '4', 'Active', '2023-03-17 15:13:51'),
(49, 'Selenicereus', 'Dragonfruit', 80, 'Cactaceae', 'Caryophyllales', '9', '9', '1.5', '60', '8', 'Active', '2023-03-17 15:13:51'),
(50, 'Durio', 'Durian', 60, 'Malvaceae', 'Malvales', '27.1', '1.5', '5.3', '147', '6.75', 'Active', '2023-03-17 15:13:51'),
(51, 'Sellowiana', 'Feijoa', 76, 'Myrtaceae', 'Myrtoideae', '8', '0.6', '0.4', '44', '3', 'Active', '2023-03-17 15:13:51'),
(52, 'Ficus', 'Fig', 68, 'Moraceae', 'Rosales', '19', '0.8', '0.3', '74', '16', 'Active', '2023-03-17 15:13:51'),
(53, 'Ribes', 'Gooseberry', 69, 'Grossulariaceae', 'Saxifragales', '10', '0.9', '0.6', '44', '0', 'Active', '2023-03-17 15:13:52'),
(54, 'Vitis', 'Grape', 81, 'Vitaceae', 'Vitales', '18.1', '0.72', '0.16', '69', '16', 'Active', '2023-03-17 15:13:52'),
(55, 'Malus', 'GreenApple', 72, 'Rosaceae', 'Rosales', '3.1', '0.4', '0.1', '21', '6.4', 'Active', '2023-03-17 15:13:52'),
(56, 'Psidium', 'Guava', 37, 'Myrtaceae', 'Myrtales', '14', '2.6', '1', '68', '9', 'Active', '2023-03-17 15:13:52'),
(57, 'Apteryx', 'Kiwi', 66, 'Actinidiaceae', 'Struthioniformes', '15', '1.1', '0.5', '61', '9', 'Active', '2023-03-17 15:13:52'),
(58, 'Actinidia', 'Kiwifruit', 85, 'Actinidiaceae', 'Ericales', '14.6', '1.14', '0.5', '61', '8.9', 'Active', '2023-03-17 15:13:52'),
(59, 'Citrus', 'Lemon', 26, 'Rutaceae', 'Sapindales', '9', '1.1', '0.3', '29', '2.5', 'Active', '2023-03-17 15:13:52'),
(60, 'Citrus', 'Lime', 44, 'Rutaceae', 'Sapindales', '8.4', '0.3', '0.1', '25', '1.7', 'Active', '2023-03-17 15:13:52'),
(61, 'Vaccinium', 'Lingonberry', 65, 'Ericaceae', 'Ericales', '11.3', '0.75', '0.34', '50', '5.74', 'Active', '2023-03-17 15:13:52'),
(62, 'Litchi', 'Lychee', 67, 'Sapindaceae', 'Sapindales', '17', '0.8', '0.44', '66', '15', 'Active', '2023-03-17 15:13:52'),
(63, 'Mangifera', 'Mango', 27, 'Anacardiaceae', 'Sapindales', '15', '0.82', '0.38', '60', '13.7', 'Active', '2023-03-17 15:13:52'),
(64, 'Cucumis', 'Melon', 41, 'Cucurbitaceae', 'Cucurbitaceae', '8', '0', '0', '34', '8', 'Active', '2023-03-17 15:13:52'),
(65, 'Morus', 'Morus', 82, 'Moraceae', 'Rosales', '9.8', '1.44', '0.39', '43', '8.1', 'Active', '2023-03-17 15:13:52'),
(66, 'Citrus', 'Orange', 2, 'Rutaceae', 'Sapindales', '8.3', '1', '0.2', '43', '8.2', 'Active', '2023-03-17 15:13:52'),
(67, 'Carica', 'Papaya', 42, 'Caricaceae', 'Caricacea', '11', '0', '0.4', '43', '1', 'Active', '2023-03-17 15:13:52'),
(68, 'Passiflora', 'Passionfruit', 70, 'Passifloraceae', 'Malpighiales', '22.4', '2.2', '0.7', '97', '11.2', 'Active', '2023-03-17 15:13:52'),
(69, 'Prunus', 'Peach', 86, 'Rosaceae', 'Rosales', '9.5', '0.9', '0.25', '39', '8.4', 'Active', '2023-03-17 15:13:52'),
(70, 'Pyrus', 'Pear', 4, 'Rosaceae', 'Rosales', '15', '0.4', '0.1', '57', '10', 'Active', '2023-03-17 15:13:52'),
(71, 'Diospyros', 'Persimmon', 52, 'Ebenaceae', 'Rosales', '18', '0', '0', '81', '18', 'Active', '2023-03-17 15:13:52'),
(72, 'Ananas', 'Pineapple', 10, 'Bromeliaceae', 'Poales', '13.12', '0.54', '0.12', '50', '9.85', 'Active', '2023-03-17 15:13:52'),
(73, 'Cactaceae', 'Pitahaya', 78, 'Cactaceae', 'Caryophyllales', '7', '1', '0.4', '36', '3', 'Active', '2023-03-17 15:13:52'),
(74, 'Prunus', 'Plum', 71, 'Rosaceae', 'Rosales', '11.4', '0.7', '0.28', '46', '9.92', 'Active', '2023-03-17 15:13:52'),
(75, 'Punica', 'Pomegranate', 79, 'Lythraceae', 'Myrtales', '18.7', '1.7', '1.2', '83', '13.7', 'Active', '2023-03-17 15:13:52'),
(76, 'Rubus', 'Raspberry', 23, 'Rosaceae', 'Rosales', '12', '1.2', '0.7', '53', '4.4', 'Active', '2023-03-17 15:13:52'),
(77, 'Fragaria', 'Strawberry', 3, 'Rosaceae', 'Rosales', '5.5', '0.8', '0.4', '29', '5.4', 'Active', '2023-03-17 15:13:52'),
(78, 'Citrus', 'Tangerine', 77, 'Rutaceae', 'Sapindales', '8.3', '0', '0.4', '45', '9.1', 'Active', '2023-03-17 15:13:52'),
(79, 'Solanum', 'Tomato', 5, 'Solanaceae', 'Solanales', '3.9', '0.9', '0.2', '74', '2.6', 'Active', '2023-03-17 15:13:52'),
(80, 'Citrullus', 'Watermelon', 25, 'Cucurbitaceae', 'Cucurbitales', '8', '0.6', '0.2', '30', '6', 'Active', '2023-03-17 15:13:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tblfavorites`
--
ALTER TABLE `tblfavorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblfruits`
--
ALTER TABLE `tblfruits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblfavorites`
--
ALTER TABLE `tblfavorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblfruits`
--
ALTER TABLE `tblfruits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
