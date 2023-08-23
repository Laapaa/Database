-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2023 at 07:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_npwp`
--

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id_kabupaten` varchar(30) NOT NULL,
  `nama_kabupaten` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id_kabupaten`, `nama_kabupaten`) VALUES
('08', 'Bogor'),
('09', 'Depok'),
('10', 'Jakarta Selatan'),
('11', 'Bekasi'),
('12', 'Jakarta Timur');

-- --------------------------------------------------------

--
-- Table structure for table `kecematan`
--

CREATE TABLE `kecematan` (
  `id_kecamatan` varchar(30) NOT NULL,
  `nama_kecamatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kecematan`
--

INSERT INTO `kecematan` (`id_kecamatan`, `nama_kecamatan`) VALUES
('08', 'Bojong Gede'),
('09', 'Rangkapan Jaya'),
('10', 'Rangkapan Jaya Baru'),
('11', 'Pakansari'),
('12', 'Cipayung');

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `id_kelurahan` varchar(30) NOT NULL,
  `nama_kelurahan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`id_kelurahan`, `nama_kelurahan`) VALUES
('08', 'Pabuaran'),
('09', 'Bojong Gede'),
('10', 'Mampang'),
('11', 'Sawangan'),
('12', 'Pancoran Mas');

-- --------------------------------------------------------

--
-- Table structure for table `kodepos`
--

CREATE TABLE `kodepos` (
  `kd_pos` char(10) NOT NULL,
  `Lokasi_KodePos` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kodepos`
--

INSERT INTO `kodepos` (`kd_pos`, `Lokasi_KodePos`) VALUES
('123456', 'Pabuaran'),
('234567', 'Sawangan'),
('654321', 'Bojong gede'),
('765432', 'Mampang'),
('998877', 'Pancoran Mas');

-- --------------------------------------------------------

--
-- Table structure for table `pajak`
--

CREATE TABLE `pajak` (
  `no_npwp` varchar(30) NOT NULL,
  `tgl_terdaftar` varchar(30) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `website` varchar(30) NOT NULL,
  `id_pribadi` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pajak`
--

INSERT INTO `pajak` (`no_npwp`, `tgl_terdaftar`, `keterangan`, `website`, `id_pribadi`) VALUES
('12.345.678.1-999.000', '19-10-2009', 'Keterangan2', 'Website2', '02'),
('22.123.456.8.221.017', '22-10-2017', 'Keterangan1', 'Website1', '01'),
('79.876.987.9-111.222', '10-10-2010', 'Keterangan3', 'Website3', '03'),
('86.789.765.5.165.712', '28-01-2019', 'Keterangan4', 'Website4', '04');

-- --------------------------------------------------------

--
-- Table structure for table `pribadi`
--

CREATE TABLE `pribadi` (
  `id_pribadi` char(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `id_kelurahan` varchar(30) NOT NULL,
  `id_kecamatan` varchar(30) NOT NULL,
  `id_kabupaten` varchar(30) NOT NULL,
  `kd_pos` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pribadi`
--

INSERT INTO `pribadi` (`id_pribadi`, `nama`, `alamat`, `id_kelurahan`, `id_kecamatan`, `id_kabupaten`, `kd_pos`) VALUES
('01', 'Agus Wahyu', 'Citayam', '08', '08', '08', '123456'),
('02', 'Sulthan Pardede', 'Puri Lesmana', '09', '09', '09', '234567'),
('03', 'Tegar Budiono', 'Jonggol', '11', '11', '11', '998877'),
('04', 'Fajri Wibowo', 'Jonggol', '10', '11', '09', '998877');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tester`
-- (See below for the actual view)
--
CREATE TABLE `tester` (
`nama` varchar(50)
,`no_npwp` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `tester`
--
DROP TABLE IF EXISTS `tester`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tester`  AS SELECT `pribadi`.`nama` AS `nama`, `pajak`.`no_npwp` AS `no_npwp` FROM (`pribadi` join `pajak`) WHERE `pribadi`.`id_pribadi` = `pajak`.`id_pribadi``id_pribadi`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id_kabupaten`);

--
-- Indexes for table `kecematan`
--
ALTER TABLE `kecematan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`id_kelurahan`);

--
-- Indexes for table `kodepos`
--
ALTER TABLE `kodepos`
  ADD PRIMARY KEY (`kd_pos`);

--
-- Indexes for table `pajak`
--
ALTER TABLE `pajak`
  ADD PRIMARY KEY (`no_npwp`),
  ADD KEY `id_pribadi` (`id_pribadi`) USING BTREE;

--
-- Indexes for table `pribadi`
--
ALTER TABLE `pribadi`
  ADD PRIMARY KEY (`id_pribadi`),
  ADD KEY `id_kelurahan` (`id_kelurahan`),
  ADD KEY `id_kecamatan` (`id_kecamatan`),
  ADD KEY `id_kabupaten` (`id_kabupaten`),
  ADD KEY `kd_pos` (`kd_pos`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pajak`
--
ALTER TABLE `pajak`
  ADD CONSTRAINT `pajak_ibfk_1` FOREIGN KEY (`id_pribadi`) REFERENCES `pribadi` (`id_pribadi`);

--
-- Constraints for table `pribadi`
--
ALTER TABLE `pribadi`
  ADD CONSTRAINT `pribadi_ibfk_1` FOREIGN KEY (`id_kelurahan`) REFERENCES `kelurahan` (`id_kelurahan`),
  ADD CONSTRAINT `pribadi_ibfk_2` FOREIGN KEY (`id_kecamatan`) REFERENCES `kecematan` (`id_kecamatan`),
  ADD CONSTRAINT `pribadi_ibfk_3` FOREIGN KEY (`id_kabupaten`) REFERENCES `kabupaten` (`id_kabupaten`),
  ADD CONSTRAINT `pribadi_ibfk_4` FOREIGN KEY (`kd_pos`) REFERENCES `kodepos` (`kd_pos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
