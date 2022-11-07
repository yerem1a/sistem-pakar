-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 01, 2019 at 03:24 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_expert`
--

-- --------------------------------------------------------

--
-- Table structure for table `ds_evidences`
--

CREATE TABLE `ds_evidences` (
  `id` int(11) NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ds_evidences`
--

INSERT INTO `ds_evidences` (`id`, `code`, `name`) VALUES
(1, 'G1 ', 'ayam mengeluarkan kotor'),
(2, 'G2 ', 'jengger ayam terlihat pucat'),
(3, 'G3', 'nafsu makan ayam menurun'),
(4, 'G4', 'tingkah ayam terlihat lesu'),
(5, 'G5', 'ayam mudah kehausan'),
(6, 'G6', 'ayam mendadak mati'),
(7, 'G7', 'umur ayam kurang dari 1'),
(8, 'G8', 'dada pada ayam terlihat tipis'),
(9, 'G9', 'persendian pada ayam bengkak'),
(10, 'G10', 'ayam sulit bernafas'),
(11, 'G11', 'ayam batuk'),
(12, 'G12', 'umur ayam lebih dari 1 '),
(13, 'G13', 'warna kotoran ayam putih'),
(14, 'G14', 'ayam sering menggeleng '),
(15, 'G15', '\r\nterdapat cairan pada hidung'),
(16, 'G16', 'Kepala Ayam Bengkak'),
(17, 'G17', 'Posisi sayap ayam menurun'),
(18, 'G18', 'Tingkah Lemah '),
(19, 'G19', 'Ayam Memiliki kotoran darah (Berak Darah)'),
(20, 'G20', 'Kepala Ayam Berwarna Hitam'),
(21, 'G21', 'Ayam Memiliki Bulu kusut'),
(22, 'G22', 'Tingkat Kematian Ayam Tinggi'),
(23, 'G23', 'Berat badan ayam terus '),
(24, 'G24', 'Ayam Bertingkah Mengantuk'),
(25, 'G25', 'Ayam Bertingkah Bersin'),
(26, 'G26', 'apakah Bentuk Fisik Ayam Kurus');

-- --------------------------------------------------------

--
-- Table structure for table `ds_problems`
--

CREATE TABLE `ds_problems` (
  `id` int(11) NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ds_problems`
--

INSERT INTO `ds_problems` (`id`, `code`, `name`) VALUES
(1, 'P1', 'Typus Ayam'),
(2, 'P2', 'TBC'),
(3, 'P3', 'Kolera'),
(4, 'P4', 'CRD / Batuk '),
(5, 'P5', 'Pilek / Snot'),
(6, 'P6', 'Berak Lumpur'),
(7, 'P7', 'Berak Darah'),
(8, 'P8', 'Hostomatosis'),
(9, 'P9', 'Radang Paru - Paru'),
(10, 'P10', 'Influenza Ayam'),
(11, 'P11', 'Sesak Nafas'),
(12, 'P12', 'Gumoro');

-- --------------------------------------------------------

--
-- Table structure for table `ds_rules`
--

CREATE TABLE `ds_rules` (
  `id_problem` int(11) DEFAULT NULL,
  `id_evidence` int(11) DEFAULT NULL,
  `cf` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ds_rules`
--

INSERT INTO `ds_rules` (`id_problem`, `id_evidence`, `cf`) VALUES
(1, 1, 0.7),
(1, 2, 0.6),
(6, 2, 0.6),
(1, 3, 0.8),
(7, 3, 0.8),
(9, 3, 0.8),
(11, 3, 0.8),
(12, 3, 0.8),
(2, 4, 0.5),
(9, 4, 0.5),
(11, 4, 0.5),
(1, 5, 0.6),
(9, 5, 0.6),
(1, 6, 0.9),
(2, 7, 0.7),
(2, 8, 0.6),
(2, 9, 0.7),
(9, 10, 0.8),
(10, 10, 0.8),
(11, 10, 0.8),
(4, 11, 0.6),
(5, 11, 0.6),
(10, 11, 0.6),
(4, 12, 0.5),
(6, 13, 0.7),
(12, 13, 0.7),
(5, 15, 0.6),
(10, 15, 0.6),
(5, 16, 0.8),
(10, 16, 0.8),
(11, 16, 0.8),
(6, 17, 0.7),
(7, 18, 0.5),
(8, 18, 0.5),
(7, 19, 0.6),
(8, 20, 0.7),
(8, 21, 0.7),
(12, 21, 0.7),
(8, 22, 0.6),
(9, 24, 0.7),
(11, 25, 0.7),
(12, 26, 0.8),
(8, 23, 0.8),
(9, 23, 0.8),
(3, 1, 0.7),
(3, 6, 0.9),
(3, 9, 0.7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ds_evidences`
--
ALTER TABLE `ds_evidences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ds_problems`
--
ALTER TABLE `ds_problems`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ds_evidences`
--
ALTER TABLE `ds_evidences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ds_problems`
--
ALTER TABLE `ds_problems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
