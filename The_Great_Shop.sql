-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 18 mars 2015 kl 20:33
-- Serverversion: 5.6.20
-- PHP-version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `The_Great_Shop`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_kund`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumpning av Data i tabell `tbl_kund`
--

INSERT INTO `tbl_kund` (`ID`, `namn`, `efternamn`, `adress`, `postadress`, `tel`, `mail`, `datum`, `login`, `passwd`) VALUES
(1, 'Ã¶fghjpoij', 'daÃ¶kgfpihdg', 'daÃ¶gkghd', 'adlhgoidh', 'adglkgdih', 'adlÃ¶kgdhp', '2015-02-24', 'mira', 'ada');

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_produkt`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `tbl_kund`
--
ALTER TABLE `tbl_kund`
 ADD PRIMARY KEY (`ID`);

--
-- Index för tabell `tbl_produkt`
--
ALTER TABLE `tbl_produkt`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `tbl_kund`
--
ALTER TABLE `tbl_kund`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT för tabell `tbl_produkt`
--
ALTER TABLE `tbl_produkt`
MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
