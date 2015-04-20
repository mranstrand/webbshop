-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2015 at 01:54 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `the_great_shop`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_kund`
--

INSERT INTO `tbl_kund` (`ID`, `namn`, `efternamn`, `adress`, `postadress`, `tel`, `mail`, `datum`, `login`, `passwd`) VALUES
(1, 'Ã¶fghjpoij', 'daÃ¶kgfpihdg', 'daÃ¶gkghd', 'adlhgoidh', 'adglkgdih', 'adlÃ¶kgdhp', '2015-02-24', 'mira', 'ada'),
(2, 'm', 'm', 'm', 'm', 'm', 'm', '2015-03-29', 'm', 'm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE IF NOT EXISTS `tbl_order` (
`id` int(9) NOT NULL,
  `regdat` date NOT NULL,
  `status` varchar(10) COLLATE utf8_bin NOT NULL,
  `kundid` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `regdat`, `status`, `kundid`) VALUES
(1, '2015-03-29', 'varukorg', 2),
(2, '2015-03-29', 'varukorg', 2),
(3, '2015-03-29', 'varukorg', 2),
(4, '2015-03-29', 'varukorg', 2),
(5, '2015-03-29', 'varukorg', 2),
(6, '2015-03-29', 'varukorg', 2),
(7, '2015-03-30', 'varukorg', 2),
(8, '2015-03-30', 'varukorg', 2),
(9, '2015-03-30', 'varukorg', 2),
(10, '2015-04-13', 'varukorg', 2),
(11, '2015-04-13', 'varukorg', 2),
(12, '2015-04-20', 'varukorg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderrader`
--

CREATE TABLE IF NOT EXISTS `tbl_orderrader` (
`id` int(11) NOT NULL,
  `antal` int(5) NOT NULL,
  `orderid` int(9) NOT NULL,
  `produktid` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_orderrader`
--

INSERT INTO `tbl_orderrader` (`id`, `antal`, `orderid`, `produktid`) VALUES
(1, 45, 9, 1),
(2, 67, 10, 1),
(3, 56, 11, 1),
(4, 87, 11, 1),
(5, 6, 11, 1),
(6, 56, 12, 1);

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
  `bokat` int(11) DEFAULT NULL,
  `saldo-bokat` int(11) NOT NULL,
  `bildURL` varchar(100) COLLATE utf8_bin NOT NULL,
  `beskrivning` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_produkt`
--

INSERT INTO `tbl_produkt` (`ID`, `artikelnr`, `artikel`, `pris`, `saldo`, `bokat`, `saldo-bokat`, `bildURL`, `beskrivning`) VALUES
(1, '1', '1', 1, 1, NULL, 0, '1', '1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_varukorg`
--
CREATE TABLE IF NOT EXISTS `view_varukorg` (
`orderID` int(9)
,`artikelnr` varchar(30)
,`artikel` varchar(30)
,`pris` int(11)
,`antal` int(5)
,`belopp` bigint(21)
);
-- --------------------------------------------------------

--
-- Structure for view `view_varukorg`
--
DROP TABLE IF EXISTS `view_varukorg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_varukorg` AS select `tbl_orderrader`.`orderid` AS `orderID`,`tbl_produkt`.`artikelnr` AS `artikelnr`,`tbl_produkt`.`artikel` AS `artikel`,`tbl_produkt`.`pris` AS `pris`,`tbl_orderrader`.`antal` AS `antal`,(`tbl_produkt`.`pris` * `tbl_orderrader`.`antal`) AS `belopp` from (`tbl_produkt` join `tbl_orderrader` on((`tbl_produkt`.`ID` = `tbl_orderrader`.`produktid`))) order by `tbl_orderrader`.`orderid`;

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
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_orderrader`
--
ALTER TABLE `tbl_orderrader`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_produkt`
--
ALTER TABLE `tbl_produkt`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
