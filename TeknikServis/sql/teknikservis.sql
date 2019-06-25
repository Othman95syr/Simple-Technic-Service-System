-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2019 at 02:25 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teknikservis`
--

-- --------------------------------------------------------

--
-- Table structure for table `cihaz`
--

CREATE TABLE `cihaz` (
  `idcihaz` int(11) NOT NULL,
  `cihazadi` varchar(50) NOT NULL,
  `markaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cihaz`
--

INSERT INTO `cihaz` (`idcihaz`, `cihazadi`, `markaid`) VALUES
(1, 'kzoom', 0),
(2, 'kzoom', 3),
(3, 'g300s', 5),
(4, 'HP2311gt', 1),
(5, 'galaxy9', 3),
(11, 'Vaperosso', 10),
(12, 'Hpl2', 11);

-- --------------------------------------------------------

--
-- Table structure for table `marka`
--

CREATE TABLE `marka` (
  `idmarka` int(11) NOT NULL,
  `markaadi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marka`
--

INSERT INTO `marka` (`idmarka`, `markaadi`) VALUES
(1, 'hp'),
(2, 'exper'),
(3, 'samsung'),
(4, 'iphone'),
(5, 'logitech'),
(10, 'Polar'),
(11, 'hiper');

-- --------------------------------------------------------

--
-- Table structure for table `musteri`
--

CREATE TABLE `musteri` (
  `idmusteri` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `telefon` int(20) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `adres` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `musteri`
--

INSERT INTO `musteri` (`idmusteri`, `ad`, `soyad`, `telefon`, `mail`, `adres`) VALUES
(1, 'Ahmet', 'Atlagelen', 123456, 'ahmet@ahmet.com', 'sivas'),
(2, 'Sait', 'Okan', 53776695, 'sait@yandex.com', 'Carsibasimah'),
(3, 'Can', 'Atari', 555555555, 'cancan@gmail.com', 'Kardesler Mah.');

-- --------------------------------------------------------

--
-- Table structure for table `servis`
--

CREATE TABLE `servis` (
  `id` int(11) NOT NULL,
  `musteriid` int(11) NOT NULL,
  `markaid` int(11) NOT NULL,
  `cihazid` int(11) NOT NULL,
  `yetkiliid` int(11) NOT NULL,
  `serino` varchar(50) NOT NULL,
  `modelno` varchar(50) NOT NULL,
  `teslimtarihi` date NOT NULL,
  `aciklama` varchar(50) NOT NULL,
  `garanti` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `feedback` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `servis`
--

INSERT INTO `servis` (`id`, `musteriid`, `markaid`, `cihazid`, `yetkiliid`, `serino`, `modelno`, `teslimtarihi`, `aciklama`, `garanti`, `status`, `feedback`) VALUES
(7, 2, 11, 12, 1, 's3r1n0', 'M0d31N0', '2018-12-01', 'Teslim Edildi', 1, 0, ''),
(8, 1, 1, 4, 1, '12', '123', '2019-05-30', 'Kayit Yapildi', 0, 1, 'servic feedback');

-- --------------------------------------------------------

--
-- Table structure for table `yetkili`
--

CREATE TABLE `yetkili` (
  `id` int(11) NOT NULL,
  `kadi` varchar(50) NOT NULL,
  `sifre` varchar(50) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yetkili`
--

INSERT INTO `yetkili` (`id`, `kadi`, `sifre`, `ad`, `soyad`) VALUES
(1, 'admin', 'admin', 'Admin', 'admin'),
(2, 'cafer', 'cafer', 'Cafer', 'Usta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cihaz`
--
ALTER TABLE `cihaz`
  ADD PRIMARY KEY (`idcihaz`),
  ADD KEY `markaid` (`markaid`);

--
-- Indexes for table `marka`
--
ALTER TABLE `marka`
  ADD PRIMARY KEY (`idmarka`);

--
-- Indexes for table `musteri`
--
ALTER TABLE `musteri`
  ADD PRIMARY KEY (`idmusteri`);

--
-- Indexes for table `servis`
--
ALTER TABLE `servis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musteriid` (`musteriid`),
  ADD KEY `markaid` (`markaid`),
  ADD KEY `cihazid` (`cihazid`),
  ADD KEY `yetkiliid` (`yetkiliid`);

--
-- Indexes for table `yetkili`
--
ALTER TABLE `yetkili`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cihaz`
--
ALTER TABLE `cihaz`
  MODIFY `idcihaz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `marka`
--
ALTER TABLE `marka`
  MODIFY `idmarka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `musteri`
--
ALTER TABLE `musteri`
  MODIFY `idmusteri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `servis`
--
ALTER TABLE `servis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `yetkili`
--
ALTER TABLE `yetkili`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `servis`
--
ALTER TABLE `servis`
  ADD CONSTRAINT `servis_ibfk_1` FOREIGN KEY (`yetkiliid`) REFERENCES `yetkili` (`id`),
  ADD CONSTRAINT `servis_ibfk_2` FOREIGN KEY (`musteriid`) REFERENCES `musteri` (`idmusteri`),
  ADD CONSTRAINT `servis_ibfk_3` FOREIGN KEY (`cihazid`) REFERENCES `cihaz` (`idcihaz`),
  ADD CONSTRAINT `servis_ibfk_4` FOREIGN KEY (`markaid`) REFERENCES `marka` (`idmarka`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
