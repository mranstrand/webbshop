-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2015 at 05:17 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webbshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kund`
--

CREATE TABLE IF NOT EXISTS `tbl_kund` (
`ID` int(9) NOT NULL,
  `namn` varchar(30) COLLATE utf8_bin NOT NULL,
  `efternamn` varchar(30) COLLATE utf8_bin NOT NULL,
  `adress` varchar(30) COLLATE utf8_bin NOT NULL,
  `postadress` varchar(30) COLLATE utf8_bin NOT NULL,
  `tel` varchar(30) COLLATE utf8_bin NOT NULL,
  `mail` varchar(30) COLLATE utf8_bin NOT NULL,
  `datum` date NOT NULL,
  `login` varchar(30) COLLATE utf8_bin NOT NULL,
  `passwd` varchar(256) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_kund`
--

INSERT INTO `tbl_kund` (`ID`, `namn`, `efternamn`, `adress`, `postadress`, `tel`, `mail`, `datum`, `login`, `passwd`) VALUES
(1, 'Ã¶fghjpoij', 'daÃ¶kgfpihdg', 'daÃ¶gkghd', 'adlhgoidh', 'adglkgdih', 'adlÃ¶kgdhp', '2015-02-24', 'mira', 'ada');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE IF NOT EXISTS `tbl_order` (
`id` int(9) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) COLLATE utf8_bin NOT NULL,
  `kundid` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderrader`
--

CREATE TABLE IF NOT EXISTS `tbl_orderrader` (
`id` int(11) NOT NULL,
  `antal` int(5) NOT NULL,
  `orderid` int(9) NOT NULL,
  `produktid` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produkt`
--

CREATE TABLE IF NOT EXISTS `tbl_produkt` (
`ID` int(9) NOT NULL,
  `artikelnr` varchar(30) COLLATE utf8_bin NOT NULL,
  `artikel` varchar(30) COLLATE utf8_bin NOT NULL,
  `pris` int(11) NOT NULL,
  `saldo` int(11) NOT NULL,
  `bokat` int(11) NOT NULL,
  `saldo-bokat` int(11) NOT NULL,
  `bildURL` varchar(100) COLLATE utf8_bin NOT NULL,
  `beskrivning` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_kund`
--
ALTER TABLE `tbl_kund`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orderrader`
--
ALTER TABLE `tbl_orderrader`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_produkt`
--
ALTER TABLE `tbl_produkt`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_kund`
--
ALTER TABLE `tbl_kund`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_orderrader`
--
ALTER TABLE `tbl_orderrader`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_produkt`
--
ALTER TABLE `tbl_produkt`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
