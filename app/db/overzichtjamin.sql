-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 06 dec 2024 om 12:45
-- Serverversie: 8.2.0
-- PHP-versie: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `overzichtjamin`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `allergeen`
--

DROP TABLE IF EXISTS `allergeen`;
CREATE TABLE IF NOT EXISTS `allergeen` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(255) NOT NULL,
  `Omschrijving` text NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `allergeen`
--

INSERT INTO `allergeen` (`Id`, `Naam`, `Omschrijving`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Gluten', 'Dit product bevat gluten', b'1', NULL, '2024-12-06 09:30:19.940904', '2024-12-06 09:30:19.940904'),
(2, 'Gelatine', 'Dit product bevat gelatine', b'1', NULL, '2024-12-06 09:30:19.940904', '2024-12-06 09:30:19.940904'),
(3, 'AZO-Kleurstof', 'Dit product bevat AZO-kleurstoffen', b'1', NULL, '2024-12-06 09:30:19.940904', '2024-12-06 09:30:19.940904'),
(4, 'Lactose', 'Dit product bevat lactose', b'1', NULL, '2024-12-06 09:30:19.940904', '2024-12-06 09:30:19.940904'),
(5, 'Soja', 'Dit product bevat soja', b'1', NULL, '2024-12-06 09:30:19.940904', '2024-12-06 09:30:19.940904');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leverancier`
--

DROP TABLE IF EXISTS `leverancier`;
CREATE TABLE IF NOT EXISTS `leverancier` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(255) NOT NULL,
  `ContactPersoon` varchar(255) NOT NULL,
  `LeverancierNummer` varchar(20) NOT NULL,
  `Mobiel` varchar(15) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `leverancier`
--

INSERT INTO `leverancier` (`Id`, `Naam`, `ContactPersoon`, `LeverancierNummer`, `Mobiel`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', b'1', NULL, '2024-12-06 09:30:19.968468', '2024-12-06 09:30:19.968468'),
(2, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734', b'1', NULL, '2024-12-06 09:30:19.968468', '2024-12-06 09:30:19.968468'),
(3, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291', b'1', NULL, '2024-12-06 09:30:19.968468', '2024-12-06 09:30:19.968468'),
(4, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823', b'1', NULL, '2024-12-06 09:30:19.968468', '2024-12-06 09:30:19.968468'),
(5, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234', b'1', NULL, '2024-12-06 09:30:19.968468', '2024-12-06 09:30:19.968468'),
(6, 'Quality Street', 'Johan Nooij', 'L1029234586', '06-23458456', b'1', NULL, '2024-12-06 09:30:19.968468', '2024-12-06 09:30:19.968468');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `magazijn`
--

DROP TABLE IF EXISTS `magazijn`;
CREATE TABLE IF NOT EXISTS `magazijn` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `VerpakkingsEenheid` decimal(5,2) NOT NULL,
  `AantalAanwezig` int DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  KEY `ProductId` (`ProductId`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `magazijn`
--

INSERT INTO `magazijn` (`Id`, `ProductId`, `VerpakkingsEenheid`, `AantalAanwezig`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5.00, 578, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 13:40:47.810236'),
(2, 2, 2.50, 400, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(3, 3, 5.00, 1, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(4, 4, 1.00, 800, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(5, 5, 3.00, 234, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(6, 6, 2.00, 345, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(7, 7, 1.00, 795, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(8, 10, 10.00, 323, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 12:59:25.875542'),
(9, 9, 2.50, 123, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(10, 13, 3.00, NULL, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(11, 11, 2.00, 367, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(12, 12, 1.00, 467, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116'),
(13, 13, 5.00, 20, b'1', NULL, '2024-12-06 09:30:19.997116', '2024-12-06 09:30:19.997116');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(255) NOT NULL,
  `Barcode` bigint NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product`
--

INSERT INTO `product` (`Id`, `Naam`, `Barcode`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 'Mintnopjes', 8719587231278, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(2, 'Schoolkrijt', 8719587326713, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(3, 'Honingdrop', 8719587327836, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(4, 'Zure Beren', 8719587321441, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(5, 'Cola Flesjes', 8719587321237, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(6, 'Turtles', 8719587322245, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(7, 'Witte Muizen', 8719587328256, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(8, 'Reuzen Slangen', 8719587325641, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(9, 'Zoute Rijen', 8719587322739, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(10, 'Winegums', 8719587327527, b'0', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 13:02:22.332791'),
(11, 'Drop Munten', 8719587322345, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(12, 'Kruis Drop', 8719587322265, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319'),
(13, 'Zoute Ruitjes', 8719587323256, b'1', NULL, '2024-12-06 09:30:20.025319', '2024-12-06 09:30:20.025319');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productperallergeen`
--

DROP TABLE IF EXISTS `productperallergeen`;
CREATE TABLE IF NOT EXISTS `productperallergeen` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductId` int NOT NULL,
  `AllergeenId` int NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  KEY `ProductId` (`ProductId`),
  KEY `AllergeenId` (`AllergeenId`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `productperallergeen`
--

INSERT INTO `productperallergeen` (`Id`, `ProductId`, `AllergeenId`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 2, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(2, 1, 1, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(3, 1, 3, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(4, 1, 4, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(5, 6, 5, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(6, 9, 2, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(7, 9, 5, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(8, 10, 2, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(9, 12, 4, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(10, 13, 1, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(11, 13, 4, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579'),
(12, 13, 5, b'1', NULL, '2024-12-06 09:30:20.052579', '2024-12-06 09:30:20.052579');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productperleverancier`
--

DROP TABLE IF EXISTS `productperleverancier`;
CREATE TABLE IF NOT EXISTS `productperleverancier` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LeverancierId` int NOT NULL,
  `ProductId` int NOT NULL,
  `DatumLevering` date NOT NULL,
  `Aantal` int NOT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(255) DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  KEY `LeverancierId` (`LeverancierId`),
  KEY `ProductId` (`ProductId`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `productperleverancier`
--

INSERT INTO `productperleverancier` (`Id`, `LeverancierId`, `ProductId`, `DatumLevering`, `Aantal`, `DatumEerstVolgendeLevering`, `IsActief`, `Opmerking`, `DatumAangemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 1, '2024-12-06', 23, '2024-11-16', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 11:31:04.687697'),
(3, 1, 2, '2024-11-09', 12, '2024-11-16', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(4, 1, 3, '2024-11-10', 11, '2024-11-17', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(5, 2, 4, '2024-11-14', 16, '2024-11-21', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(6, 2, 4, '2024-11-21', 23, '2024-11-28', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(7, 2, 5, '2024-11-14', 45, '2024-11-21', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(8, 2, 6, '2024-11-14', 30, '2024-11-21', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(9, 3, 7, '2024-11-12', 12, '2024-11-19', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(10, 3, 7, '2024-11-19', 23, '2024-11-26', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(11, 3, 8, '2024-11-10', 12, '2024-11-17', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(12, 3, 9, '2024-11-11', 1, '2024-11-18', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(13, 4, 10, '2024-11-16', 24, '2024-11-30', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(14, 5, 11, '2024-11-10', 47, '2024-11-17', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(15, 5, 11, '2024-11-19', 60, '2024-11-26', b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(16, 5, 12, '2024-11-11', 45, NULL, b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(17, 5, 13, '2024-11-12', 23, NULL, b'1', NULL, '2024-12-06 09:30:20.084398', '2024-12-06 09:30:20.084398'),
(31, 1, 1, '2024-05-29', 25, '2024-05-29', b'1', NULL, '2024-12-06 13:40:47.809474', '2024-12-06 13:40:47.810468');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
