-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 21 juil. 2020 à 08:53
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `compta`
--
CREATE DATABASE IF NOT EXISTS `compta` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `compta`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `ID` int(10) NOT NULL,
  `ID_FOU` int(11) NOT NULL,
  `REF` varchar(13) NOT NULL,
  `DESIGNATION` varchar(255) NOT NULL,
  `PRIX` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fou_compo` (`ID_FOU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`ID`, `ID_FOU`, `REF`, `DESIGNATION`, `PRIX`) VALUES
(1, 1, 'A01', 'Perceuse P1', '75'),
(2, 2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', '2'),
(3, 2, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', '4'),
(4, 3, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', '4'),
(5, 1, 'A02', 'Meuleuse 125mm', '38'),
(6, 3, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', '2'),
(7, 1, 'A03', 'Perceuse à colonne', '185'),
(8, 3, 'D04', 'Coffret mêches à bois', '12'),
(9, 2, 'F03', 'Coffret mêches plates', '6'),
(10, 2, 'F04', 'Fraises d’encastrement', '8');

-- --------------------------------------------------------

--
-- Structure de la table `bon`
--

DROP TABLE IF EXISTS `bon`;
CREATE TABLE IF NOT EXISTS `bon` (
  `ID` int(11) NOT NULL,
  `ID_art` int(11) NOT NULL,
  `NUMERO` int(10) NOT NULL,
  `DATE_CMDE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DELAI` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bon`
--

INSERT INTO `bon` (`ID`, `ID_art`, `NUMERO`, `DATE_CMDE`, `DELAI`) VALUES
(1, 1, 3, '2020-07-21 08:48:23', 3);

-- --------------------------------------------------------

--
-- Structure de la table `compo`
--

DROP TABLE IF EXISTS `compo`;
CREATE TABLE IF NOT EXISTS `compo` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_art` int(10) NOT NULL,
  `QTE` int(10) NOT NULL,
  `ID_bon` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_art_compo` (`ID_art`),
  KEY `FK_bon_compo` (`ID_bon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compo`
--

INSERT INTO `compo` (`ID`, `ID_art`, `QTE`, `ID_bon`) VALUES
(1, 3, 1, 1),
(2, 4, 5, 1),
(3, 1, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `ID` int(10) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`ID`, `NOM`) VALUES
(1, 'Francaise d\'Imports'),
(2, 'FDM SA'),
(3, 'Dubois & Fils');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_fou_compo` FOREIGN KEY (`ID_FOU`) REFERENCES `fournisseur` (`ID`);

--
-- Contraintes pour la table `compo`
--
ALTER TABLE `compo`
  ADD CONSTRAINT `FK_art_compo` FOREIGN KEY (`ID_art`) REFERENCES `article` (`ID`),
  ADD CONSTRAINT `FK_bon_compo` FOREIGN KEY (`ID_bon`) REFERENCES `bon` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
