-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 11:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `park_prirode`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `biljke_oblasti`
-- (See below for the actual view)
--
CREATE TABLE `biljke_oblasti` (
`LOKALNI_NAZIV` varchar(30)
,`ID_BILJKE` int(11)
,`ID_OBLAST` int(11)
,`IME` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `biljna_vrsta`
--

CREATE TABLE `biljna_vrsta` (
  `ID_BILJKE` int(11) NOT NULL,
  `ID_OBLAST` int(11) DEFAULT NULL,
  `LATINSKI_NAZIV` varchar(30) DEFAULT NULL,
  `LOKALNI_NAZIV` varchar(30) DEFAULT NULL,
  `BROJ_ODLUKE` varchar(30) DEFAULT NULL,
  `DATUM_ZASTITE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `biljna_vrsta`
--

INSERT INTO `biljna_vrsta` (`ID_BILJKE`, `ID_OBLAST`, `LATINSKI_NAZIV`, `LOKALNI_NAZIV`, `BROJ_ODLUKE`, `DATUM_ZASTITE`) VALUES
(1, 1, 'Thymus serpyllum', 'Majcina dusica', '513', '2020-04-08'),
(2, 1, 'Gentiana lutea', 'Lincura', '645', '2020-05-06'),
(3, 2, NULL, 'Hajducka trava', '513', '2021-09-23'),
(4, 3, 'Sizigium aromaticum', 'Karanfilic', '513', '2019-11-25'),
(5, 2, 'Rosmarinus officinalis', 'Ruzmarin', '645', '2005-12-03'),
(6, 2, NULL, 'Safran', '645', '2020-06-28'),
(7, 3, 'Verbascum phlomoides', 'Sarska divizma', '513', '2020-09-29'),
(8, 5, NULL, 'Cvet Natalijina ramonda', '645', '2020-05-15'),
(9, 4, NULL, 'Cvet crveni bozur', '645', '2020-03-17');

-- --------------------------------------------------------

--
-- Table structure for table `hraniliste`
--

CREATE TABLE `hraniliste` (
  `REDNI_BROJ` int(11) NOT NULL,
  `POCETNI_MESEC` date DEFAULT NULL,
  `KRAJNJI_MESEC` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hraniliste`
--

INSERT INTO `hraniliste` (`REDNI_BROJ`, `POCETNI_MESEC`, `KRAJNJI_MESEC`) VALUES
(1, '2020-05-01', '2020-06-02'),
(2, '2020-01-01', '2020-02-02'),
(3, '2020-02-01', '2020-03-02'),
(4, '2020-03-01', '2020-04-02'),
(5, '2020-04-01', '2020-05-02'),
(6, '2020-05-01', '2020-06-02'),
(7, '2020-06-01', '2020-07-02'),
(8, '2020-07-01', '2020-08-02'),
(9, '2020-08-01', '2020-09-02'),
(10, '2020-09-01', '2020-12-02');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `RegID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`RegID`, `Username`, `Password`) VALUES
(2, 'keva', '123'),
(20, 'asdasdas', 'sdsdsds');

-- --------------------------------------------------------

--
-- Table structure for table `oblast`
--

CREATE TABLE `oblast` (
  `ID_OBLAST` int(11) NOT NULL,
  `IME` varchar(30) DEFAULT NULL,
  `POVRSINA` double DEFAULT NULL,
  `NAZIV_SELA` varchar(30) DEFAULT NULL,
  `TIP_ZASTITE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oblast`
--

INSERT INTO `oblast` (`ID_OBLAST`, `IME`, `POVRSINA`, `NAZIV_SELA`, `TIP_ZASTITE`) VALUES
(1, 'Crni kamen', 35000, 'Kuzmin', 'Visok'),
(2, 'Velika livada', 10000, 'Susice', 'Srednji'),
(3, 'Kacanik', 5000, 'Mrdjince', 'Nizak'),
(4, 'Gavranik', 3500, 'Mrdjince', 'Srednji'),
(5, 'Livad', 12000, 'Berevce', 'Visok'),
(6, 'Alandrica', 14000, 'Mrdjince', 'Srednji'),
(7, 'Macas', 25000, 'Berevce', 'Nizak'),
(8, 'Penjerupe', 17500, 'Mrdjince', 'Visok'),
(9, 'Crne vode', 3000, 'Gotovusa', 'Nizak');

-- --------------------------------------------------------

--
-- Table structure for table `radnik`
--

CREATE TABLE `radnik` (
  `JMBG` decimal(13,0) NOT NULL,
  `ID_OBLAST` int(11) NOT NULL,
  `IME` varchar(30) DEFAULT NULL,
  `PREZIME` varchar(30) DEFAULT NULL,
  `ADRESA` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vidjena`
--

CREATE TABLE `vidjena` (
  `REDNI_BROJ` int(11) NOT NULL,
  `BR_PRSTENA` int(11) NOT NULL,
  `DATUM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zivi`
--

CREATE TABLE `zivi` (
  `BR_PRSTENA` int(11) NOT NULL,
  `ID_OBLAST` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zivotinja`
--

CREATE TABLE `zivotinja` (
  `BR_PRSTENA` int(11) NOT NULL,
  `Redni_broj` int(11) NOT NULL,
  `ID_oblasti` int(11) NOT NULL,
  `LATINSKI_NAZIV` varchar(30) DEFAULT NULL,
  `LOKALNI_NAZIV` varchar(30) DEFAULT NULL,
  `STANISTE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zivotinja`
--

INSERT INTO `zivotinja` (`BR_PRSTENA`, `Redni_broj`, `ID_oblasti`, `LATINSKI_NAZIV`, `LOKALNI_NAZIV`, `STANISTE`) VALUES
(1, 1, 1, 'Canis lupus', 'Sivi vuk', 'Cetinarska suma'),
(2, 1, 1, 'Ursus arctos', 'Mrki medved', 'Mesana suma'),
(3, 2, 2, 'Dinaromys bogdanovi', 'Dinarska voluharica', 'Greben'),
(4, 2, 2, 'Martes martes', 'Kuna zlatica', 'Mesana suma'),
(5, 2, 2, 'Martes foina', 'Kuna belica', 'Mesana suma'),
(6, 2, 2, 'Lutra lutra', 'Vidra', 'Reke'),
(7, 2, 2, 'Gyps fulvus', 'Beloglavi sup', 'Visoki predeli'),
(8, 3, 3, 'Tetrao urogallus', 'Veliki tetreb', 'Ravnice'),
(9, 4, 4, 'Alectoris graeca', 'Jarebica kamenjarka', 'Stenoviti predeli'),
(10, 5, 4, 'Fringilla coelebs', 'Snezna zeba', 'Stenoviti predeli'),
(11, 2, 2, 'Vulpes zerda', 'Pustinjska lisica', 'Pustinja'),
(12, 2, 2, 'Panthera leo', 'Lav', 'Savana'),
(13, 2, 2, 'Vulpera tigris', 'Tigar', 'Savana'),
(2233, 2, 2, 'rdrdrd', 'RTRDTRDR', 'TRRYTYU');

-- --------------------------------------------------------

--
-- Structure for view `biljke_oblasti`
--
DROP TABLE IF EXISTS `biljke_oblasti`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `biljke_oblasti`  AS SELECT `b`.`LOKALNI_NAZIV` AS `LOKALNI_NAZIV`, `b`.`ID_BILJKE` AS `ID_BILJKE`, `o`.`ID_OBLAST` AS `ID_OBLAST`, `o`.`IME` AS `IME` FROM (`biljna_vrsta` `b` left join `oblast` `o` on(`b`.`ID_OBLAST` = `o`.`ID_OBLAST`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biljna_vrsta`
--
ALTER TABLE `biljna_vrsta`
  ADD PRIMARY KEY (`ID_BILJKE`),
  ADD KEY `FK_PRIPADA` (`ID_OBLAST`);

--
-- Indexes for table `hraniliste`
--
ALTER TABLE `hraniliste`
  ADD PRIMARY KEY (`REDNI_BROJ`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`RegID`);

--
-- Indexes for table `oblast`
--
ALTER TABLE `oblast`
  ADD PRIMARY KEY (`ID_OBLAST`);

--
-- Indexes for table `radnik`
--
ALTER TABLE `radnik`
  ADD PRIMARY KEY (`JMBG`),
  ADD KEY `FK_ANGAZOVAN` (`ID_OBLAST`);

--
-- Indexes for table `vidjena`
--
ALTER TABLE `vidjena`
  ADD KEY `FK_JE` (`BR_PRSTENA`),
  ADD KEY `FK_U` (`REDNI_BROJ`);

--
-- Indexes for table `zivi`
--
ALTER TABLE `zivi`
  ADD KEY `FK_RELATIONSHIP_6` (`BR_PRSTENA`),
  ADD KEY `FK_RELATIONSHIP_7` (`ID_OBLAST`);

--
-- Indexes for table `zivotinja`
--
ALTER TABLE `zivotinja`
  ADD PRIMARY KEY (`BR_PRSTENA`),
  ADD KEY `Redni_broj` (`Redni_broj`),
  ADD KEY `ID_oblasti` (`ID_oblasti`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `RegID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `biljna_vrsta`
--
ALTER TABLE `biljna_vrsta`
  ADD CONSTRAINT `FK_PRIPADA` FOREIGN KEY (`ID_OBLAST`) REFERENCES `oblast` (`ID_OBLAST`);

--
-- Constraints for table `radnik`
--
ALTER TABLE `radnik`
  ADD CONSTRAINT `FK_ANGAZOVAN` FOREIGN KEY (`ID_OBLAST`) REFERENCES `oblast` (`ID_OBLAST`);

--
-- Constraints for table `vidjena`
--
ALTER TABLE `vidjena`
  ADD CONSTRAINT `FK_JE` FOREIGN KEY (`BR_PRSTENA`) REFERENCES `zivotinja` (`BR_PRSTENA`),
  ADD CONSTRAINT `FK_U` FOREIGN KEY (`REDNI_BROJ`) REFERENCES `hraniliste` (`REDNI_BROJ`);

--
-- Constraints for table `zivi`
--
ALTER TABLE `zivi`
  ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`BR_PRSTENA`) REFERENCES `zivotinja` (`BR_PRSTENA`),
  ADD CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`ID_OBLAST`) REFERENCES `oblast` (`ID_OBLAST`);

--
-- Constraints for table `zivotinja`
--
ALTER TABLE `zivotinja`
  ADD CONSTRAINT `zivotinja_ibfk_1` FOREIGN KEY (`Redni_broj`) REFERENCES `hraniliste` (`REDNI_BROJ`),
  ADD CONSTRAINT `zivotinja_ibfk_2` FOREIGN KEY (`ID_oblasti`) REFERENCES `oblast` (`ID_OBLAST`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
