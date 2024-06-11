-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2024 at 11:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topup`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `saldo` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_user`, `email`, `password`, `saldo`) VALUES
(6, 'dustin@gmail.com', '123dustin', 34000.00);

-- --------------------------------------------------------

--
-- Table structure for table `mata_uang_game`
--

CREATE TABLE `mata_uang_game` (
  `id_mata_uang` int(11) NOT NULL,
  `nama_mata_uang` varchar(100) NOT NULL,
  `id_game` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_uang_game`
--

INSERT INTO `mata_uang_game` (`id_mata_uang`, `nama_mata_uang`, `id_game`, `jumlah`, `harga`) VALUES
(6, 'Primogems', 8, 60, 16000.00),
(7, 'Primogems', 8, 300, 50000.00),
(8, 'Primogems', 8, 980, 150000.00),
(9, 'UC', 9, 60, 10000.00),
(10, 'UC', 9, 300, 50000.00),
(11, 'UC', 9, 980, 150000.00),
(15, 'Diamonds', 11, 50, 10000.00),
(16, 'Diamonds', 11, 250, 50000.00),
(17, 'Diamonds', 11, 1000, 200000.00),
(18, 'CP', 12, 80, 10000.00),
(19, 'CP', 12, 400, 50000.00),
(20, 'CP', 12, 800, 100000.00);

-- --------------------------------------------------------

--
-- Table structure for table `nama_game`
--

CREATE TABLE `nama_game` (
  `id_game` int(11) NOT NULL,
  `nama_game` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nama_game`
--

INSERT INTO `nama_game` (`id_game`, `nama_game`) VALUES
(8, 'Genshin Impact'),
(9, 'PUBG Mobile'),
(11, 'Mobile Legends'),
(12, 'Call of Duty Mobile'),
(13, 'Wuthering Waves');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_mata_uang` int(11) DEFAULT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `id_mata_uang`, `tanggal_transaksi`, `status`) VALUES
(5, 6, 6, '2024-06-11 08:40:51', 'Berhasil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `mata_uang_game`
--
ALTER TABLE `mata_uang_game`
  ADD PRIMARY KEY (`id_mata_uang`),
  ADD KEY `fk_id_game` (`id_game`);

--
-- Indexes for table `nama_game`
--
ALTER TABLE `nama_game`
  ADD PRIMARY KEY (`id_game`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_transaksi_akun` (`id_user`),
  ADD KEY `fk_transaksi_mata_uang_game` (`id_mata_uang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mata_uang_game`
--
ALTER TABLE `mata_uang_game`
  MODIFY `id_mata_uang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nama_game`
--
ALTER TABLE `nama_game`
  MODIFY `id_game` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mata_uang_game`
--
ALTER TABLE `mata_uang_game`
  ADD CONSTRAINT `fk_id_game` FOREIGN KEY (`id_game`) REFERENCES `nama_game` (`id_game`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mata_uang_game_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `nama_game` (`id_game`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_akun` FOREIGN KEY (`id_user`) REFERENCES `akun` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transaksi_mata_uang_game` FOREIGN KEY (`id_mata_uang`) REFERENCES `mata_uang_game` (`id_mata_uang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `akun` (`id_user`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_mata_uang`) REFERENCES `mata_uang_game` (`id_mata_uang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
